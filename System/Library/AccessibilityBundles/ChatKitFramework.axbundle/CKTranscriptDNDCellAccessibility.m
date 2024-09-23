@implementation CKTranscriptDNDCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptDNDCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptDNDCell"), CFSTR("setMuteSwitch:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKTranscriptDNDCell"), CFSTR("_muteSwitch"), "UISwitch");

}

- (void)setMuteSwitch:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptDNDCellAccessibility;
  v3 = a3;
  -[CKTranscriptDNDCellAccessibility setMuteSwitch:](&v4, sel_setMuteSwitch_, v3);
  objc_msgSend(v3, "setIsAccessibilityElement:", 0, v4.receiver, v4.super_class);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
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

  -[CKTranscriptDNDCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("muteSwitch"));
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

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[CKTranscriptDNDCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("muteSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isOn"))
    v3 = CFSTR("switch.on");
  else
    v3 = CFSTR("switch.off");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
