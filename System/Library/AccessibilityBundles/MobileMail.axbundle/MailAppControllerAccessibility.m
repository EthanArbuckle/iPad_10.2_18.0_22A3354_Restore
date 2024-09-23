@implementation MailAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailAppController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailAppController"), CFSTR("masterNavigationController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MailNavigationController"), CFSTR("UINavigationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationController"), CFSTR("visibleViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("conversationViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailAppController"), CFSTR("mostRecentMainScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailMainScene"), CFSTR("splitViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailSplitViewController"), CFSTR("mailboxPickerNavController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailSplitViewController"), CFSTR("messageListNavController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailSplitViewController"), CFSTR("messageDetailNavController"), "@", 0);

}

- (id)_accessibilitySplitViewControllerScannerGroupElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  -[MailAppControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mostRecentMainScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("splitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!AXDeviceIsPad()
    || objc_msgSend(v6, "displayMode") == 1
    || objc_msgSend(v6, "displayMode") == 3
    || !objc_msgSend(v6, "displayMode"))
  {
    v11 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "displayMode") == 4
      || objc_msgSend(v6, "displayMode") == 5
      || objc_msgSend(v6, "displayMode") == 6)
    {
      -[MailAppControllerAccessibility _axAccessibilityGroupForKey:fromSplitController:](self, "_axAccessibilityGroupForKey:fromSplitController:", CFSTR("mailboxPickerNavController"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axSafelyAddObject:", v8);

    }
    -[MailAppControllerAccessibility _axAccessibilityGroupForKey:fromSplitController:](self, "_axAccessibilityGroupForKey:fromSplitController:", CFSTR("messageListNavController"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObject:", v9);

    if (objc_msgSend(v6, "displayMode") == 4 || objc_msgSend(v6, "displayMode") == 2)
    {
      -[MailAppControllerAccessibility _axAccessibilityGroupForKey:fromSplitController:](self, "_axAccessibilityGroupForKey:fromSplitController:", CFSTR("messageDetailNavController"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axSafelyAddObject:", v10);

    }
    if (objc_msgSend(v7, "count"))
      v11 = v7;
    else
      v11 = 0;

  }
  return v11;
}

- (id)_axAccessibilityGroupForKey:(id)a3 fromSplitController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeUIViewForKey:", CFSTR("view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "_accessibilityProcessScannerGroupElementPieces:", v10);
  if (objc_msgSend(v10, "count"))
  {
    v13[0] = CFSTR("GroupElements");
    v13[1] = CFSTR("GroupTraits");
    v14[0] = v10;
    v14[1] = &unk_25028F9F8;
    v13[2] = CFSTR("GroupScanBehaviorTraits");
    v13[3] = CFSTR("GroupIdentifier");
    v14[2] = &unk_25028FA10;
    v14[3] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_axVisibleViewController
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  -[MailAppControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("masterNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXDeviceIsPad()
    && (objc_msgSend(v4, "visibleViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        NSClassFromString(CFSTR("MessageListViewController")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("conversationViewController"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_accessibilityFirstElementForReadFromTop
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailAppControllerAccessibility _accessibilityFirstElementForFocusWithOptions:](self, "_accessibilityFirstElementForFocusWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityFirstElementForFocus
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  -[MailAppControllerAccessibility _axVisibleViewController](self, "_axVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ConversationViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisibleIgnoringAXOverrides:stoppingBeforeContainer:", 0, 0);

  if (v6)
  {
    objc_msgSend(v3, "_accessibilityFirstElementForFocus");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)MailAppControllerAccessibility;
    -[MailAppControllerAccessibility _accessibilityFirstElementForFocus](&v10, sel__accessibilityFirstElementForFocus);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

@end
