@implementation UIStatusBarTimeItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarTimeItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v3;
  id v4;
  id v5;
  BOOL v6;

  v5 = (id)-[UIStatusBarTimeItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateTimeString"));
  v4 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:");
  v6 = objc_msgSend(v3, "length") != 0;

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BDFEA60];
  v4 = (id)-[UIStatusBarTimeItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateTimeString"));
  v6[0] = (id)objc_msgSend(v3, "axAttributedStringWithString:");

  objc_msgSend(v6[0], "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00]);
  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarTimeItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarTimeItemViewAccessibility;
  return -[UIStatusBarTimeItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BDF7430];
}

@end
