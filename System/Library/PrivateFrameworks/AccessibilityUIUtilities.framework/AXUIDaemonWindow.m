@implementation AXUIDaemonWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (AXUIDaemonWindow)init
{
  AXUIDaemonWindow *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUIDaemonWindow;
  v2 = -[AXUIDaemonWindow init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIDaemonWindow setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[AXUIDaemonWindow setClipsToBounds:](v2, "setClipsToBounds:", 1);
    -[AXUIDaemonWindow _didUpdateOrientation:](v2, "_didUpdateOrientation:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__didUpdateOrientation_, CFSTR("AXUIDaemonOrientationDidUpdateNotification"), 0);

  }
  return v2;
}

- (void)_didUpdateOrientation:(id)a3
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Duration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  -[AXUIDaemonWindow _updateInterfaceOrientationFromDeviceOrientation:](self, "_updateInterfaceOrientationFromDeviceOrientation:", v6 > 0.0);

  AXPerformSafeBlock();
}

uint64_t __42__AXUIDaemonWindow__didUpdateOrientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sceneSettingsSafeAreaInsetsDidChange");
}

- (UIEdgeInsets)_normalizedSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = AXUINormalizedSafeAreaInsetsForOrientation(-[AXUIDaemonWindow interfaceOrientation](self, "interfaceOrientation"));
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_accessibilityWindowUsesOwnOrientationForComparingGeometry
{
  return 1;
}

@end
