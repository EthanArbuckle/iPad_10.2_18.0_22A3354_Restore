@implementation SelectedColorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SelectedColorButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SelectedColorButton"), CFSTR("buttonWithType:radius:color:"), "q", "d", "@", 0);
}

+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SelectedColorButtonAccessibility;
  v7 = a5;
  objc_msgSendSuper2(&v11, sel_buttonWithType_radius_color_, a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelForFlagColor(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityLabel:", v9, v11.receiver, v11.super_class);
  return v8;
}

@end
