@implementation CAMSemanticStyleDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSemanticStyleDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  UIAXStringForAllChildren();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
