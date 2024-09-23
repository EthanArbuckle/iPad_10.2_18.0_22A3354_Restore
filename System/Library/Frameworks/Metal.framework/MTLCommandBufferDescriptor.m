@implementation MTLCommandBufferDescriptor

+ (MTLCommandBufferDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLCommandBufferDescriptor *)+[MTLCommandBufferDescriptor allocWithZone:](_MTLCommandBufferDescriptor, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLCommandBufferDescriptor;
  return (MTLCommandBufferDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (MTLLogState)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
