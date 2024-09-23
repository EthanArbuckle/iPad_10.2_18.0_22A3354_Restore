@implementation _GCDevicePhysicalInputInitializationContext

- (_QWORD)initWithViewConfiguration:(uint64_t)a3 viewProperties:(uint64_t)a4 viewState:
{
  _QWORD *v7;
  CFArrayCallBacks callBacks;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)_GCDevicePhysicalInputInitializationContext;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  memset(&callBacks, 0, sizeof(callBacks));
  v7[2] = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks);
  if (a2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, CFSTR("_GCDevicePhysicalInputBase.m"), 91, CFSTR("Invalid parameter not satisfying: %s"), "viewConfiguration == nil || [viewConfiguration isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
    if (!a3)
      goto LABEL_7;
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, CFSTR("_GCDevicePhysicalInputBase.m"), 92, CFSTR("Invalid parameter not satisfying: %s"), "viewProperties == nil || [viewProperties isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
LABEL_7:
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, CFSTR("_GCDevicePhysicalInputBase.m"), 93, CFSTR("Invalid parameter not satisfying: %s"), "viewState == nil || [viewState isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
      if (a2)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  if (!a2)
LABEL_10:
    a2 = objc_opt_new();
LABEL_11:
  v7[3] = a2;
  if (!a3)
    a3 = objc_opt_new();
  v7[4] = a3;
  if (!a4)
    a4 = objc_opt_new();
  v7[5] = a4;
  return v7;
}

- (_GCDevicePhysicalInputInitializationContext)init
{
  return (_GCDevicePhysicalInputInitializationContext *)-[_GCDevicePhysicalInputInitializationContext initWithViewConfiguration:viewProperties:viewState:](self, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_views);
  self->_views = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)

  self->_viewConfiguration = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)

  self->_viewProperties = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)

  self->_viewState = 0;
  self->_implementation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputInitializationContext;
  -[_GCDevicePhysicalInputInitializationContext dealloc](&v3, sel_dealloc);
}

- (uint64_t)viewConfiguration
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)viewProperties
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)viewState
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)_stateMagic:(uint64_t)result
{
  if (result)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    return objc_msgSend(a2, "magic");
  }
  return result;
}

- (id)viewDataSource:(id)a3
{
  return self->_implementation;
}

- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4
{
  const void *v5;
  unsigned int Count;

  v5 = (const void *)objc_msgSend((id)objc_opt_class(), "withTemplate:context:", a4, self);
  Count = CFArrayGetCount(self->_views);
  CFArrayAppendValue(self->_views, v5);
  return Count | 0x30000000000;
}

- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  unint64_t v6;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  id *v16;
  unint64_t v18;

  v6 = a6;
  v8 = a4;
  v18 = a6;
  v12 = (void *)*((_QWORD *)&self->_viewConfiguration + (a4 - 1));
  v13 = -[_GCDevicePhysicalInputInitializationContext _stateMagic:]((uint64_t)self, v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (HIWORD(v6) != (_DWORD)v13)
    {
      v14 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v15 = (objc_class *)objc_opt_class();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 193, CFSTR("<%@ %p> is allocating a new slot with a copy of the value from %@, in a slot that is not part of the existing state table."), NSStringFromClass(v15), a3, a5, v18);
    }
  }
  else
  {
    v16 = -[_GCDevicePhysicalInputMutableStateTable allocatePrimitiveSlot]((id *)v12);
    objc_msgSend(v12, "setPrimitiveValue:atIndex:", objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource]((uint64_t)a5), "view:primitiveValueForSlot:", a5, &v18), v16);
    return (v13 << 48) | (v8 << 32) | v16 | 0x10000000000;
  }
  return v6;
}

- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  unint64_t v6;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  unint64_t v18;

  v6 = a6;
  v8 = a4;
  v18 = a6;
  v12 = (void *)*((_QWORD *)&self->_viewConfiguration + (a4 - 1));
  v13 = -[_GCDevicePhysicalInputInitializationContext _stateMagic:]((uint64_t)self, v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (HIWORD(v6) != (_DWORD)v13)
    {
      v14 = (void *)unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v15 = (objc_class *)objc_opt_class();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputBase.m"), 233, CFSTR("<%@ %p> is allocating a new slot with a copy of the value from %@, in a slot that is not part of the existing state table."), NSStringFromClass(v15), a3, a5, v18);
    }
  }
  else
  {
    v16 = -[_GCDevicePhysicalInputMutableStateTable allocateObjectSlot]((id *)v12);
    objc_msgSend(v12, "setObjectValue:atIndex:policy:", objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource]((uint64_t)a5), "view:objectValueForSlot:", a5, &v18), v16, 769);
    return (v13 << 48) | (v8 << 32) | v16 | 0x20000000000;
  }
  return v6;
}

- (_GCDevicePhysicalInputBase)implementation
{
  return self->_implementation;
}

@end
