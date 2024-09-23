@implementation VOTSliderSettingViewController

- (int64_t)tableViewStyle
{
  return 2;
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
  VOTSliderSettingViewController *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier], "propertyForKey:", CFSTR("VOSSettingsItem")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameForItem:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v8));

    objc_msgSend(v6, "addObject:", v9);
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v10, "setSpecifierValue:specifier:", "specifierValue:", 0, 5, 0));

    objc_msgSend(v11, "setProperty:forKey:", v5, CFSTR("VOSSettingsItem"));
    objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(VOTCustomSliderCell, v12), PSCellClassKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsItem Volume](VOSSettingsItem, "Volume"));
    if (v5 == v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](AXSettings, "sharedInstance"));
      v15 = objc_msgSend(v14, "voiceOverMediaDuckingMode");

      if (v15)
      {
        objc_msgSend(v11, "setProperty:forKey:", &off_100025F20, PSControlMinimumKey);
        objc_msgSend(v11, "setProperty:forKey:", &off_100026058, PSControlMaximumKey);
      }
    }
    else
    {

    }
    objc_msgSend(v6, "addObject:", v11);
    v16 = *(void **)&self->PSListController_opaque[v3];
    *(_QWORD *)&self->PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VOTSliderSettingViewController;
  v8 = -[VOTSliderSettingViewController tableView:cellForRowAtIndexPath:](&v17, "tableView:cellForRowAtIndexPath:", v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  v11 = objc_opt_class(PSSliderTableCell, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "control"));
    objc_initWeak(&location, v12);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E0F8;
    v14[3] = &unk_100024C08;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "setAccessibilityValueBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (id)specifierValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyForKey:", CFSTR("VOSSettingsItem")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForSettingsItem:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scaledValue:withItem:", v5, v3));

  return v7;
}

- (void)setSpecifierValue:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "propertyForKey:", CFSTR("VOSSettingsItem")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  objc_msgSend(v6, "setValue:forSettingsItem:", v5, v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
