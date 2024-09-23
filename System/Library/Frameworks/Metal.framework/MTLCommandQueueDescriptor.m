@implementation MTLCommandQueueDescriptor

+ (MTLCommandQueueDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLCommandQueueDescriptor *)+[MTLCommandQueueDescriptor allocWithZone:](MTLCommandQueueDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLCommandQueueDescriptor;
  return (MTLCommandQueueDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (id)commandQueueDescriptor
{
  return objc_alloc_init(MTLCommandQueueDescriptorInternal);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (void)setMaxCommandBufferCount:(unint64_t)a3
{
  self->_maxCommandBufferCount = a3;
}

- (MTLLogState)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
