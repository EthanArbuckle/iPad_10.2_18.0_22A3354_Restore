@implementation _NSKeyValueObjectAndKeyPair

- (id)initWithObject:(void *)a3 key:(uint64_t)a4 context:
{
  id v7;
  uint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)_NSKeyValueObjectAndKeyPair;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(a2, sel_allowsWeakReference) & 1) != 0)
    {
      *((_QWORD *)v7 + 2) = a2;
      *((_QWORD *)v7 + 3) = object_getClass(a2);
      objc_storeWeak((id *)v7 + 1, a2);
      v8 = objc_msgSend(a3, "copy");
      *((_QWORD *)v7 + 4) = a4;
      *((_QWORD *)v7 + 5) = v8;
      return v7;
    }

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_object, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueObjectAndKeyPair;
  -[_NSKeyValueObjectAndKeyPair dealloc](&v3, sel_dealloc);
}

- (BOOL)objectWasDeallocated
{
  _BOOL8 v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x186DA8F78]();
    v1 = objc_loadWeak((id *)(v1 + 8)) == 0;
    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

- (_Unwind_Exception)newCurrentValue
{
  _Unwind_Exception *v1;
  void *v2;
  id v3;
  _Unwind_Exception *v4;

  v1 = exception_object;
  if (exception_object)
  {
    v2 = (void *)MEMORY[0x186DA8F78]();
    v3 = objc_loadWeak((id *)&v1->exception_cleanup);
    if (v3)
    {
      v1 = (_Unwind_Exception *)objc_msgSend(v3, "valueForKey:", v1[1].exception_cleanup);
      if (!v1)
        v1 = (_Unwind_Exception *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    else
    {
      v1 = 0;
    }
    v4 = v1;
    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  if (!-[_NSKeyValueObjectAndKeyPair objectWasDeallocated]((_BOOL8)self))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_objectPointer == *((_QWORD *)a3 + 2))
      return -[NSString isEqualToString:](self->_key, "isEqualToString:", *((_QWORD *)a3 + 5));
  }
  return 0;
}

- (unint64_t)hash
{
  unint64_t objectPointer;

  objectPointer = self->_objectPointer;
  return -[NSString hash](self->_key, "hash") ^ objectPointer;
}

- (id)description
{
  unint64_t objectPointer;
  Class objectClass;
  _BOOL4 v5;
  const __CFString *v6;

  objectPointer = self->_objectPointer;
  objectClass = self->_objectClass;
  v5 = -[_NSKeyValueObjectAndKeyPair objectWasDeallocated]((_BOOL8)self);
  v6 = CFSTR("live");
  if (v5)
    v6 = CFSTR("deallocated");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Key: 0x%llx (%@ -- %@).%@ (context: %p)>"), objectPointer, objectClass, v6, self->_key, self->_context);
}

@end
