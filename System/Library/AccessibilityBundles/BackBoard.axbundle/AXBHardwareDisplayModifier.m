@implementation AXBHardwareDisplayModifier

- (AXBHardwareDisplayModifier)init
{
  AXBHardwareDisplayModifier *v2;
  int v3;
  _QWORD *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v6;
  __CFNotificationCenter *v7;
  __CFString *v8;
  void *v9;
  AXBHardwareDisplayModifier *v10;
  AXBHardwareDisplayModifier *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXBHardwareDisplayModifier;
  v2 = -[AXBHardwareDisplayModifier init](&v13, sel_init);
  if (v2)
  {
    v3 = AXIsInternalInstall();
    v4 = (_QWORD *)MEMORY[0x24BED2780];
    if (v3)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2870]);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_toggleAXSetting_0, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      v7 = CFNotificationCenterGetDarwinNotifyCenter();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterAddObserver(v7, 0, (CFNotificationCallback)_toggleAXSetting_0, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__updateGrayScaleSettings, *v4, 0);

    v12 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    v10 = v12;

  }
  return v2;
}

uint64_t __34__AXBHardwareDisplayModifier_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGrayScaleSettings");
}

- (void)_updateGrayScaleSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setGrayscale:", _AXSGrayscaleEnabled() != 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXBHardwareDisplayModifier;
  -[AXBHardwareDisplayModifier dealloc](&v4, sel_dealloc);
}

@end
