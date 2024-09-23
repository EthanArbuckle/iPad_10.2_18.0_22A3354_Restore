@implementation UIImageViewAccessibility

- (UIImageViewAccessibility)initWithImage:(id)a3
{
  id v3;
  UIImageViewAccessibility *v5;
  id v6;
  objc_super v7;
  id v8;
  id location[2];
  id v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)UIImageViewAccessibility;
  v10 = -[UIImageViewAccessibility initWithImage:](&v7, sel_initWithImage_, location[0]);
  v8 = v10;
  v6 = (id)objc_msgSend(location[0], "accessibilityLabel");
  if (v6)
    objc_msgSend(v8, "setAccessibilityLabel:", v6);
  v5 = (UIImageViewAccessibility *)v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v5;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 43;
}

- (id)accessibilityElements
{
  id v2;
  id v3;
  id v5;
  id v6;
  os_log_t oslog;
  id obj;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;
  id v15[2];
  UIImageViewAccessibility *v16;
  id v17;
  id v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15[1] = (id)a2;
  v14.receiver = self;
  v14.super_class = (Class)UIImageViewAccessibility;
  v15[0] = -[UIImageViewAccessibility accessibilityElements](&v14, sel_accessibilityElements);
  if (v15[0])
  {
    v17 = v15[0];
    v13 = 1;
  }
  else
  {
    v6 = (id)-[UIImageViewAccessibility image](v16, "image");
    v12 = (id)objc_msgSend(v6, "_accessibilityEncodedHierarchyData");

    if (v12)
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBADD0]), "initWithHierarchyData:", v12);
      v10 = 0;
      obj = 0;
      v5 = (id)objc_msgSend(v11, "decodeHierarchyWithContainer:error:", v16, &obj);
      objc_storeStrong(&v10, obj);
      v9 = v5;
      if (v10 || !v9)
      {
        oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v10);
          _os_log_error_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_ERROR, "Could not decode hierarchy: %@", v19, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v9)
      {
        v18 = v9;
        v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
        v3 = v15[0];
        v15[0] = v2;

        -[UIImageViewAccessibility setAccessibilityElements:](v16, "setAccessibilityElements:", v15[0]);
      }
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    v17 = v15[0];
    v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v15, 0);
  return v17;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v4;
  BOOL v5;
  objc_super v6;
  SEL v7;
  UIImageViewAccessibility *v8;
  unint64_t v9;

  v8 = self;
  v7 = a2;
  v2 = (id)-[UIImageViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v5 = v2 == 0;

  if (v5)
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIImageViewAccessibility;
    return -[UIImageViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits) | *MEMORY[0x24BDF73C8];
  }
  else
  {
    v4 = (id)-[UIImageViewAccessibility accessibilityUserDefinedTraits](v8, "accessibilityUserDefinedTraits");
    v9 = objc_msgSend(v4, "unsignedLongLongValue");

  }
  return v9;
}

- (id)accessibilityLabel
{
  id v3;
  objc_super v4;
  id location;
  int v6;
  id v7[2];
  UIImageViewAccessibility *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UIImageViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (objc_msgSend(v7[0], "length"))
  {
    v9 = v7[0];
    v6 = 1;
  }
  else
  {
    v3 = (id)-[UIImageViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("image"));
    location = (id)objc_msgSend(v3, "accessibilityLabel");

    if (objc_msgSend(location, "length"))
    {
      v9 = location;
    }
    else
    {
      v4.receiver = v8;
      v4.super_class = (Class)UIImageViewAccessibility;
      v9 = -[UIImageViewAccessibility accessibilityLabel](&v4, sel_accessibilityLabel);
    }
    v6 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityValue
{
  id v3;
  objc_super v4;
  id location;
  int v6;
  id v7[2];
  UIImageViewAccessibility *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UIImageViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (objc_msgSend(v7[0], "length"))
  {
    v9 = v7[0];
    v6 = 1;
  }
  else
  {
    v3 = (id)-[UIImageViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("image"));
    location = (id)objc_msgSend(v3, "accessibilityValue");

    if (objc_msgSend(location, "length"))
    {
      v9 = location;
    }
    else
    {
      v4.receiver = v8;
      v4.super_class = (Class)UIImageViewAccessibility;
      v9 = -[UIImageViewAccessibility accessibilityValue](&v4, sel_accessibilityValue);
    }
    v6 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityIdentification
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  UIImageViewAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIImageViewAccessibility;
  v8[0] = -[UIImageViewAccessibility accessibilityIdentification](&v7, sel_accessibilityIdentification);
  if (!v8[0])
  {
    v6 = (id)-[UIImageViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("image"));
    v2 = (id)objc_msgSend(v6, "accessibilityIdentification");
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (id)accessibilityIdentifier
{
  id v3;
  id v4;
  id v5[2];
  UIImageViewAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UIImageViewAccessibility accessibilityUserDefinedIdentifier](self, "accessibilityUserDefinedIdentifier");
  if (!v5[0])
  {
    v5[0] = -[UIImageViewAccessibility accessibilityIdentification](v6, "accessibilityIdentification");

  }
  if (!v5[0])
  {
    v4 = (id)-[UIImageViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("image"));
    v5[0] = (id)objc_msgSend(v4, "accessibilityIdentifier");

  }
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  BOOL v4;
  objc_super v5;
  SEL v6;
  UIImageViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v3 = (id)-[UIImageViewAccessibility storedAccessibilityIdentifier](self, "storedAccessibilityIdentifier");
  v4 = 0;
  if (v3)
    v4 = AXDoesRequestingClientDeserveAutomation() != 0;

  if (v4)
    return 1;
  v5.receiver = v7;
  v5.super_class = (Class)UIImageViewAccessibility;
  return -[UIImageViewAccessibility isAccessibilityElement](&v5, sel_isAccessibilityElement);
}

@end
