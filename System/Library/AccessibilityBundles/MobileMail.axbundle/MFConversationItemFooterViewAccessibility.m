@implementation MFConversationItemFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFConversationItemFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemFooterView"), CFSTR("seeMoreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemFooterView"), CFSTR("revealActionsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemFooterView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MFConversationViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFExpandedMessageCell"), CFSTR("messageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemFooterViewAccessibility"), CFSTR("_accessibilityConversationViewControllerForCell:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemFooterViewAccessibility"), CFSTR("_accessibilityUpdateLeadingActionTitle:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MFConversationItemFooterViewAccessibility;
  -[MFConversationItemFooterViewAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  -[MFConversationItemFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("revealActionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("reveal.more.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_initWeak(&location, v3);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__MFConversationItemFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_250285A88;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "setAccessibilityActivateBlock:", v15);
  -[MFConversationItemFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("seeMoreButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (_AXSAutomationEnabled())
  {
    objc_msgSend(v6, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "_accessibilitySetFrameExpansion:", 0.0, (v10 - v9) * -0.5);
    objc_msgSend(v6, "accessibilitySetIdentification:", CFSTR("AXAccessibilityUseAccessibilityFrameForHittest"));
  }
  -[MFConversationItemFooterViewAccessibility _accessibilityParentCell](self, "_accessibilityParentCell");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConversationItemFooterViewAccessibility _accessibilityConversationViewControllerForCell:](self, "_accessibilityConversationViewControllerForCell:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_accessibilityTitleForLeadingActionWithCell:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySubstituteReadPhonemeInString((uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFConversationItemFooterViewAccessibility _accessibilityUpdateLeadingActionTitle:](self, "_accessibilityUpdateLeadingActionTitle:", v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __87__MFConversationItemFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

- (void)_accessibilityPerformLeadingAction
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  -[MFConversationItemFooterViewAccessibility _accessibilityParentCell](self, "_accessibilityParentCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConversationItemFooterViewAccessibility _accessibilityConversationViewControllerForCell:](self, "_accessibilityConversationViewControllerForCell:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityPerformLeadingActionWithCell:", v3);
  v7 = v3;
  v5 = v3;
  v6 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __79__MFConversationItemFooterViewAccessibility__accessibilityPerformLeadingAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityTitleForLeadingActionWithCell:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_accessibilityUpdateLeadingActionTitle:", v2);

}

- (void)_accessibilityUpdateLeadingActionTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MFConversationItemFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("revealActionsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilitySubstituteReadPhonemeInString((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__accessibilityPerformLeadingAction);

    v10[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityCustomActions:", v9);

  }
}

- (id)_accessibilityConversationViewControllerForCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  NSClassFromString(CFSTR("MFExpandedMessageCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("messageViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  NSClassFromString(CFSTR("ConversationViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)_accessibilityParentCell
{
  return (id)-[MFConversationItemFooterViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 1);
}

uint64_t __69__MFConversationItemFooterViewAccessibility__accessibilityParentCell__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFConversationViewCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterViewAccessibility;
  -[MFConversationItemFooterViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[MFConversationItemFooterViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
