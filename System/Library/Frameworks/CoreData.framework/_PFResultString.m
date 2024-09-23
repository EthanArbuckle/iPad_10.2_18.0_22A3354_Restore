@implementation _PFResultString

- (void)release
{

}

- (_PFResultString)retain
{
  id v3;

  v3 = self->_parentObject;
  return self;
}

+ (unint64_t)bufferOffset
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self);
}

- (id)copy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self);
}

- (unint64_t)retainCount
{
  return objc_msgSend(self->_parentObject, "retainCount");
}

- (BOOL)_isDeallocating
{
  return objc_msgSend(self->_parentObject, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  return objc_msgSend(self->_parentObject, "_tryRetain");
}

@end
