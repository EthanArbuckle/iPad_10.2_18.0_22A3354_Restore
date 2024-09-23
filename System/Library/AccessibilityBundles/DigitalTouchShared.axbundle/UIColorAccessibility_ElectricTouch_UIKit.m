@implementation UIColorAccessibility_ElectricTouch_UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIColor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedApproximateColorDescription
{
  return (id)-[UIColorAccessibility_ElectricTouch_UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXCachedApproximateColorDescription"));
}

- (void)_axSetCachedApproximateColorDescription:(id)a3
{
  -[UIColorAccessibility_ElectricTouch_UIKit _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("kAXCachedApproximateColorDescription"));
}

- (double)axHue
{
  double v3;

  v3 = 0.0;
  -[UIColorAccessibility_ElectricTouch_UIKit getHue:saturation:brightness:alpha:](self, "getHue:saturation:brightness:alpha:", &v3, 0, 0, 0);
  return v3;
}

- (double)axSaturation
{
  double v3;

  v3 = 0.0;
  -[UIColorAccessibility_ElectricTouch_UIKit getHue:saturation:brightness:alpha:](self, "getHue:saturation:brightness:alpha:", 0, &v3, 0, 0);
  return v3;
}

- (id)axApproximateColorDescription
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __CFString *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  -[UIColorAccessibility_ElectricTouch_UIKit _axCachedApproximateColorDescription](self, "_axCachedApproximateColorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIColorAccessibility_ElectricTouch_UIKit axHue](self, "axHue");
    v5 = v4;
    -[UIColorAccessibility_ElectricTouch_UIKit axSaturation](self, "axSaturation");
    v7 = v6;
    -[UIColorAccessibility_ElectricTouch_UIKit axLuminance](self, "axLuminance");
    v9 = v8;
    if (v8 <= 0.99000001)
    {
      if (v8 >= 0.00999999978)
      {
        if (v7 >= 0.0500000007)
        {
          v16 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("color.format.lightness.saturation.hue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIColorAccessibility_ElectricTouch_UIKit axLightnessModifier](self, "axLightnessModifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIColorAccessibility_ElectricTouch_UIKit axSaturationModifier](self, "axSaturationModifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5 <= 0.0560000017 || v5 >= 0.111000001 || v9 >= 0.430000007)
          {
            -[UIColorAccessibility_ElectricTouch_UIKit axHueName](self, "axHueName");
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            accessibilityLocalizedString(CFSTR("color.brown"));
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v21 = (void *)v20;
          objc_msgSend(v16, "stringWithFormat:", v17, v18, v19, v20);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("color.format.lightness.hue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIColorAccessibility_ElectricTouch_UIKit axLightnessModifier](self, "axLightnessModifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          accessibilityLocalizedString(CFSTR("color.gray"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", v13, v14, v15);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_7;
      }
      v10 = CFSTR("color.black");
    }
    else
    {
      v10 = CFSTR("color.white");
    }
    accessibilityLocalizedString(v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    -[UIColorAccessibility_ElectricTouch_UIKit _axSetCachedApproximateColorDescription:](self, "_axSetCachedApproximateColorDescription:", v3);
  }
  return v3;
}

- (id)axHueName
{
  void *v3;

  v3 = (void *)objc_opt_class();
  -[UIColorAccessibility_ElectricTouch_UIKit axHue](self, "axHue");
  return (id)objc_msgSend(v3, "axHueNameForValue:");
}

- (id)axLightnessModifier
{
  double v2;
  __CFString *v3;
  __CFString *v4;

  -[UIColorAccessibility_ElectricTouch_UIKit axLuminance](self, "axLuminance");
  if (v2 >= 0.349999994)
  {
    if (v2 <= 0.850000024)
    {
      v4 = &stru_2501F6170;
      return v4;
    }
    v3 = CFSTR("color.lightness.high");
  }
  else
  {
    v3 = CFSTR("color.lightness.low");
  }
  accessibilityLocalizedString(v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)axSaturationModifier
{
  double v3;
  __CFString *v4;
  double v5;
  __CFString *v6;

  -[UIColorAccessibility_ElectricTouch_UIKit axSaturation](self, "axSaturation");
  if (v3 >= 0.200000003)
  {
    if (v3 <= 0.899999976
      || (-[UIColorAccessibility_ElectricTouch_UIKit axLuminance](self, "axLuminance"), v5 <= 0.699999988))
    {
      v6 = &stru_2501F6170;
      return v6;
    }
    v4 = CFSTR("color.saturation.high");
  }
  else
  {
    v4 = CFSTR("color.saturation.low");
  }
  accessibilityLocalizedString(v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)axHueNameForValue:(double)a3
{
  __CFString *v5;

  if (a3 < 0.0 || a3 > 1.0)
  {
    _AXAssert();
    return 0;
  }
  if (a3 >= 0.0280000009)
  {
    if (a3 < 0.0560000017)
    {
      v5 = CFSTR("color.hue.red.orange");
      goto LABEL_39;
    }
    if (a3 < 0.111000001)
    {
      v5 = CFSTR("color.hue.orange");
      goto LABEL_39;
    }
    if (a3 < 0.128999993)
    {
      v5 = CFSTR("color.hue.orange.yellow");
      goto LABEL_39;
    }
    if (a3 < 0.166999996)
    {
      v5 = CFSTR("color.hue.yellow");
      goto LABEL_39;
    }
    if (a3 < 0.222000003)
    {
      v5 = CFSTR("color.hue.yellow.green");
      goto LABEL_39;
    }
    if (a3 < 0.388999999)
    {
      v5 = CFSTR("color.hue.green");
      goto LABEL_39;
    }
    if (a3 < 0.469000012)
    {
      v5 = CFSTR("color.hue.green.cyan");
      goto LABEL_39;
    }
    if (a3 < 0.540000021)
    {
      v5 = CFSTR("color.hue.cyan");
      goto LABEL_39;
    }
    if (a3 < 0.611000001)
    {
      v5 = CFSTR("color.hue.cyan.blue");
      goto LABEL_39;
    }
    if (a3 < 0.666999996)
    {
      v5 = CFSTR("color.hue.blue");
      goto LABEL_39;
    }
    if (a3 < 0.800000012)
    {
      v5 = CFSTR("color.hue.blue.magenta");
      goto LABEL_39;
    }
    if (a3 < 0.888999999)
    {
      v5 = CFSTR("color.hue.magenta");
      goto LABEL_39;
    }
    if (a3 < 0.916999996)
    {
      v5 = CFSTR("color.hue.magenta.pink");
      goto LABEL_39;
    }
    if (a3 < 0.958000004)
    {
      v5 = CFSTR("color.hue.pink");
      goto LABEL_39;
    }
    if (a3 < 0.986000001)
    {
      v5 = CFSTR("color.hue.pink.red");
      goto LABEL_39;
    }
  }
  v5 = CFSTR("color.hue.red");
LABEL_39:
  accessibilityLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)axColorStringForSpeaking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIColorAccessibility_ElectricTouch_UIKit axLuminance](self, "axLuminance");
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[UIColorAccessibility_ElectricTouch_UIKit axApproximateColorDescription](self, "axApproximateColorDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
