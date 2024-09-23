@implementation MTLFunctionReflection

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[MTLFunctionReflection allocWithZone:](MTLFunctionReflectionInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLFunctionReflection;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

@end
