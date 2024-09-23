@implementation UIStatusBarServiceItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarServiceItemView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarServiceItemView"), CFSTR("_serviceString"), "NSString");
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityCoreTelephonyServiceStringName
{
  id v2;
  id v3;
  id v4[2];
  id v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4[1] = a1;
  if (a1)
  {
    v4[0] = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", CFSTR("__service__string__"));
    v2 = v4[0];
    v6 = *MEMORY[0x24BDFECB8];
    v7[0] = MEMORY[0x24BDBD1C8];
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    objc_msgSend(v2, "setAttributes:");

    v5 = v4[0];
    objc_storeStrong(v4, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t Type;
  int v21;
  id location[2];
  UIStatusBarServiceItemViewAccessibility *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v15 = (id)-[UIStatusBarServiceItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentType"));
  v16 = objc_msgSend(v15, "intValue");

  v21 = v16;
  if (v16 == 2)
  {
    Type = AXDeviceGetType();
    if (Type == 2)
    {
      v2 = accessibilityLocalizedString(CFSTR("status.service.ipod"));
      v3 = location[0];
      location[0] = v2;

    }
    else
    {
      if (Type == 3)
        v4 = accessibilityLocalizedString(CFSTR("status.service.ipad"));
      else
        v4 = -[UIStatusBarServiceItemViewAccessibility _accessibilityCoreTelephonyServiceStringName](v23);
      v5 = location[0];
      location[0] = v4;

    }
  }
  else if (v21 == 1)
  {
    v6 = (id)-[UIStatusBarServiceItemViewAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_serviceString"));
    v7 = location[0];
    location[0] = v6;

  }
  else
  {
    v19 = -[UIStatusBarServiceItemViewAccessibility _accessibilityCoreTelephonyServiceStringName](v23);
    if ((objc_msgSend(v19, "hasAttribute:", *MEMORY[0x24BDFECB8]) & 1) != 0)
    {
      v18 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", &stru_24FF484E0);
      v11 = v18;
      v12 = accessibilityLocalizedString(CFSTR("status.service.network.format"));
      objc_msgSend(v11, "appendFormat:", v19);

      v13 = v18;
      v14 = (id)objc_msgSend(v19, "coalescedAttributes");
      v17 = objc_msgSend(v18, "rangeOfString:", v19);
      objc_msgSend(v13, "setAttributes:withRange:", v14, v17, v8);

      objc_storeStrong(location, v18);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      objc_storeStrong(location, v19);
    }
    objc_storeStrong(&v19, 0);
  }
  v10 = location[0];
  objc_storeStrong(location, 0);
  return v10;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarServiceItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarServiceItemViewAccessibility;
  return -[UIStatusBarServiceItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
