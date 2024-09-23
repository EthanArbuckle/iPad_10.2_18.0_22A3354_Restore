@implementation _GCDevicePhysicalInputView

+ (id)withTemplate:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTemplate:context:", a3, a4);
}

+ (id)withParameters:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithParameters:", a3);
}

- (_GCDevicePhysicalInputView)initWithTemplate:(id)a3 context:(id)a4
{
  _GCDevicePhysicalInputView *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  if (!a4)
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputView.m"), 39, CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputView;
  v7 = -[_GCDevicePhysicalInputView init](&v11, sel_init, a3);
  v8 = objc_msgSend(a4, "viewDataSource:", v7);
  v7->_dataSource = (_GCDevicePhysicalInputViewDataSource *)v8;
  if (!v8)
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_GCDevicePhysicalInputView.m"), 43, CFSTR("Context must provide a data source!"));
  v9 = (void *)objc_msgSend(a4, "implementation");
  if (v9)
  {
    v7->_isPartOfPhysicalInput = 1;
    v7->_isSnapshot = objc_msgSend(v9, "isSnapshot");
  }
  return v7;
}

- (_GCDevicePhysicalInputView)initWithParameters:(id)a3
{
  _GCDevicePhysicalInputView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputView;
  result = -[_GCDevicePhysicalInputView init](&v4, sel_init, a3);
  result->_dataSource = (_GCDevicePhysicalInputViewDataSource *)result;
  return result;
}

- (_GCDevicePhysicalInputView)init
{
  return -[_GCDevicePhysicalInputView initWithParameters:](self, "initWithParameters:", 0);
}

- (void)dealloc
{
  objc_super v2;

  self->_dataSource = 0;
  v2.receiver = self;
  v2.super_class = (Class)_GCDevicePhysicalInputView;
  -[_GCDevicePhysicalInputView dealloc](&v2, sel_dealloc);
}

- (uint64_t)physicalInput
{
  if (result)
  {
    if (*(_BYTE *)(result + 16))
      return *(_QWORD *)(result + 8);
    else
      return 0;
  }
  return result;
}

- (BOOL)isSnapshot
{
  if (result)
    return *(_BYTE *)(result + 17) != 0;
  return result;
}

+ (unsigned)updateContextSize
{
  return 0;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  return 0;
}

- (uint64_t)_primitiveValueForSlot:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:primitiveValueForSlot:", result, a2);
  return result;
}

- (uint64_t)_setPrimitiveValue:(uint64_t)a3 forSlot:
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:setPrimitiveValue:forSlot:", result, a2, a3);
  return result;
}

- (uint64_t)_testAndSetPrimitiveValue:(uint64_t)a3 forSlot:
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:testAndSetPrimitiveValue:forSlot:", result, a2, a3);
  return result;
}

- (uint64_t)_objectValueForSlot:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:objectValueForSlot:", result, a2);
  return result;
}

- (uint64_t)_setObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:setObjectValue:forSlot:policy:", result, a2, a3, a4);
  return result;
}

- (uint64_t)_testAndSetObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "view:testAndSetObjectValue:forSlot:policy:", result, a2, a3, a4);
  return result;
}

- (void)_willChangeValueForKey:(void *)a1
{
  unsigned __int8 v2;

  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)a1 + 18);
    if ((v2 & 1) != 0)
      return (void *)objc_msgSend(a1, "willChangeValueForKey:", a2);
  }
  return a1;
}

- (void)_didChangeValueForKey:(void *)a1
{
  unsigned __int8 v2;

  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)a1 + 18);
    if ((v2 & 1) != 0)
      return (void *)objc_msgSend(a1, "didChangeValueForKey:", a2);
  }
  return a1;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  objc_super v6;

  atomic_store(1u, (unsigned __int8 *)&self->_isObserved);
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputView;
  -[_GCDevicePhysicalInputView addObserver:forKeyPath:options:context:](&v6, sel_addObserver_forKeyPath_options_context_, a3, a4, a5, a6);
}

- (_GCDevicePhysicalInputView)retain
{
  _GCDevicePhysicalInputView *v2;
  _GCDevicePhysicalInputViewDataSource *dataSource;
  BOOL v4;
  _GCDevicePhysicalInputViewDataSource *v5;
  objc_super v7;

  v2 = self;
  dataSource = self->_dataSource;
  if (dataSource)
    v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  else
    v4 = 1;
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)_GCDevicePhysicalInputView;
    return -[_GCDevicePhysicalInputView retain](&v7, sel_retain);
  }
  else
  {
    v5 = dataSource;
  }
  return v2;
}

- (void)release
{
  _GCDevicePhysicalInputViewDataSource *dataSource;
  BOOL v3;
  objc_super v4;

  dataSource = self->_dataSource;
  if (dataSource)
    v3 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  else
    v3 = 1;
  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)_GCDevicePhysicalInputView;
    -[_GCDevicePhysicalInputView release](&v4, sel_release);
  }
  else
  {

  }
}

- (unint64_t)retainCount
{
  _GCDevicePhysicalInputViewDataSource *dataSource;
  BOOL v4;
  objc_super v6;

  dataSource = self->_dataSource;
  if (dataSource)
    v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  else
    v4 = 1;
  if (!v4)
    return -[_GCDevicePhysicalInputViewDataSource retainCount](dataSource, "retainCount");
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputView;
  return -[_GCDevicePhysicalInputView retainCount](&v6, sel_retainCount);
}

- (BOOL)retainWeakReference
{
  _GCDevicePhysicalInputViewDataSource *dataSource;
  BOOL v4;
  objc_super v6;

  dataSource = self->_dataSource;
  if (dataSource)
    v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  else
    v4 = 1;
  if (!v4)
    return -[_GCDevicePhysicalInputViewDataSource retainWeakReference](dataSource, "retainWeakReference");
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputView;
  return -[_GCDevicePhysicalInputView retainWeakReference](&v6, sel_retainWeakReference);
}

- (BOOL)allowsWeakReference
{
  _GCDevicePhysicalInputViewDataSource *dataSource;
  BOOL v3;
  objc_super v5;

  dataSource = self->_dataSource;
  if (dataSource)
    v3 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  else
    v3 = 1;
  if (!v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputView;
  return -[_GCDevicePhysicalInputView allowsWeakReference](&v5, sel_allowsWeakReference);
}

- (uint64_t)dataSource
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4
{
  return *a4;
}

- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  *a5 = a4;
}

- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  -[_GCDevicePhysicalInputView view:setPrimitiveValue:forSlot:](self, "view:setPrimitiveValue:forSlot:", self, a4, a5);
  return 1;
}

- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4
{
  return (id)*a4;
}

- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  if (*a5)
  {
    objc_setAssociatedObject(a3, (const void *)*a5, 0, (void *)0x301);
    *a5 = 0;
  }
  if (a6 == 3)
  {
    a4 = (id)objc_msgSend(a4, "copy");
    v10 = a3;
    v11 = a4;
    v12 = a4;
    v13 = 1;
  }
  else
  {
    if (a6 != 771)
    {
      objc_setAssociatedObject(a3, a4, a4, (void *)a6);
      goto LABEL_9;
    }
    a4 = (id)objc_msgSend(a4, "copy");
    v10 = a3;
    v11 = a4;
    v12 = a4;
    v13 = 769;
  }
  objc_setAssociatedObject(v10, v11, v12, (void *)v13);

LABEL_9:
  *a5 = (unint64_t)a4;
}

- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  -[_GCDevicePhysicalInputView view:setObjectValue:forSlot:policy:](self, "view:setObjectValue:forSlot:policy:", a3, a4, a5, a6);
  return 1;
}

- (id)view:(id)a3 viewForSlot:(unint64_t *)a4
{
  return (id)*a4;
}

- (_GCDevicePhysicalInputBase)implementation
{
  return 0;
}

- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4
{
  objc_setAssociatedObject(a3, a4, a4, (void *)0x301);
  return (unint64_t)a4;
}

- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  return 0;
}

- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  return 0;
}

@end
