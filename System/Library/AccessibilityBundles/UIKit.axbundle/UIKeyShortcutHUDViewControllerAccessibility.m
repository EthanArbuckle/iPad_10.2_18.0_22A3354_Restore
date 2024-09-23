@implementation UIKeyShortcutHUDViewControllerAccessibility

uint64_t __74___UIKeyShortcutHUDViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissHUD", a1, a1);
}

void __76___UIKeyShortcutHUDViewControllerAccessibility_setHidden_completionHandler___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
