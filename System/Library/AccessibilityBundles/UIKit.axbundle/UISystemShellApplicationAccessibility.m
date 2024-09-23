@implementation UISystemShellApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISystemShellApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  objc_super v4;
  int64_t v5;
  SEL v6;
  UISystemShellApplicationAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  if ((unint64_t)(a3 - 1100) <= 0xB)
    __asm { BR              X8 }
  v4.receiver = v7;
  v4.super_class = (Class)UISystemShellApplicationAccessibility;
  return -[UISystemShellApplicationAccessibility _iosAccessibilityAttributeValue:](&v4, sel__iosAccessibilityAttributeValue_, v5);
}

id __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "bundleIdentifier");
  objc_storeStrong(location, 0);
  return v3;
}

id __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke_2(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(location[0], "pid"));
  objc_storeStrong(location, 0);
  return v3;
}

uint64_t __73__UISystemShellApplicationAccessibility__iosAccessibilityAttributeValue___block_invoke_3(void *a1, void *a2)
{
  id v3;
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "bundleIdentifier");
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE078]);

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  objc_super v5;
  int v6;
  id location;
  int64_t v8;
  SEL v9;
  UISystemShellApplicationAccessibility *v10;
  id v11;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v8 == 91510)
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", AXFrontBoardPIDForApplicationWithBundleID());
    v6 = 1;
  }
  else
  {
    if (v8 == 91700)
    {
      v11 = (id)AXFrontBoardSpeakThisAppPIDForPoint();
    }
    else
    {
      v5.receiver = v10;
      v5.super_class = (Class)UISystemShellApplicationAccessibility;
      v11 = -[UISystemShellApplicationAccessibility _iosAccessibilityAttributeValue:forParameter:](&v5, sel__iosAccessibilityAttributeValue_forParameter_, v8, location);
    }
    v6 = 1;
  }
  objc_storeStrong(&location, 0);
  return v11;
}

- (BOOL)_accessibilityIsSystemAppServer
{
  return 1;
}

@end
