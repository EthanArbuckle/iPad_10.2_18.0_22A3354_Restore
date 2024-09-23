@implementation HUAlarmTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAlarmTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAlarmTableViewCell"), CFSTR("enabledSwitch"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAlarmTableViewCell"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAlarmTableViewCell"), CFSTR("nameAndDescriptionLabel"), "@", 0);

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUAlarmTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("enabledSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[HUAlarmTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("enabledSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return (id)-[HUAlarmTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("timeLabel, nameAndDescriptionLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7428];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
