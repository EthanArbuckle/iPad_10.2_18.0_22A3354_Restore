@implementation NCNotificationSeamlessContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationSeamlessContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("_dateLabel"), "UILabel<BSUIDateLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("primaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("primarySubtitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("secondaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("importantText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("footerText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("thumbnail"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListCell"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationSeamlessContentView"), CFSTR("_secondaryTextElement"), "UIView<NCTextSupporting>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_executeDefaultAction:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCExpandedPlatterViewController"), CFSTR("customContentRequestsDefaultAction:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("thumbnail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("thumbnail"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      accessibilityLocalizedString(CFSTR("attachment.label"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v4, "isAXAttributedString")
    && objc_msgSend(v4, "hasAttribute:", *MEMORY[0x24BDFEB80]))
  {
    v5 = 0;
LABEL_7:

    v4 = (void *)v5;
  }
  -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("primaryText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("primarySubtitleText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility _accessibilitySecondaryText](self, "_accessibilitySecondaryText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("importantText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("footerText"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  -[NCNotificationSeamlessContentViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_2;
    v11[3] = &unk_2503BDCC8;
    v7 = v11;
    v8 = v4;
LABEL_5:
    v7[4] = v8;
    AXPerformSafeBlock();

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_3;
    v10[3] = &unk_2503BDCC8;
    v7 = v10;
    v8 = v6;
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349233D4](CFSTR("NCNotificationListCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeDefaultAction:", 1);
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "customContentRequestsDefaultAction:", 0);
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationSeamlessContentViewAccessibility;
  -[NCNotificationSeamlessContentViewAccessibility accessibilityCustomRotors](&v8, sel_accessibilityCustomRotors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryTextElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomRotors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v3);
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v5);

  return v6;
}

- (id)_accessibilitySupportGesturesAttributes
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("AXSupportedGestureTypeKey");
  v5[1] = CFSTR("AXOrbGestureMode");
  v6[0] = &unk_2503C4148;
  v6[1] = &unk_2503C4160;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilitySecondaryText
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NCNotificationSeamlessContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
