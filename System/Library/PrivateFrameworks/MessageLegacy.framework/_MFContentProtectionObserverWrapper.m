@implementation _MFContentProtectionObserverWrapper

- (_MFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4
{
  _MFContentProtectionObserverWrapper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFContentProtectionObserverWrapper;
  v6 = -[_MFContentProtectionObserverWrapper init](&v8, sel_init);
  if (v6)
  {
    v6->_observerReference = (MFWeakReferenceHolder *)(id)objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", a3);
    dispatch_retain((dispatch_object_t)a4);
    v6->_queue = (OS_dispatch_queue *)a4;
  }
  return v6;
}

- (MFContentProtectionObserver)observer
{
  return (MFContentProtectionObserver *)(id)-[MFWeakReferenceHolder retainedReference](self->_observerReference, "retainedReference");
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)_MFContentProtectionObserverWrapper;
  -[_MFContentProtectionObserverWrapper dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
