@implementation _NSKeyValueObjectBox

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueObjectBox;
  -[_NSKeyValueObjectBox dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated]((_BOOL8)self))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  return self->_objectPointer == *((_QWORD *)a3 + 2);
}

- (id)description
{
  unint64_t objectPointer;
  Class objectClass;
  id v4;
  const __CFString *v5;

  objectPointer = self->_objectPointer;
  objectClass = self->_objectClass;
  v4 = objc_loadWeak(&self->_object);
  v5 = CFSTR("live");
  if (!v4)
    v5 = CFSTR("deallocated");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Object: 0x%llx (%@ — %@)>"), objectPointer, objectClass, v5);
}

@end
