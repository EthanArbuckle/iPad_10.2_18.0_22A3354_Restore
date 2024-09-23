@implementation SUUIDynamicMenuBarViewElement

- (BOOL)isDynamicContainer
{
  return 1;
}

+ (Class)_titlesMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

+ (Class)_shelfMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

@end
