@implementation UIAccessibilityDismissDraftElement

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  -[UIAccessibilityDismissDraftElement _accessibilityWithdrawActiveItem](self, "_accessibilityWithdrawActiveItem");
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  -[UIAccessibilityDismissDraftElement _accessibilityWithdrawActiveItem](self, "_accessibilityWithdrawActiveItem");
  return 1;
}

- (void)_accessibilityWithdrawActiveItem
{
  id v3;
  void *v4;
  void *v5;

  -[UIAccessibilityDismissDraftElement mailApplicationScene](self, "mailApplicationScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  -[UIAccessibilityDismissDraftElement accessibilityContainer](self, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetAdditionalElements:", 0);

}

uint64_t __70__UIAccessibilityDismissDraftElement__accessibilityWithdrawActiveItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_minimizeKeyCommandPressed:", 0);
}

- (id)mailApplicationScene
{
  return objc_loadWeakRetained(&self->_mailApplicationScene);
}

- (void)setMailApplicationScene:(id)a3
{
  objc_storeWeak(&self->_mailApplicationScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mailApplicationScene);
}

@end
