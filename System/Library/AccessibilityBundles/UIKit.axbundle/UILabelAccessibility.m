@implementation UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 48;
}

- (double)_accessibilityFontSize
{
  double v2;
  id v4;
  double v5;

  v4 = (id)-[UILabelAccessibility font](self, "font");
  objc_msgSend(v4, "pointSize");
  v5 = v2;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  double v3;
  void *v4;
  id v5;
  id v7;
  void *context;
  char v9;
  id v10;
  BOOL v11;
  int v12;
  id location;
  id v14;
  char v15;
  SEL v16;
  UILabelAccessibility *v17;
  char v18;

  v17 = self;
  v16 = a2;
  v2 = (id)-[UILabelAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v11 = v2 == 0;

  if (v11)
  {
    v15 = 0;
    -[UILabelAccessibility alpha](v17, "alpha");
    if (v3 <= 0.0 || (v9 = 1, (-[UILabelAccessibility isHidden](v17, "isHidden") & 1) != 0))
      v9 = -[UILabelAccessibility _accessibilityOverridesInvisibility](v17, "_accessibilityOverridesInvisibility");
    v15 = v9 & 1;
    if ((v9 & 1) != 0)
    {
      context = (void *)MEMORY[0x2348C3C98]();
      v14 = -[UILabelAccessibility _accessibilityLabel:](v17, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithStringOrAttributedString:", v14);
        v5 = v14;
        v14 = v4;

      }
      v7 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      location = (id)objc_msgSend(v14, "stringByTrimmingCharactersInSet:");

      if (objc_msgSend(location, "length"))
      {
        v12 = 0;
      }
      else
      {
        v18 = 0;
        v12 = 1;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v14, 0);
      objc_autoreleasePoolPop(context);
      if (!v12)
        v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v10 = (id)-[UILabelAccessibility isAccessibilityUserDefinedElement](v17, "isAccessibilityUserDefinedElement");
    v18 = objc_msgSend(v10, "BOOLValue") & 1;

  }
  return v18 & 1;
}

- (id)_accessibilityLabel:(void *)a1
{
  id location;
  char v4;
  void *v5;
  id v6;

  v5 = a1;
  v4 = a2 & 1;
  if (a1)
  {
    location = (id)objc_msgSend(v5, "accessibilityUserDefinedLabel");
    if (location)
      v6 = location;
    else
      v6 = -[UILabelAccessibility _axOriginalLabelText:](v5, v4 & 1);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_axCleanupNewlines:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id obj;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD __b[8];
  id v18;
  char v19;
  id v20;
  id v21[3];
  id v22;
  int v23;
  id location;
  uint64_t v25;
  id v26;
  id v27;
  dispatch_once_t *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v25)
  {
    if (location)
    {
      v28 = (dispatch_once_t *)&_axCleanupNewlines__onceToken;
      v27 = 0;
      objc_storeStrong(&v27, &__block_literal_global_25);
      if (*v28 != -1)
        dispatch_once(v28, v27);
      objc_storeStrong(&v27, 0);
      v15 = (void *)_axCleanupNewlines__Regex;
      v14 = location;
      v2 = (void *)objc_msgSend(location, "length");
      v30 = 0;
      v29 = v2;
      v31 = 0;
      v32 = v2;
      v21[1] = 0;
      v21[2] = v2;
      v22 = (id)objc_msgSend(v15, "matchesInString:options:range:", v14, 0, 0, v2);
      if (objc_msgSend(v22, "count"))
      {
        objc_opt_class();
        v19 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = location;
        }
        else
        {
          v20 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location);
          v19 = 1;
          v3 = v20;
        }
        v21[0] = v3;
        if ((v19 & 1) != 0)

        memset(__b, 0, sizeof(__b));
        v11 = (id)objc_msgSend(v22, "reverseObjectEnumerator");
        obj = (id)objc_msgSend(v11, "allObjects");

        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (v13)
        {
          v8 = *(_QWORD *)__b[2];
          v9 = 0;
          v10 = v13;
          while (1)
          {
            v7 = v9;
            if (*(_QWORD *)__b[2] != v8)
              objc_enumerationMutation(obj);
            v18 = *(id *)(__b[1] + 8 * v9);
            v6 = v21[0];
            v16 = objc_msgSend(v18, "range");
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v16, v4, CFSTR(" "));
            ++v9;
            if (v7 + 1 >= v10)
            {
              v9 = 0;
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
              if (!v10)
                break;
            }
          }
        }

        v26 = v21[0];
        v23 = 1;
        objc_storeStrong(v21, 0);
      }
      else
      {
        v26 = location;
        v23 = 1;
      }
      objc_storeStrong(&v22, 0);
    }
    else
    {
      v26 = 0;
      v23 = 1;
    }
  }
  else
  {
    v26 = 0;
    v23 = 1;
  }
  objc_storeStrong(&location, 0);
  return v26;
}

void __43__UILabelAccessibility__axCleanupNewlines___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?<!\n)\n{1}(?!\n)"), 0, 0, a1, a1);
  v2 = (void *)_axCleanupNewlines__Regex;
  _axCleanupNewlines__Regex = (uint64_t)v1;

}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  objc_class *v3;
  objc_super v5;
  Method InstanceMethod;
  SEL name;
  SEL v8;
  UILabelAccessibility *v9;
  id location;
  dispatch_once_t *v12;

  v9 = self;
  v8 = a2;
  name = a3;
  v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_189);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityLabel)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod;
  if (name == sel_accessibilityAttributedLabel)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod;
  v5.receiver = v9;
  v5.super_class = (Class)UILabelAccessibility;
  return -[UILabelAccessibility _accessibilityOverridesPotentiallyAttributedAPISelector:](&v5, sel__accessibilityOverridesPotentiallyAttributedAPISelector_, name);
}

Method __80__UILabelAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityLabel);
  v1 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v1, sel_accessibilityAttributedLabel);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod = (uint64_t)result;
  return result;
}

- (id)accessibilityCustomRotors
{
  return (id)-[UILabelAccessibility _accessibilityInternalTextLinkCustomRotors](self, "_accessibilityInternalTextLinkCustomRotors", a2, self);
}

- (id)accessibilityValue
{
  objc_super v3;
  SEL v4;
  UILabelAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if ((-[UILabelAccessibility accessibilityExposeLabelAsValue](self, "accessibilityExposeLabelAsValue") & 1) != 0)
  {
    v6 = -[UILabelAccessibility _axOriginalLabelText:](v5, 1);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UILabelAccessibility;
    v6 = -[UILabelAccessibility accessibilityValue](&v3, sel_accessibilityValue);
  }
  return v6;
}

- (id)_axOriginalLabelText:(void *)a1
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  uint64_t DurationRangeInString;
  uint64_t v16;
  id v17;
  char v18;
  BOOL v19;
  id v20;
  id v21;
  id obj;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  int v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  dispatch_once_t *v42;

  v39 = a1;
  v38 = a2 & 1;
  if (a1)
  {
    v37 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_axOriginalLabelText"), v39);
    v2 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v37);
    v19 = v2 == 0;

    if (!v19)
    {
      v40 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v37);
      v36 = 1;
LABEL_34:
      objc_storeStrong(&v37, 0);
      return v40;
    }
    v17 = (id)objc_msgSend(v39, "accessibilityIdentification");
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("doubleHeightLabel"));

    if ((v18 & 1) != 0)
    {
      v35 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("text"));
      if ((v38 & 1) != 0)
      {
        v34 = 0;
        v32 = 0;
        v33 = 0;
        v31 = 0;
        DurationRangeInString = _accessibilityFindDurationRangeInString(v35, &v31);
        v16 = v3;
        objc_storeStrong(&v34, v31);
        v32 = DurationRangeInString;
        v33 = v16;
        if (DurationRangeInString == 0x7FFFFFFFFFFFFFFFLL)
        {
          v36 = 0;
        }
        else
        {
          v4 = objc_allocWithZone(MEMORY[0x24BDFEA60]);
          v30 = (id)objc_msgSend(v4, "initWithString:", v35);
          objc_msgSend(v30, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], v34, v32, v33);
          objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v30, v37);
          v40 = v30;
          v36 = 1;
          objc_storeStrong(&v30, 0);
        }
        objc_storeStrong(&v34, 0);
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v35, v37);
        v40 = v35;
        v36 = 1;
      }
      objc_storeStrong(&v35, 0);
      if (v36)
        goto LABEL_34;
    }
    v28 = 0;
    objc_opt_class();
    v14 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("attributedText"));
    v27 = (id)__UIAccessibilityCastAsClass();

    v26 = v27;
    objc_storeStrong(&v27, 0);
    v29 = v26;
    v25 = 0;
    if (objc_msgSend(v26, "length"))
    {
      if ((v38 & 1) == 0)
      {
        v5 = (id)objc_msgSend(v29, "string");
        v6 = v25;
        v25 = v5;

        objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v25, v37);
        v40 = v25;
        v36 = 1;
LABEL_33:
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v29, 0);
        goto LABEL_34;
      }
      v24 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      if (v24)
      {
        v42 = (dispatch_once_t *)&_axOriginalLabelText__onceToken;
        v41 = 0;
        objc_storeStrong(&v41, &__block_literal_global_220);
        if (*v42 != -1)
          dispatch_once(v42, v41);
        objc_storeStrong(&v41, 0);
        if (!AXDoesRequestingClientDeserveAutomation())
          objc_msgSend(v24, "removeAttributes:", _axOriginalLabelText__Attributes);
        v23 = (id)objc_msgSend(v39, "_accessibilityValueForKey:", *MEMORY[0x24BEBB2F8]);
        if (v23)
        {
          obj = (id)objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", v23, CFSTR(","));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong(&v24, obj);
          objc_storeStrong(&obj, 0);
        }
        v21 = -[UILabelAccessibility _axCleanupNewlines:]((uint64_t)v39, v24);
        objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v21, v37);
        v40 = v21;
        v36 = 1;
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v23, 0);
      }
      else
      {
        v36 = 0;
      }
      objc_storeStrong(&v24, 0);
      if (v36)
        goto LABEL_33;
    }
    if (!objc_msgSend(v25, "length"))
    {
      v7 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("text"));
      v8 = v25;
      v25 = v7;

    }
    v9 = -[UILabelAccessibility _axCleanupNewlines:]((uint64_t)v39, v25);
    v10 = v25;
    v25 = v9;

    v20 = (id)objc_msgSend(v39, "_accessibilityValueForKey:", *MEMORY[0x24BEBB2F8]);
    if (v20)
    {
      v11 = (id)objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", v20, CFSTR(","));
      v12 = v25;
      v25 = v11;

    }
    objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v25, v37);
    v40 = v25;
    v36 = 1;
    objc_storeStrong(&v20, 0);
    goto LABEL_33;
  }
  v40 = 0;
  return v40;
}

- (id)accessibilityLabel
{
  return -[UILabelAccessibility _accessibilityLabel:](self, 1);
}

- (id)accessibilityAttributedLabel
{
  id location[3];
  id v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[UILabelAccessibility accessibilityLabel](self, "accessibilityLabel");
  if ((objc_msgSend(location[0], "isAXAttributedString") & 1) != 0)
  {
    v4 = (id)objc_msgSend(location[0], "cfAttributedString");
  }
  else if (location[0])
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", location[0]);
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (id)copyAttributedText:(id)a3 withAttributes:(id)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id location[2];
  UILabelAccessibility *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v14 = 0;
  v10 = (id)-[UILabelAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("defaultAttributes"));
  v13 = (id)__UIAccessibilitySafeClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = (id)objc_msgSend(v12, "mutableCopy");

  v4 = objc_alloc(MEMORY[0x24BDD1688]);
  v11 = (id)objc_msgSend(v4, "initWithString:attributes:", location[0], v15);
  v6 = v11;
  v7 = (id)objc_msgSend(location[0], "_accessibilityAttributedLocalizedString");
  objc_msgSend(v6, "_setAccessibilityAttributedLocalizedString:");

  v8 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityLocalizedStringKey
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UILabelAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v4 = (id)-[UILabelAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v6 = (id)objc_msgSend(v7, "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringKey"));
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);
  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UILabelAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v4 = (id)-[UILabelAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v6 = (id)objc_msgSend(v7, "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringBundleID"));
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);
  return v3;
}

- (id)accessibilityLocalizationBundlePath
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UILabelAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v4 = (id)-[UILabelAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v6 = (id)objc_msgSend(v7, "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizationBundlePath"));
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);
  return v3;
}

- (id)accessibilityLocalizedStringTableName
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UILabelAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v4 = (id)-[UILabelAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  v6 = (id)objc_msgSend(v7, "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringTableName"));
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);
  return v3;
}

void __45__UILabelAccessibility__axOriginalLabelText___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BEBB360];
  v3[1] = *MEMORY[0x24BEBB330];
  v3[2] = *MEMORY[0x24BEBB3C8];
  v3[3] = *MEMORY[0x24BEBB3A8];
  v3[4] = *MEMORY[0x24BEBB368];
  v1 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5, a1, a1);
  v2 = (void *)_axOriginalLabelText__Attributes;
  _axOriginalLabelText__Attributes = (uint64_t)v1;

}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)-[UILabelAccessibility textColor](self, "textColor", a2, self);
}

- (id)_accessibilityBackgroundTextColorAttribute
{
  return (id)-[UILabelAccessibility backgroundColor](self, "backgroundColor", a2, self);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  char HasButtonLikeGesture;
  uint64_t v5;
  id v6;
  char v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  objc_super v16;
  unint64_t v17;
  SEL v18;
  UILabelAccessibility *v19;
  unint64_t v20;

  v19 = self;
  v18 = a2;
  v2 = (id)-[UILabelAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v9 = v2 == 0;

  if (v9)
  {
    v17 = 0;
    v5 = *MEMORY[0x24BDF7410];
    v16.receiver = v19;
    v16.super_class = (Class)UILabelAccessibility;
    v17 = v5 | -[UILabelAccessibility accessibilityTraits](&v16, sel_accessibilityTraits);
    v6 = (id)-[UILabelAccessibility accessibilityIdentification](v19, "accessibilityIdentification");
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("doubleHeightLabel"));

    if ((v7 & 1) != 0)
      v17 |= *MEMORY[0x24BDF7430];
    v15 = v19;
    v10 = 0;
    HasButtonLikeGesture = 0;
    if ((objc_msgSend(v15, "isUserInteractionEnabled") & 1) != 0)
    {
      v14 = 0;
      objc_opt_class();
      v13 = (id)__UIAccessibilityCastAsSafeCategory();
      v12 = v13;
      objc_storeStrong(&v13, 0);
      v11 = v12;
      v10 = 1;
      HasButtonLikeGesture = -[UIViewAccessibility _accessibilityHasButtonLikeGestureRecognizer](v12);
    }
    if ((v10 & 1) != 0)

    if ((HasButtonLikeGesture & 1) != 0)
      v17 |= *MEMORY[0x24BDF73B0];
    v20 = v17;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v8 = (id)-[UILabelAccessibility accessibilityUserDefinedTraits](v19, "accessibilityUserDefinedTraits");
    v20 = objc_msgSend(v8, "unsignedLongLongValue");

  }
  return v20;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v2;
  id v4;
  BOOL v5;
  id v6;
  char v7;
  objc_super v8;
  SEL v9;
  UILabelAccessibility *v10;
  BOOL v11;

  v10 = self;
  v9 = a2;
  v6 = (id)-[UILabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("doubleHeightLabel"));

  if ((v7 & 1) != 0)
    return 1;
  v2 = (id)-[UILabelAccessibility storedAccessibilityRespondsToUserInteraction](v10, "storedAccessibilityRespondsToUserInteraction");
  v5 = v2 == 0;

  if (v5)
  {
    if ((-[UILabelAccessibility _accessibilityIsFKARunningForFocusItem](v10, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
    {
      return 0;
    }
    else
    {
      v8.receiver = v10;
      v8.super_class = (Class)UILabelAccessibility;
      return -[UILabelAccessibility accessibilityRespondsToUserInteraction](&v8, sel_accessibilityRespondsToUserInteraction);
    }
  }
  else
  {
    v4 = (id)-[UILabelAccessibility storedAccessibilityRespondsToUserInteraction](v10, "storedAccessibilityRespondsToUserInteraction");
    v11 = objc_msgSend(v4, "BOOLValue") & 1;

  }
  return v11;
}

@end
