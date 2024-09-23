@implementation ZoomUI_SBFluidSwitcherViewController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  -[ZoomUI_SBFluidSwitcherViewController safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "displayID");

  if ((!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad()) && translatedUpwards
    || (objc_msgSend(getZoomServicesClass(), "sharedInstance"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "activeZoomModeOnDisplay:", v12),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE00498]),
        v14,
        v13,
        v15))
  {
    objc_msgSend(getZoomServicesClass(), "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notifyZoomFluidSwitcherGestureWillBegin");

  }
  v17.receiver = self;
  v17.super_class = (Class)ZoomUI_SBFluidSwitcherViewController;
  -[ZoomUI_SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didBeginGesture:](&v17, sel_handleFluidSwitcherGestureManager_didBeginGesture_, v6, v7);

}

- (void)handleFluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad())
  {
    if (soft_AXDeviceIsPad())
    {
      -[ZoomUI_SBFluidSwitcherViewController safeValueForKey:](self, "safeValueForKey:", CFSTR("rootModifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke;
      v12[3] = &unk_24FED6108;
      v9 = v8;
      v13 = v9;
      v14 = &v15;
      soft_AXPerformSafeBlock(v12);

    }
    if (!*((_BYTE *)v16 + 24))
    {
      objc_msgSend(getZoomServicesClass(), "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSelector:withObject:afterDelay:", sel_notifyZoomFluidSwitcherGestureDidFinish, 0, 0.5);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ZoomUI_SBFluidSwitcherViewController;
  -[ZoomUI_SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didEndGesture:](&v11, sel_handleFluidSwitcherGestureManager_didEndGesture_, v6, v7);
  _Block_object_dispose(&v15, 8);

}

@end
