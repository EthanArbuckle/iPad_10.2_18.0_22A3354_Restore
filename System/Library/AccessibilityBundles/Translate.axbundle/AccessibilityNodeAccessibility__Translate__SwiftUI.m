@implementation AccessibilityNodeAccessibility__Translate__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AccessibilityNodeAccessibility__Translate__SwiftUI accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("moreButton")))
  {
    v4 = CFSTR("more.button");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("conversationViewOptionsButton")))
    {
      v8.receiver = self;
      v8.super_class = (Class)AccessibilityNodeAccessibility__Translate__SwiftUI;
      -[AccessibilityNodeAccessibility__Translate__SwiftUI accessibilityLabel](&v8, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = CFSTR("conversation.style.button");
  }
  accessibilityLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityAttributedLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDFEA60]);
  -[AccessibilityNodeAccessibility__Translate__SwiftUI accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStringOrAttributedString:", v4);

  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
