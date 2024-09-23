@implementation MTLStructMember

+ (MTLStructMember)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLStructMember *)+[MTLStructMember allocWithZone:](MTLStructMemberInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLStructMember;
  return (MTLStructMember *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLStructType)structType
{
  return 0;
}

- (MTLArrayType)arrayType
{
  return 0;
}

- (MTLTextureReferenceType)textureReferenceType
{
  return 0;
}

- (MTLPointerType)pointerType
{
  return 0;
}

- (id)indirectArgumentType
{
  return 0;
}

@end
