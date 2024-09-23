@implementation WKScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WKScrollView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollViewAccessibility"), CFSTR("_accessibilityStoredVisibleContentInset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollViewAccessibility"), CFSTR("_accessibilityStoredShouldUseFallbackForVisibleContentInset"), "@", 0);

}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  UIEdgeInsets result;

  -[WKScrollViewAccessibility _accessibilityStoredVisibleContentInset](self, "_accessibilityStoredVisibleContentInset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "UIEdgeInsetsValue");
  }
  else
  {
    -[WKScrollViewAccessibility _accessibilityStoredShouldUseFallbackForVisibleContentInset](self, "_accessibilityStoredShouldUseFallbackForVisibleContentInset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "adjustedContentInset");
      v10 = v19;
      v11 = v20;
      v12 = v21;
      v13 = v22;

      goto LABEL_6;
    }
    v23.receiver = self;
    v23.super_class = (Class)WKScrollViewAccessibility;
    -[WKScrollViewAccessibility _accessibilityVisibleContentInset](&v23, sel__accessibilityVisibleContentInset);
  }
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
LABEL_6:

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

@end
