@implementation WKContentViewAccessibility__MessageUI__WebKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFirstResponderStartRepost
{
  JUMPOUT(0x2348C0B8CLL);
}

- (void)_axSetFirstResponderStartRepost:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  -[WKContentViewAccessibility__MessageUI__WebKit _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v5, &location);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash", v4, 3221225472, __91__WKContentViewAccessibility__MessageUI__WebKit__accessibilityLoadAccessibilityInformation__block_invoke, &unk_24FEF9EF8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXAddNotificationCallback();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_axRepostFirstResponderWhenReady
{
  void *v3;
  void *v4;
  double Current;
  void *v6;
  double v7;
  double v8;

  -[WKContentViewAccessibility__MessageUI__WebKit _accessibilityResponderElement](self, "_accessibilityResponderElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXRemoveNotificationCallback();

    _UIAccessibilitySetAssociatedElementContextForNextNotification();
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB8], 0);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[WKContentViewAccessibility__MessageUI__WebKit _axFirstResponderStartRepost](self, "_axFirstResponderStartRepost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = Current - v7;

    if (v8 < 3.0)
      AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  -[WKContentViewAccessibility__MessageUI__WebKit willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[WKContentViewAccessibility__MessageUI__WebKit _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WKContentViewAccessibility__MessageUI__WebKit hash](self, "hash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXRemoveNotificationCallback();

  v4.receiver = self;
  v4.super_class = (Class)WKContentViewAccessibility__MessageUI__WebKit;
  -[WKContentViewAccessibility__MessageUI__WebKit dealloc](&v4, sel_dealloc);
}

@end
