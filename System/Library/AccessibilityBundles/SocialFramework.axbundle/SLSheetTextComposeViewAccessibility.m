@implementation SLSheetTextComposeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLSheetTextComposeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SLSheetTextComposeViewAccessibility)initWithFrame:(CGRect)a3
{
  SLSheetTextComposeViewAccessibility *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLSheetTextComposeViewAccessibility;
  v3 = -[SLSheetTextComposeViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SLSheetTextComposeViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SocialSheetComposeTextView"));

  return v3;
}

@end
