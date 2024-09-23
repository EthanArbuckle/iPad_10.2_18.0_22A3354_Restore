@implementation TPSlidingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSlidingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSlidingButton"), CFSTR("type"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSlidingButton"), CFSTR("delegate"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  -[TPSlidingButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
LABEL_3:
    v6 = v5;
    goto LABEL_4;
  }
  -[TPSlidingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if ((v9 & 0xFFFFFFFD) == 0)
  {
    accessibilityLocalizedString(CFSTR("phone.action.answer"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v13.receiver = self;
  v13.super_class = (Class)TPSlidingButtonAccessibility;
  -[TPSlidingButtonAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSlidingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_acceptButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSlidingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_acceptButton"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
LABEL_4:

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  char v3;

  -[TPSlidingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_acceptButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityActivate");

  return v3;
}

@end
