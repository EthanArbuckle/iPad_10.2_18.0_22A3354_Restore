@implementation VOTQuickSettingsListViewController

- (VOTQuickSettingsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  VOTQuickSettingsListViewController *v4;
  VOTQuickSettingsListViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VOTQuickSettingsListViewController;
  v4 = -[VOTQuickSettingsListViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_mode = 0;
    v6 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    -[VOTQuickSettingsListViewController setSearchController:](v5, "setSearchController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](v5, "searchController"));
    objc_msgSend(v7, "setSearchResultsUpdater:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](v5, "searchController"));
    objc_msgSend(v8, "setObscuresBackgroundDuringPresentation:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](v5, "searchController"));
    objc_msgSend(v9, "setHidesNavigationBarDuringPresentation:", 0);

    v10 = sub_10000DC74(CFSTR("VoiceOverQuickSettings.filter.placeholder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](v5, "searchController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchBar"));
    objc_msgSend(v13, "setPlaceholder:", v11);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](v5, "searchController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController navigationItem](v5, "navigationItem"));
    objc_msgSend(v15, "setSearchController:", v14);

    -[VOTQuickSettingsListViewController setDefinesPresentationContext:](v5, "setDefinesPresentationContext:", 1);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController settingsItemUpdateObserverToken](self, "settingsItemUpdateObserverToken"));
  objc_msgSend(v3, "removeObserver:", v4);

  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsListViewController;
  -[VOTQuickSettingsListViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VOTQuickSettingsListViewController;
  -[VOTQuickSettingsListViewController viewDidLoad](&v17, "viewDidLoad");
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v6 = VOSDidUpdateValueForSettingsItemNotification;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006960;
  v14[3] = &unk_100024818;
  objc_copyWeak(&v15, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v6, v4, v5, v14));
  -[VOTQuickSettingsListViewController setSettingsItemUpdateObserverToken:](self, "setSettingsItemUpdateObserverToken:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](AXSettings, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000698C;
  v12[3] = &unk_100024840;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v12, "voiceOverSelectedLanguage", self);

  objc_destroyWeak(&v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](AXSettings, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000069B8;
  v10[3] = &unk_100024840;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v10, "voiceOverMediaDuckingMode", self);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(_QWORD *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController filteredSpecifiers](self, "filteredSpecifiers"));

    if (v4)
      v5 = objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController filteredSpecifiers](self, "filteredSpecifiers"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController allSpecifiers](self, "allSpecifiers"));
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(_QWORD *)&self->PSListController_opaque[v3] = v5;

  }
  return *(id *)&self->PSListController_opaque[v3];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[VOTQuickSettingsListViewController _filterContentForSearchText:](self, "_filterContentForSearchText:", v4);

}

- (NSArray)allSpecifiers
{
  NSArray *allSpecifiers;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  allSpecifiers = self->_allSpecifiers;
  if (!allSpecifiers)
  {
    v26 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userSettingsItems"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v6)
      goto LABEL_18;
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Included")));
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Item")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition"));
          if (v13 != v14)
          {

            goto LABEL_11;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController data](self, "data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "frontmostAppIdentifier"));
          v17 = VOSProcessAllowsScreenRecognition();

          if (v17)
          {
LABEL_11:
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsItem Activities](VOSSettingsItem, "Activities"));
            if (v13 != v18)
            {

              goto LABEL_14;
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](AXSettings, "sharedInstance"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "voiceOverActivities"));
            v21 = objc_msgSend(v20, "count");

            if (v21)
            {
LABEL_14:
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController data](self, "data"));
              objc_msgSend(v13, "setSettingsData:", v22);

              v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController _specifierForItem:](self, "_specifierForItem:", v13));
              -[NSArray addObject:](v26, "addObject:", v23);

            }
          }

          continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v7)
      {
LABEL_18:

        v24 = self->_allSpecifiers;
        self->_allSpecifiers = v26;

        allSpecifiers = self->_allSpecifiers;
        return allSpecifiers;
      }
    }
  }
  return allSpecifiers;
}

- (BOOL)_isSearchBarEmpty
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](self, "searchController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

- (BOOL)_isFiltering
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](self, "searchController"));
  if (objc_msgSend(v3, "isActive"))
    v4 = !-[VOTQuickSettingsListViewController _isSearchBarEmpty](self, "_isSearchBarEmpty");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_filterContentForSearchText:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id obj;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController speakFilteredItemSummaryTimer](self, "speakFilteredItemSummaryTimer"));
  objc_msgSend(v4, "invalidate");

  if (-[VOTQuickSettingsListViewController _isFiltering](self, "_isFiltering"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController allSpecifiers](self, "allSpecifiers"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "propertyForKey:", CFSTR("VOSSettingsItem")));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nameForItem:", v9));
          v12 = objc_msgSend(v11, "containsString:", v16);

          if (v12)
            objc_msgSend(v14, "addObject:", v8);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v5);
    }

    -[VOTQuickSettingsListViewController setFilteredSpecifiers:](self, "setFilteredSpecifiers:", v14);
  }
  else
  {
    -[VOTQuickSettingsListViewController setFilteredSpecifiers:](self, "setFilteredSpecifiers:", 0);
  }
  -[VOTQuickSettingsListViewController reloadSpecifiers](self, "reloadSpecifiers");
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100007090;
  v17[3] = &unk_100024868;
  objc_copyWeak(&v18, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v17, 1.5));
  -[VOTQuickSettingsListViewController setSpeakFilteredItemSummaryTimer:](self, "setSpeakFilteredItemSummaryTimer:", v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (id)_specifierForItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "itemType");
  if (v5 == (id)2)
  {
    v7 = objc_opt_class(VOTQuickAccessTableCell, v6);
    v11 = VOTPickerSettingViewController;
LABEL_7:
    v8 = objc_opt_class(v11, v10);
LABEL_11:
    v9 = 2;
    goto LABEL_12;
  }
  if (v5 == (id)1)
  {
    v7 = objc_opt_class(VOTQuickAccessTableCell, v6);
    v11 = VOTSliderSettingViewController;
    goto LABEL_7;
  }
  if (v5)
  {
    v12 = VOTLogCommon();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "unknown VOSSettingItem type", buf, 2u);
    }

    v7 = 0;
    v8 = 0;
    goto LABEL_11;
  }
  v7 = objc_opt_class(VOTQuickAccessSwitchTableCell, v6);
  v8 = 0;
  v9 = 6;
LABEL_12:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nameForItem:", v4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, "setSpecifierValue:specifier:", "specifierValue:", v8, v9, 0));

  objc_msgSend(v16, "setProperty:forKey:", v4, CFSTR("VOSSettingsItem"));
  objc_msgSend(v16, "setProperty:forKey:", v7, PSCellClassKey);
  return v16;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formattedValue:withItem:", v5, v3));

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

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (AXQuickSettingsData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setAllSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allSpecifiers, a3);
}

- (NSArray)filteredSpecifiers
{
  return self->_filteredSpecifiers;
}

- (void)setFilteredSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSpecifiers, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (id)settingsItemUpdateObserverToken
{
  return self->_settingsItemUpdateObserverToken;
}

- (void)setSettingsItemUpdateObserverToken:(id)a3
{
  objc_storeStrong(&self->_settingsItemUpdateObserverToken, a3);
}

- (NSTimer)speakFilteredItemSummaryTimer
{
  return self->_speakFilteredItemSummaryTimer;
}

- (void)setSpeakFilteredItemSummaryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_speakFilteredItemSummaryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakFilteredItemSummaryTimer, 0);
  objc_storeStrong(&self->_settingsItemUpdateObserverToken, 0);
  objc_storeStrong((id *)&self->_filteredSpecifiers, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
