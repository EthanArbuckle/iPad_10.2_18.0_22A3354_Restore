@implementation TVRUITouchpadViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUITouchpadViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  -[TVRUITouchpadViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilityUpdateTouchpad_, *MEMORY[0x24BDF7380], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  -[TVRUITouchpadViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (int64_t)touchpadMode
{
  objc_super v4;

  if (UIAccessibilityIsSwitchControlRunning())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  return -[TVRUITouchpadViewControllerAccessibility touchpadMode](&v4, sel_touchpadMode);
}

- (void)setDevice:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUITouchpadViewControllerAccessibility;
  -[TVRUITouchpadViewControllerAccessibility setDevice:](&v3, sel_setDevice_, a3);
  if (UIAccessibilityIsSwitchControlRunning())
    AXPerformSafeBlock();
}

uint64_t __54__TVRUITouchpadViewControllerAccessibility_setDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToDirectionalControlView");
}

- (void)_accessibilityUpdateTouchpad:(id)a3
{
  id v4;

  -[TVRUITouchpadViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteDevice"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadViewControllerAccessibility setDevice:](self, "setDevice:", v4);

}

@end
