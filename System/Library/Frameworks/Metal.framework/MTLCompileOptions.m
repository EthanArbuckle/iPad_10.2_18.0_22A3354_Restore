@implementation MTLCompileOptions

+ (MTLCompileOptions)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLCompileOptions *)+[MTLCompileOptions allocWithZone:](MTLCompileOptionsInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLCompileOptions;
  return (MTLCompileOptions *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end
