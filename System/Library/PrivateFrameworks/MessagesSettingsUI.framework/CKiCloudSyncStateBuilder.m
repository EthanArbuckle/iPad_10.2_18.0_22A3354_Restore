@implementation CKiCloudSyncStateBuilder

+ (id)syncModelForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  id var3;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v18;
  unint64_t v19;
  id v20;
  BOOL v21;
  __int128 v22;
  unint64_t v23;
  id v24;
  BOOL v25;
  __int128 v26;
  unint64_t v27;
  id v28;
  BOOL v29;
  __int128 v30;
  unint64_t v31;
  id v32;
  BOOL v33;
  __int128 v34;
  unint64_t v35;
  id v36;
  BOOL v37;
  __int128 v38;
  unint64_t v39;
  id v40;
  BOOL v41;
  __int128 v42;
  unint64_t v43;
  id v44;
  BOOL v45;
  __int128 v46;
  unint64_t v47;
  id v48;
  BOOL v49;
  __int128 v50;
  unint64_t v51;
  id v52;
  BOOL v53;
  __int128 v54;
  unint64_t var2;
  id v56;
  BOOL var4;

  switch(a3->var0)
  {
    case 0:
      v54 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      var2 = a3->var2;
      v6 = var3;
      v56 = v6;
      var4 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "idleStateForDescriptor:", &v54);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 1:
      v50 = *(_OWORD *)&a3->var0;
      v8 = a3->var3;
      v51 = a3->var2;
      v6 = v8;
      v52 = v6;
      v53 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "syncUploadingForDescriptor:", &v50);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      v46 = *(_OWORD *)&a3->var0;
      v9 = a3->var3;
      v47 = a3->var2;
      v6 = v9;
      v48 = v6;
      v49 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "syncDownloadingForDescriptor:", &v46);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3:
      v42 = *(_OWORD *)&a3->var0;
      v10 = a3->var3;
      v43 = a3->var2;
      v6 = v10;
      v44 = v6;
      v45 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "syncPausedNoInternetConnectionForDescriptor:", &v42);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 4:
      v38 = *(_OWORD *)&a3->var0;
      v11 = a3->var3;
      v39 = a3->var2;
      v6 = v11;
      v40 = v6;
      v41 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "syncPausedAirplaneModeForDescriptor:", &v38);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 5:
      v34 = *(_OWORD *)&a3->var0;
      v12 = a3->var3;
      v35 = a3->var2;
      v6 = v12;
      v36 = v6;
      v37 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "syncPausedCellularDataDisabledForDescriptor:", &v34);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 6:
      v30 = *(_OWORD *)&a3->var0;
      v13 = a3->var3;
      v31 = a3->var2;
      v6 = v13;
      v32 = v6;
      v33 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "accountMismatchStateForDescriptor:", &v30);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 7:
      v26 = *(_OWORD *)&a3->var0;
      v14 = a3->var3;
      v27 = a3->var2;
      v6 = v14;
      v28 = v6;
      v29 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "noSyncStorageAlmostFullForDescriptor:", &v26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 8:
      v22 = *(_OWORD *)&a3->var0;
      v15 = a3->var3;
      v23 = a3->var2;
      v6 = v15;
      v24 = v6;
      v25 = a3->var4;
      if (!a1)
        goto LABEL_23;
      objc_msgSend(a1, "noSyncStorageFullForDescriptor:", &v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 9:
      v18 = *(_OWORD *)&a3->var0;
      v16 = a3->var3;
      v19 = a3->var2;
      v6 = v16;
      v20 = v6;
      v21 = a3->var4;
      if (a1)
      {
        objc_msgSend(a1, "noSyncStorageOverFullForDescriptor:", &v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        a1 = v7;
      }
      else
      {
LABEL_23:

        a1 = 0;
      }
LABEL_24:

      return a1;
    default:
      goto LABEL_24;
  }
}

+ (id)idleStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 1);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", 0);
  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 1);
  if (a3->var4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_PAUSED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  }
  else
  {
    +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v7);
  }

  return v5;
}

+ (id)syncUploadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  void *v5;
  void *v6;
  void *v7;
  CKiCloudSyncStateModel *v8;
  void *v9;

  if (a3->var2)
  {
    objc_msgSend(a1, "_syncingMessagesStringWithLongCount:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SYNCING_WITH_ICLOUD"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v8, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v8, "setSyncStatusMacButtonType:", 1);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v8, "setMessagesInCloudCount:", v9);

  -[CKiCloudSyncStateModel setSyncStatus:](v8, "setSyncStatus:", v5);
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v8, "setSyncStatusFooterText:", v7);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v8, "setLastSyncedDateString:", v7);
  -[CKiCloudSyncStateModel setSyncAvailable:](v8, "setSyncAvailable:", 1);

  return v8;
}

+ (id)syncDownloadingForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  void *v5;
  CKiCloudSyncStateModel *v6;
  void *v7;
  void *v8;
  void *v9;

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v6, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v6, "setSyncStatusMacButtonType:", 1);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v6, "setMessagesInCloudCount:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SYNCING_WITH_ICLOUD"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v6, "setSyncStatus:", v9);

  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v6, "setSyncStatusFooterText:", v5);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v6, "setLastSyncedDateString:", v5);
  -[CKiCloudSyncStateModel setSyncAvailable:](v6, "setSyncAvailable:", 1);

  return v6;
}

+ (id)syncCompleteForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 1);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_COMPLETE_JUST_NOW"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", 0);
  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 1);

  return v5;
}

+ (id)syncPausedNoInternetConnectionForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 3);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_PAUSED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_NO_INTERNET"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CTA"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_NO_INTERNET_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)syncPausedAirplaneModeForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 0);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_PAUSED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_AIRPLANE_MODE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CTA"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_AIRPLANE_MODE_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)syncPausedCellularDataDisabledForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 0);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_PAUSED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_NO_CELLULAR_DATA"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CTA"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SYNC_ERROR_NO_CELLULAR_DATA_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)accountMismatchStateForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 3);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_FAILED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ICLOUD_ACCOUNT_MISMATCH"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SETTINGS_CTA"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ICLOUD_ACCOUNT_MISMATCH_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)noSyncStorageAlmostFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 1);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v7);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_ALMOST_FULL"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GET_MORE_STORAGE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_ALMOST_FULL_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v15);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v11);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v9);

  return v5;
}

+ (id)noSyncStorageFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 2);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOT_SYNCING"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_FULL"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("GET_MORE_STORAGE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_FULL_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)noSyncStorageOverFullForDescriptor:(CKiCloudSyncStatusDescriptor *)a3
{
  CKiCloudSyncStateModel *v5;
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

  v5 = objc_alloc_init(CKiCloudSyncStateModel);
  -[CKiCloudSyncStateModel setSyncState:](v5, "setSyncState:", a3->var0);
  -[CKiCloudSyncStateModel setSyncStatusMacButtonType:](v5, "setSyncStatusMacButtonType:", 2);
  objc_msgSend(a1, "_messagesInCloudCountStringWithLongCount:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setMessagesInCloudCount:](v5, "setMessagesInCloudCount:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOT_SYNCING"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatus:](v5, "setSyncStatus:", v8);

  -[CKiCloudSyncStateModel setSyncAvailable:](v5, "setSyncAvailable:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_OVER_FULL"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("GET_MORE_STORAGE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("YOUR_ICLOUD_STORAGE_IS_OVER_FULL_%@"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKiCloudSettingsUtils lastSyncedDateStringForDate:inContext:](CKiCloudSettingsUtils, "lastSyncedDateStringForDate:inContext:", a3->var3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSyncStateBuilder _syncFooterTextWithStatusError:dateString:](CKiCloudSyncStateBuilder, "_syncFooterTextWithStatusError:dateString:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKiCloudSyncStateModel setSyncStatusFooterText:](v5, "setSyncStatusFooterText:", v18);
  -[CKiCloudSyncStateModel setSyncStatusFooterSubstringForHyperlink:](v5, "setSyncStatusFooterSubstringForHyperlink:", v12);
  -[CKiCloudSyncStateModel setSyncStatusMacToolTipText:](v5, "setSyncStatusMacToolTipText:", v10);
  -[CKiCloudSyncStateModel setLastSyncedDateString:](v5, "setLastSyncedDateString:", v17);

  return v5;
}

+ (id)_messagesInCloudCountStringWithLongCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  +[CKiCloudSettingsUtils sharedNumberFormatter](CKiCloudSettingsUtils, "sharedNumberFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("N_MESSAGE(S)"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, a3, v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("Unknown");
  }

  return v10;
}

+ (id)_syncingMessagesStringWithLongCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  +[CKiCloudSettingsUtils sharedNumberFormatter](CKiCloudSettingsUtils, "sharedNumberFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SYNCING_N_MESSAGE(S)"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, a3, v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("Unknown");
  }

  return v10;
}

+ (id)_syncFooterTextWithStatusError:(id)a3 dateString:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v5, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

@end
