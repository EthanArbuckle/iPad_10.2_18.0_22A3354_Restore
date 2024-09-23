@implementation _UIScrollViewWolfScrollIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIScrollViewWolfScrollIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIScrollViewWolfScrollIndicator"), CFSTR("type"), "Q", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityIdentifier
{
  if (-[_UIScrollViewWolfScrollIndicatorAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("type"), a2, self) == 1)return CFSTR("WolfScrollIndicatorVertical");
  else
    return CFSTR("WolfScrollIndicatorHorizontal");
}

@end
