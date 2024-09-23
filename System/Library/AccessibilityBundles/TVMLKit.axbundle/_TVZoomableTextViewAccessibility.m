@implementation _TVZoomableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVZoomableTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TVFocusableTextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVZoomableTextView"), CFSTR("TVFocusableTextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVFocusableTextView"), CFSTR("moreLabel"), "@", 0);

}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v2;
  char v3;

  -[_TVZoomableTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moreLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 0;
}

@end
