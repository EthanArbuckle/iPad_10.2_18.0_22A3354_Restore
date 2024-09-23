@implementation MTLStageInputOutputDescriptor

+ (MTLStageInputOutputDescriptor)stageInputOutputDescriptor
{
  return (MTLStageInputOutputDescriptor *)objc_alloc_init(MTLStageInputOutputDescriptorInternal);
}

+ (MTLStageInputOutputDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLStageInputOutputDescriptor *)+[MTLStageInputOutputDescriptor allocWithZone:](MTLStageInputOutputDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLStageInputOutputDescriptor;
  return (MTLStageInputOutputDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  return 0;
}

@end
