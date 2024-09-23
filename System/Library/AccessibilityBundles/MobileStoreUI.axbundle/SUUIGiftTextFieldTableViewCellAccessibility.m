@implementation SUUIGiftTextFieldTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIGiftTextFieldTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SUUIGiftTextFieldTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SUUIGiftTextFieldTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[SUUIGiftTextFieldTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");

  -[SUUIGiftTextFieldTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "BOOLValue");

  v6 = *MEMORY[0x24BDF73E8];
  if ((_DWORD)v3)
    v6 = 0;
  return v6 | v4;
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

  -[SUUIGiftTextFieldTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
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
