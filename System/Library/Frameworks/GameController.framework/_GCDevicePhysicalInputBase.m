@implementation _GCDevicePhysicalInputBase

- (id)_initWithFacadeTemplate:(id)a3 elementsTemplates:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v6;
  _GCDevicePhysicalInputBase *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  _GCDevicePhysicalInputElementsArray *v26;
  _GCDevicePhysicalInputElementsCollection *v27;
  uint64_t v28;
  void *v30;
  objc_class *v31;
  id v32;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 273, CFSTR("Invalid parameter not satisfying: %s"), "facadeTemplate != nil");
    if (v6)
      goto LABEL_3;
  }
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 274, CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
LABEL_3:
  v32 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_GCDevicePhysicalInputBase;
  v11 = -[_GCDevicePhysicalInputBase init](&v46, sel_init);
  v12 = objc_msgSend(a5, "copy");
  if (!v12)
    v12 = objc_opt_new();
  v11->_attributes = (NSSet *)v12;
  *((_QWORD *)v6 + 1) = v11;
  v11->_viewConfiguration = (_GCDevicePhysicalInputStateTable *)*((_QWORD *)v6 + 3);
  v11->_viewProperties = (_GCDevicePhysicalInputStateTable *)*((_QWORD *)v6 + 4);
  v11->_viewState = (_GCDevicePhysicalInputStateTable *)*((_QWORD *)v6 + 5);
  v13 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_2);
  v11->_elementCount = objc_msgSend(v13, "count");
  v11->_indexedElements = (id *)malloc_type_calloc(objc_msgSend(v13, "count"), 8uLL, 0x80040B8603338uLL);
  v14 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v13;
  v37 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v37)
  {
    v15 = 0;
    v35 = *(_QWORD *)v43;
    v36 = v6;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v11->_indexedElements[v15] = (id)objc_msgSend((id)objc_opt_class(), "withTemplate:context:", v17, v6);
        if (!v11->_indexedElements[v15])
        {
          v24 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v25 = (objc_class *)objc_opt_class();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("_GCDevicePhysicalInputBase.m"), 302, CFSTR("%@ failed to initialize copy."), NSStringFromClass(v25));
        }
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v18 = (void *)objc_msgSend(v17, "aliases");
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v39 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (objc_msgSend(v14, "objectForKey:", v23))
                objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("_GCDevicePhysicalInputBase.m"), 305, CFSTR("Duplicate elements with alias: %@"), v23);
              objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", v15), v23);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v20);
        }
        ++v15;
        v6 = v36;
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v37);
  }
  v11->_elementIndexByAlias = (NSDictionary *)objc_msgSend(v14, "copy");

  v11->_additionalViews = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *((CFArrayRef *)v6 + 2));
  v26 = [_GCDevicePhysicalInputElementsArray alloc];
  v11->_indexedElementViews = v26;
  v26->_implementation = v11;
  v27 = [_GCDevicePhysicalInputElementsCollection alloc];
  v11->_elementCollection = v27;
  v27->_implementation = v11;
  v28 = objc_msgSend((id)objc_opt_class(), "withTemplate:context:", v32, v6);
  v11->_facade = (_GCDevicePhysicalInputFacade *)v28;
  if (!v28)
  {
    v30 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v31 = (objc_class *)objc_opt_class();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("_GCDevicePhysicalInputBase.m"), 327, CFSTR("%@ failed to initialize copy."), NSStringFromClass(v31));
  }
  v11->_viewConfiguration = (_GCDevicePhysicalInputStateTable *)objc_msgSend(*((id *)v6 + 3), "copy");
  v11->_viewProperties = (_GCDevicePhysicalInputStateTable *)objc_msgSend(*((id *)v6 + 4), "copy");
  v11->_viewState = (_GCDevicePhysicalInputStateTable *)objc_msgSend(*((id *)v6 + 5), "copy");
  return v11;
}

- (_GCDevicePhysicalInputBase)init
{
  -[_GCDevicePhysicalInputBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)dealloc
{
  __assert_rtn("-[_GCDevicePhysicalInputBase dealloc]", "_GCDevicePhysicalInputBase.m", 342, "_objc_rootRetainCount(_facade) == 1");
}

- (GCDevice)device
{
  return (GCDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (_GCDevicePhysicalInputDataSource)dataSource
{
  return (_GCDevicePhysicalInputDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (_GCDevicePhysicalInput)physicalInput
{
  return 0;
}

- (uint64_t)_elementCount
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)_elementAtIndex:(uint64_t)result
{
  unint64_t v2;
  NSString *v3;

  if (result)
  {
    v2 = *(_QWORD *)(result + 24);
    if (v2 <= a2)
    {
      v3 = +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), "-[_GCDevicePhysicalInputBase _elementAtIndex:]", a2, v2);
      objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], v3, 0));
    }
    return *(_QWORD *)(*(_QWORD *)(result + 32) + 8 * a2);
  }
  return result;
}

- (uint64_t)_elementForAlias:(uint64_t)a1
{
  void *v3;

  if (a1 && (v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a2)) != 0)
    return -[_GCDevicePhysicalInputBase _elementAtIndex:](a1, objc_msgSend(v3, "unsignedIntegerValue"));
  else
    return 0;
}

- (uint64_t)elements
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (id)elementsForProtocol:(id *)result
{
  if (result)
  {
    if (a2)
      return -[_GCPhysicalInputFilteredElementCollection initWithCollection:filter:]((id *)[_GCPhysicalInputFilteredElementCollection alloc], result[8], a2);
    else
      return (id *)result[8];
  }
  return result;
}

- (BOOL)isSnapshot
{
  return 1;
}

- (double)lastEventTimestamp
{
  return 0.0;
}

- (double)lastEventLatency
{
  double v3;

  if (!dword_254DBDEFC)
    mach_timebase_info((mach_timebase_info_t)&lastEventLatency_sTimebaseInfo);
  -[_GCDevicePhysicalInputBase lastEventTimestamp](self, "lastEventTimestamp");
  return (double)(mach_absolute_time() * lastEventLatency_sTimebaseInfo / dword_254DBDEFC)
       / 1000000000.0
       - v3;
}

- (id)_stateTableForSlot:(SlotID)a3
{
  void *Property;
  ptrdiff_t v7;

  if (*((unsigned __int8 *)&a3.var1 + 4) == 3)
  {
    if (self)
    {
      v7 = 88;
LABEL_10:
      Property = objc_getProperty(self, a2, v7, 1);
      goto LABEL_11;
    }
  }
  else
  {
    if (*((unsigned __int8 *)&a3.var1 + 4) == 2)
    {
      if ((a3.var0 & 0xFF0000000000) != 0x20000000000)
        -[_GCDevicePhysicalInputBase _stateTableForSlot:].cold.1((uint64_t)a2, (uint64_t)self);
      if (self)
      {
        Property = self->_viewProperties;
        goto LABEL_11;
      }
      goto LABEL_15;
    }
    if (self)
    {
      v7 = 72;
      goto LABEL_10;
    }
  }
LABEL_15:
  Property = 0;
LABEL_11:
  if (HIWORD(a3.var0) != objc_msgSend(Property, "magic"))
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 485, CFSTR("Bad magic"));
  return Property;
}

- (id)viewConfiguration
{
  if (result)
    return objc_getProperty(result, a2, 72, 1);
  return result;
}

- (uint64_t)viewProperties
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (id)viewState
{
  if (result)
    return objc_getProperty(result, a2, 88, 1);
  return result;
}

- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4
{
  unint64_t v5;
  void *v9;
  objc_class *v10;

  v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x10000000000)
  {
    v9 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (objc_class *)objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 492, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive."), v5, NSStringFromClass(v10), a3);
  }
  if ((v5 & 0xFF00000000) == 0x300000000)
    -[_GCDevicePhysicalInputBase updateViewStateIfNeeded](self, "updateViewStateIfNeeded");
  return objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v5), "primitiveValueAtIndex:", v5);
}

- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  unint64_t v7;
  void *v10;
  objc_class *v11;

  v7 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x10000000000)
  {
    v10 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 505, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive"), v7, NSStringFromClass(v11), a3);
  }
  objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v7), "setPrimitiveValue:atIndex:", a4, v7);
}

- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  unint64_t v7;
  void *v11;
  objc_class *v12;

  v7 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x10000000000)
  {
    v11 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v12 = (objc_class *)objc_opt_class();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 514, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive"), v7, NSStringFromClass(v12), a3);
  }
  return objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v7), "testAndSetPrimitiveValue:atIndex:previous:", a4, v7, 0);
}

- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4
{
  unint64_t v5;
  void *v9;
  objc_class *v10;

  v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x20000000000)
  {
    v9 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (objc_class *)objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 523, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold an object"), v5, NSStringFromClass(v10), a3);
  }
  if ((v5 & 0xFF00000000) == 0x300000000)
    -[_GCDevicePhysicalInputBase updateViewStateIfNeeded](self, "updateViewStateIfNeeded");
  return (id)objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v5), "objectValueAtIndex:", v5);
}

- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  unint64_t v10;
  void *v12;
  objc_class *v13;

  v10 = *a5;
  if ((*a5 & 0xFF00000000) == 0x200000000)
  {
    -[_GCDevicePhysicalInputBase view:testAndSetObjectValue:forSlot:policy:](self, "view:testAndSetObjectValue:forSlot:policy:", a3, a4);
  }
  else
  {
    if ((v10 & 0xFF0000000000) != 0x20000000000)
    {
      v12 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v13 = (objc_class *)objc_opt_class();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 540, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold an object"), v10, NSStringFromClass(v13), a3);
    }
    objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v10), "setObjectValue:atIndex:policy:", a4, v10, a6);
  }
}

- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  unint64_t v9;
  void *v13;
  objc_class *v14;

  v9 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x20000000000)
  {
    v13 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v14 = (objc_class *)objc_opt_class();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 549, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold an object"), v9, NSStringFromClass(v14), a3);
  }
  return objc_msgSend(-[_GCDevicePhysicalInputBase _stateTableForSlot:](self, "_stateTableForSlot:", v9), "testAndSetObjectValue:atIndex:policy:compareObjects:previous:", a4, v9, a6, 1, 0);
}

- (id)view:(id)a3 viewForSlot:(unint64_t *)a4
{
  unint64_t v5;
  id result;
  void *v9;
  objc_class *v10;
  NSException *v11;

  v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x30000000000)
  {
    v9 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (objc_class *)objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 558, CFSTR("Slot [id: %#.8llx] of view <%@ %p> does not hold a view-ref"), v5, NSStringFromClass(v10), a3);
  }
  result = self->_additionalViews;
  if (result)
  {
    if (v5 >= CFArrayGetCount((CFArrayRef)result))
    {
      v11 = +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** %s: index %u beyond bounds [0 .. %lu]"), "-[_GCDevicePhysicalInputBase view:viewForSlot:]", v5, CFArrayGetCount(self->_additionalViews)), 0);
      objc_exception_throw(v11);
    }
    return (id)CFArrayGetValueAtIndex(self->_additionalViews, v5);
  }
  return result;
}

+ (id)description
{
  return CFSTR("Physical Input");
}

+ (id)debugDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  NSSet *attributes;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _GCDevicePhysicalInputElementsArray *indexedElementViews;
  const __CFString *v9;

  if (self)
  {
    if (-[NSSet count](self->_attributes, "count"))
    {
      attributes = self->_attributes;
LABEL_4:
      v4 = -[NSArray componentsJoinedByString:](-[NSSet allObjects](attributes, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
      goto LABEL_7;
    }
  }
  else
  {
    v5 = objc_msgSend(0, "count");
    attributes = 0;
    if (v5)
      goto LABEL_4;
  }
  v4 = CFSTR("default");
LABEL_7:
  v6 = objc_opt_class();
  v7 = -[_GCDevicePhysicalInputBase isSnapshot](self, "isSnapshot");
  if (self)
    indexedElementViews = self->_indexedElementViews;
  else
    indexedElementViews = 0;
  if (v7)
    v9 = CFSTR(" Snapshot");
  else
    v9 = &stru_24D2B85A8;
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@%@ '%@' (%zi elements)"), v6, v9, v4, -[_GCDevicePhysicalInputElementsArray count](indexedElementViews, "count"));
}

- (uint64_t)attributes
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (NSString)debugDescription
{
  _GCDevicePhysicalInputBase *v2;
  NSSet *attributes;
  const __CFString *v4;
  uint64_t v5;
  objc_class *v6;
  NSMutableString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v2 = self;
  v18 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    if (-[NSSet count](self->_attributes, "count"))
    {
      attributes = v2->_attributes;
LABEL_4:
      v4 = -[NSArray componentsJoinedByString:](-[NSSet allObjects](attributes, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
      goto LABEL_7;
    }
  }
  else
  {
    v5 = objc_msgSend(0, "count");
    attributes = 0;
    if (v5)
      goto LABEL_4;
  }
  v4 = CFSTR("default");
LABEL_7:
  v6 = (objc_class *)objc_opt_class();
  v7 = +[NSMutableString stringWithFormat:](&off_254DF2C58, "stringWithFormat:", CFSTR("<%@ %p> '%@' {"), NSStringFromClass(v6), v2, v4);
  if (v2)
  {
    -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("\n\t%@"), objc_msgSend((id)-[_GCDevicePhysicalInputFacade debugDescription](v2->_facade, "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t")));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = (_GCDevicePhysicalInputBase *)v2->_indexedElementViews;
  }
  else
  {
    -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("\n\t%@"), objc_msgSend((id)objc_msgSend(0, "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t")));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
  }
  v8 = -[_GCDevicePhysicalInputBase countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v2);
        -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("\n\t%@"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t")));
      }
      v9 = -[_GCDevicePhysicalInputBase countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  -[NSMutableString appendString:](v7, "appendString:", CFSTR("\n}"));
  return &v7->super;
}

- (uint64_t)facade
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (void)setViewConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 72);
}

- (void)setViewState:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 88);
}

- (void)_stateTableForSlot:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("_GCDevicePhysicalInputBase.m"), 473, CFSTR("Callbacks must be stored as objects."));
  __break(1u);
}

@end
