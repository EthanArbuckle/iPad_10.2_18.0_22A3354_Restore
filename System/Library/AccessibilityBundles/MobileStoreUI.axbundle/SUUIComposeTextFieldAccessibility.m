@implementation SUUIComposeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIComposeTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4
{
  SUUIComposeTextFieldAccessibility *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIComposeTextFieldAccessibility;
  v4 = -[SUUIComposeTextFieldAccessibility initWithConfiguration:style:](&v9, sel_initWithConfiguration_style_, a3, *(_QWORD *)&a4);
  -[SUUIComposeTextFieldAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeTextFieldAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

  return v4;
}

@end
