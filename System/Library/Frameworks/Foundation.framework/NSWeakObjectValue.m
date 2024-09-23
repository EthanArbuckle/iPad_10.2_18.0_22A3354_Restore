@implementation NSWeakObjectValue

- (id)weakObjectValue
{
  return (id)_NSObjectLoadWeak();
}

- (NSWeakObjectValue)initWithObject:(id)a3
{
  NSWeakObjectValue *v4;
  NSWeakObjectValue *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSWeakObjectValue;
  v4 = -[NSValue init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    _NSObjectStoreWeak();
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _NSObjectStoreWeak();
  v3.receiver = self;
  v3.super_class = (Class)NSWeakObjectValue;
  -[NSWeakObjectValue dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualToValue:(id)a3
{
  void *value;

  if (self == a3)
    return 1;
  if (!a3)
    return 0;
  value = self->_value;
  return value == (void *)objc_msgSend(a3, "nonretainedObjectValue");
}

- (unint64_t)hash
{
  return (unint64_t)self->_value;
}

- (const)objCType
{
  return "@";
}

- (id)nonretainedObjectValue
{
  return self->_value;
}

- (void)getValue:(void *)a3
{
  *(_QWORD *)a3 = _NSObjectLoadWeak();
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  NSString *v4;

  if (a4 != 8)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes"), a4, -[NSWeakObjectValue objCType](self, "objCType", a3), 8);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v4, 0));
  }
  *(_QWORD *)a3 = _NSObjectLoadWeak();
}

@end
