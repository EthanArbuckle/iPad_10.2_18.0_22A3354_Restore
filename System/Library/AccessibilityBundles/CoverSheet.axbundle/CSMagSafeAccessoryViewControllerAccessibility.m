@implementation CSMagSafeAccessoryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSMagSafeAccessoryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSMagSafeAccessoryViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSMagSafeAccessoryViewController"), CFSTR("CSAccessoryViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSMagSafeAccessoryViewController"), CFSTR("accessory"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSMagSafeAccessory"), CFSTR("primaryColor"), "@", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CSMagSafeAccessoryViewControllerAccessibility;
  -[CSMagSafeAccessoryViewControllerAccessibility viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[CSMagSafeAccessoryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  buf[0] = 0;
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("primaryColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (buf[0])
    abort();
  AXLogAppAccessibility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2325A1000, v7, OS_LOG_TYPE_DEFAULT, "MagSafe accessory: %@ %@", buf, 0x16u);
  }

  v8 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v6, "accessibilityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v8)
  {
    case 2:
      accessibilitySBLocalizedString(CFSTR("mag.safe.detected.clear.case"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_12;
      break;
    case 3:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("mag.safe.detected.leather");
      goto LABEL_11;
    case 5:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("mag.safe.detected.silicone");
      goto LABEL_11;
    case 6:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("mag.safe.detected.sleeve");
      goto LABEL_11;
    case 8:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("mag.safe.detected.wallet");
LABEL_11:
      accessibilitySBLocalizedString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_12:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);

      }
      break;
    default:
      break;
  }

}

@end
