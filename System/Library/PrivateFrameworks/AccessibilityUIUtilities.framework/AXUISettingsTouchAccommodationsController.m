@implementation AXUISettingsTouchAccommodationsController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsTouchAccommodationsController;
  -[AXUISettingsTouchAccommodationsController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AXUISettingsTouchAccommodationsController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
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

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", CFSTR("TouchAccommodationsMasterSwitch"));
    -[AXUISettingsTouchAccommodationsController _updateMasterSwitchFooterTextForSpecifier:shouldReload:](self, "_updateMasterSwitchFooterTextForSpecifier:shouldReload:", v6, 0);
    if (-[AXUISettingsTouchAccommodationsController touchAccommodationsAreConfigured](self, "touchAccommodationsAreConfigured"))
    {
      AXLocStringKeyForHomeButton();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AXLocStringKeyForModel();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXUILocalizedStringForKey(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AXUILocalizedStringForKey(CFSTR("TOUCH_ACCOMMODATIONS_FOOTER_TEXT_UNCONFIGURED"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x1E0D80848]);

    objc_msgSend(v5, "addObject:", v6);
    v10 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("TOUCH_ACCOMMODATIONS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setTouchAccommodationsEnabled_specifier_, sel_touchAccommodationsEnabled_, 0, 6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setProperty:forKey:", CFSTR("TOUCH_ACCOMMODATIONS_SWITCHER"), *MEMORY[0x1E0D80868]);
    objc_msgSend(v5, "addObject:", v12);
    -[AXUISettingsTouchAccommodationsController _holdDurationSpecifiers](self, "_holdDurationSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

    if (-[AXUISettingsTouchAccommodationsController _shouldShowSwipeGesturesSpecifiersWithHoldDuration](self, "_shouldShowSwipeGesturesSpecifiersWithHoldDuration"))
    {
      -[AXUISettingsTouchAccommodationsController _swipeGesturesSpecifiers](self, "_swipeGesturesSpecifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v14);

    }
    -[AXUISettingsTouchAccommodationsController _ignoreRepeatSpecifiers](self, "_ignoreRepeatSpecifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

    -[AXUISettingsTouchAccommodationsController _tapActivationMethodSpecifiers](self, "_tapActivationMethodSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v16);

    if (-[AXUISettingsTouchAccommodationsController _shouldShowSwipeGesturesSpecifiersWithTapAssistance](self, "_shouldShowSwipeGesturesSpecifiersWithTapAssistance"))
    {
      -[AXUISettingsTouchAccommodationsController _swipeGesturesSpecifiers](self, "_swipeGesturesSpecifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v17);

    }
    v18 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)touchAccommodationsEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsTouchAccommodationsController touchAccommodationsEnabled](self, "touchAccommodationsEnabled", a3));
}

- (void)setTouchAccommodationsEnabled:(id)a3 specifier:(id)a4
{
  -[AXUISettingsTouchAccommodationsController setTouchAccommodationsEnabled:](self, "setTouchAccommodationsEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (id)holdDuration:(id)a3
{
  double v4;

  if (-[AXUISettingsTouchAccommodationsController touchAccommodationsHoldDurationEnabled](self, "touchAccommodationsHoldDurationEnabled", a3))
  {
    -[AXUISettingsTouchAccommodationsController touchAccommodationsHoldDuration](self, "touchAccommodationsHoldDuration");
    AXLocalizedTimeSummary(0, v4);
  }
  else
  {
    AXUILocalizedStringForKey(CFSTR("OFF"));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ignoreRepeat:(id)a3
{
  double v4;

  if (-[AXUISettingsTouchAccommodationsController touchAccommodationsIgnoreRepeatEnabled](self, "touchAccommodationsIgnoreRepeatEnabled", a3))
  {
    -[AXUISettingsTouchAccommodationsController touchAccommodationsIgnoreRepeatDuration](self, "touchAccommodationsIgnoreRepeatDuration");
    AXLocalizedTimeSummary(0, v4);
  }
  else
  {
    AXUILocalizedStringForKey(CFSTR("OFF"));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activationMethod:(id)a3
{
  unint64_t v3;
  void *v4;

  v3 = -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod", a3);
  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    AXUILocalizedStringForKey(off_1E76ABD90[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("ActivationMethod"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "setChecked:", -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod") == (int)objc_msgSend(v8, "intValue"));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AXUISettingsTouchAccommodationsController;
  -[AXUISettingsSetupCapableListController tableView:didSelectRowAtIndexPath:](&v28, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("ActivationMethod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v21 = v8;
    v22 = v7;
    v20 = v9;
    v10 = objc_msgSend(v9, "intValue");
    -[AXUISettingsTouchAccommodationsController setTouchAccommodationsTapActivationMethod:](self, "setTouchAccommodationsTapActivationMethod:", v10);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v6;
    objc_msgSend(v6, "visibleCells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "specifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "propertyForKey:", CFSTR("ActivationMethod"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            objc_msgSend(v16, "setChecked:", objc_msgSend(v18, "intValue") == v10);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    -[AXUISettingsTouchAccommodationsController _updateMasterSwitchFooterText](self, "_updateMasterSwitchFooterText");
    -[AXUISettingsTouchAccommodationsController _showOrHideTapTimeoutAnimated:](self, "_showOrHideTapTimeoutAnimated:", 1);
    -[AXUISettingsTouchAccommodationsController _updateSwipeGesturesSpecifiers](self, "_updateSwipeGesturesSpecifiers");
    v7 = v22;
    v6 = v23;
    v9 = v20;
    v8 = v21;
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)minimumValueForSpecifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  double *v7;
  double v8;

  v4 = a3;
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = (double *)MEMORY[0x1E0CF3C70];
  }
  else
  {
    -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (double *)MEMORY[0x1E0CF3C90];
    if (v6 == v4)
      v7 = (double *)MEMORY[0x1E0CF3C60];
  }
  v8 = *v7;

  return v8;
}

- (double)maximumValueForSpecifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  double *v7;
  double v8;

  v4 = a3;
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = (double *)MEMORY[0x1E0CF3C68];
  }
  else
  {
    -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (double *)MEMORY[0x1E0CF3C88];
    if (v6 == v4)
      v7 = (double *)MEMORY[0x1E0CF3C58];
  }
  v8 = *v7;

  return v8;
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.05;
}

- (double)valueForSpecifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;

  v4 = a3;
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[AXUISettingsTouchAccommodationsController touchAccommodationsIgnoreRepeatDuration](self, "touchAccommodationsIgnoreRepeatDuration");
  }
  else
  {
    -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
      -[AXUISettingsTouchAccommodationsController touchAccommodationsHoldDuration](self, "touchAccommodationsHoldDuration");
    else
      -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationTimeout](self, "touchAccommodationsTapActivationTimeout");
  }
  v8 = v7;

  return v8;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    -[AXUISettingsTouchAccommodationsController setTouchAccommodationsIgnoreRepeatDuration:](self, "setTouchAccommodationsIgnoreRepeatDuration:", a4);
  }
  else
  {
    -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[AXUISettingsTouchAccommodationsController setTouchAccommodationsHoldDuration:](self, "setTouchAccommodationsHoldDuration:", a4);
    else
      -[AXUISettingsTouchAccommodationsController setTouchAccommodationsTapActivationTimeout:](self, "setTouchAccommodationsTapActivationTimeout:", a4);
  }

}

- (id)stringValueForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[AXUISettingsTouchAccommodationsController valueForSpecifier:](self, "valueForSpecifier:", a3);
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatNumberWithOptions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateMasterSwitchFooterText
{
  id v3;

  -[AXUISettingsTouchAccommodationsController specifierForID:](self, "specifierForID:", CFSTR("TouchAccommodationsMasterSwitch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController _updateMasterSwitchFooterTextForSpecifier:shouldReload:](self, "_updateMasterSwitchFooterTextForSpecifier:shouldReload:", v3, 1);

}

- (void)_updateMasterSwitchFooterTextForSpecifier:(id)a3 shouldReload:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (-[AXUISettingsTouchAccommodationsController touchAccommodationsAreConfigured](self, "touchAccommodationsAreConfigured"))
  {
    AXLocStringKeyForHomeButton();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLocStringKeyForModel();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXUILocalizedStringForKey(CFSTR("TOUCH_ACCOMMODATIONS_FOOTER_TEXT_UNCONFIGURED"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = *MEMORY[0x1E0D80848];
  objc_msgSend(v12, "propertyForKey:", *MEMORY[0x1E0D80848]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v12, "setProperty:forKey:", v8, v9);
    if (v4)
      -[AXUISettingsTouchAccommodationsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v12, 1);
  }

}

- (id)_tapActivationMethodSpecifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v23;
  uint64_t v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("ACTIVATION_METHOD"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXUILocalizedStringForKey(CFSTR("ACTIVATION_METHOD_FOOTER_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0D80848];
  objc_msgSend(v5, "setProperty:forKey:", v6);

  objc_msgSend(v2, "addObject:", v5);
  v7 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("OFF"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, 0, 0, 0, 0, 3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D80868];
  objc_msgSend(v9, "setProperty:forKey:", CFSTR("OFF"), *MEMORY[0x1E0D80868]);
  objc_msgSend(v9, "setProperty:forKey:", &unk_1E76C21C8, CFSTR("ActivationMethod"));
  objc_msgSend(v2, "addObject:", v9);
  v11 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("ACTIVATE_ON_TOUCH"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, 0, 0, 0, 0, 3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setProperty:forKey:", CFSTR("ACTIVATE_ON_TOUCH"), v10);
  objc_msgSend(v13, "setProperty:forKey:", &unk_1E76C21E0, CFSTR("ActivationMethod"));
  objc_msgSend(v2, "addObject:", v13);
  v14 = (void *)MEMORY[0x1E0D804E8];
  AXUILocalizedStringForKey(CFSTR("ACTIVATE_ON_RELEASE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, 0, 0, 0, 0, 3, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setProperty:forKey:", CFSTR("ACTIVATE_ON_RELEASE"), v10);
  objc_msgSend(v16, "setProperty:forKey:", &unk_1E76C21F8, CFSTR("ActivationMethod"));
  objc_msgSend(v2, "addObject:", v16);
  -[AXUISettingsTouchAccommodationsController tapTimeoutSpecifiers](self, "tapTimeoutSpecifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("TimerSpecifierGroup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(CFSTR("ACTIVATE_TAP_TIMEOUT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setName:", v19);

    AXUILocalizedStringForKey(CFSTR("ACTIVATE_TAP_TIMEOUT_FOOTER"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", v20, v25);

    objc_msgSend(v18, "setProperty:forKey:", CFSTR("TimerSpecifierGroup"), v10);
    objc_msgSend(MEMORY[0x1E0D804E8], "ax_stepperSpecifierWithDelegate:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setProperty:forKey:", CFSTR("TimerSpecifier"), v10);
    v27[0] = v18;
    v27[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController setTapTimeoutSpecifiers:](self, "setTapTimeoutSpecifiers:", v22);

  }
  if ((unint64_t)(-[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod")- 1) <= 1)
  {
    -[AXUISettingsTouchAccommodationsController tapTimeoutSpecifiers](self, "tapTimeoutSpecifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v23);

  }
  return v2;
}

- (void)_showOrHideTapTimeoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod");
  -[AXUISettingsTouchAccommodationsController specifierForID:](self, "specifierForID:", CFSTR("TimerSpecifierGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v5 - 1) > 1)
  {
    if (!v6)
      return;
    -[AXUISettingsTouchAccommodationsController specifierForID:](self, "specifierForID:", CFSTR("TimerSpecifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController indexPathForSpecifier:](self, "indexPathForSpecifier:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[AXUISettingsTouchAccommodationsController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "nameTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resignFirstResponder");

    -[AXUISettingsTouchAccommodationsController tapTimeoutSpecifiers](self, "tapTimeoutSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v11, v3);

  }
  else
  {
    if (v6)
      return;
    -[AXUISettingsTouchAccommodationsController tapTimeoutSpecifiers](self, "tapTimeoutSpecifiers");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:");
  }

}

- (void)_setIgnoreRepeatEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AXUISettingsTouchAccommodationsController setTouchAccommodationsIgnoreRepeatEnabled:](self, "setTouchAccommodationsIgnoreRepeatEnabled:", v5);
  -[AXUISettingsTouchAccommodationsController _updateMasterSwitchFooterText](self, "_updateMasterSwitchFooterText");
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController _updateDelayPickerSpecifier:additionalSpecifiers:afterSpecifierWithIdentifier:enabled:](self, "_updateDelayPickerSpecifier:additionalSpecifiers:afterSpecifierWithIdentifier:enabled:", v6, 0, CFSTR("IgnoreRepeat"), v5);

}

- (id)_ignoreRepeatEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsTouchAccommodationsController touchAccommodationsIgnoreRepeatEnabled](self, "touchAccommodationsIgnoreRepeatEnabled", a3));
}

- (id)_ignoreRepeatSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "ax_stepperSpecifierWithDelegate:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController setIgnoreRepeatPickerSpecifier:](self, "setIgnoreRepeatPickerSpecifier:", v4);

  }
  AXUILocalizedStringForKey(CFSTR("IGNORE_REPEAT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey(CFSTR("IGNORE_REPEAT_FOOTER_TEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController ignoreRepeatPickerSpecifier](self, "ignoreRepeatPickerSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController _durationSpecifiersWithName:groupIdentifier:footerText:set:get:previousSpecifierIdentifier:conditionalSpecifiers:](self, "_durationSpecifiersWithName:groupIdentifier:footerText:set:get:previousSpecifierIdentifier:conditionalSpecifiers:", v5, CFSTR("IgnoreRepeatGroup"), v6, sel__setIgnoreRepeatEnabled_specifier_, sel__ignoreRepeatEnabled_, CFSTR("IgnoreRepeat"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setHoldDurationEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AXUISettingsTouchAccommodationsController setTouchAccommodationsHoldDurationEnabled:](self, "setTouchAccommodationsHoldDurationEnabled:", v5);
  -[AXUISettingsTouchAccommodationsController _updateMasterSwitchFooterText](self, "_updateMasterSwitchFooterText");
  -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController _updateDelayPickerSpecifier:additionalSpecifiers:afterSpecifierWithIdentifier:enabled:](self, "_updateDelayPickerSpecifier:additionalSpecifiers:afterSpecifierWithIdentifier:enabled:", v6, 0, CFSTR("HoldDuration"), v5);

  -[AXUISettingsTouchAccommodationsController _updateSwipeGesturesSpecifiers](self, "_updateSwipeGesturesSpecifiers");
}

- (id)_holdDurationEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsTouchAccommodationsController touchAccommodationsHoldDurationEnabled](self, "touchAccommodationsHoldDurationEnabled", a3));
}

- (id)_holdDurationSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "ax_stepperSpecifierWithDelegate:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController setHoldDurationPickerSpecifier:](self, "setHoldDurationPickerSpecifier:", v4);

  }
  -[AXUISettingsTouchAccommodationsController holdDurationPickerSpecifier](self, "holdDurationPickerSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXUILocalizedStringForKey(CFSTR("HOLD_DURATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey(CFSTR("HOLD_DURATION_FOOTER_TEXT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsController _durationSpecifiersWithName:groupIdentifier:footerText:set:get:previousSpecifierIdentifier:conditionalSpecifiers:](self, "_durationSpecifiersWithName:groupIdentifier:footerText:set:get:previousSpecifierIdentifier:conditionalSpecifiers:", v7, CFSTR("HoldDurationGroup"), v8, sel__setHoldDurationEnabled_specifier_, sel__holdDurationEnabled_, CFSTR("HoldDuration"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldShowSwipeGesturesSpecifiersWithTapAssistance
{
  int64_t v3;

  v3 = -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod");
  if (v3)
    LOBYTE(v3) = !-[AXUISettingsTouchAccommodationsController touchAccommodationsHoldDurationEnabled](self, "touchAccommodationsHoldDurationEnabled");
  return v3;
}

- (void)_updateSwipeGesturesSpecifiers
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = -[AXUISettingsTouchAccommodationsController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("IgnoreRepeatGroup"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    _AXAssert();
  }
  -[AXUISettingsTouchAccommodationsController swipeGesturesSpecifiers](self, "swipeGesturesSpecifiers", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[AXUISettingsTouchAccommodationsController swipeGesturesSpecifiers](self, "swipeGesturesSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "indexOfObject:", v7);
    v9 = 0;
    v10 = 0;
    if (v3 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v8 < v3;
      v9 = v8 > v3;
    }

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = -[AXUISettingsTouchAccommodationsController _shouldShowSwipeGesturesSpecifiersWithHoldDuration](self, "_shouldShowSwipeGesturesSpecifiersWithHoldDuration");
  v12 = -[AXUISettingsTouchAccommodationsController _shouldShowSwipeGesturesSpecifiersWithTapAssistance](self, "_shouldShowSwipeGesturesSpecifiersWithTapAssistance");
  v13 = v12;
  if (v10 && !v11 || v9 && !v12)
  {
    -[AXUISettingsTouchAccommodationsController _swipeGesturesSpecifiers](self, "_swipeGesturesSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v14, 1);

  }
  if (!v10 && v11)
  {
    -[AXUISettingsTouchAccommodationsController _swipeGesturesSpecifiers](self, "_swipeGesturesSpecifiers");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v16, v3, 1);
LABEL_17:

    return;
  }
  if (!v9 && v13)
  {
    -[AXUISettingsTouchAccommodationsController _swipeGesturesSpecifiers](self, "_swipeGesturesSpecifiers");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v16, 1);
    goto LABEL_17;
  }
}

- (Class)touchAccomodationsSwipeGestureViewControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_swipeGesturesSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[AXUISettingsTouchAccommodationsController swipeGesturesSpecifiers](self, "swipeGesturesSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__swipeGesturesEnabled_, -[AXUISettingsTouchAccommodationsController touchAccomodationsSwipeGestureViewControllerClass](self, "touchAccomodationsSwipeGestureViewControllerClass"), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v4;
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController setSwipeGesturesSpecifiers:](self, "setSwipeGesturesSpecifiers:", v8);

  }
  -[AXUISettingsTouchAccommodationsController swipeGesturesSpecifiers](self, "swipeGesturesSpecifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_swipeGesturesEnabled:(id)a3
{
  __CFString *v3;

  if (-[AXUISettingsTouchAccommodationsController touchAccommodationsAllowsSwipeGesturesToBypass](self, "touchAccommodationsAllowsSwipeGesturesToBypass", a3))
  {
    v3 = CFSTR("ON");
  }
  else
  {
    v3 = CFSTR("OFF");
  }
  AXUILocalizedStringForKey(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateDelayPickerSpecifier:(id)a3 additionalSpecifiers:(id)a4 afterSpecifierWithIdentifier:(id)a5 enabled:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a6;
  v19 = a3;
  v10 = a4;
  v11 = a5;
  -[AXUISettingsTouchAccommodationsController specifiers](self, "specifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v19);

  if (v6)
  {
    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v10);
      -[AXUISettingsTouchAccommodationsController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v14, v11, 1);
LABEL_6:

    }
  }
  else if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v10);
    -[AXUISettingsTouchAccommodationsController indexPathForSpecifier:](self, "indexPathForSpecifier:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsController table](self, "table");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellForRowAtIndexPath:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "nameTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resignFirstResponder");

    -[AXUISettingsTouchAccommodationsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v14, 1);
    goto LABEL_6;
  }

}

- (id)_durationSpecifiersWithName:(id)a3 groupIdentifier:(id)a4 footerText:(id)a5 set:(SEL)a6 get:(SEL)a7 previousSpecifierIdentifier:(id)a8 conditionalSpecifiers:(id)a9
{
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = a9;
  v15 = (void *)MEMORY[0x1E0C99DE8];
  v16 = a8;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v15, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setProperty:forKey:", v18, *MEMORY[0x1E0D80868]);

  objc_msgSend(v21, "setProperty:forKey:", v17, *MEMORY[0x1E0D80848]);
  objc_msgSend(v20, "addObject:", v21);
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, a6, a7, 0, 6, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setIdentifier:", v16);
  objc_msgSend(v20, "addObject:", v22);
  if (objc_msgSend((id)-[AXUISettingsTouchAccommodationsController performSelector:withObject:](self, "performSelector:withObject:", a7, 0), "BOOLValue"))objc_msgSend(v20, "addObjectsFromArray:", v14);

  return v20;
}

- (BOOL)touchAccommodationsEnabled
{
  return self->_touchAccommodationsEnabled;
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  self->_touchAccommodationsEnabled = a3;
}

- (BOOL)touchAccommodationsAreConfigured
{
  return self->_touchAccommodationsAreConfigured;
}

- (BOOL)touchAccommodationsHoldDurationEnabled
{
  return self->_touchAccommodationsHoldDurationEnabled;
}

- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3
{
  self->_touchAccommodationsHoldDurationEnabled = a3;
}

- (BOOL)touchAccommodationsIgnoreRepeatEnabled
{
  return self->_touchAccommodationsIgnoreRepeatEnabled;
}

- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3
{
  self->_touchAccommodationsIgnoreRepeatEnabled = a3;
}

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  return self->_touchAccommodationsAllowsSwipeGesturesToBypass;
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  self->_touchAccommodationsAllowsSwipeGesturesToBypass = a3;
}

- (double)touchAccommodationsHoldDuration
{
  return self->_touchAccommodationsHoldDuration;
}

- (void)setTouchAccommodationsHoldDuration:(double)a3
{
  self->_touchAccommodationsHoldDuration = a3;
}

- (double)touchAccommodationsIgnoreRepeatDuration
{
  return self->_touchAccommodationsIgnoreRepeatDuration;
}

- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3
{
  self->_touchAccommodationsIgnoreRepeatDuration = a3;
}

- (double)touchAccommodationsTapActivationTimeout
{
  return self->_touchAccommodationsTapActivationTimeout;
}

- (void)setTouchAccommodationsTapActivationTimeout:(double)a3
{
  self->_touchAccommodationsTapActivationTimeout = a3;
}

- (int64_t)touchAccommodationsTapActivationMethod
{
  return self->_touchAccommodationsTapActivationMethod;
}

- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3
{
  self->_touchAccommodationsTapActivationMethod = a3;
}

- (NSArray)tapTimeoutSpecifiers
{
  return self->_tapTimeoutSpecifiers;
}

- (void)setTapTimeoutSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_tapTimeoutSpecifiers, a3);
}

- (PSSpecifier)holdDurationPickerSpecifier
{
  return self->_holdDurationPickerSpecifier;
}

- (void)setHoldDurationPickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_holdDurationPickerSpecifier, a3);
}

- (PSSpecifier)ignoreRepeatPickerSpecifier
{
  return self->_ignoreRepeatPickerSpecifier;
}

- (void)setIgnoreRepeatPickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreRepeatPickerSpecifier, a3);
}

- (NSArray)swipeGesturesSpecifiers
{
  return self->_swipeGesturesSpecifiers;
}

- (void)setSwipeGesturesSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_swipeGesturesSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGesturesSpecifiers, 0);
  objc_storeStrong((id *)&self->_ignoreRepeatPickerSpecifier, 0);
  objc_storeStrong((id *)&self->_holdDurationPickerSpecifier, 0);
  objc_storeStrong((id *)&self->_tapTimeoutSpecifiers, 0);
}

@end
