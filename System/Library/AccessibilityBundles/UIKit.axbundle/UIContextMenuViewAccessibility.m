@implementation UIContextMenuViewAccessibility

void __78___UIContextMenuViewAccessibility_displayMenu_updateType_alongsideAnimations___block_invoke(uint64_t a1, void *a2)
{
  id v3[4];

  v3[3] = (id)a1;
  v3[2] = a2;
  v3[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_copyWeak(v3, (id *)(a1 + 40));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v3);
}

void __78___UIContextMenuViewAccessibility_displayMenu_updateType_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications notification;
  id WeakRetained;

  notification = *MEMORY[0x24BDF72C8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UIAccessibilityPostNotification(notification, WeakRetained);

}

uint64_t __63___UIContextMenuViewAccessibility_accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveToDetentPosition:updateScrubPath:", 0, 0, a1, a1);
}

@end
