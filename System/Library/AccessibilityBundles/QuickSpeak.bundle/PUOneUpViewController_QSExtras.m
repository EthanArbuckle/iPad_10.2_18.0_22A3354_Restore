@implementation PUOneUpViewController_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOneUpViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityQuickSpeakContent
{
  return 0;
}

@end
