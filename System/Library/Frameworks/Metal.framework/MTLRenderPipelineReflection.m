@implementation MTLRenderPipelineReflection

+ (MTLRenderPipelineReflection)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLRenderPipelineReflection *)+[MTLRenderPipelineReflection allocWithZone:](MTLRenderPipelineReflectionInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPipelineReflection;
  return (MTLRenderPipelineReflection *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

@end
