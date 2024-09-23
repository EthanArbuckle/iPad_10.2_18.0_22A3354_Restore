@implementation AVTRecordingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTRecordingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTRecordingButton"), CFSTR("uiState"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTRecordingButton"), CFSTR("setUIState:"), "v", "Q", 0);

}

- (id)accessibilityAttributedLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (-[AVTRecordingButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("uiState")))
    return 0;
  v3 = objc_alloc(MEMORY[0x24BDD1688]);
  accessibilityLocalizedString(CFSTR("animoji.record.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("en"));

  if (v8)
  {
    v10 = *MEMORY[0x24BDF7350];
    v11[0] = CFSTR("ɻɪ.ˈkwɔɻd");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributes:range:", v9, 0, objc_msgSend(v5, "length"));

  }
  return v5;
}

- (id)accessibilityLabel
{
  unint64_t v2;
  void *v3;

  v2 = -[AVTRecordingButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("uiState"));
  if (v2 <= 3)
  {
    accessibilityLocalizedString(off_2501822F8[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTRecordingButtonAccessibility;
  v3 = -[AVTRecordingButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[AVTRecordingButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("uiState"));
  v5 = *MEMORY[0x24BDF7408];
  if (v4 != 1)
    v5 = 0;
  return v5 | v3;
}

- (void)setUIState:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTRecordingButtonAccessibility;
  -[AVTRecordingButtonAccessibility setUIState:](&v4, sel_setUIState_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
