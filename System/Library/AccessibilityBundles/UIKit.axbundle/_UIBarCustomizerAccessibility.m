@implementation _UIBarCustomizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBarCustomizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = CFSTR("_UIBarCustomizer");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("beginWithSession:"), "v", v3, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(id *);
  void *v8;
  id v9[3];
  id location;
  objc_super v11;
  SEL v12;
  _UIBarCustomizerAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIBarCustomizerAccessibility;
  -[_UIBarCustomizerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, v13);
  v3 = -[_UIBarCustomizerAccessibility _axContainerView](v13, "_axContainerView");
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

  v2 = -[_UIBarCustomizerAccessibility _axContainerView](v13, "_axContainerView");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __75___UIBarCustomizerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8 = &unk_24FF3DA88;
  objc_copyWeak(v9, &location);
  objc_msgSend(v2, "_setAccessibilityPerformEscapeBlock:", &v4);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (id)_axContainerView
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[3];

  v10[2] = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v5 = (id)objc_msgSend(v7, "delegate");
  v3 = v10[0];
  v4 = (id)objc_msgSend(v10[0], "_activeSession");
  v6 = (id)objc_msgSend(v5, "barCustomizer:containerViewForSession:", v3);

  objc_storeStrong(v10, 0);
  return v6;
}

- (void)beginWithSession:(id)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  id location[2];
  _UIBarCustomizerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIBarCustomizerAccessibility;
  -[_UIBarCustomizerAccessibility beginWithSession:](&v5, sel_beginWithSession_, location[0]);
  -[_UIBarCustomizerAccessibility _accessibilityLoadAccessibilityInformation](v7, "_accessibilityLoadAccessibilityInformation");
  notification = *MEMORY[0x24BDF7328];
  v4 = -[_UIBarCustomizerAccessibility _axContainerView](v7, "_axContainerView");
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  UIAccessibilityNotifications v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  UIAccessibilityNotifications notification;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  unint64_t v29;
  objc_super v30;
  id v31;
  unint64_t v32;
  id v33;
  id v34;
  char v35;
  id v36;
  id v37;
  id location[2];
  _UIBarCustomizerAccessibility *v39;

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v35 = 0;
  objc_opt_class();
  v34 = (id)__UIAccessibilityCastAsClass();
  v33 = v34;
  objc_storeStrong(&v34, 0);
  v36 = v33;
  v32 = objc_msgSend(v33, "_dropIndex");
  v30.receiver = v39;
  v30.super_class = (Class)_UIBarCustomizerAccessibility;
  v31 = -[_UIBarCustomizerAccessibility dropInteraction:sessionDidUpdate:](&v30, sel_dropInteraction_sessionDidUpdate_, location[0], v37);
  v29 = objc_msgSend(v36, "_dropIndex");
  if (v32 != v29 && v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      v32 = v29 - 1;
    v28 = (id)objc_msgSend(v36, "_visibleItems");
    if (v32 >= v29 || (v18 = v32, v18 >= objc_msgSend(v28, "count")))
    {
      if (v29 < objc_msgSend(v28, "count"))
      {
        v22 = 0;
        objc_opt_class();
        v11 = (id)objc_msgSend(v28, "objectAtIndex:", v29);
        v21 = (id)__UIAccessibilityCastAsClass();

        v20 = v21;
        objc_storeStrong(&v21, 0);
        v23 = v20;
        v7 = *MEMORY[0x24BDF71E8];
        v6 = (void *)MEMORY[0x24BDD17C8];
        v10 = (id)UIKitAccessibilityLocalizedString();
        v9 = (id)objc_msgSend(v23, "name");
        v8 = (id)objc_msgSend(v6, "localizedStringWithFormat:", v10, v9);
        UIAccessibilityPostNotification(v7, v8);

        objc_storeStrong(&v23, 0);
      }
    }
    else
    {
      v26 = 0;
      objc_opt_class();
      v17 = (id)objc_msgSend(v28, "objectAtIndex:", v32);
      v25 = (id)__UIAccessibilityCastAsClass();

      v24 = v25;
      objc_storeStrong(&v25, 0);
      v27 = v24;
      notification = *MEMORY[0x24BDF71E8];
      v12 = (void *)MEMORY[0x24BDD17C8];
      v16 = (id)UIKitAccessibilityLocalizedString();
      v15 = (id)objc_msgSend(v27, "name");
      v14 = (id)objc_msgSend(v12, "localizedStringWithFormat:", v16, v15);
      UIAccessibilityPostNotification(notification, v14);

      objc_storeStrong(&v27, 0);
    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE28]);
    objc_storeStrong(&v28, 0);
  }
  v5 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
