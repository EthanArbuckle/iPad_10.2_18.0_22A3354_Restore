@implementation PKPhysicsBody(SKPhysicsBody)

- (const)_descriptionClassName
{
  return CFSTR("SKPhysicsBody");
}

- (uint64_t)isKindOfClass:()SKPhysicsBody
{
  objc_super v6;

  if (objc_opt_class() == a3)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F03C1830;
  return (uint64_t)objc_msgSendSuper2(&v6, sel_isKindOfClass_, a3);
}

@end
