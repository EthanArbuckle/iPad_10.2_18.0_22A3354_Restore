@implementation HURecordingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HURecordingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HURecordingButton"), CFSTR("currentRecordingState"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HURecordingButton"), CFSTR("setEnabled:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HURecordingButton"), CFSTR("setImage:forState:animated:"), "v", "@", "Q", "B", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  if (-[HURecordingButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("currentRecordingState")))
  {
    return 0;
  }
  v3 = objc_alloc(MEMORY[0x24BDD1688]);
  accessibilityHomeUILocalizedString(CFSTR("record.button"));
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

- (id)accessibilityUserInputLabels
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = -[HURecordingButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("currentRecordingState"));
  if (v2 == 4)
  {
    accessibilityHomeUILocalizedString(CFSTR("stop.button"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    accessibilityHomeUILocalizedString(CFSTR("stop.alternative.done"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      v6 = (void *)MEMORY[0x24BDBD1A8];
      return v6;
    }
    accessibilityHomeUILocalizedString(CFSTR("record.button"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    accessibilityHomeUILocalizedString(CFSTR("record.alternative.start"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    accessibilityHomeUILocalizedString(CFSTR("record.alternative.announce"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HURecordingButtonAccessibility;
  -[HURecordingButtonAccessibility setImage:forState:animated:](&v5, sel_setImage_forState_animated_, a3, a4, a5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityHint
{
  return 0;
}

- (id)accessibilityAttributedHint
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HURecordingButtonAccessibility;
  -[HURecordingButtonAccessibility setEnabled:](&v3, sel_setEnabled_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityLabel
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[HURecordingButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("currentRecordingState"));
  if (v2)
  {
    if (v2 == 5)
    {
      v3 = CFSTR("send.button");
    }
    else
    {
      if (v2 != 4)
      {
        v4 = 0;
        return v4;
      }
      v3 = CFSTR("stop.button");
    }
  }
  else
  {
    v3 = CFSTR("record.button");
  }
  accessibilityHomeUILocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
