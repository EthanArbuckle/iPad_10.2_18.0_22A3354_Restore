@implementation _UISearchTokenLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchTokenLayoutView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISearchTokenLayoutView"), CFSTR("delegateView"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  return (id)-[_UISearchTokenLayoutViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("delegateView"), a2, self);
}

- (unint64_t)accessibilityTraits
{
  id v3;
  unint64_t v4;

  v3 = (id)-[_UISearchTokenLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegateView"));
  v4 = objc_msgSend(v3, "accessibilityTraits");

  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  char v4;

  v3 = (id)-[_UISearchTokenLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegateView"));
  v4 = objc_msgSend(v3, "isAccessibilityElement");

  return v4 & 1;
}

@end
