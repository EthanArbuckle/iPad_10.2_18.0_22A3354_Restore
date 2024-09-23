@implementation VOTPickerSettingViewController

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id obj;
  VOTPickerSettingViewController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    v22 = OBJC_IVAR___PSListController__specifiers;
    v24 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier], "propertyForKey:", CFSTR("VOSSettingsItem")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameForItem:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v7));

    objc_msgSend(v5, "addObject:", v8);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "possibleValuesForSettingsItem:", v4));

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v14 = PSValueKey;
      do
      {
        v15 = 0;
        v16 = v8;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "formattedValue:withItem:", v17, v4));

          v8 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, v24, 0, 0, 0, 3, 0));
          objc_msgSend(v8, "setProperty:forKey:", v17, v14);
          objc_msgSend(v8, "setProperty:forKey:", v4, CFSTR("VOSSettingsItem"));
          objc_msgSend(v5, "addObject:", v8);

          v15 = (char *)v15 + 1;
          v16 = v8;
        }
        while (v12 != v15);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    v20 = *(void **)&v24->PSListController_opaque[v22];
    *(_QWORD *)&v24->PSListController_opaque[v22] = v5;

    v3 = *(void **)&v24->PSListController_opaque[v22];
  }
  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[VOTPickerSettingViewController _updateCellAccessory:](self, "_updateCellAccessory:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "specifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "propertyForKey:", PSValueKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "propertyForKey:", CFSTR("VOSSettingsItem")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  objc_msgSend(v11, "setValue:forSettingsItem:", v9, v10);

  -[VOTPickerSettingViewController _updateCellAccessories](self, "_updateCellAccessories");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateCellAccessories
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTPickerSettingViewController table](self, "table", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[VOTPickerSettingViewController _updateCellAccessory:](self, "_updateCellAccessory:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateCellAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "specifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyForKey:", PSValueKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyForKey:", CFSTR("VOSSettingsItem")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForSettingsItem:", v5));
  if (objc_msgSend(v4, "isEqual:", v7))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v3, "setAccessoryType:", v8);

}

@end
