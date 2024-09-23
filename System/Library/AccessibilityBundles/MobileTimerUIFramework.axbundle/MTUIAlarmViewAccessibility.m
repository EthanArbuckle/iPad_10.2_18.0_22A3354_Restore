@implementation MTUIAlarmViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTUIAlarmView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("enabledSwitch"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("repeatText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("detailLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v5;
  void *v6;
  char v7;

  -[MTUIAlarmViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[MTUIAlarmViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[MTUIAlarmViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("repeatText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enabledSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enabledSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

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

  -[MTUIAlarmViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enabledSwitch"));
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

@end
