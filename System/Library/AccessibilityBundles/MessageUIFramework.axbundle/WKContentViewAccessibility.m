@implementation WKContentViewAccessibility

void __91__WKContentViewAccessibility__MessageUI__WebKit__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;

  if (*MEMORY[0x24BEBAFB8] == a2)
  {
    v4 = (id *)(a1 + 32);
    v5 = a4;
    WeakRetained = objc_loadWeakRetained(v4);
    _axuiElementForNotificationData();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v5);

    if (v8)
    {
      v9 = objc_loadWeakRetained(v4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_axSetFirstResponderStartRepost:", v10);

      v11 = objc_loadWeakRetained(v4);
      objc_msgSend(v11, "_axRepostFirstResponderWhenReady");

    }
  }
}

uint64_t __81__WKContentViewAccessibility__MessageUI__WebKit__axRepostFirstResponderWhenReady__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axRepostFirstResponderWhenReady");
}

@end
