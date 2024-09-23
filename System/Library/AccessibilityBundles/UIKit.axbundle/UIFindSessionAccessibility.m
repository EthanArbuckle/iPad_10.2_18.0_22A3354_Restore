@implementation UIFindSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIFindSession");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityElementForFindSessionResult
{
  id location[3];
  id v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = self;
  if (objc_msgSend(location[0], "resultCount") <= 0)
    v4 = 0;
  else
    v4 = (id)objc_msgSend(location[0], "searchableResponder");
  objc_storeStrong(location, 0);
  return v4;
}

@end
