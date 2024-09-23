@implementation VOTQuickAccessTableCellAccessibility

- (VOTQuickAccessTableCellAccessibility)initWithWeakCell:(id)a3
{
  id v4;
  VOTQuickAccessTableCellAccessibility *v5;
  VOTQuickAccessTableCellAccessibility *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VOTQuickAccessTableCellAccessibility;
  v5 = -[VOTQuickAccessTableCellAccessibility init](&v8, "init");
  v6 = v5;
  if (v5)
    -[VOTQuickAccessTableCellAccessibility setCell:](v5, "setCell:", v4);

  return v6;
}

- (id)_settingsItem
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility cell](self, "cell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "specifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertyForKey:", CFSTR("VOSSettingsItem")));
  return v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility cell](self, "cell"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "specifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility _settingsItem](self, "_settingsItem"));
  objc_msgSend(v4, "setNextValueForItem:inDirection:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility cell](self, "cell"));
  objc_msgSend(v6, "reloadWithSpecifier:animated:", v7, 0);

}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility cell](self, "cell"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "specifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility _settingsItem](self, "_settingsItem"));
  objc_msgSend(v4, "setNextValueForItem:inDirection:", v5, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessTableCellAccessibility cell](self, "cell"));
  objc_msgSend(v6, "reloadWithSpecifier:animated:", v7, 0);

}

- (BOOL)_accessibilityShouldClearChildren
{
  return 0;
}

- (PSTableCell)cell
{
  return (PSTableCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cell);
}

@end
