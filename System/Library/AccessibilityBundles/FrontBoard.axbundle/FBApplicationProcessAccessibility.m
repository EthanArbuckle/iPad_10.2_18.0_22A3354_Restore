@implementation FBApplicationProcessAccessibility

- (void)_bootstrapAndExec
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessAccessibility;
  -[FBApplicationProcessAccessibility _bootstrapAndExec](&v3, sel__bootstrapAndExec);
  -[FBApplicationProcessAccessibility _accessibilitySetWasJustLaunched:](self, "_accessibilitySetWasJustLaunched:", 1);
}

- (void)_setSceneLifecycleState:(unsigned __int8)a3
{
  int v3;
  FBApplicationProcessAccessibility *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v3 = a3;
  v16[3] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)FBApplicationProcessAccessibility;
  -[FBApplicationProcessAccessibility _setSceneLifecycleState:](&v14, sel__setSceneLifecycleState_);
  if (v3 == 2)
  {
    if (_AXSApplicationAccessibilityEnabled()
      && -[FBApplicationProcessAccessibility _accessibilityWasJustLaunched](self, "_accessibilityWasJustLaunched"))
    {
      v5 = self;
      if (UIAccessibilityIsVoiceOverRunning())
      {
        -[FBApplicationProcessAccessibility bundleIdentifier](v5, "bundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        AXApplicationNameLabelForBundleIdentifier();
      }
      else
      {
        -[FBApplicationProcessAccessibility handle](v5, "handle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[FBApplicationProcessAccessibility pid](v5, "pid");
      if (v7)
      {
        v9 = v8;
        -[FBApplicationProcessAccessibility bundleIdentifier](v5, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v15[0] = CFSTR("bundleID");
          -[FBApplicationProcessAccessibility bundleIdentifier](v5, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v11;
          v16[1] = v7;
          v15[1] = CFSTR("displayName");
          v15[2] = CFSTR("pid");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2] = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          UIAccessibilityPostNotification(0x1388u, v13);

        }
      }

    }
    -[FBApplicationProcessAccessibility _accessibilitySetWasJustLaunched:](self, "_accessibilitySetWasJustLaunched:", 0);
  }
}

- (void)_accessibilitySetWasJustLaunched:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FBApplicationProcess");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWasJustLaunched
{
  return __UIAccessibilityGetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBProcess"), CFSTR("_bootstrapAndExec"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBProcess"), CFSTR("_setSceneLifecycleState:"), "v", "C", 0);

}

@end
