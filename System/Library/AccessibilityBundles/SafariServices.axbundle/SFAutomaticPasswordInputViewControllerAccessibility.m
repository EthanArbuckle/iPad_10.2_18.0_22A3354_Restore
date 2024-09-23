@implementation SFAutomaticPasswordInputViewControllerAccessibility

void __71___SFAutomaticPasswordInputViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id argument;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_inputView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFindDescendant:", &__block_literal_global_0);
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
}

uint64_t __71___SFAutomaticPasswordInputViewControllerAccessibility_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
