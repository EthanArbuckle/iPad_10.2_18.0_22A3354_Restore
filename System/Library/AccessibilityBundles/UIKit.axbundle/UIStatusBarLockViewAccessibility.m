@implementation UIStatusBarLockViewAccessibility

void __70___UIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke(uint64_t a1, char a2)
{
  char v2;

  v2 = a2 & 1;
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((v2 & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
