@implementation PHAudioControlsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHAudioControlsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioControlsButton"), CFSTR("controlType"), "Q", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHAudioControlsButtonAccessibility;
  v3 = -[PHAudioControlsButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[PHAudioControlsButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("controlType"));
  if (v4 == 14 || v4 == 11)
    v3 &= ~*MEMORY[0x24BDF7400];
  return v3;
}

@end
