@implementation CAMHDRButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMHDRButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMHDRButton"), CFSTR("HDRMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMHDRButton"), CFSTR("setHDRMode:"), "v", "q", 0);

}

- (BOOL)accessibilityActivate
{
  void *v2;

  -[CAMHDRButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("HDRMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "integerValue");

  AXPerformSafeBlock();
  return 1;
}

void __50__CAMHDRButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setHDRMode:", *(_QWORD *)(a1 + 40));
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("hdr.label"));
}

- (id)accessibilityValue
{
  void *v2;
  unsigned int v3;
  void *v4;

  -[CAMHDRButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("HDRMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityCameraKitLocalizedString(off_24FEE0A70[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(CFSTR("flash.hdr.button.hint.text"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("HDR");
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMHDRButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMHDRButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
