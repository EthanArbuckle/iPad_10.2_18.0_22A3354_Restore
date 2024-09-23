@implementation MPAddKeepLocalControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAddKeepLocalControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCustomActionLabel
{
  JUMPOUT(0x2348C0538);
}

- (void)_accessibilitySetCustomActionLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAddKeepLocalControl"), CFSTR("controlStatus"), "{MPAddKeepLocalControlStatus=qd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAddKeepLocalControl"), CFSTR("setControlStatus:animated:"), "v", "{MPAddKeepLocalControlStatus=qd}", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MPAddKeepLocalControlAccessibility accessibilityValue](self, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[MPAddKeepLocalControlAccessibility accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (id)accessibilityLabel
{
  return -[MPAddKeepLocalControlAccessibility _accessibilityLabelForStatusType:](self, "_accessibilityLabelForStatusType:", -[MPAddKeepLocalControlAccessibility controlStatus](self, "controlStatus"));
}

- (id)accessibilityValue
{
  uint64_t v3;
  double v4;

  v3 = -[MPAddKeepLocalControlAccessibility controlStatus](self, "controlStatus");
  return -[MPAddKeepLocalControlAccessibility _accessibilityValueForStatusType:andDownloadProgress:](self, "_accessibilityValueForStatusType:andDownloadProgress:", v3, v4);
}

- (id)_accessibilityLabelForStatusType:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("add.button");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = CFSTR("download.button");
  }
  accessibilityMPLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 3)
  {
    accessibilityMPLocalizedString(CFSTR("waiting.download"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 4)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMPLocalizedString(CFSTR("downloading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_accessibilityCustomActionLabelForControlStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  accessibilityMPLocalizedString(off_24FEF3880[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPAddKeepLocalControlAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[MPAddKeepLocalControlAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[MPAddKeepLocalControlAccessibility controlStatus](self, "controlStatus");
  v5 = *MEMORY[0x24BDF7430];
  if (v4 != 4)
    v5 = 0;
  return v3 | v5;
}

- (void)setControlStatus:(MPAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  int64_t var0;
  void *v6;
  objc_super v7;

  var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)MPAddKeepLocalControlAccessibility;
  -[MPAddKeepLocalControlAccessibility setControlStatus:animated:](&v7, sel_setControlStatus_animated_, a3.var0, *(_QWORD *)&a3.var1, a4);
  -[MPAddKeepLocalControlAccessibility _accessibilityCustomActionLabelForControlStatus:](self, "_accessibilityCustomActionLabelForControlStatus:", var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAddKeepLocalControlAccessibility _accessibilitySetCustomActionLabel:](self, "_accessibilitySetCustomActionLabel:", v6);

}

@end
