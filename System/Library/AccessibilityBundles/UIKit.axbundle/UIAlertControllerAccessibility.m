@implementation UIAlertControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAlertController");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIAlertController"), CFSTR("UIViewController"));
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIAlertControllerView"), CFSTR("_contentView"), "@");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerPhoneTVMacView"), CFSTR("_actionViews"), "NSMutableArray");
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  UIAlertControllerAccessibility *v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  UIAlertControllerAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAlertControllerAccessibility;
  -[UIAlertControllerAccessibility viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __48__UIAlertControllerAccessibility_viewDidAppear___block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

void __48__UIAlertControllerAccessibility_viewDidAppear___block_invoke(id *a1)
{
  id v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD __b[8];
  id argument;
  id location;
  id v14;
  id v15[3];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15[2] = a1;
  v15[1] = a1;
  v15[0] = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("view"));
  v14 = (id)objc_msgSend(v15[0], "safeValueForKey:", CFSTR("_contentView"));
  location = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityResponderElement");
  v9 = (id)objc_msgSend(v15[0], "accessibilityIdentifier");
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("VO_USAGE_CONFIRMED_ALERT"));

  if ((v10 & 1) != 0)
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v15[0], "safeValueForKey:", CFSTR("_actionViews"));
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    if (v8)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        argument = *(id *)(__b[1] + 8 * v5);
        v1 = (id)objc_msgSend(argument, "accessibilityIdentifier");
        v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("VO_USAGE_CONFIRMED_TUTORIAL_BUTTON"));

        if ((v2 & 1) != 0)
          break;
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
          if (!v6)
            goto LABEL_10;
        }
      }
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], argument);
    }
LABEL_10:

  }
  if ((objc_msgSend(location, "_accessibilityIsDescendantOfElement:", v15[0]) & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v14);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
}

@end
