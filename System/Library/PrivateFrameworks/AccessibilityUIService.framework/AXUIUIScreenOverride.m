@implementation AXUIUIScreenOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScreen");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_isMainScreen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_displayPeripheryInsetsRestrictedToScene"), "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_displayPeripheryInsets"), "{UIEdgeInsets=dddd}", 0);

}

- (UIEdgeInsets)_displayPeripheryInsetsRestrictedToScene
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  UIEdgeInsets result;

  if (-[AXUIUIScreenOverride safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isMainScreen")))
  {
    objc_opt_class();
    -[AXUIUIScreenOverride safeValueForKey:](self, "safeValueForKey:", CFSTR("_displayPeripheryInsets"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "UIEdgeInsetsValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)AXUIUIScreenOverride;
    -[AXUIUIScreenOverride _displayPeripheryInsetsRestrictedToScene](&v21, sel__displayPeripheryInsetsRestrictedToScene);
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

@end
