@implementation UIViewAccessibility__MobileMail__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__MobileMail__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXAccessibilityUseAccessibilityFrameForHittest"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return -[UIViewAccessibility__MobileMail__UIKit _accessibilityUseAccessibilityFrameForHittest](&v6, sel__accessibilityUseAccessibilityFrameForHittest);
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__MobileMail__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MailMessagesTableView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return -[UIViewAccessibility__MobileMail__UIKit _accessibilityIsFirstElementForFocus](&v6, sel__accessibilityIsFirstElementForFocus);
}

- (BOOL)_accessibilityIsApplicationSceneView
{
  void *v2;
  char v3;

  -[UIViewAccessibility__MobileMail__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("kAXApplicationSceneViewIdentifier"));

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  char v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;
  char v31;
  _QWORD block[5];
  objc_super v33;
  objc_super v34;

  if (!-[UIViewAccessibility__MobileMail__UIKit _accessibilityIsApplicationSceneView](self, "_accessibilityIsApplicationSceneView"))
  {
    v34.receiver = self;
    v34.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
    -[UIViewAccessibility__MobileMail__UIKit accessibilityElements](&v34, sel_accessibilityElements);
LABEL_12:
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    return v28;
  }
  -[UIViewAccessibility__MobileMail__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXShowDraftsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    v33.receiver = self;
    v33.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
    -[UIViewAccessibility__MobileMail__UIKit accessibilityElements](&v33, sel_accessibilityElements);
    goto LABEL_12;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke;
  block[3] = &unk_250285728;
  block[4] = self;
  if (accessibilityElements_onceToken != -1)
    dispatch_once(&accessibilityElements_onceToken, block);
  -[UIViewAccessibility__MobileMail__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXDraftHeightKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[UIViewAccessibility__MobileMail__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXNumberOfDraftsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  accessibilityLocalizedString(CFSTR("show.drafts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("number.of.drafts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)accessibilityElements_showDraftsElement, "setAccessibilityLabel:", v14, v13, CFSTR("__AXStringForVariablesSentinel"));
  v31 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  objc_msgSend(v15, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v15, "safeAreaInsets");
  objc_msgSend((id)accessibilityElements_showDraftsElement, "setAccessibilityFrame:", v18, v22 - v16, v20, v16 - v23);
  v30.receiver = self;
  v30.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  -[UIViewAccessibility__MobileMail__UIKit accessibilityElements](&v30, sel_accessibilityElements);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIViewAccessibility__MobileMail__UIKit safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "axSafelyAddObjectsFromArray:", v26);

  objc_msgSend(v25, "ax_filteredArrayUsingBlock:", &__block_literal_global_15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  if ((objc_msgSend(v28, "containsObject:", accessibilityElements_showDraftsElement) & 1) == 0)
    objc_msgSend(v28, "axSafelyAddObject:", accessibilityElements_showDraftsElement);

  return v28;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIViewAccessibility__MobileMail__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXAccessibilityStatusIndicatorView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility__MobileMail__UIKit;
  return -[UIViewAccessibility__MobileMail__UIKit _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
}

@end
