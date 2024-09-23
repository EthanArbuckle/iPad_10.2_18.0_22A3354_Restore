@implementation MailStatusProgressBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailStatusProgressBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailStatusLabelView"), CFSTR("primaryLabelText"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MailStatusProgressBarView"), CFSTR("MailStatusLabelView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailStatusProgressBarView"), CFSTR("toolbarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFProgressToolbar"), CFSTR("progressView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIProgressView"), CFSTR("progress"), "f", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  -[MailStatusProgressBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toolbarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("progressView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeFloatForKey:", CFSTR("progress"));

  -[MailStatusProgressBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryLabelText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)AXFormatFloatWithPercentage();
  if (v5)
  {
    AXFormatFloatWithPercentage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
