@implementation UIBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIBarButtonItem");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("customView"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityAddIdForView:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  BOOL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned int v34;
  id v35;
  id v36;
  unsigned int v37;
  id v38;
  int v39;
  id location;
  id v41;

  v41 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v41)
  {
    if (location)
    {
      v38 = (id)objc_msgSend(v41, "accessibilityIdentification");
      if (objc_msgSend(v38, "length"))
      {
        objc_msgSend(location, "accessibilitySetIdentification:", v38);
      }
      else
      {
        v33 = (id)objc_msgSend(v41, "safeValueForKey:", CFSTR("systemItem"));
        v34 = objc_msgSend(v33, "intValue");

        v37 = v34;
        if (!v34)
        {
          v32 = (id)objc_msgSend(v41, "safeValueForKey:", CFSTR("tag"));
          v37 = objc_msgSend(v32, "intValue");

        }
        if (v37)
        {
          v30 = location;
          v31 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v37);
          objc_msgSend(v30, "accessibilitySetIdentification:");

        }
      }
      v36 = (id)objc_msgSend(v41, "_accessibilityGetBlockForAttribute:", 1);
      if (v36)
      {
        objc_msgSend(location, "_setAccessibilityLabelBlock:", v36);
      }
      else
      {
        v35 = (id)objc_msgSend(v41, "_accessibilityAXAttributedLabel");
        if (objc_msgSend(v35, "length"))
          objc_msgSend(location, "setAccessibilityLabel:", v35);
        objc_storeStrong(&v35, 0);
      }
      v2 = (id)objc_msgSend(v41, "_accessibilityGetBlockForAttribute:", 2);
      v3 = v36;
      v36 = v2;

      if (v36)
      {
        objc_msgSend(location, "_setAccessibilityHintBlock:", v36);
      }
      else
      {
        v4 = (id)objc_msgSend(v41, "_accessibilityAXAttributedHint");
        v29 = v4 == 0;

        if (!v29)
        {
          v27 = location;
          v28 = (id)objc_msgSend(v41, "_accessibilityAXAttributedHint");
          objc_msgSend(v27, "setAccessibilityHint:");

        }
      }
      v5 = (id)objc_msgSend(v41, "accessibilityIdentifier");
      v26 = v5 == 0;

      if (!v26)
      {
        v24 = location;
        v25 = (id)objc_msgSend(v41, "accessibilityIdentifier");
        objc_msgSend(v24, "setAccessibilityIdentifier:");

      }
      v6 = (id)objc_msgSend(v41, "_accessibilityGetBlockForAttribute:", 3);
      v7 = v36;
      v36 = v6;

      if (v36)
      {
        objc_msgSend(location, "_setAccessibilityValueBlock:", v36);
      }
      else
      {
        v8 = (id)objc_msgSend(v41, "_accessibilityAXAttributedValue");
        v23 = v8 == 0;

        if (!v23)
        {
          v21 = location;
          v22 = (id)objc_msgSend(v41, "_accessibilityAXAttributedValue");
          objc_msgSend(v21, "setAccessibilityValue:");

        }
      }
      v9 = (id)objc_msgSend(v41, "accessibilityUserDefinedTraits");
      v20 = v9 == 0;

      if (!v20)
      {
        v18 = location;
        v19 = (id)objc_msgSend(v41, "accessibilityUserDefinedTraits");
        objc_msgSend(v18, "setAccessibilityTraits:", objc_msgSend(v19, "unsignedLongLongValue"));

      }
      v10 = (id)objc_msgSend(v41, "isAccessibilityUserDefinedElement");
      v17 = v10 == 0;

      if (!v17)
      {
        v15 = location;
        v16 = (id)objc_msgSend(v41, "isAccessibilityUserDefinedElement");
        objc_msgSend(v15, "setIsAccessibilityElement:", objc_msgSend(v16, "BOOLValue") & 1);

      }
      v11 = (id)objc_msgSend(v41, "accessibilityUserDefinedNotFirstElement");
      v14 = v11 == 0;

      if (!v14)
      {
        v12 = location;
        v13 = (id)objc_msgSend(v41, "accessibilityUserDefinedNotFirstElement");
        objc_msgSend(v12, "_setAccessibilityIsNotFirstElement:", objc_msgSend(v13, "BOOLValue") & 1);

      }
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v38, 0);
      v39 = 0;
    }
    else
    {
      v39 = 1;
    }
  }
  else
  {
    v39 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityIdentifierForImage:(uint64_t)a1
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  UIImage *image;
  int i;
  id v10;
  id v11;
  int v12;
  id location;
  uint64_t v14;
  id v15;

  v14 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v14)
  {
    if (location)
    {
      v11 = &unk_24FF85EB0;
      v10 = &unk_24FF85EC8;
      for (i = 0; ; ++i)
      {
        v5 = i;
        if (v5 >= objc_msgSend(v11, "count"))
          break;
        v3 = (void *)MEMORY[0x24BDF6AC8];
        v4 = (id)objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        image = (UIImage *)(id)objc_msgSend(v3, "kitImageNamed:");

        v7 = UIImagePNGRepresentation((UIImage *)location);
        v6 = UIImagePNGRepresentation(image);
        if ((objc_msgSend(v7, "isEqual:", v6) & 1) != 0)
        {
          v15 = (id)objc_msgSend(v10, "objectAtIndexedSubscript:", i);
          v12 = 1;
        }
        else
        {
          v12 = 0;
        }
        objc_storeStrong(&v6, 0);
        objc_storeStrong(&v7, 0);
        objc_storeStrong((id *)&image, 0);
        if (v12)
          goto LABEL_13;
      }
      v15 = 0;
      v12 = 1;
LABEL_13:
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    else
    {
      v15 = 0;
      v12 = 1;
    }
  }
  else
  {
    v15 = 0;
    v12 = 1;
  }
  objc_storeStrong(&location, 0);
  return v15;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  objc_super v22;
  id v23[2];
  UIBarButtonItemAccessibility *v24;

  v24 = self;
  v23[1] = (id)a2;
  v22.receiver = self;
  v22.super_class = (Class)UIBarButtonItemAccessibility;
  v23[0] = -[UIBarButtonItemAccessibility accessibilityLabel](&v22, sel_accessibilityLabel);
  v20 = 0;
  objc_opt_class();
  v13 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("image"));
  v19 = (id)__UIAccessibilityCastAsClass();

  v18 = v19;
  objc_storeStrong(&v19, 0);
  v21 = v18;
  if (!v23[0])
  {
    v17 = (id)objc_msgSend(v21, "accessibilityIdentifier");
    if (!v17)
    {
      v17 = -[UIBarButtonItemAccessibility _accessibilityIdentifierForImage:]((uint64_t)v24, v21);

    }
    v16 = (id)UIAXLocalizedStringForKnownAXIdentifier();
    if (objc_msgSend(v16, "length"))
    {
      objc_storeStrong(v23, v16);
    }
    else
    {
      v2 = (id)objc_msgSend(v21, "accessibilityLabel");
      v3 = v23[0];
      v23[0] = v2;

    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  if (!v23[0])
  {
    v4 = -[UIBarButtonItemAccessibility _axBarButtonImagePath](v24);
    v5 = v23[0];
    v23[0] = v4;

  }
  v14 = 0;
  v12 = 0;
  if (!objc_msgSend(v23[0], "length"))
  {
    v15 = (id)objc_msgSend(v21, "accessibilityLabel");
    v14 = 1;
    v12 = objc_msgSend(v15, "isEqualToString:", CFSTR("sidebar.leading"));
  }
  if ((v14 & 1) != 0)

  if ((v12 & 1) != 0)
  {
    v6 = (id)accessibilityUIKitLocalizedString();
    v7 = v23[0];
    v23[0] = v6;

  }
  if (!v23[0]
    && (-[UIBarButtonItemAccessibility safeBoolForKey:](v24, "safeBoolForKey:", CFSTR("isSystemItem")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6F90], "_accessibilityTitleForSystemTag:", -[UIBarButtonItemAccessibility safeIntegerForKey:](v24, "safeIntegerForKey:", CFSTR("systemItem")));
    v9 = v23[0];
    v23[0] = v8;

  }
  v11 = v23[0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v23, 0);
  return v11;
}

- (id)_axBarButtonImagePath
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIBarButtonItemAccessibility___axBarButtonImagePath);
  else
    return 0;
}

- (id)accessibilityLocalizedStringKey
{
  return (id)-[UIBarButtonItemAccessibility _accessibilityRetrieveLocalizedStringKey](self, "_accessibilityRetrieveLocalizedStringKey", a2, self);
}

- (id)accessibilityLocalizationBundleID
{
  return (id)-[UIBarButtonItemAccessibility _accessibilityRetrieveLocalizationBundleID](self, "_accessibilityRetrieveLocalizationBundleID", a2, self);
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)-[UIBarButtonItemAccessibility _accessibilityRetrieveLocalizationBundlePath](self, "_accessibilityRetrieveLocalizationBundlePath", a2, self);
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)-[UIBarButtonItemAccessibility _accessibilityRetrieveLocalizedStringTableName](self, "_accessibilityRetrieveLocalizedStringTableName", a2, self);
}

- (void)setTitle:(id)a3
{
  UIBarButtonItemAccessibility *v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setTitle:](&v5, sel_setTitle_, location[0]);
  v3 = v7;
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("view"));
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v3, v4);

  objc_storeStrong(location, 0);
}

- (void)setView:(id)a3
{
  objc_super v3;
  id location[2];
  UIBarButtonItemAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setView:](&v3, sel_setView_, location[0]);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setCustomView:(id)a3
{
  objc_super v3;
  id location[2];
  UIBarButtonItemAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setCustomView:](&v3, sel_setCustomView_, location[0]);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityLabelBlock:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility _setAccessibilityLabelBlock:](&v5, sel__setAccessibilityLabelBlock_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeUIViewForKey:](v7, "safeUIViewForKey:", CFSTR("_view"));
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", location[0]);

  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityHintBlock:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility _setAccessibilityHintBlock:](&v5, sel__setAccessibilityHintBlock_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeUIViewForKey:](v7, "safeUIViewForKey:", CFSTR("_view"));
  objc_msgSend(v4, "_setAccessibilityHintBlock:", location[0]);

  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(location, 0);
}

- (void)_setAccessibilityValueBlock:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility _setAccessibilityValueBlock:](&v5, sel__setAccessibilityValueBlock_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeUIViewForKey:](v7, "safeUIViewForKey:", CFSTR("_view"));
  objc_msgSend(v4, "_setAccessibilityValueBlock:", location[0]);

  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityLabel:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityAttributedLabel:](&v5, sel_setAccessibilityAttributedLabel_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityAttributedLabel:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityIdentifier:](&v5, sel_setAccessibilityIdentifier_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  id v3;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  UIBarButtonItemAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setIsAccessibilityElement:](&v5, sel_setIsAccessibilityElement_, a3);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setIsAccessibilityElement:", v6);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
}

- (void)setAccessibilityValue:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityValue:](&v5, sel_setAccessibilityValue_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityValue:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedValue:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityAttributedValue:](&v5, sel_setAccessibilityAttributedValue_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityAttributedValue:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  id v3;
  id v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  UIBarButtonItemAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityTraits:](&v5, sel_setAccessibilityTraits_, a3);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityTraits:", v6);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIBarButtonItemAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UIBarButtonItemAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v4;
  BOOL v5;
  unint64_t v7;

  v2 = (id)-[UIBarButtonItemAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v5 = v2 == 0;

  if (v5)
    return *MEMORY[0x24BDF73B0];
  v4 = (id)-[UIBarButtonItemAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v7 = objc_msgSend(v4, "unsignedLongLongValue");

  return v7;
}

- (void)_setAccessibilityIsNotFirstElement:(BOOL)a3
{
  id v3;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  UIBarButtonItemAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility _setAccessibilityIsNotFirstElement:](&v5, sel__setAccessibilityIsNotFirstElement_, a3);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "_setAccessibilityIsNotFirstElement:", v6);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
}

- (void)setAccessibilityHint:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityHint:](&v5, sel_setAccessibilityHint_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityHint:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIBarButtonItemAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility setAccessibilityAttributedHint:](&v5, sel_setAccessibilityAttributedHint_, location[0]);
  v4 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_view"));
  objc_msgSend(v4, "setAccessibilityAttributedHint:", location[0]);
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_updateView"));
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  UIBarButtonItemAccessibility *v2;
  id v3;
  objc_super v4;
  SEL v5;
  UIBarButtonItemAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v2 = v6;
  v3 = (id)-[UIBarButtonItemAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("view"));
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v2, v3);

}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UIBarButtonItemAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UIBarButtonItemAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v2.receiver = v4;
  v2.super_class = (Class)UIBarButtonItemAccessibility;
  -[UIBarButtonItemAccessibility dealloc](&v2, sel_dealloc);
}

- (id)createViewForNavigationItem:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  UIBarButtonItemAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  v6 = -[UIBarButtonItemAccessibility createViewForNavigationItem:](&v5, sel_createViewForNavigationItem_, location[0]);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v8, v6);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (UIBarButtonItemAccessibility)initWithImage:(id)a3 style:(int64_t)a4 target:(id)a5 action:(SEL)a6
{
  UIBarButtonItemAccessibility *v6;
  UIBarButtonItemAccessibility *v11;
  objc_super v12;
  SEL v13;
  id v14;
  int64_t v15;
  id location[2];
  UIBarButtonItemAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = a6;
  v6 = v17;
  v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)UIBarButtonItemAccessibility;
  v17 = -[UIBarButtonItemAccessibility initWithImage:style:target:action:](&v12, sel_initWithImage_style_target_action_, location[0], v15, v14, a6);
  objc_storeStrong((id *)&v17, v17);
  -[UIBarButtonItemAccessibility _updateAccessibilityLabelForImage:](v17, location[0]);
  v11 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v11;
}

- (void)_updateAccessibilityLabelForImage:(void *)a1
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  int v6;
  id location;
  id v8;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    v5 = (id)objc_msgSend(location, "accessibilityIdentifier");
    if (objc_msgSend(v5, "length"))
    {
      v4 = (id)UIAXLocalizedStringForKnownAXIdentifier();
      if (v4)
      {
        objc_msgSend(v8, "setAccessibilityLabel:", v4);
      }
      else
      {
        v2 = (uint64_t)v8;
        v3 = (id)objc_msgSend(v8, "_accessibilityRetrieveImagePathLabel:", v5);
        -[UIBarButtonItemAccessibility _setAXBarButtonImagePath:](v2, v3);

      }
      objc_storeStrong(&v4, 0);
    }
    objc_storeStrong(&v5, 0);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (UIBarButtonItemAccessibility)initWithImage:(id)a3 landscapeImagePhone:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7
{
  UIBarButtonItemAccessibility *v7;
  UIBarButtonItemAccessibility *v13;
  objc_super v14;
  SEL v15;
  id v16;
  int64_t v17;
  id v18;
  id location[2];
  UIBarButtonItemAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  v16 = 0;
  objc_storeStrong(&v16, a6);
  v15 = a7;
  v7 = v20;
  v20 = 0;
  v14.receiver = v7;
  v14.super_class = (Class)UIBarButtonItemAccessibility;
  v20 = -[UIBarButtonItemAccessibility initWithImage:landscapeImagePhone:style:target:action:](&v14, sel_initWithImage_landscapeImagePhone_style_target_action_, location[0], v18, v17, v16, a7);
  objc_storeStrong((id *)&v20, v20);
  -[UIBarButtonItemAccessibility _updateAccessibilityLabelForImage:](v20, location[0]);
  v13 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v13;
}

- (void)_setAXBarButtonImagePath:(uint64_t)a1
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

- (id)createViewForToolbar:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  UIBarButtonItemAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)UIBarButtonItemAccessibility;
  v6 = -[UIBarButtonItemAccessibility createViewForToolbar:](&v5, sel_createViewForToolbar_, location[0]);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v8, v6);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
