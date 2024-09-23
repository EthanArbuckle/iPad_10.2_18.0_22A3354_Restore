@implementation ETTapMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETTapMessage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETTapMessage"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETTapMessage"), CFSTR("ETMessage"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTapMessage"), CFSTR("displayInScene:"), "v", "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("tap.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTapMessageAccessibility _accessibilityColorString](self, "_accessibilityColorString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(CFSTR("tap"));
}

- (void)displayInScene:(id)a3
{
  id v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  ETTapMessageAccessibility *v11;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    _axSetIsWaitingOnETMessageStart(1);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __44__ETTapMessageAccessibility_displayInScene___block_invoke;
    v9 = &unk_2501F5FF0;
    v10 = v4;
    v11 = self;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ETTapMessageAccessibility;
    -[ETTapMessageAccessibility displayInScene:](&v5, sel_displayInScene_, v4);
  }

}

uint64_t __44__ETTapMessageAccessibility_displayInScene___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ETTapMessageAccessibility;
  objc_msgSendSuper2(&v3, sel_displayInScene_, v1);
  return _axSetIsWaitingOnETMessageStart(0);
}

@end
