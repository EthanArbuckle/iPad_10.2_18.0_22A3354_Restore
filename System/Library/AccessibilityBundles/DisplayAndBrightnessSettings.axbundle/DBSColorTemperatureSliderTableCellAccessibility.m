@implementation DBSColorTemperatureSliderTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DBSColorTemperatureSliderTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("ScreenColorTemperature"));
}

- (id)accessibilityValue
{
  void *v3;
  double v4;
  double v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;

  -[DBSColorTemperatureSliderTableCellAccessibility _accessibilityAbsoluteValue](self, "_accessibilityAbsoluteValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = fabs(v4 + -0.5);
  if (v5 >= 0.15)
  {
    if (fabs(v4 + -0.25) >= 0.15)
    {
      if (fabs(v4) >= 0.15)
      {
        if (fabs(v4 + -0.75) >= 0.15)
        {
          if (v5 >= 1.0)
          {
            v7 = 0;
            goto LABEL_12;
          }
          v6 = CFSTR("screen.color.warmest");
        }
        else
        {
          v6 = CFSTR("screen.color.warmer");
        }
      }
      else
      {
        v6 = CFSTR("screen.color.coolest");
      }
    }
    else
    {
      v6 = CFSTR("screen.color.cooler");
    }
  }
  else
  {
    v6 = CFSTR("screen.color.midpoint");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)DBSColorTemperatureSliderTableCellAccessibility;
  -[DBSColorTemperatureSliderTableCellAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
