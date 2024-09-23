@implementation UIWebBrowserViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebBrowserView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)assistFormNode:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() || !*MEMORY[0x24BEBB2A8])
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebBrowserViewAccessibility;
    -[UIWebBrowserViewAccessibility assistFormNode:](&v5, sel_assistFormNode_, v4);
    AXPerformBlockOnMainThreadAfterDelay();
  }

}

void __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke()
{
  void *v0;
  Class v1;
  void *v2;
  _QWORD v3[5];

  AXUIKeyboardWindow();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = NSClassFromString(CFSTR("UIPickerView"));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke_2;
  v3[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v3[4] = v1;
  objc_msgSend(v0, "_accessibilityFindDescendant:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v2);

}

BOOL __48__UIWebBrowserViewAccessibility_assistFormNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "isAccessibilityElement"))
  {
    objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)accessibilityContainerType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserViewAccessibility;
  return -[UIWebBrowserViewAccessibility accessibilityContainerType](&v3, sel_accessibilityContainerType);
}

@end
