@implementation _NSKeyedUnarchiverHelper

- (BOOL)classNameAllowed:(Class)a3
{
  objc_class *Superclass;
  BOOL v5;

  if (!self->_allowed)
    return 1;
  Superclass = a3;
  if (!a3)
    return 0;
  do
  {
    v5 = -[NSArray containsObject:](self->_allowed, "containsObject:", NSStringFromClass(Superclass));
    if (v5)
      break;
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyedUnarchiverHelper;
  -[_NSKeyedUnarchiverHelper dealloc](&v3, sel_dealloc);
}

- (_NSKeyedUnarchiverHelper)init
{
  self->_allowedClasses = (NSMutableArray *)objc_opt_new();
  *(_WORD *)&self->expectsUnnestedCollection = 0;
  return self;
}

- (id)allowedClassNames
{
  return self->_allowed;
}

- (void)setAllowedClassNames:(id)a3
{
  NSArray *allowed;

  allowed = self->_allowed;
  if (allowed != a3)
  {

    self->_allowed = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (NSError)decodeError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDecodeError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

@end
