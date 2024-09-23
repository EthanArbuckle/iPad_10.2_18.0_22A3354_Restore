@implementation TLKRichTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKRichTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKRichTextField"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKRichTextField"), CFSTR("starRatingView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[TLKRichTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKRichTextFieldAccessibility _axLabelForElementIfVisible:](self, "_axLabelForElementIfVisible:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKRichTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("starRatingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKRichTextFieldAccessibility _axLabelForElementIfVisible:](self, "_axLabelForElementIfVisible:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axLabelForElementIfVisible:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
