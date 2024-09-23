@implementation PSTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSTableCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("refreshCellContentsWithSpecifier:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityClearChildren"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSControlTableCell"), CFSTR("control"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibility"), CFSTR("_accessibilityPerformableActions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("canPerformAction:withSender:"), "B", ":", "@", 0);

}

- (BOOL)_accessibilityElementServesAsHeadingLandmark
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSTableCellAccessibility;
  -[PSTableCellAccessibility refreshCellContentsWithSpecifier:](&v5, sel_refreshCellContentsWithSpecifier_, a3);
  NSSelectorFromString(CFSTR("_accessibilityShouldClearChildren"));
  if ((objc_opt_respondsToSelector() & 1) == 0
    || -[PSTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityShouldClearChildren")))
  {
    v4 = (id)-[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
  }
}

+ (void)_setAccessibilityData:(id)a3 onCell:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  objc_msgSend(v23, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (!v6)
  {
    objc_msgSend(v23, "propertyForKey:", CFSTR("accessibilityLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v23, "propertyForKey:", CFSTR("axBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertyForKey:", CFSTR("axStringsFileName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_2503140A8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
        objc_msgSend(v5, "setAccessibilityLabel:", v10);

    }
    v7 = v23;
  }
  objc_msgSend(v7, "propertyForKey:", CFSTR("accessibilityHint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v23, "propertyForKey:", CFSTR("axBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "propertyForKey:", CFSTR("axStringsFileName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_2503140A8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v5, "setAccessibilityHint:", v14);

  }
  objc_msgSend(v23, "accessibilityIdentification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v23, "accessibilityIdentification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilitySetIdentification:", v16);

  }
  objc_msgSend(v23, "accessibilityLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v23, "accessibilityLanguage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLanguage:", v18);

  }
  objc_msgSend(v23, "propertyForKey:", CFSTR("accessibilityGet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v19, CFSTR("accessibilityStatusGetter"));
    objc_msgSend(v23, "target");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v20, CFSTR("accessibilityStatusTarget"));

  }
  objc_msgSend(v23, "propertyForKey:", CFSTR("isAccessibilityElement"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 && (objc_msgSend(v21, "BOOLValue") & 1) == 0)
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BEBB178]);

}

- (BOOL)_accessibilityLanguageOverriddesUser
{
  void *v3;
  char v4;
  objc_super v6;

  -[PSTableCellAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LanguageCell"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)PSTableCellAccessibility;
  return -[PSTableCellAccessibility _accessibilityLanguageOverriddesUser](&v6, sel__accessibilityLanguageOverriddesUser);
}

- (PSTableCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  PSTableCellAccessibility *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSTableCellAccessibility;
  v7 = a5;
  v8 = -[PSTableCellAccessibility initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v7);
  -[PSTableCellAccessibility _accessibilityLoadAccessibilityInformationWithSpecifier:](v8, "_accessibilityLoadAccessibilityInformationWithSpecifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSTableCellAccessibility;
  -[PSTableCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[PSTableCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSTableCellAccessibility;
  -[PSTableCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCellAccessibility _accessibilityLoadAccessibilityInformationWithSpecifier:](self, "_accessibilityLoadAccessibilityInformationWithSpecifier:", v3);

}

- (void)_accessibilityLoadAccessibilityInformationWithSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_setAccessibilityData:onCell:", v4, self);

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[PSTableCellAccessibility type](self, "type");
  if (!objc_msgSend(v7, "_accessibilityAutomationHitTest") || (unint64_t)(v8 - 5) > 1)
    goto LABEL_7;
  -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  if (!objc_msgSend(v9, "pointInside:withEvent:", v7))
  {

LABEL_7:
    v13.receiver = self;
    v13.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isAccessibilityElement"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v9, "_accessibilityHitTest:withEvent:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

LABEL_10:
  return v11;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if ((unint64_t)(-[PSTableCellAccessibility type](self, "type") - 5) > 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility automationElements](&v9, sel_automationElements);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "addObject:", v4);
    if (v5)
      objc_msgSend(v7, "addObject:", v5);
    if (v3)
      objc_msgSend(v7, "addObject:", v3);

  }
  return v7;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[PSTableCellAccessibility type](self, "type") == 5)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAccessibilityElement");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PSTableCellAccessibility;
    return -[PSTableCellAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PSTableCellAccessibility;
  v3 = -[PSTableCellAccessibility accessibilityTraits](&v16, sel_accessibilityTraits);
  if ((unint64_t)(-[PSTableCellAccessibility type](self, "type") - 5) <= 1)
  {
    -[PSTableCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("control"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isHidden"))
    {
      -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "accessibilityTraits") | v3;

      v12 = v14 & ~*MEMORY[0x24BEBB178];
      return v12;
    }

  }
  if ((-[PSTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_checked")) & 1) != 0
    || -[PSTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
  {
    v3 |= *MEMORY[0x24BDF7400];
  }
  v5 = -[PSTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("cellEnabled"));
  v6 = *MEMORY[0x24BDF73E8];
  if (v5)
    v6 = 0;
  v7 = v6 | v3;
  -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  v10 = *MEMORY[0x24BDF73B0] | v7;
  if (((1 << v9) & 0x2006) == 0)
    v10 = v7;
  if (v9 > 0xD)
    v10 = v7;
  if ((*MEMORY[0x24BDF73B0] & v7) != 0 && v9 == 4)
    return *MEMORY[0x24BDF73B0] ^ v7;
  else
    return v10;
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  -[PSTableCellAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("appleid")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mobileme")))
    {
      v4 = CFSTR("mail.mobileme.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mail-gmail")))
    {
      v4 = CFSTR("mail.gmail.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mail-yahoo")))
    {
      v4 = CFSTR("mail.yahoo.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mail-aol")))
    {
      v4 = CFSTR("mail.aol.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mail-hotmail")))
    {
      v4 = CFSTR("mail.outlook.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("mail-exchange")))
    {
      v4 = CFSTR("mail.exchange.text");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("KeyboardPeriodShortcut")))
    {
      v4 = CFSTR("keyboard.period.shortcut");
      goto LABEL_19;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ShakeToShuffle")))
    {
      v4 = CFSTR("shake.to.shuffle");
      goto LABEL_19;
    }
    v7 = -[PSTableCellAccessibility type](self, "type");
    if (v7 == 5)
    {
      -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v10 = v7;
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      -[PSTableCellAccessibility accessibilityIdentification](self, "accessibilityIdentification");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("LanguageCell"));

      if (!v13)
      {
        if (v10 == 6)
        {
          -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailTextLabel"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "accessibilityLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_46;
        }
        v9 = v8;
LABEL_23:
        v5 = v9;
LABEL_46:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCellAccessibility accessibilityLanguage](self, "accessibilityLanguage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        -[PSTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axLanguage"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "setAttribute:forKey:", v14, *MEMORY[0x24BDFEBE0]);
LABEL_45:

      goto LABEL_46;
    }
    -[PSTableCellAccessibility specifier](self, "specifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "propertyForKey:", *MEMORY[0x24BE75C60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("AccountPSDetailController"));

    if (v16)
    {
      objc_msgSend(v14, "propertyForKey:", *MEMORY[0x24BE75AC8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessibilityIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v18, "hasPrefix:", CFSTR("126")) & 1) != 0)
      {
        v19 = CFSTR("chinese.126.mail.account");
LABEL_39:
        accessibilityLocalizedString(v19);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_45;
      }
      if ((objc_msgSend(v18, "hasPrefix:", CFSTR("163")) & 1) != 0)
      {
        v19 = CFSTR("chinese.163.mail.account");
        goto LABEL_39;
      }
      if (objc_msgSend(v18, "hasPrefix:", CFSTR("qq")))
      {
        v19 = CFSTR("chinese.qq.mail.account");
        goto LABEL_39;
      }

    }
    objc_msgSend(v14, "accessibilityLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      objc_msgSend(v14, "accessibilityLabel");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)PSTableCellAccessibility;
      -[PSTableCellAccessibility accessibilityLabel](&v25, sel_accessibilityLabel);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v23;
    goto LABEL_45;
  }
  v4 = CFSTR("mail.appleid.text");
LABEL_19:
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if ((unint64_t)(-[PSTableCellAccessibility type](self, "type") - 5) > 1)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  else
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  objc_super v18;

  if ((unint64_t)(-[PSTableCellAccessibility type](self, "type") - 5) <= 1)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "_accessibilityViewIsVisible") & 1) != 0)
    {
      -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }

  }
  -[PSTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityStatusGetter"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PSTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityStatusTarget"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v8 && (NSSelectorFromString(v8), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(v9, "performSelector:withObject:", NSSelectorFromString(v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_13;
  }
  else
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailTextLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_13:
      -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessibilityLabel");
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
      goto LABEL_14;
    }
  }
  -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailTextLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_accessibilityViewIsVisible");

  if ((v13 & 1) == 0)
    goto LABEL_13;
LABEL_14:
  if (objc_msgSend(v10, "length"))
  {
    v16 = v10;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility accessibilityValue](&v18, sel_accessibilityValue);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  return v17;
}

- (void)accessibilityIncrement
{
  id v3;
  objc_super v4;

  if (-[PSTableCellAccessibility type](self, "type") == 5)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityTraits");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility accessibilityIncrement](&v4, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  id v3;
  objc_super v4;

  if (-[PSTableCellAccessibility type](self, "type") == 5)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityTraits");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility accessibilityDecrement](&v4, sel_accessibilityDecrement);
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  if ((unint64_t)(-[PSTableCellAccessibility type](self, "type") - 5) > 1
    || (-[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "accessibilityHint"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility accessibilityHint](&v6, sel_accessibilityHint);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[PSTableCellAccessibility type](self, "type") == 5)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityMinScrubberPosition");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility _accessibilityMinScrubberPosition](&v10, sel__accessibilityMinScrubberPosition);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[PSTableCellAccessibility type](self, "type") == 5)
  {
    -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityMaxScrubberPosition");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSTableCellAccessibility;
    -[PSTableCellAccessibility _accessibilityMaxScrubberPosition](&v10, sel__accessibilityMaxScrubberPosition);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSTableCellAccessibility;
  if (-[PSTableCellAccessibility accessibilityRespondsToUserInteraction](&v6, sel_accessibilityRespondsToUserInteraction))
  {
    return 1;
  }
  -[PSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  char v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSTableCellAccessibility;
  if (-[PSTableCellAccessibility canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, a4))
    return 1;
  if (!-[PSTableCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))return 0;
  -[PSTableCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_accessibilityPerformableActions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "containsObject:", v8);

  return v6;
}

@end
