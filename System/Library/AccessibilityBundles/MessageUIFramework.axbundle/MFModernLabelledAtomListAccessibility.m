@implementation MFModernLabelledAtomListAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFModernLabelledAtomList");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernLabelledAtomList"), CFSTR("labelText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernLabelledAtomList"), CFSTR("atomDisplayStrings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernLabelledAtomList"), CFSTR("label"), "@", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (BOOL)_accessibilitySpeakThisIgnoresAccessibilityElementStatus
{
  return 1;
}

- (id)_accessibilitySpeakThisString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[MFModernLabelledAtomListAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernLabelledAtomListAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("atomDisplayStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "indexOfObject:", v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "removeObjectAtIndex:", v6);
      objc_msgSend(v4, "insertObject:atIndex:", v5, 0);
    }
  }

  return v4;
}

@end
