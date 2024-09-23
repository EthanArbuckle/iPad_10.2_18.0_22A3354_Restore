@implementation MFWeakReferenceHolder

- (id)reference
{
  return objc_loadWeak((id *)&self->_reference);
}

- (id)retainedReference
{
  return objc_loadWeakRetained((id *)&self->_reference);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_reference, 0);
  v3.receiver = self;
  v3.super_class = (Class)MFWeakReferenceHolder;
  -[MFWeakReferenceHolder dealloc](&v3, sel_dealloc);
}

+ (id)weakReferenceWithObject:(id)a3
{
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)&weakReferenceWithObject__lock);
  v4 = objc_getAssociatedObject(a3, (const void *)sWeakReferenceKey);
  if (!v4)
    v4 = -[MFWeakReferenceHolder _initWithObject:]([MFWeakReferenceHolder alloc], "_initWithObject:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&weakReferenceWithObject__lock);
  return v4;
}

- (id)_initWithObject:(id)a3
{
  MFWeakReferenceHolder *v5;
  MFWeakReferenceHolder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFWeakReferenceHolder;
  v5 = -[MFWeakReferenceHolder init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if (!objc_storeWeak((id *)&v5->_reference, a3))
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("WeakReferences.m"), 51, CFSTR("object reference %p is not compatible with objc weak references"), a3);
      objc_setAssociatedObject(a3, (const void *)sWeakReferenceKey, v6, (void *)1);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

@end
