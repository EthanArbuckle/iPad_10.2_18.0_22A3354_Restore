@implementation _UIReplicantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIReplicantView");
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

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[_UIReplicantViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 0;
  v4 = (id)-[_UIReplicantViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

@end
