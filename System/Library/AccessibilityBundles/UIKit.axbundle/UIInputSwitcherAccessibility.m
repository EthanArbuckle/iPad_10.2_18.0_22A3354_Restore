@implementation UIInputSwitcherAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcher");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = CFSTR("UIInputSwitcher");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("loadedIdentifier"), v4, 0);
  objc_storeStrong(v6, v5);
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  id v5;
  id v6;
  uint64_t v7;
  char v9;
  UIAccessibilityNotifications *v10;
  id v11;
  id v12;
  id argument;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  objc_super v27;
  char v28;
  BOOL v29;
  BOOL v30;
  id location[2];
  UIInputSwitcherAccessibility *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v29 = a5;
  v28 = 0;
  v27.receiver = v32;
  v27.super_class = (Class)UIInputSwitcherAccessibility;
  v28 = -[UIInputSwitcherAccessibility switchMode:withHUD:withDelay:](&v27, sel_switchMode_withHUD_withDelay_, location[0], a4, a5);
  if ((v28 & 1) != 0 && location[0])
  {
    v25 = 0;
    objc_opt_class();
    v12 = (id)-[UIInputSwitcherAccessibility safeValueForKey:](v32, "safeValueForKey:", CFSTR("loadedIdentifier"));
    v24 = (id)__UIAccessibilityCastAsClass();

    v23 = v24;
    objc_storeStrong(&v24, 0);
    v26 = v23;
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v22 = (id)objc_msgSend(v11, "inputModeWithIdentifier:", v26);

    v21 = (id)MEMORY[0x2348C3740](v26);
    v5 = (id)MEMORY[0x2348C3680](v21);
    v6 = v21;
    v21 = v5;

    v20 = (id)objc_msgSend(v22, "extendedDisplayName");
    v19 = (id)UIKitAccessibilityLocalizedString();
    v18 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v19, v20);
    v16 = 0;
    v17 = 0;
    if (v20)
    {
      v16 = objc_msgSend(v18, "rangeOfString:", v20);
      v17 = v7;
    }
    else
    {
      v34 = 0x7FFFFFFFFFFFFFFFLL;
      v33 = 0;
      v35 = 0x7FFFFFFFFFFFFFFFLL;
      v36 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0;
    }
    argument = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v18);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(argument, "setAttribute:forKey:withRange:", v21, *MEMORY[0x24BDFEB98], v16, v17);
    objc_msgSend(argument, "setAttribute:forKey:", &unk_24FF85A60, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB000], argument);
    v10 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE30]);
    UIAccessibilityPostNotification(*v10, argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v26, 0);
  }
  v9 = v28;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

@end
