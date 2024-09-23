@implementation SKUISettingsTableViewCellAcccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUISettingsTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUISettingsTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUISettingsTableViewCell"), CFSTR("_settingDescriptionView"), "SKUISettingDescriptionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIDefaultSettingDescriptionView"), CFSTR("_viewReuseView"), "SKUIViewReuseView");
  objc_msgSend(v3, "validateClass:", CFSTR("SKUICheckboxFieldSettingDescriptionView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char isKindOfClass;

  -[SKUISettingsTableViewCellAcccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_settingDescriptionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUIEditProfileSettingDescriptionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_axLockupView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SKUISettingsTableViewCellAcccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_settingDescriptionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUIDefaultSettingDescriptionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_viewReuseView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          NSClassFromString(CFSTR("SKUIHorizontalLockupView"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(CFSTR("SKUITabularLockupView"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
          v10 = v9;
          goto LABEL_15;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v10 = 0;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_15:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_axViewContainsSwitch
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SKUISettingsTableViewCellAcccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_settingDescriptionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUICheckboxFieldSettingDescriptionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "subviews");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          NSClassFromString(CFSTR("UISwitch"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            goto LABEL_13;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SKUISettingsTableViewCellAcccessibility _axLockupView](self, "_axLockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    -[SKUISettingsTableViewCellAcccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SKUISettingsTableViewCellAcccessibility _axLockupView](self, "_axLockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityCustomActions");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    -[SKUISettingsTableViewCellAcccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityTraits");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    return *MEMORY[0x24BDF73B0] | -[SKUISettingsTableViewCellAcccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    -[SKUISettingsTableViewCellAcccessibility accessibilityValue](&v7, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKUISettingsTableViewCellAcccessibility _axViewContainsSwitch](self, "_axViewContainsSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    -[SKUISettingsTableViewCellAcccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

@end
