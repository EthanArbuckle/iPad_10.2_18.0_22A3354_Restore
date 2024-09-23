@implementation ACSportsSiriUIContentLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIContentLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("ACSportsBaseballScoreboardView"), CFSTR("ACSportsPeriodicScoreboardView"));
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)ACSportsSiriUIContentLabelAccessibility;
  -[ACSportsSiriUIContentLabelAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ACSportsSiriUIContentLabelAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsSportsPeriodVenueLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    v13 = v10 + -20.0;
  else
    v13 = v10;
  if (v12)
    v14 = v6 + 10.0;
  else
    v14 = v6;
  v15 = v4;
  v16 = v8;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

@end
