@implementation CAMControlDrawerCustomButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlDrawerCustomButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CAMControlDrawerExpandableButton"), CFSTR("isExpanded"), 1, 1);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CAMControlDrawerCustomButton"), CFSTR("CAMControlDrawerExpandableButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMControlDrawerCustomButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerButton"), CFSTR("_backgroundView"), "@", 0);

}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
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
  objc_super v20;
  CGRect result;

  if (-[CAMControlDrawerCustomButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    -[CAMControlDrawerCustomButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CAMControlDrawerCustomButtonAccessibility;
    -[CAMControlDrawerCustomButtonAccessibility accessibilityFrame](&v20, sel_accessibilityFrame);
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end
