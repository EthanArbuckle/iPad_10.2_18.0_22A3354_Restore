@implementation UIPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPresentationController");
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

- (BOOL)_accessibilityPresentationControllerModalizes
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UIPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPresentationControllerAccessibility;
  -[UIPresentationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UIPresentationControllerAccessibility _accessibilityModalizePresentationView](v4, "_accessibilityModalizePresentationView");
}

- (void)_accessibilityModalizePresentationView
{
  objc_class *v2;
  NSObject *v3;
  os_log_type_t v4;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  NSString *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  os_log_type_t v18;
  id location[2];
  UIPresentationControllerAccessibility *v20;
  uint8_t v21[16];
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  location[1] = (id)a2;
  if (-[UIPresentationControllerAccessibility _accessibilityPresentationControllerModalizes](self, "_accessibilityPresentationControllerModalizes"))
  {
    v17 = v20;
    v8 = (id)objc_msgSend(v17, "containerView");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v15 = 0;
      objc_opt_class();
      v7 = (id)objc_msgSend(v17, "containerView");
      v14 = (id)__UIAccessibilityCastAsSafeCategory();

      v13 = v14;
      objc_storeStrong(&v14, 0);
      v16 = v13;
      -[UITransitionViewAccessibility _axSetPresentationController:]((uint64_t)v13, v17);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v12 = (id)AXLogValidations();
      v11 = 16;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        v3 = v12;
        v4 = v11;
        v6 = (id)objc_msgSend(v17, "containerView");
        v2 = (objc_class *)objc_opt_class();
        v5 = NSStringFromClass(v2);
        v10 = v5;
        __os_log_helper_16_2_1_8_66((uint64_t)v21, (uint64_t)v10);
        _os_log_error_impl(&dword_230C4A000, v3, v4, "Unexpected class %{public}@ for presentation controller container view", v21, 0xCu);

        objc_storeStrong((id *)&v10, 0);
      }
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    location[0] = (id)AXLogAppAccessibility();
    v18 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v20);
      _os_log_impl(&dword_230C4A000, (os_log_t)location[0], v18, "Presentation controller doesn't modalize: %@", v22, 0xCu);
    }
    objc_storeStrong(location, 0);
  }
}

@end
