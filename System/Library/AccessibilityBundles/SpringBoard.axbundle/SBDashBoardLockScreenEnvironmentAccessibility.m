@implementation SBDashBoardLockScreenEnvironmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDashBoardLockScreenEnvironment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBLockScreenManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("_shouldPlayLockSound"), "B", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBDashBoardLockScreenEnvironment"), CFSTR("SBLockScreenBacklightControlling"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardLockScreenEnvironment"), CFSTR("setInScreenOffMode:forAutoUnlock:fromUnlockSource:"), "v", "B", "B", "i", 0);

}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  UIAccessibilityNotifications v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIAccessibilityNotifications v20;
  objc_super v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = a3;
  v25[2] = *MEMORY[0x24BDAC8D0];
  +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUILocked");

  v21.receiver = self;
  v21.super_class = (Class)SBDashBoardLockScreenEnvironmentAccessibility;
  -[SBDashBoardLockScreenEnvironmentAccessibility setInScreenOffMode:forAutoUnlock:fromUnlockSource:](&v21, sel_setInScreenOffMode_forAutoUnlock_fromUnlockSource_, v7, v6, v5);
  if (v7)
  {
    +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "lastLockSource");

    if ((AXSpringBoardScreenCurtainIsBeingEnabled() & 1) != 0)
      return;
    if (v12 == 15)
      v13 = 1;
    else
      v13 = v10;
    v14 = *MEMORY[0x24BEBB080];
    v24[0] = CFSTR("isUserLocked");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("playLockSound");
    v25[0] = v15;
    v16 = (void *)MEMORY[0x24BDD16E0];
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "safeBoolForKey:", CFSTR("_shouldPlayLockSound")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v14, v19);

  }
  else
  {
    if ((AXSpringBoardScreenCurtainIsBeingEnabled() & 1) != 0)
      return;
    v20 = *MEMORY[0x24BEBB088];
    v22 = CFSTR("isUserLocked");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v20, v17);
  }

}

@end
