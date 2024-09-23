@implementation MTLArrayType

+ (MTLArrayType)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLArrayType *)+[MTLArrayType allocWithZone:](MTLArrayTypeInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLArrayType;
  return (MTLArrayType *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLStructType)elementStructType
{
  return 0;
}

- (MTLArrayType)elementArrayType
{
  return 0;
}

- (MTLTextureReferenceType)elementTextureReferenceType
{
  return 0;
}

- (MTLPointerType)elementPointerType
{
  return 0;
}

- (id)elementIndirectArgumentType
{
  return 0;
}

@end
