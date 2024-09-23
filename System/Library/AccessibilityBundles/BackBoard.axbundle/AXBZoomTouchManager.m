@implementation AXBZoomTouchManager

+ (void)initializeZoomMonitor
{
  if (initializeZoomMonitor_onceToken != -1)
    dispatch_once(&initializeZoomMonitor_onceToken, &__block_literal_global_23);
}

void __44__AXBZoomTouchManager_initializeZoomMonitor__block_invoke()
{
  AXBZoomTouchManager *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v0 = objc_alloc_init(AXBZoomTouchManager);
  v1 = (void *)SharedManager_3;
  SharedManager_3 = (uint64_t)v0;

  v2 = (id)objc_msgSend(MEMORY[0x24BEC64E8], "sharedInstance");
  objc_msgSend((id)SharedManager_3, "updateSettings");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BED29C0];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_180_2);

}

uint64_t __44__AXBZoomTouchManager_initializeZoomMonitor__block_invoke_2()
{
  return objc_msgSend((id)SharedManager_3, "updateSettings");
}

+ (Class)getZoomBundlePrincipalClassForcingLoad:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/SpringBoardPlugins/ZoomTouch.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if ((objc_msgSend(v4, "isLoaded") & 1) == 0)
  {
    if (v3)
    {
      v14 = 0;
      v6 = objc_msgSend(v5, "loadAndReturnError:", &v14);
      v7 = v14;
      v8 = v7;
      if ((v6 & 1) == 0)
      {
        v12 = CFSTR("**** Accessibility: Could not load ZoomTouch bundle: %@");
        v13 = v7;
        LOBYTE(v11) = 1;
        _AXLogWithFacility();
      }

      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
LABEL_7:
  v9 = (id)objc_msgSend(v5, "principalClass", v11, v12, v13);
LABEL_9:

  return (Class)v9;
}

- (void)setZoomTouchEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  char *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "getZoomBundlePrincipalClassForcingLoad:", a3);
  if (v3)
    v5 = sel_enableZoom;
  else
    v5 = sel_disableZoom;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "performSelector:withObject:", v5, 0);
}

- (void)updateSettings
{
  objc_msgSend((id)SharedManager_3, "setZoomTouchEnabled:", _AXSZoomTouchEnabled() != 0);
}

@end
