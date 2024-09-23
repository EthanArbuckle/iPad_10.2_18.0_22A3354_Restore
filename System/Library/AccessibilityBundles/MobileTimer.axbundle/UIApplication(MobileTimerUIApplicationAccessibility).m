@implementation UIApplication(MobileTimerUIApplicationAccessibility)

+ (void)_accessibilityPerformValidations:()MobileTimerUIApplicationAccessibility
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("timerManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTTimer"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileTimerTabBarController"), CFSTR("stopwatchViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileTimerTabBarController"), CFSTR("timerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTTimerManager"), CFSTR("getCurrentTimerSync"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

- (BOOL)accessibilityPerformMagicTap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  _QWORD *v15;
  _BOOL8 v16;
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  objc_msgSend(a1, "safeValueForKey:", CFSTR("_tabBarController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("stopwatchViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("timerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v26[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = 0;
  }
  while (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if ((void *)v9 == v5)
    {
      MEMORY[0x234916758](CFSTR("MTAStopwatchViewController"));
      v12 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_15;
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_mode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (v14 == 1)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_2;
        v20[3] = &unk_2502B6FE8;
        v15 = v20;
        v12 = v5;
        v20[4] = v12;
        v20[5] = &v22;
        AXPerformSafeBlock();
      }
      else
      {
        if (v14 != 3)
        {
          v12 = v5;
          if (v14 == 2)
          {
            v21[0] = MEMORY[0x24BDAC760];
            v21[1] = 3221225472;
            v21[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke;
            v21[3] = &unk_2502B6FE8;
            v15 = v21;
            v12 = v5;
            v21[4] = v12;
            v21[5] = &v22;
            AXPerformSafeBlock();
            goto LABEL_14;
          }
LABEL_15:

          break;
        }
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_3;
        v19[3] = &unk_2502B6FE8;
        v15 = v19;
        v12 = v5;
        v19[4] = v12;
        v19[5] = &v22;
        AXPerformSafeBlock();
      }
LABEL_14:

      goto LABEL_15;
    }
    if ((void *)v9 == v6)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_4;
      v18[3] = &unk_2502B6FE8;
      v15 = v18;
      v12 = v6;
      v18[4] = v12;
      v18[5] = &v22;
      AXPerformSafeBlock();
      goto LABEL_14;
    }
    objc_msgSend(v8, "removeObject:", v9);
    objc_msgSend(v10, "childViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);

  }
  v16 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

@end
