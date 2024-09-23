@implementation AFUISiriViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AFUISiriViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("compactView:bottomContentInsetDidChange:"), "v", "@", "d", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AFUISiriViewController"), CFSTR("UIViewController"));

}

- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4
{
  id v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;
  char v17;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v7, "isClarityBoardEnabled");

  v9 = 0.0;
  if (v8)
  {
    v17 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;

    if (v13 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v9 = v15 - v13;

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AFUISiriViewControllerAccessibility;
  -[AFUISiriViewControllerAccessibility compactView:bottomContentInsetDidChange:](&v16, sel_compactView_bottomContentInsetDidChange_, v6, v9 + a4);

}

@end
