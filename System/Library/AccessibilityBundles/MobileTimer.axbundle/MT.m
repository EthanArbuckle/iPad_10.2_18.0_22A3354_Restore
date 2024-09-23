@implementation MT

void __56__MT_UIPageControlAccessibility__axStopWatchAdjustPage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentPage:", *(_QWORD *)(a1 + 40));
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
