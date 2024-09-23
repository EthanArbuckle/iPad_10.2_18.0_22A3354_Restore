@implementation SUScriptNotificationObserverAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUScriptNotificationObserver");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUScriptNotificationObserverAccessibility)init
{
  SUScriptNotificationObserverAccessibility *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptNotificationObserverAccessibility;
  v2 = -[SUScriptNotificationObserverAccessibility init](&v5, sel_init);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__axActionOccurredForWeb_, CFSTR("AXActionForWebNotification"), 0);

  return v2;
}

- (void)_axActionOccurredForWeb:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __69__SUScriptNotificationObserverAccessibility__axActionOccurredForWeb___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("scroll"));

  if (v3)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("direction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue");

    if ((unint64_t)(v5 - 1) < 6)
    {
      v6 = *(&off_2503F2350 + v5 - 1);
LABEL_6:
      v9 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", v6);
    }
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("escape"));

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("_accessibilityPerformEscape");
      goto LABEL_6;
    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AXActionForWebNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserverAccessibility;
  -[SUScriptNotificationObserverAccessibility dealloc](&v4, sel_dealloc);
}

@end
