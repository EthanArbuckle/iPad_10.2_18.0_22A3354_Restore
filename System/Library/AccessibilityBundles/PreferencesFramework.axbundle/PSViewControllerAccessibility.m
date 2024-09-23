@implementation PSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PSViewController"), CFSTR("UIViewController"));
}

- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition
{
  _BOOL4 IsVoiceOverRunning;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  UIAccessibilityNotifications v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityValueForKey:", CFSTR("applicationDidBecomeActiveDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && (objc_msgSend(v5, "timeIntervalSinceDate:", v4), v7 <= 1.0))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Bridge"));

      if ((v10 & 1) == 0)
      {
        NSClassFromString(CFSTR("UISplitViewController"));
        -[PSViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LODWORD(v14) = 0;
LABEL_20:
          LOBYTE(IsVoiceOverRunning) = (_DWORD)v14 != 0;
          return IsVoiceOverRunning;
        }
        v12 = (void *)v11;
        while (1)
        {
          objc_msgSend(v12, "safeValueForKey:", CFSTR("_viewDelegate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_msgSend(v12, "superview");
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
          if (!v14)
            goto LABEL_20;
        }
        v15 = v13;
        if ((objc_msgSend(v15, "isCollapsed") & 1) != 0)
        {
          LODWORD(v14) = 0;
LABEL_19:

          goto LABEL_20;
        }
        objc_opt_class();
        -[PSViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "navigationBar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_accessibilityLeafDescendantsWithOptions:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21
          || (-[PSViewControllerAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title")),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v25, "length"),
              v25,
              !v26))
        {
          v22 = v12;

        }
        else
        {
          v22 = v18;
          if (!v22)
          {
            LODWORD(v14) = 0;
            goto LABEL_18;
          }
        }
        v23 = *MEMORY[0x24BDF7328];
        v28[0] = *MEMORY[0x24BDFEF20];
        v28[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v23, v24);

        LODWORD(v14) = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    LOBYTE(IsVoiceOverRunning) = 0;
  }
  return IsVoiceOverRunning;
}

@end
