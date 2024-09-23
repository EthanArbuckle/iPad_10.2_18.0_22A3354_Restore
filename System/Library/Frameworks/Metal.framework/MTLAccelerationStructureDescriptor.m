@implementation MTLAccelerationStructureDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setUsage:", self->_usage);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  MTLAccelerationStructureUsage v7;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v7 = -[MTLAccelerationStructureDescriptor usage](self, "usage");
  return v7 == objc_msgSend(a3, "usage");
}

- (unint64_t)hash
{
  MTLAccelerationStructureUsage v3;

  v3 = -[MTLAccelerationStructureDescriptor usage](self, "usage");
  return _MTLHashState((int *)&v3, 8uLL);
}

- (BOOL)isInstanceDescriptor
{
  return 0;
}

- (MTLAccelerationStructureUsage)usage
{
  return self->_usage;
}

- (void)setUsage:(MTLAccelerationStructureUsage)usage
{
  self->_usage = usage;
}

@end
