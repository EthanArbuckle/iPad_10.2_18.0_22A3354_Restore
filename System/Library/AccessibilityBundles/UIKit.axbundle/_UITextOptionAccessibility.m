@implementation _UITextOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITextOption");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITextOption"), CFSTR("textChoice"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  char v4;
  id v5;
  objc_super v6;
  os_log_type_t v7;
  id location;
  BOOL v9;
  int v10;
  id v11;
  uint64_t v12;
  SEL v13;
  _UITextOptionAccessibility *v14;
  id v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13 = a2;
  v12 = -[_UITextOptionAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("type"));
  v11 = (id)-[_UITextOptionAccessibility safeStringForKey:](v14, "safeStringForKey:", CFSTR("textChoice"));
  if (v12)
  {
    if (v12 == 1)
    {
      v15 = accessibilityLocalizedString(CFSTR("text.option.type.revert.label"));
      v10 = 1;
    }
    else
    {
      v9 = objc_msgSend(v11, "length") != 0;
      if (!v9)
      {
        location = (id)AXLogAppAccessibility();
        v7 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v16, v12);
          _os_log_fault_impl(&dword_230C4A000, (os_log_t)location, v7, "Unexpectedly missing text for text option with type: %ld", v16, 0xCu);
        }
        objc_storeStrong(&location, 0);
      }
      v4 = 0;
      if (v9)
      {
        v2 = v11;
      }
      else
      {
        v6.receiver = v14;
        v6.super_class = (Class)_UITextOptionAccessibility;
        v5 = -[_UITextOptionAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
        v4 = 1;
        v2 = v5;
      }
      v15 = v2;
      if ((v4 & 1) != 0)

      v10 = 1;
    }
  }
  else
  {
    v15 = accessibilityLocalizedString(CFSTR("text.option.type.cancel.label"));
    v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  return v15;
}

@end
