@implementation PKPaymentSetupHeroViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentSetupHeroView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentSetupHeroView"), CFSTR("_context"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupHeroView"), CFSTR("_isSmallPhone"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupHeroViewAccessibility;
  -[PKPaymentSetupHeroViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v3;

  if ((-[PKPaymentSetupHeroViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_context")) & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v3 = CFSTR("payment.hero.watch");
  }
  else if ((-[PKPaymentSetupHeroViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isSmallPhone")) & 1) != 0)
  {
    v3 = CFSTR("payment.hero.label.small.phone");
  }
  else if (AXDeviceHasPearl())
  {
    v3 = CFSTR("payment.hero.label.face.id");
  }
  else
  {
    v3 = CFSTR("payment.hero.label.touch.id");
  }
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (PKPaymentSetupHeroViewAccessibility)initWithContext:(int64_t)a3 featuredPaymentNetworks:(id)a4
{
  PKPaymentSetupHeroViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupHeroViewAccessibility;
  v4 = -[PKPaymentSetupHeroViewAccessibility initWithContext:featuredPaymentNetworks:](&v6, sel_initWithContext_featuredPaymentNetworks_, a3, a4);
  -[PKPaymentSetupHeroViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
