@implementation AXUISettingsTouchAccommodationsAllowSwipeGesturesController

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

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_FOOTER_TEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D80848]);

    objc_msgSend(v5, "addObject:", v6);
    v8 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel__setAllowsSwipesToBypass_specifier_, sel__allowsSwipesToBypass_, 0, 6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setProperty:forKey:", CFSTR("AllowSwipeGestures"), *MEMORY[0x1E0D80868]);
    objc_msgSend(v5, "addObject:", v10);
    if (-[AXUISettingsTouchAccommodationsAllowSwipeGesturesController touchAccommodationsAllowsSwipeGesturesToBypass](self, "touchAccommodationsAllowsSwipeGesturesToBypass"))
    {
      -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _minimumDistanceSpecifiers](self, "_minimumDistanceSpecifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

    }
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_setAllowsSwipesToBypass:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController setTouchAccommodationsAllowsSwipeGesturesToBypass:](self, "setTouchAccommodationsAllowsSwipeGesturesToBypass:", v5);
  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController minimumDistanceSpecifiers](self, "minimumDistanceSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController minimumDistanceSpecifiers](self, "minimumDistanceSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController containsSpecifier:](self, "containsSpecifier:", v8);

  }
  else
  {
    v9 = 0;
  }

  if (v9 != (_DWORD)v5)
  {
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _minimumDistanceSpecifiers](self, "_minimumDistanceSpecifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (id)v10;
    if ((_DWORD)v5)
      -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v10, CFSTR("AllowSwipeGestures"), 1);
    else
      -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v10, 1);

  }
}

- (id)_allowsSwipesToBypass:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController touchAccommodationsAllowsSwipeGesturesToBypass](self, "touchAccommodationsAllowsSwipeGesturesToBypass", a3));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXUISettingsTouchAccommodationsAllowSwipeGesturesController;
  v6 = a4;
  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "propertyForKey:", CFSTR("MinimumDistance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController touchAccommodationsSwipeGestureMinimumDistance](self, "touchAccommodationsSwipeGestureMinimumDistance");
  objc_msgSend(v7, "setChecked:", vabdd_f64(v12, v11) < 2.22044605e-16);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXUISettingsTouchAccommodationsAllowSwipeGesturesController;
  v6 = a4;
  -[AXUISettingsSetupCapableListController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("MinimumDistance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController setTouchAccommodationsSwipeGestureMinimumDistance:](self, "setTouchAccommodationsSwipeGestureMinimumDistance:", v10);
  -[AXUISettingsBaseListController updateTableCheckedSelection:](self, "updateTableCheckedSelection:", v6);

}

- (id)_specifierWithName:(id)a3 minimumDistance:(double)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, 0, 0, 0, 0, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("MinimumDistance"));

  return v5;
}

- (id)_minimumDistanceSpecifiers
{
  void *v3;
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

  -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController minimumDistanceSpecifiers](self, "minimumDistanceSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_FOOTER_TEXT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);

    objc_msgSend(v4, "addObject:", v7);
    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_1X"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _specifierWithName:minimumDistance:](self, "_specifierWithName:minimumDistance:", v9, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_2X"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _specifierWithName:minimumDistance:](self, "_specifierWithName:minimumDistance:", v11, 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_4X"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _specifierWithName:minimumDistance:](self, "_specifierWithName:minimumDistance:", v13, 40.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_6X"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _specifierWithName:minimumDistance:](self, "_specifierWithName:minimumDistance:", v15, 60.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    AXUILocalizedStringForKey(CFSTR("ALLOW_SWIPE_GESTURES_MINIMUM_DISTANCE_8X"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController _specifierWithName:minimumDistance:](self, "_specifierWithName:minimumDistance:", v17, 80.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController setMinimumDistanceSpecifiers:](self, "setMinimumDistanceSpecifiers:", v4);
  }
  return -[AXUISettingsTouchAccommodationsAllowSwipeGesturesController minimumDistanceSpecifiers](self, "minimumDistanceSpecifiers");
}

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  return self->_touchAccommodationsAllowsSwipeGesturesToBypass;
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  self->_touchAccommodationsAllowsSwipeGesturesToBypass = a3;
}

- (double)touchAccommodationsSwipeGestureMinimumDistance
{
  return self->_touchAccommodationsSwipeGestureMinimumDistance;
}

- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3
{
  self->_touchAccommodationsSwipeGestureMinimumDistance = a3;
}

- (NSArray)minimumDistanceSpecifiers
{
  return self->_minimumDistanceSpecifiers;
}

- (void)setMinimumDistanceSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDistanceSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDistanceSpecifiers, 0);
}

@end
