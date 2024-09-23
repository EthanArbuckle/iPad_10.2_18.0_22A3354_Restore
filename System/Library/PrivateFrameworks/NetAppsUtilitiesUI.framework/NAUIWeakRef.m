@implementation NAUIWeakRef

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_weakStorage, 0);
  v3.receiver = self;
  v3.super_class = (Class)NAUIWeakRef;
  -[NAUIWeakRef dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return (unint64_t)self->_weakPointer;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && (id)*((_QWORD *)a3 + 2) == self->_weakPointer;
}

+ (id)weakRefWithObject:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  if (objc_msgSend(a3, "allowsWeakReference"))
  {
    *((_BYTE *)v4 + 24) = 1;
    objc_storeWeak((id *)v4 + 1, a3);
  }
  *((_QWORD *)v4 + 2) = a3;
  return v4;
}

- (id)object
{
  if (self->_useWeakStorage)
    return objc_loadWeak(&self->_weakStorage);
  else
    return self->_weakPointer;
}

@end
