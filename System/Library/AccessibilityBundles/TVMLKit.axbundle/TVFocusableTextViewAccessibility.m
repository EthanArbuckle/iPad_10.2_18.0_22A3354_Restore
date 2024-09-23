@implementation TVFocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVFocusableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVFocusableTextView"), CFSTR("descriptionTextView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_opt_class();
  -[TVFocusableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  objc_msgSend(v4, "setIsAccessibilityElement:", v6);
  return v6;
}

- (BOOL)_isAccessibilityExplorerElement
{
  return -[TVFocusableTextViewAccessibility _accessibilityIsFrameOutOfBoundsConsideringScrollParents:](self, "_accessibilityIsFrameOutOfBoundsConsideringScrollParents:", 0) ^ 1;
}

- (unint64_t)_accessibilityExplorerElementReadPriority
{
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = NSClassFromString(CFSTR("_TVRelatedContentShelfView"));
  -[TVFocusableTextViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v4)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityAncestorIsKindOf:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v6)
      v7 = 1;
  }

  return v7;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[TVFocusableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionTextView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
