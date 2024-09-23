@implementation WKContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WebEvent"), CFSTR("_characters"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WebEvent"), CFSTR("_charactersIgnoringModifiers"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WebEvent"), CFSTR("_modifierFlags"), "I");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("webView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_setAccessibilityWebProcessToken:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_accessibilityRegisterUIProcessTokens"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_processDidExit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_didRelaunchProcess"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_selectionChanged"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_updateChangedSelection"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_requiresKeyboardWhenFirstResponder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_zoomToRevealFocusedElement"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("_hideKeyboard"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("shareForWebView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("handleKeyWebEvent:withCompletionHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("copy:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("paste:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("selectAll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("toggleBoldface:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("toggleItalics:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("increaseSizeForWebView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("decreaseSizeForWebView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("toggleUnderline:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIResponder"), CFSTR("_handleKeyUIEvent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WKContentView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WKContentView"), CFSTR("UIResponder"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_systemDefaultFocusGroupIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WKWebView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWebView"), CFSTR("URL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKContentView"), CFSTR("handleKeyEntry:withCompletionHandler:"), "v", "@", "@?", 0);

}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WKContentViewAccessibility _registerForNotificationsIfNecessary](self, "_registerForNotificationsIfNecessary");
  -[WKContentViewAccessibility _signalAccessibilityPageLoadCompleteForCatalyst](self, "_signalAccessibilityPageLoadCompleteForCatalyst");
  -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("postedWebPageLoadedNotification"));
}

- (void)_registerForNotificationsIfNecessary
{
  void *v3;

  if ((-[WKContentViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("registerdForPBNotifications")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pasteboardChanged_, *MEMORY[0x24BDF7C08], 0);

    -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("registerdForPBNotifications"));
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;

  if (-[WKContentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
  {
    -[WKContentViewAccessibility accessibilityElements](self, "accessibilityElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_axClearRemoteElements
{
  -[WKContentViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("RemoteElements"));
  objc_msgSend(MEMORY[0x24BEBAE00], "postNotification:withData:", 1001, *MEMORY[0x24BDFEEB0]);
  -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("postedWebPageLoadedNotification"));
}

- (void)_accessibilityRegisterUIProcessTokens
{
  objc_super v3;

  -[WKContentViewAccessibility _axClearRemoteElements](self, "_axClearRemoteElements");
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _accessibilityRegisterUIProcessTokens](&v3, sel__accessibilityRegisterUIProcessTokens);
}

- (void)_axCleanupAfterTermination
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogAppAccessibility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_230E3C000, v3, OS_LOG_TYPE_INFO, "Process relaunched, clearing elements", v4, 2u);
  }

  objc_setAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-pid"), "hash"), 0, 0);
  objc_setAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-uuid"), "hash"), 0, 0);
  -[WKContentViewAccessibility _axClearRemoteElements](self, "_axClearRemoteElements");
}

- (void)_didRelaunchProcess
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _didRelaunchProcess](&v3, sel__didRelaunchProcess);
  -[WKContentViewAccessibility _axCleanupAfterTermination](self, "_axCleanupAfterTermination");
}

- (void)_processDidExit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _processDidExit](&v3, sel__processDidExit);
  -[WKContentViewAccessibility _axCleanupAfterTermination](self, "_axCleanupAfterTermination");
}

- (void)_setAccessibilityWebProcessToken:(id)a3
{
  char v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _setAccessibilityWebProcessToken:](&v5, sel__setAccessibilityWebProcessToken_, a3);
  v4 = -[WKContentViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("postedWebPageLoadedNotification"));
  -[WKContentViewAccessibility _axClearRemoteElements](self, "_axClearRemoteElements");
  if ((v4 & 1) == 0)
  {
    -[WKContentViewAccessibility _signalAccessibilityPageLoadCompleteForCatalyst](self, "_signalAccessibilityPageLoadCompleteForCatalyst");
    -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("postedWebPageLoadedNotification"));
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)accessibilityParentDiscardsChildrenContainerGroupingBehavior
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WKContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storedAccessibilityContainerType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "storedAccessibilityContainerType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __70__WKContentViewAccessibility_handleKeyWebEvent_withCompletionHandler___block_invoke;
  v8[3] = &unk_24FF8CF80;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)WKContentViewAccessibility;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v9;
  -[WKContentViewAccessibility handleKeyWebEvent:withCompletionHandler:](&v7, sel_handleKeyWebEvent_withCompletionHandler_, a3, v8);

}

void __70__WKContentViewAccessibility_handleKeyWebEvent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v20 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    v5 = v20;
  }
  if ((_DWORD)a3)
  {
    v7 = _AXSAutomationEnabled();
    v5 = v20;
    if (v7)
    {
      objc_msgSend(v20, "safeValueForKey:", CFSTR("_characters"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (__CFString *)v8;
      else
        v10 = &stru_24FF8D130;
      v11 = v10;

      objc_msgSend(v20, "safeValueForKey:", CFSTR("_charactersIgnoringModifiers"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (__CFString *)v12;
      else
        v14 = &stru_24FF8D130;
      v15 = v14;

      objc_msgSend(v20, "safeValueForKey:", CFSTR("_modifierFlags"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = &unk_24FF8E690;
      if (v16)
        v18 = (void *)v16;
      v19 = v18;

      AXUIAutomationHandleKeyComplete();
      v5 = v20;
    }
  }

}

- (void)handleKeyEntry:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __67__WKContentViewAccessibility_handleKeyEntry_withCompletionHandler___block_invoke;
  v8[3] = &unk_24FF8CFA8;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)WKContentViewAccessibility;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v9;
  -[WKContentViewAccessibility handleKeyEntry:withCompletionHandler:](&v7, sel_handleKeyEntry_withCompletionHandler_, a3, v8);

}

void __67__WKContentViewAccessibility_handleKeyEntry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    v5 = v12;
  }
  if ((_DWORD)a3)
  {
    v7 = _AXSAutomationEnabled();
    v5 = v12;
    if (v7)
    {
      objc_msgSend(v12, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "characters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "charactersIgnoringModifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "modifierFlags"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AXUIAutomationHandleKeyComplete();

      v5 = v12;
    }
  }

}

- (void)_pasteboardChanged:(id)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __49__WKContentViewAccessibility__pasteboardChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("needToAnnounceCopy"));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF018]);
    return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 0, CFSTR("needToAnnounceCopy"));
  }
  return result;
}

- (void)accessibilityRelayNotification:(id)a3 notificationData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  const void *v17;
  void *v18;
  id v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;

    if (v12)
    {
      AXLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[WKContentViewAccessibility accessibilityRelayNotification:notificationData:].cold.1((uint64_t)v12, v13);

    }
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithStringOrAttributedString:", v11);
LABEL_15:
    v15 = v11;
    v11 = (void *)v14;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("associatedElement"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (const void *)_AXUIElementCreateWithData();
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      if (v16)
        CFRelease(v16);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (const void *)_AXUIElementCreateWithData();
    CFAutorelease(v17);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_17:
  AXWebNotificationWithName(v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(objc_msgSend(v18, "unsignedIntValue"), v11);

}

- (void)copy:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WKContentViewAccessibility _registerForNotificationsIfNecessary](self, "_registerForNotificationsIfNecessary");
  -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("needToAnnounceCopy"));
  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility copy:](&v5, sel_copy_, v4);

}

- (void)cut:(id)a3
{
  uint64_t v4;
  id v5;
  objc_super v6;

  v4 = *MEMORY[0x24BDFF018];
  v5 = a3;
  -[WKContentViewAccessibility _accessibilityIgnoreNextPostPasteboardTextOperation:](self, "_accessibilityIgnoreNextPostPasteboardTextOperation:", v4);
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility cut:](&v6, sel_cut_, v5);

  -[WKContentViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF020]);
}

- (void)paste:(id)a3
{
  uint64_t v4;
  id v5;
  objc_super v6;

  v4 = *MEMORY[0x24BDFF060];
  v5 = a3;
  -[WKContentViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", v4);
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility paste:](&v6, sel_paste_, v5);

}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility selectAll:](&v5, sel_selectAll_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)toggleBoldface:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility toggleBoldface:](&v6, sel_toggleBoldface_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDFEAE8], *MEMORY[0x24BDFEC48]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)increaseSizeForWebView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility toggleBoldface:](&v6, sel_toggleBoldface_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDFEB50], *MEMORY[0x24BDFEC48]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)decreaseSizeForWebView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility toggleBoldface:](&v6, sel_toggleBoldface_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDFEB50], *MEMORY[0x24BDFEC48]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)toggleItalics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility toggleItalics:](&v6, sel_toggleItalics_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDFEB90], *MEMORY[0x24BDFEC48]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)toggleUnderline:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility toggleUnderline:](&v6, sel_toggleUnderline_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDFECD8], *MEMORY[0x24BDFEC48]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (BOOL)_accessibilityBeginUndoableTextInsertion
{
  return 0;
}

- (BOOL)_accessibilityEndUndoableTextInsertion
{
  return 0;
}

- (void)_accessibilityShare
{
  AXPerformSafeBlock();
}

uint64_t __49__WKContentViewAccessibility__accessibilityShare__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareForWebView:", 0);
}

- (id)_accessibilityResponderElement
{
  void *v3;
  void *v4;
  void *v5;

  if (-[WKContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_requiresKeyboardWhenFirstResponder")))
  {
    -[WKContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("RemoteElements"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityResponderElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WKContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("RemoteElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setAccessibilityContainer:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BDF7C08], 0);

  v9.receiver = self;
  v9.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility dealloc](&v9, sel_dealloc);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[WKContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("RemoteElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_getAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-uuid"), "hash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_getAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-pid"), "hash"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "intValue");

      if ((_DWORD)v8)
      {
        objc_getAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-machport"), "hash"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "intValue");

        objc_getAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-pid"), "hash"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = 1;
        _AXLogWithFacility();

        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA78]), "initWithUUID:andRemotePid:andContextId:", v6, v8, -[WKContentViewAccessibility _accessibilityContextId](self, "_accessibilityContextId", v14, CFSTR("WKContentView[%@] set up: %@ pid: %@ MACH_PORT %d"), self, v6, v15, v10));
        objc_msgSend(v11, "setOnClientSide:", 1);
        objc_msgSend(v11, "setAccessibilityContainer:", self);
        objc_msgSend(v11, "setMachPort:", 0);
        objc_msgSend(v11, "setDeniesDirectAppConnection:", 1);
        v16[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WKContentViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("RemoteElements"));

        return v12;
      }
      -[WKContentViewAccessibility _accessibilityRegisterUIProcessTokens](self, "_accessibilityRegisterUIProcessTokens");

    }
    else
    {
      -[WKContentViewAccessibility _accessibilityRegisterUIProcessTokens](self, "_accessibilityRegisterUIProcessTokens");
    }
    v3 = 0;
  }
  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  CGPoint result;
  CGRect v6;

  -[WKContentViewAccessibility bounds](self, "bounds");
  UIAccessibilityConvertFrameToScreenCoordinates(v6, (UIView *)self);
  AX_CGRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[WKContentViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4;
  id v5;

  v4 = (id)-[WKContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectionChanged"));
  v5 = (id)-[WKContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_updateChangedSelection"));
}

- (void)_zoomToRevealFocusedElement
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _zoomToRevealFocusedElement](&v2, sel__zoomToRevealFocusedElement);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __57__WKContentViewAccessibility__zoomToRevealFocusedElement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 1, CFSTR("WebFormControlStarted"));
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F0], 0);
}

- (void)_hideKeyboard
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  -[WKContentViewAccessibility _hideKeyboard](&v3, sel__hideKeyboard);
  if (-[WKContentViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("WebFormControlStarted")))UIAccessibilityPostNotification(*MEMORY[0x24BEBB1E8], 0);
  -[WKContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("WebFormControlStarted"));
}

- (id)accessibilityDragSourceDescriptors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF67B0]);
  accessibilityUIKitLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:point:inView:", v3, v4, 0.0, 0.0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v10;

  if (-[WKContentViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[WKContentViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348C4418](CFSTR("WKWebView")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("URL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      -[WKContentViewAccessibility _accessibilityResponderElement](self, "_accessibilityResponderElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v7 = 0;
LABEL_11:

        return v7;
      }
    }
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UIDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "_webViewCanBecomeFocused:", v3);
    else
      v7 = 1;

    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)WKContentViewAccessibility;
  return -[WKContentViewAccessibility canBecomeFocused](&v10, sel_canBecomeFocused);
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  objc_super v5;

  if (-[WKContentViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[WKContentViewAccessibility _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WKContentViewAccessibility;
    -[WKContentViewAccessibility _systemDefaultFocusGroupIdentifier](&v5, sel__systemDefaultFocusGroupIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  return 1;
}

- (int)_accessibilityRemotePid
{
  void *v2;
  int v3;

  objc_getAssociatedObject(self, (const void *)objc_msgSend(CFSTR("ax-pid"), "hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)accessibilityRelayNotification:(uint64_t)a1 notificationData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230E3C000, a2, OS_LOG_TYPE_ERROR, "Could not de-archive: %@", (uint8_t *)&v2, 0xCu);
}

@end
