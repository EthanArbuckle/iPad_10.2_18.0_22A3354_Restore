@implementation TUIProactiveCandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIProactiveCandidateCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIProactiveCandidateCell"), CFSTR("candidate"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  -[TUIProactiveCandidateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("candidate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "slotID");
  if ((_DWORD)v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("proactive.suggestion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttribute:forKey:", v9, *MEMORY[0x24BDFEC20]);

    return v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIProactiveCandidateCellAccessibility;
    -[TUIProactiveCandidateCellAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;

  if (AXRequestingClient() == 4)
    return 1;
  -[TUIProactiveCandidateCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

@end
