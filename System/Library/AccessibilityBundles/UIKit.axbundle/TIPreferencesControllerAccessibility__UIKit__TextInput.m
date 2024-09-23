@implementation TIPreferencesControllerAccessibility__UIKit__TextInput

- (id)valueForPreferenceKey:(id)a3
{
  objc_super v4;
  int v5;
  id v6;
  char v7;
  id location[2];
  TIPreferencesControllerAccessibility__UIKit__TextInput *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  if (_AXSAssistiveTouchEnabled())
  {
    v6 = -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityMouseKeysEnabled](v9);
    if (!v6)
    {
      -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityUpdateMouseKeysSetting]((uint64_t)v9);
      v6 = -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilityMouseKeysEnabled](v9);

    }
    v7 = objc_msgSend(v6, "BOOLValue") & 1;
    objc_storeStrong(&v6, 0);
  }
  v7 &= 1u;
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEB4EF0]) & 1) != 0
    && (_AXSAssistiveTouchScannerEnabled() || (v7 & 1) != 0))
  {
    v10 = MEMORY[0x24BDBD1C0];
    v5 = 1;
  }
  else
  {
    v4.receiver = v9;
    v4.super_class = (Class)TIPreferencesControllerAccessibility__UIKit__TextInput;
    v10 = -[TIPreferencesControllerAccessibility__UIKit__TextInput valueForPreferenceKey:](&v4, sel_valueForPreferenceKey_, location[0]);
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TIPreferencesController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityMouseKeysEnabled
{
  if (a1)
    return objc_getAssociatedObject(a1, &__TIPreferencesController___accessibilityMouseKeysEnabled);
  else
    return 0;
}

- (void)_accessibilitySetMouseKeysEnabled:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TIPreferencesController"), CFSTR("valueForPreferenceKey:"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (TIPreferencesControllerAccessibility__UIKit__TextInput)init
{
  TIPreferencesControllerAccessibility__UIKit__TextInput *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[3];
  id from;
  objc_super v12;
  SEL v13;
  TIPreferencesControllerAccessibility__UIKit__TextInput *v14;

  v13 = a2;
  v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)TIPreferencesControllerAccessibility__UIKit__TextInput;
  v14 = -[TIPreferencesControllerAccessibility__UIKit__TextInput init](&v12, sel_init);
  objc_storeStrong((id *)&v14, v14);
  objc_initWeak(&from, v14);
  v4 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __62__TIPreferencesControllerAccessibility__UIKit__TextInput_init__block_invoke;
  v9 = &unk_24FF3DCB0;
  objc_copyWeak(v10, &from);
  objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", &v5, sel_assistiveTouchMouseKeysEnabled, v14);

  objc_destroyWeak(v10);
  v3 = v14;
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v14, 0);
  return v3;
}

- (void)_accessibilityUpdateMouseKeysSetting
{
  void *v1;
  id v2;
  id v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDD16E0];
    v3 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v2 = (id)objc_msgSend(v1, "numberWithBool:", objc_msgSend(v3, "assistiveTouchMouseKeysEnabled") & 1);
    -[TIPreferencesControllerAccessibility__UIKit__TextInput _accessibilitySetMouseKeysEnabled:](a1, v2);

  }
}

@end
