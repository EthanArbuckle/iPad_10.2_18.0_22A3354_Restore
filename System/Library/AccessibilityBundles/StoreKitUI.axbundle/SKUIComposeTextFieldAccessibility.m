@implementation SKUIComposeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIComposeTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SKUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4
{
  SKUIComposeTextFieldAccessibility *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUIComposeTextFieldAccessibility;
  v4 = -[SKUIComposeTextFieldAccessibility initWithConfiguration:style:](&v9, sel_initWithConfiguration_style_, a3, *(_QWORD *)&a4);
  -[SKUIComposeTextFieldAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeTextFieldAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

  return v4;
}

@end
