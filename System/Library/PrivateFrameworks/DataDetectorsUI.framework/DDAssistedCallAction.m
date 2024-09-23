@implementation DDAssistedCallAction

+ (BOOL)isAvailable
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___DDAssistedCallAction;
  v2 = objc_msgSendSuper2(&v4, sel_isAvailable);
  if (v2)
    LOBYTE(v2) = _AXSSoftwareTTYEnabled() != 0;
  return v2;
}

- (id)iconName
{
  return CFSTR("teletype");
}

- (id)subtitle
{
  return 0;
}

@end
