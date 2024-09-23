@implementation _GCDevicePhysicalInputTransaction

+ (uint64_t)transactionWithImplementation:(uint64_t)a3 configuration:(uint64_t)a4 state:
{
  objc_class *v7;
  _GCDevicePhysicalInputInitializationContext *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t result;
  id Instance;
  uint64_t v18;
  _GCDevicePhysicalInputTransaction *v19;
  double v20;
  _GCDevicePhysicalInputChangedElementsEnumerator *v21;
  void *IndexedIvars;

  v7 = (objc_class *)objc_opt_self();
  v8 = [_GCDevicePhysicalInputInitializationContext alloc];
  v9 = -[_GCDevicePhysicalInputBase viewProperties]((uint64_t)a2);
  v10 = -[_GCDevicePhysicalInputInitializationContext initWithViewConfiguration:viewProperties:viewState:](v8, a3, v9, a4);
  v11 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)a2);
  v12 = (char *)malloc_type_calloc(objc_msgSend(v11, "count"), 8uLL, 0x100004000313F17uLL);
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v14 = 0;
    v15 = v12 + 7;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      result = objc_msgSend((id)objc_opt_class(), "updateContextSize");
      if (result >= 8)
      {
        *v15 |= 0x80u;
        *(_DWORD *)(v15 - 7) = v14;
        v14 += result;
        if (HIDWORD(v14))
          break;
      }
      ++v13;
      v15 += 8;
      if (v13 >= objc_msgSend(v11, "count"))
        goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    v14 = 0;
LABEL_8:
    Instance = class_createInstance(v7, v14 + 8 * objc_msgSend(v11, "count"));
    v18 = -[_GCDevicePhysicalInputBase facade]((uint64_t)a2);
    v19 = (_GCDevicePhysicalInputTransaction *)objc_msgSend(Instance, "_initWithFacadeTemplate:elementsTemplates:attributes:context:", v18, v11, -[_GCDevicePhysicalInputBase attributes]((uint64_t)a2), v10);
    -[_GCDevicePhysicalInputBase setDevice:](v19, "setDevice:", -[_GCDevicePhysicalInputBase device](a2, "device"));
    v19->_physicalInput = a2;
    -[_GCDevicePhysicalInput lastEventTimestamp](a2, "lastEventTimestamp");
    v19->_lastEventTimestamp = v20;
    v21 = [_GCDevicePhysicalInputChangedElementsEnumerator alloc];
    v19->_changedElements = v21;
    v21->_implementation = v19;
    IndexedIvars = object_getIndexedIvars(v19);
    memcpy(IndexedIvars, v12, 8 * objc_msgSend(v11, "count"));
    free(v12);

    return (uint64_t)v19;
  }
  return result;
}

- (void)dealloc
{
  __assert_rtn("-[_GCDevicePhysicalInputTransaction dealloc]", "_GCDevicePhysicalInputTransaction.m", 114, "_objc_rootRetainCount(_changedElements) == 1");
}

- (BOOL)allowsWeakReference
{
  return 0;
}

- (id)physicalInput
{
  _GCDevicePhysicalInput *v3;

  objc_sync_enter(self);
  v3 = self->_physicalInput;
  objc_sync_exit(self);
  return v3;
}

- (_QWORD)detach
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v1[14] = 0;
    return (_QWORD *)objc_sync_exit(v1);
  }
  return result;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  objc_class *v5;

  if ((unint64_t)-[_GCDevicePhysicalInputTransaction retainCount](self, "retainCount") <= 1)
    v3 = &stru_24D2B85A8;
  else
    v3 = CFSTR(" (captured)");
  if (self->_physicalInput)
    v4 = &stru_24D2B85A8;
  else
    v4 = CFSTR(" (detached)");
  v5 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p;%@%@>"),
           NSStringFromClass(v5),
           self,
           v3,
           v4);
}

- (BOOL)isSnapshot
{
  return 1;
}

- (_GCDevicePhysicalInputChangedElementsEnumerator)changedElements
{
  _GCDevicePhysicalInputChangedElementsEnumerator *v1;
  _GCDevicePhysicalInputChangedElementsEnumerator *v2;

  if (result)
  {
    v1 = result;
    if (LOBYTE(result[5]._currentIndex))
    {
      if (_objc_rootRetainCount() == 1)
      {
        v1[5]._implementation->super._dataSource = 0;
        return (_GCDevicePhysicalInputChangedElementsEnumerator *)v1[5]._implementation;
      }
      else
      {
        v2 = [_GCDevicePhysicalInputChangedElementsEnumerator alloc];
        v2->_implementation = (_GCDevicePhysicalInputTransaction *)v1;
        return v2;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)updateContextForElementAtIndex:(_QWORD *)a3 size:(int)a4 onlyIfChanged:
{
  char *IndexedIvars;
  char *v9;
  uint64_t v10;
  NSException *v12;

  if (!a1)
    return 0;
  if (objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1), "count") <= a2)
  {
    v12 = +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), "-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:]", a2, objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1), "count")), 0);
    objc_exception_throw(v12);
  }
  IndexedIvars = (char *)object_getIndexedIvars(a1);
  v9 = &IndexedIvars[8 * a2];
  if (a4)
  {
    if ((v9[7] & 0x40) == 0)
      return 0;
  }
  if (v9[7] < 0)
  {
    v10 = objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1), "count");
    if (a3)
      *a3 = *((unsigned __int16 *)v9 + 2);
    return (uint64_t)&IndexedIvars[8 * v10 + *(unsigned int *)v9];
  }
  else if (a3)
  {
    *a3 = 7;
  }
  return (uint64_t)v9;
}

- (uint64_t)mutableUpdateContextForElementAtIndex:(uint64_t)a3 withHandler:
{
  _BYTE *v5;
  char *IndexedIvars;
  char *v7;
  _BYTE *v8;
  int v9;
  char v10;
  char *v11;
  uint64_t v12;
  char v13;
  NSException *v14;
  _DWORD v15[2];

  if (result)
  {
    v5 = (_BYTE *)result;
    if (objc_msgSend((id)-[_GCDevicePhysicalInputBase elements](result), "count") <= a2)
    {
      v14 = +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), "-[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:]", a2, objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)v5), "count")), 0);
      objc_exception_throw(v14);
    }
    IndexedIvars = (char *)object_getIndexedIvars(v5);
    v7 = &IndexedIvars[8 * a2];
    v8 = v7 + 7;
    if (v7[7] < 0)
    {
      v11 = IndexedIvars;
      v12 = objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)v5), "count");
      result = (*(uint64_t (**)(uint64_t, char *, _QWORD))(a3 + 16))(a3, &v11[8 * v12 + *(unsigned int *)v7], *((unsigned __int16 *)v7 + 2));
      if ((_DWORD)result)
        v13 = 64;
      else
        v13 = 0;
      v10 = *v8 & 0xBF | v13;
    }
    else
    {
      *(_DWORD *)((char *)v15 + 3) = 0;
      v15[0] = 0;
      result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a3 + 16))(a3, v15, 7);
      if ((_DWORD)result)
      {
        v9 = v15[0];
        *(_DWORD *)(v7 + 3) = *(_DWORD *)((char *)v15 + 3);
        *(_DWORD *)v7 = v9;
        v10 = *v8 | 0x40;
      }
      else
      {
        *(_DWORD *)(v7 + 3) = 0;
        *(_DWORD *)v7 = 0;
        v10 = *v8 & 0xBF;
      }
    }
    *v8 = v10;
    v5[136] = 1;
  }
  return result;
}

- (BOOL)updateContextIsValidForElementAtIndex:(_BOOL8)result
{
  if (result)
    return *(_BYTE *)(result + 136) != 0;
  return result;
}

- (uint64_t)invalidateAllUpdateContexts
{
  if (result)
    *(_BYTE *)(result + 136) = 0;
  return result;
}

- (double)lastEventTimestamp
{
  return self->_lastEventTimestamp;
}

- (uint64_t)setLastEventTimestamp:(uint64_t)result
{
  if (result)
    *(double *)(result + 120) = a2;
  return result;
}

@end
