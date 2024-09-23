@implementation _UISearchAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchAtomView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UISearchAtomView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("selectionStyle"), "q", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  return (id)-[_UISearchAtomViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("textLabel"), a2, self);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  unint64_t v4;
  objc_super v5;
  SEL v6;
  _UISearchAtomViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UISearchAtomViewAccessibility;
  v4 = -[_UISearchAtomViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[_UISearchAtomViewAccessibility safeIntegerForKey:](v7, "safeIntegerForKey:", CFSTR("selectionStyle")))
    v3 = *MEMORY[0x24BDF7400];
  else
    v3 = 0;
  return v4 | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
