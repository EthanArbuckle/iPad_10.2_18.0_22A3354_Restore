@implementation NCNotificationContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContentView"), CFSTR("primaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContentView"), CFSTR("primarySubtitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContentView"), CFSTR("secondaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContentView"), CFSTR("summaryText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationContentView"), CFSTR("thumbnail"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NCNotificationListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationListCell"), CFSTR("_contentViewController"), "UIViewController<NCNotificationListDimmable>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_executeDefaultAction:"), "v", "B", 0);

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
  void *v12;

  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("thumbnail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("thumbnail"));
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
  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primarySubtitleText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("summaryText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  void *v3;
  id v5;

  -[NCNotificationContentViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return 1;
}

uint64_t __63__NCNotificationContentViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349233D4](CFSTR("NCNotificationListCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __63__NCNotificationContentViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_contentViewController"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_executeDefaultAction:", 1);

}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationContentViewAccessibility;
  -[NCNotificationContentViewAccessibility accessibilityCustomRotors](&v8, sel_accessibilityCustomRotors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryTextView"));
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
  v6[0] = &unk_2503C4178;
  v6[1] = &unk_2503C4190;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
