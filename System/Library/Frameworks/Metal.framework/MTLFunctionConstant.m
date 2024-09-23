@implementation MTLFunctionConstant

+ (MTLFunctionConstant)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLFunctionConstant *)+[MTLFunctionConstant allocWithZone:](MTLFunctionConstantInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLFunctionConstant;
  return (MTLFunctionConstant *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

@end
