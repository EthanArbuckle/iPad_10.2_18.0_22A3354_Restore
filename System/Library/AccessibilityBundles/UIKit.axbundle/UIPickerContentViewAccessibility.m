@implementation UIPickerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPickerContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIPickerContentView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPickerContentView"), CFSTR("isChecked"), "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[UIPickerContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;

  v3 = 0;
  if ((-[UIPickerContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isChecked")) & 1) != 0)
    return *MEMORY[0x24BDF7400];
  return v3;
}

@end
