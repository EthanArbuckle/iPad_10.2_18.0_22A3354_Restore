@implementation InputUIWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("InputUIWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IUIInputSourceViewController"), CFSTR("textInputSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IUIRTIInputSource"), CFSTR("sourceSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("makeKeyAndVisible"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RTIInputSystemSession"), CFSTR("setDocumentTraits:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)InputUIWindowAccessibility;
  -[InputUIWindowAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v10[3] = &unk_2502490F0;
  v10[4] = self;
  v3 = (void *)MEMORY[0x2349123BC](v10);
  if ((-[InputUIWindowAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("RegisteredKeyboardWindow")) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDFEA78];
    v14[0] = CFSTR("ax-pidretrieval");
    v5 = (void *)MEMORY[0x2349123BC](v3);
    v15[0] = v5;
    v15[1] = &__block_literal_global_0;
    v14[1] = CFSTR("ax-contextretrieval");
    v14[2] = CFSTR("ax-uuid");
    v6 = *MEMORY[0x24BDFFA10];
    v14[3] = CFSTR("ax-register");
    v15[2] = v6;
    v15[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerRemoteElement:remotePort:", v7, 0);

    -[InputUIWindowAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("RegisteredKeyboardWindow"));
  }
  AXLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[InputUIWindowAccessibility _accessibilityContextId](self, "_accessibilityContextId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_2326C8000, v8, OS_LOG_TYPE_INFO, "Register input window %@", buf, 0xCu);

  }
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ax_filteredArrayUsingBlock:", &__block_literal_global_203);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityContextId");

  return v3;
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __72__InputUIWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("textInputSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("sourceSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processId");

  return v7;
}

- (void)makeKeyAndVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InputUIWindowAccessibility;
  -[InputUIWindowAccessibility makeKeyAndVisible](&v3, sel_makeKeyAndVisible);
  -[InputUIWindowAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setDocumentTraits:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InputUIWindowAccessibility;
  -[InputUIWindowAccessibility setDocumentTraits:](&v4, sel_setDocumentTraits_, a3);
  -[InputUIWindowAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
