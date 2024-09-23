@implementation CKKeepMessagesSelectionList

- (CKKeepMessagesSelectionList)init
{
  CKKeepMessagesSelectionList *v2;
  CKKeepMessagesSelectionList *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKKeepMessagesSelectionList;
  v2 = -[CKKeepMessagesSelectionList init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKKeepMessagesSelectionList _internalInit](v2, "_internalInit");
  return v3;
}

- (void)_internalInit
{
  CKKeepMessagesPreferenceManager *v3;
  CKKeepMessagesPreferenceManager *keepMessagesPreferenceManager;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *durationPreferenceTitles;
  NSArray *durationPreferenceValues;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(CKKeepMessagesPreferenceManager);
  keepMessagesPreferenceManager = self->_keepMessagesPreferenceManager;
  self->_keepMessagesPreferenceManager = v3;

  MessagesSettingsLocalizedString(CFSTR("KEEP_MESSAGES_1MONTH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  MessagesSettingsLocalizedString(CFSTR("KEEP_MESSAGES_1YEAR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  MessagesSettingsLocalizedString(CFSTR("KEEP_MESSAGES_FOREVER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 3);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  durationPreferenceTitles = self->_durationPreferenceTitles;
  self->_durationPreferenceTitles = v8;

  durationPreferenceValues = self->_durationPreferenceValues;
  self->_durationPreferenceValues = (NSArray *)&unk_24D094130;

  -[CKKeepMessagesSelectionList _configureInitialSelectedIndexes](self, "_configureInitialSelectedIndexes", v12, v13);
  -[CKKeepMessagesSelectionList keepMessagesPreferenceManager](self, "keepMessagesPreferenceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSyncedSettingObserver:selector:key:", self, sel__syncedSettingsDidChange_, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKKeepMessagesSelectionList keepMessagesPreferenceManager](self, "keepMessagesPreferenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSyncedSettingObserver:key:", self, 0);

  v4.receiver = self;
  v4.super_class = (Class)CKKeepMessagesSelectionList;
  -[CKKeepMessagesSelectionList dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v21 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("KEEP_ALL_MESSAGES_HEADER"));
    v5 = objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("KEEP_ALL_MESSAGES_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x24BE75000uLL;
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ALL_MESSAGES_GROUP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v5;
    objc_msgSend(v8, "setName:", v5);
    objc_msgSend(v8, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);
    v19 = v8;
    objc_msgSend(v4, "addObject:", v8);
    if (-[NSArray count](self->_durationPreferenceTitles, "count"))
    {
      v9 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_durationPreferenceTitles, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 4, 0);
        v11 = v7;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD17C8];
        -[NSArray objectAtIndexedSubscript:](self->_durationPreferenceValues, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v14, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setIdentifier:", v15);
        objc_msgSend(v4, "addObject:", v12);

        v7 = v11;
        ++v9;
      }
      while (-[NSArray count](self->_durationPreferenceTitles, "count") > v9);
    }
    v16 = (objc_class *)objc_msgSend(v4, "copy");
    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v21) = v16;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
  }
  return v3;
}

- (void)_configureInitialSelectedIndexes
{
  void *v3;
  int64_t v4;
  id v5;

  +[CKKeepMessagesPreferenceManager keepMessagesPreference](CKKeepMessagesPreferenceManager, "keepMessagesPreference");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKKeepMessagesSelectionList durationPreferenceValues](self, "durationPreferenceValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", v5);

  self->_selectedKeepMessagesPreferenceIndex = v4;
}

- (void)_selectionListDidSelectIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");
  if (!v5)
  {
    v8 = v6;
    v9 = -[CKKeepMessagesSelectionList selectedKeepMessagesPreferenceIndex](self, "selectedKeepMessagesPreferenceIndex");
    if (v8 >= v9)
    {
      -[CKKeepMessagesSelectionList _updatePreferenceAtIndexPath:](self, "_updatePreferenceAtIndexPath:", v4);
      if (!IMOSLoggingEnabled())
        goto LABEL_15;
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 134218496;
        v12 = v9;
        v13 = 2048;
        v14 = v8;
        v15 = 2048;
        v16 = 0;
        _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_INFO, "[Conference] Immediately updating preference for duration change (%ld -> %ld) in section={%ld}", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      -[CKKeepMessagesSelectionList _warnAboutDeletingMessagesForSelectedListItem:](self, "_warnAboutDeletingMessagesForSelectedListItem:", v4);
      if (!IMOSLoggingEnabled())
        goto LABEL_15;
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 134218496;
        v12 = v9;
        v13 = 2048;
        v14 = v8;
        v15 = 2048;
        v16 = 0;
        _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_INFO, "[Conference] Showing alert about dataloss from duration change (row %ld -> %ld) in section={%ld}", (uint8_t *)&v11, 0x20u);
      }
    }

    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v4, "row");
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_INFO, "[Conference] Selected an indexPath from an unsupported section={%ld}", (uint8_t *)&v11, 0xCu);
    }

  }
LABEL_15:

}

- (void)_updatePreferenceAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[CKKeepMessagesSelectionList durationPreferenceValues](self, "durationPreferenceValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "section");
  if (!v7)
  {
    -[CKKeepMessagesSelectionList updateKeepMessagesPreference:](self, "updateKeepMessagesPreference:", v9);
    -[CKKeepMessagesSelectionList durationPreferenceValues](self, "durationPreferenceValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedKeepMessagesPreferenceIndex = objc_msgSend(v8, "indexOfObject:", v9);

    -[CKKeepMessagesSelectionList reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[CKKeepMessagesSelectionList _selectionListDidSelectIndexPath:](self, "_selectionListDidSelectIndexPath:", a4);
  -[CKKeepMessagesSelectionList reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CKKeepMessagesSelectionList;
  -[CKKeepMessagesSelectionList tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
    objc_msgSend(v7, "setChecked:", objc_msgSend(v6, "row") == -[CKKeepMessagesSelectionList selectedKeepMessagesPreferenceIndex](self, "selectedKeepMessagesPreferenceIndex"));

  return v7;
}

- (void)_warnAboutDeletingMessagesForSelectedListItem:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "row"))
    v5 = CFSTR("DELETE_MESSAGES_WARNING_YEAR");
  else
    v5 = CFSTR("DELETE_MESSAGES_WARNING_MONTH");
  MadridLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x24BEBD3A8];
  MadridLocalizedString(CFSTR("FACETIME_ALERT_CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  MadridLocalizedString(CFSTR("FACETIME_ALERT_DELETE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __77__CKKeepMessagesSelectionList__warnAboutDeletingMessagesForSelectedListItem___block_invoke;
  v27[3] = &unk_24D0761A8;
  objc_copyWeak(&v29, &location);
  v12 = v4;
  v28 = v12;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v9);
  objc_msgSend(v14, "addAction:", v13);
  -[CKKeepMessagesSelectionList table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellForRowAtIndexPath:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceView:", v16);

  objc_msgSend(v16, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v14, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  -[CKKeepMessagesSelectionList presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

void __77__CKKeepMessagesSelectionList__warnAboutDeletingMessagesForSelectedListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_INFO, "[Conference] Delete tapped. Going to show secondary confirmation alert.", v6, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_warnForFinalConfirmationForUpdatingIndexPath:", *(_QWORD *)(a1 + 32));

}

- (void)_warnForFinalConfirmationForUpdatingIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE502C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
    v7 = CFSTR("ALL_DEVICES");
  else
    v7 = CFSTR("THIS_DEVICE");
  MadridLocalizedString(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "row");
  v10 = v9 == 0;
  if (v9)
    v11 = CFSTR("ARE_YOU_SURE_YOU_WANT_TO_DELETE_MESSAGES_OLDER_THAN_1_YEAR");
  else
    v11 = CFSTR("ARE_YOU_SURE_YOU_WANT_TO_DELETE_MESSAGES_OLDER_THAN_30_DAYS");
  if (v10)
    v12 = CFSTR("PERMANENTLY_DELETE_MESSAGES_OLDER_THAN_30_DAYS_FROM_%@");
  else
    v12 = CFSTR("PERMANENTLY_DELETE_MESSAGES_OLDER_THAN_1_YEAR_FROM_%@");
  MadridLocalizedString(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MadridLocalizedString(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x24BEBD3A8];
  MadridLocalizedString(CFSTR("FACETIME_ALERT_CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  MadridLocalizedString(CFSTR("DELETE_OLDER_MESSAGES"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __77__CKKeepMessagesSelectionList__warnForFinalConfirmationForUpdatingIndexPath___block_invoke;
  v37[3] = &unk_24D0761A8;
  objc_copyWeak(&v39, &location);
  v21 = v4;
  v38 = v21;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 2, v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v8;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v13, v15, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v18);
  objc_msgSend(v23, "addAction:", v22);
  -[CKKeepMessagesSelectionList table](self, "table");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "cellForRowAtIndexPath:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSourceView:", v25);

  objc_msgSend(v25, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(v23, "popoverPresentationController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSourceRect:", v28, v30, v32, v34);

  -[CKKeepMessagesSelectionList presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

void __77__CKKeepMessagesSelectionList__warnForFinalConfirmationForUpdatingIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_INFO, "[Conference] Confirmed duration change in alert. Updating.", v6, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePreferenceAtIndexPath:", *(_QWORD *)(a1 + 32));

  notify_post("com.apple.imautomatichistorydeletionagent.prefchange");
}

- (void)updateKeepMessagesPreference:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKKeepMessagesSelectionList keepMessagesPreferenceManager](self, "keepMessagesPreferenceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateKeepMessagesPreference:", v4);

}

- (NSArray)durationPreferenceTitles
{
  return self->_durationPreferenceTitles;
}

- (void)setDurationPreferenceTitles:(id)a3
{
  objc_storeStrong((id *)&self->_durationPreferenceTitles, a3);
}

- (NSArray)durationPreferenceValues
{
  return self->_durationPreferenceValues;
}

- (void)setDurationPreferenceValues:(id)a3
{
  objc_storeStrong((id *)&self->_durationPreferenceValues, a3);
}

- (int64_t)selectedKeepMessagesPreferenceIndex
{
  return self->_selectedKeepMessagesPreferenceIndex;
}

- (void)setSelectedKeepMessagesPreferenceIndex:(int64_t)a3
{
  self->_selectedKeepMessagesPreferenceIndex = a3;
}

- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager
{
  return self->_keepMessagesPreferenceManager;
}

- (void)setKeepMessagesPreferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, 0);
  objc_storeStrong((id *)&self->_durationPreferenceValues, 0);
  objc_storeStrong((id *)&self->_durationPreferenceTitles, 0);
}

@end
