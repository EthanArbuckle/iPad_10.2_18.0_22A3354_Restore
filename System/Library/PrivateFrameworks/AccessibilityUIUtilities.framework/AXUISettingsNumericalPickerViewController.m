@implementation AXUISettingsNumericalPickerViewController

- (double)maximumValue
{
  return 0.0;
}

- (BOOL)supportsInfiniteTime
{
  return 0;
}

- (double)minimumValue
{
  return 0.0;
}

- (double)numericalPreferenceValue
{
  return 0.0;
}

- (BOOL)numericalPreferenceEnabled
{
  return 0;
}

- (BOOL)userCanDisableNumericalPreference
{
  return 0;
}

- (id)localizedFooterText
{
  return 0;
}

- (id)localizedTitle
{
  return &stru_1E76AC698;
}

- (id)localizedPickerFooterText
{
  return &stru_1E76AC698;
}

- (double)stepAmount
{
  return 0.05;
}

- (BOOL)shouldDisablePreferenceEntirely
{
  return 0;
}

- (BOOL)shouldSaveOnExit
{
  return 0;
}

- (id)localizedTextForValue:(double)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatNumberWithOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsNumericalPickerViewController;
  -[AXUISettingsSetupCapableListController viewDidLoad](&v3, sel_viewDidLoad);
  self->_cachedNumericalValue = 3.40282347e38;
  -[AXUISettingsNumericalPickerViewController _updateEnabledStateForDelay](self, "_updateEnabledStateForDelay");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
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

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    if (-[AXUISettingsNumericalPickerViewController userCanDisableNumericalPreference](self, "userCanDisableNumericalPreference"))
    {
      v6 = -[AXUISettingsNumericalPickerViewController shouldDisablePreferenceEntirely](self, "shouldDisablePreferenceEntirely");
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsNumericalPickerViewController localizedFooterText](self, "localizedFooterText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D80848];
      objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);

      objc_msgSend(v5, "addObject:", v7);
      v10 = (void *)MEMORY[0x1E0D804E8];
      -[AXUISettingsNumericalPickerViewController localizedTitle](self, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setDelayEnabled_specifier_, sel_delayEnabled_, 0, 6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setIdentifier:", CFSTR("NumericalPreferenceSwitcherIdentifier"));
      if (v6)
        objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      objc_msgSend(v5, "addObject:", v12);
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIdentifier:", CFSTR("NumericalPreferencePickerGroupIdentifier"));
      objc_msgSend(v5, "addObject:", v13);
      if (-[AXUISettingsNumericalPickerViewController numericalPreferenceEnabled](self, "numericalPreferenceEnabled")
        && !v6)
      {
        -[AXUISettingsNumericalPickerViewController localizedPickerFooterText](self, "localizedPickerFooterText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setProperty:forKey:", v14, v9);

        -[AXUISettingsNumericalPickerViewController _delayPickerSpecifier](self, "_delayPickerSpecifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D804E8];
      -[AXUISettingsNumericalPickerViewController localizedTitle](self, "localizedTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "groupSpecifierWithName:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setIdentifier:", CFSTR("NumericalPreferencePickerGroupIdentifier"));
      -[AXUISettingsNumericalPickerViewController localizedFooterText](self, "localizedFooterText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x1E0D80848]);
      objc_msgSend(v5, "addObject:", v7);
      -[AXUISettingsNumericalPickerViewController _delayPickerSpecifier](self, "_delayPickerSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);
    }

    if (-[AXUISettingsNumericalPickerViewController supportsInfiniteTime](self, "supportsInfiniteTime"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v18);
      v19 = (void *)MEMORY[0x1E0D804E8];
      accessibilityLocalizedString(CFSTR("infinite.time.for.duration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, sel_setInfiniteTimeEnabled_specifier_, sel_infiniteTime_, 0, 6, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIdentifier:", CFSTR("NumericalPreferenceInfiniteTimeDurationIdentifier"));
      objc_msgSend(v5, "addObject:", v21);

    }
    v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_updateEnabledStateForDelay
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x1E0D80808];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("NumericalPreferencePickerIdentifier"));

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AXUISettingsNumericalPickerViewController infiniteTimeEnabled](self, "infiniteTimeEnabled") ^ 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setProperty:forKey:", v12, v7);

          -[AXUISettingsNumericalPickerViewController reloadSpecifier:](self, "reloadSpecifier:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)setInfiniteTimeEnabled:(id)a3 specifier:(id)a4
{
  -[AXUISettingsNumericalPickerViewController setInfiniteTimeEnabled:](self, "setInfiniteTimeEnabled:", objc_msgSend(a3, "BOOLValue"));
  -[AXUISettingsNumericalPickerViewController _updateEnabledStateForDelay](self, "_updateEnabledStateForDelay");
}

- (id)infiniteTime:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsNumericalPickerViewController infiniteTimeEnabled](self, "infiniteTimeEnabled", a3));
}

- (BOOL)infiniteTimeEnabled
{
  return 0;
}

- (void)setDelayEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AXUISettingsNumericalPickerViewController setNumericalPreferenceEnabledFromUser:](self, "setNumericalPreferenceEnabledFromUser:", v5);
  if ((_DWORD)v5)
  {
    -[AXUISettingsNumericalPickerViewController _delayPickerSpecifier](self, "_delayPickerSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsNumericalPickerViewController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v6, CFSTR("NumericalPreferencePickerGroupIdentifier"), 1);

    if (-[AXUISettingsNumericalPickerViewController shouldSaveOnExit](self, "shouldSaveOnExit")
      && fabs(self->_cachedNumericalValue + -3.40282347e38) >= 2.22044605e-16)
    {
      -[AXUISettingsNumericalPickerViewController _delayPickerFooterSpecifier](self, "_delayPickerFooterSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsNumericalPickerViewController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v7, 0, 1);

    }
    -[AXUISettingsNumericalPickerViewController specifierForID:](self, "specifierForID:", CFSTR("NumericalPreferencePickerGroupIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsNumericalPickerViewController localizedPickerFooterText](self, "localizedPickerFooterText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x1E0D80848]);

    -[AXUISettingsNumericalPickerViewController reloadSpecifier:](self, "reloadSpecifier:", v8);
  }
  else
  {
    -[AXUISettingsNumericalPickerViewController specifierForID:](self, "specifierForID:", CFSTR("NumericalPreferencePickerIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsNumericalPickerViewController indexPathForSpecifier:](self, "indexPathForSpecifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXUISettingsNumericalPickerViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "nameTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resignFirstResponder");

    -[AXUISettingsNumericalPickerViewController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("NumericalPreferencePickerIdentifier"), 1);
    -[AXUISettingsNumericalPickerViewController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("NumericalPreferencePickerDelayFooterIdentifier"), 1);
    -[AXUISettingsNumericalPickerViewController specifierForID:](self, "specifierForID:", CFSTR("NumericalPreferencePickerGroupIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", &stru_1E76AC698, *MEMORY[0x1E0D80848]);
    -[AXUISettingsNumericalPickerViewController reloadSpecifier:](self, "reloadSpecifier:", v14);

  }
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (id)delayEnabled:(id)a3
{
  void *v4;

  if (-[AXUISettingsNumericalPickerViewController shouldDisablePreferenceEntirely](self, "shouldDisablePreferenceEntirely", a3))
  {
    v4 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsNumericalPickerViewController numericalPreferenceEnabled](self, "numericalPreferenceEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_delayPickerSpecifier
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D804E8], "ax_stepperSpecifierWithDelegate:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", CFSTR("NumericalPreferencePickerIdentifier"));
  return v2;
}

- (id)_delayPickerFooterSpecifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("NumericalPreferencePickerDelayFooterIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("numerical.value.saved.later"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v3, *MEMORY[0x1E0D80848]);

  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsNumericalPickerViewController;
  -[AXUISettingsNumericalPickerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[AXUISettingsNumericalPickerViewController shouldSaveOnExit](self, "shouldSaveOnExit"))
  {
    if (fabs(self->_cachedNumericalValue + -3.40282347e38) >= 2.22044605e-16)
      -[AXUISettingsNumericalPickerViewController setNumericalPreferenceValueFromUser:](self, "setNumericalPreferenceValueFromUser:");
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXUISettingsNumericalPickerViewController;
  -[AXUISettingsNumericalPickerViewController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  double result;

  result = self->_cachedNumericalValue;
  if (fabs(result + -3.40282347e38) < 2.22044605e-16)
    -[AXUISettingsNumericalPickerViewController numericalPreferenceValue](self, "numericalPreferenceValue", a3);
  return result;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (-[AXUISettingsNumericalPickerViewController shouldSaveOnExit](self, "shouldSaveOnExit"))
  {
    self->_cachedNumericalValue = a4;
    -[AXUISettingsNumericalPickerViewController specifierForID:](self, "specifierForID:", CFSTR("NumericalPreferencePickerDelayFooterIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[AXUISettingsNumericalPickerViewController _delayPickerFooterSpecifier](self, "_delayPickerFooterSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsNumericalPickerViewController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v8, 0, 1);

    }
  }
  else
  {
    -[AXUISettingsNumericalPickerViewController setNumericalPreferenceValueFromUser:](self, "setNumericalPreferenceValueFromUser:", a4);
  }
  v9 = v6;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __64__AXUISettingsNumericalPickerViewController_specifier_setValue___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x1E0DC44C8];
  objc_msgSend(*(id *)(a1 + 32), "stringValueForSpecifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (id)stringValueForSpecifier:(id)a3
{
  -[AXUISettingsNumericalPickerViewController valueForSpecifier:](self, "valueForSpecifier:", a3);
  return -[AXUISettingsNumericalPickerViewController localizedTextForValue:](self, "localizedTextForValue:");
}

@end
