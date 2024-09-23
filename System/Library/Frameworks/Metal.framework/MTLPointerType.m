@implementation MTLPointerType

+ (MTLPointerType)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLPointerType *)+[MTLPointerType allocWithZone:](MTLPointerTypeInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLPointerType;
  return (MTLPointerType *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLStructType)elementStructType
{
  return 0;
}

- (MTLArrayType)elementArrayType
{
  return 0;
}

@end
