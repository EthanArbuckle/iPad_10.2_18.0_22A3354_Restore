uint64_t sub_230F4061C(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_230F46910();

  objc_msgSend(MEMORY[0x24BE6DDD8], "startSharedContextWithOptions:", 2056);
  return objc_msgSend(*(id *)(a1 + 40), "acAccount:wasDeletedInStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void sub_230F408B4(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;

  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_230F46B28(a1);

  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "dirtyProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_230F46A98();

  }
  objc_msgSend(*v3, "dirtyAccountProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_230F46A08();

  }
  objc_msgSend(*v3, "dirtyDataclassProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_230F46978();

  }
  objc_msgSend(MEMORY[0x24BE6DDD8], "startSharedContextWithOptions:", 2056);
  objc_msgSend(*(id *)(a1 + 40), "deleteSpotlightDomainIfNecessaryForAccount:oldAccount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v13 = *(_DWORD *)(a1 + 72);
  if (v13 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "acAccount:wasDeletedInStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  }
  else if (v13 == 2 || v13 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "acAccount:wasModifiedInStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  }
  objc_msgSend(MEMORY[0x24BE6DDD8], "sharedContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workerManagedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6DDC8], "updateAllLegacyAccountMigrationStatesInContext:", v15);
  v16 = dispatch_time(0, 2000000000);
  dispatch_after(v16, MEMORY[0x24BDAC9B8], &unk_24FFB9C98);

}

void sub_230F40AE8()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE6DEF0], "sharedWidget");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reloadTimelinesWithReason:", CFSTR("Account has changed"));

}

void sub_230F40B64()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB3FD0], *MEMORY[0x24BDB3FD8], *MEMORY[0x24BDB4068], *MEMORY[0x24BDB4078], *MEMORY[0x24BDB4088], *MEMORY[0x24BDB4098], *MEMORY[0x24BDB4160], *MEMORY[0x24BDB4030], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25414C148;
  qword_25414C148 = v0;

}

void sub_230F41438(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Accounts");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_230F46E0C();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_230F46DA4();

    objc_msgSend(MEMORY[0x24BE6DEE8], "setObject:forKey:", 0, *MEMORY[0x24BE6DEF8]);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_230F418D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_230F41908(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_230F46FF4();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_230F41960(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t *v53;
  void *v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BE6DD98];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accountWithIdentifier:context:", v3, *(_QWORD *)(v2 + 8));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v4;
  if (v4)
    goto LABEL_42;
  v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_230F470AC(v2, v6);

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v8;
  v9 = objc_msgSend(v8, "userType");
  objc_msgSend(*(id *)v2, "objectForKeyedSubscript:", *MEMORY[0x24BE6DE78]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "objectForKeyedSubscript:", *MEMORY[0x24BE6DE80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "objectForKeyedSubscript:", *MEMORY[0x24BE6DE88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || !v11 || !objc_msgSend(v10, "BOOLValue") || (objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {
    v13 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_230F47080();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v54 = v12;
  v14 = (void *)MEMORY[0x24BE6DD98];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "newAccountWithIdentifier:type:context:", v15, 1, *(_QWORD *)(a1 + 40));

  objc_msgSend(v16, "setNeedsToBeFetchedFromCloud:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (v10)
    objc_msgSend(v16, "setDidChooseToMigrate:", objc_msgSend(v10, "BOOLValue"));
  if (v11)
    objc_msgSend(v16, "setDidFinishMigration:", objc_msgSend(v11, "BOOLValue"));
  v50 = v11;
  if (v12)
    objc_msgSend(v16, "setDidMigrateOnMac:", objc_msgSend(v12, "BOOLValue"));
  v51 = v10;
  v17 = objc_msgSend(*(id *)v2, "ic_isNotesMigrated");
  v18 = objc_msgSend(*(id *)v2, "ic_hasICloudEmailAddress");
  v53 = (uint64_t *)v2;
  v19 = objc_msgSend(*(id *)v2, "ic_isManagedAppleID");
  if (v9 == 1)
    v20 = 1;
  else
    v20 = v17 | v19 | v18 ^ 1;
  if (objc_msgSend(v16, "didChooseToMigrate"))
  {
    if ((objc_msgSend(v16, "didFinishMigration") & 1) != 0 || ((v20 ^ 1) & 1) != 0)
      goto LABEL_29;
LABEL_25:
    v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *v53;
      v23 = v9 == 1;
      *(_DWORD *)buf = 67110146;
      v63 = v17;
      v64 = 1024;
      v65 = v18 ^ 1;
      v66 = 1024;
      v67 = v19;
      v68 = 1024;
      v69 = v9 == 1;
      v70 = 2112;
      v71 = v22;
      _os_log_impl(&dword_230F3E000, v21, OS_LOG_TYPE_DEFAULT, "Automatically upgrading Notes because notesMigrated in account bag (%d), there is no iCloud email address (%d), Apple ID is managed (%d), or user is ephemeral (%d): %@", buf, 0x24u);
    }
    else
    {
      v23 = v9 == 1;
    }

    NSLog(CFSTR("Automatically upgrading Notes because notesMigrated in account bag (%d), there is no iCloud email address (%d), Apple ID is managed (%d), or user is ephemeral (%d): %@"), v17, v18 ^ 1u, v19, v23, *(_QWORD *)(a1 + 32));
    objc_msgSend(v16, "setDidChooseToMigrate:", 1);
    objc_msgSend(v16, "setDidFinishMigration:", 1);
    objc_msgSend(v16, "setDidMigrateOnMac:", 1);
    objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Upgraded account"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_29;
  }
  if (v20)
    goto LABEL_25;
LABEL_29:
  v24 = v16;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v25 = a1;
  objc_msgSend(MEMORY[0x24BE6DD98], "allAccountsInContext:", *(_QWORD *)(a1 + 40));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v58 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v33 = *(void **)(v25 + 48);
        objc_msgSend(v32, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "accountWithIdentifier:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v32, "accountType") == 1)
        {
          objc_msgSend(v32, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "isEqual:", v37))
          {

            v25 = a1;
          }
          else
          {
            v38 = objc_msgSend(v35, "ic_isNotesEnabled");

            v25 = a1;
            if ((v38 & 1) == 0)
              objc_msgSend(MEMORY[0x24BE6DD98], "deleteAccount:", v32);
          }
        }

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v29);
  }

  v4 = 0;
  v2 = (uint64_t)v53;
  v5 = v24;
LABEL_42:
  objc_msgSend(v5, "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "accountDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "isEqualToString:", v40);

  if ((v41 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE6DDB0], "sharedController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = a1;
    objc_msgSend(v42, "batchUpdateTopicSubscriptionsAllAccountsInContext:", *(_QWORD *)(a1 + 40));

    if (v4)
      goto LABEL_51;
  }
  else
  {
    v43 = a1;
    objc_msgSend(*(id *)(a1 + 32), "accountDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v44);

    objc_msgSend(MEMORY[0x24BE6DDB0], "sharedController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "batchUpdateTopicSubscriptionsAllAccountsInContext:", *(_QWORD *)(a1 + 40));

  }
  v46 = *(void **)(v43 + 40);
  v56 = 0;
  v47 = objc_msgSend(v46, "save:", &v56);
  v48 = v56;
  if ((v47 & 1) == 0)
  {
    v49 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_230F47020();

  }
LABEL_51:

}

void sub_230F41FF0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v2 = (void *)MEMORY[0x24BE6DD98];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:context:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "fetchAndSetMigrationStateForACAccount:inStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE6DE78]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE6DE80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE6DE88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDidChooseToMigrate:", objc_msgSend(v5, "BOOLValue"));
    objc_msgSend(v4, "setDidFinishMigration:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "setDidMigrateOnMac:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "updateChangeCountWithReason:", CFSTR("Set migration state"));

    v8 = a1 + 80;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      goto LABEL_14;
LABEL_7:
    objc_msgSend(MEMORY[0x24BE6DDC0], "currentDeviceMigrationStateForAccount:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "didFinishMigration"))
    {
      if (objc_msgSend(v12, "state") != 7)
      {
        v13 = CFSTR("Finished migration");
        v14 = 7;
LABEL_12:
        objc_msgSend(v12, "setState:", v14);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setStateModificationDate:", v15);

        objc_msgSend(v12, "updateChangeCountWithReason:", v13);
      }
    }
    else if (objc_msgSend(v4, "didChooseToMigrate"))
    {
      v13 = CFSTR("Set migration state");
      v14 = 2;
      goto LABEL_12;
    }

LABEL_14:
    v16 = *(void **)(a1 + 40);
    v21 = 0;
    v17 = objc_msgSend(v16, "save:", &v21);
    v18 = v21;
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BE6DDD8], "sharedContext");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject crossProcessChangeCoordinator](v19, "crossProcessChangeCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postAccountDidChangeNotification");

    }
    else
    {
      v19 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_230F47020();
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24))
      objc_msgSend(MEMORY[0x24BE6DDE0], "updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded");

    goto LABEL_21;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "reload");
    v9 = MEMORY[0x24BDBD1C8];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE6DE78]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE6DE80]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE6DE88]);
    v10 = *(void **)(a1 + 56);
    v11 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_230F4234C;
    v22[3] = &unk_24FFB9D80;
    v23 = v11;
    objc_msgSend(v10, "saveAccount:withCompletionHandler:", v23, v22);

  }
  v8 = a1 + 80;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_7;
LABEL_21:

}

void sub_230F4234C(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230F4712C();

  }
}

void sub_230F4252C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BE6DD98];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:context:", v3, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE6DDB0], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllTopicSubscriptionsForAccount:", v5);

  }
}

void sub_230F425B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BE6DD98];
  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountWithIdentifier:context:", v4, *(_QWORD *)(v3 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE6DDB8], "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearCachedDevicesForAccount:", v5);

    objc_msgSend(MEMORY[0x24BE6DD98], "deleteAccountWithBatchDelete:", v5);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_230F47210();

  }
  objc_msgSend(*(id *)(a1 + 48), "cleanupAdditionalPersistentStores");
  objc_msgSend(*(id *)(a1 + 48), "crossProcessChangeCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postAccountDidChangeNotification");

  objc_msgSend(MEMORY[0x24BE6DDE0], "disableNotesOnLockScreenIfNecessary");
}

void sub_230F42A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230F42A78(uint64_t a1, char a2, char a3, char a4, void *a5)
{
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;

  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230F42B5C;
  v14[3] = &unk_24FFB9DF8;
  v15 = v9;
  v10 = *(NSObject **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v18 = v11;
  v19 = v12;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v13 = v9;
  dispatch_async(v10, v14);

}

void sub_230F42B5C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accountWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v5 = 1;
    else
      v5 = v4 == 0;
    if (v5)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "reload");
      v6 = (void *)MEMORY[0x24BE6DDC8];
      v7 = *(unsigned __int8 *)(a1 + 72);
      v8 = *(unsigned __int8 *)(a1 + 73);
      v9 = *(unsigned __int8 *)(a1 + 74);
      v11 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = sub_230F42C8C;
      v12[3] = &unk_24FFB9D80;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v6, "saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:", v7, v8, v9, v10, v11, v12);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
}

intptr_t sub_230F42C8C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_230F42C94(uint64_t a1)
{
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      sub_230F47304();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_230F42D2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_230F42D38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_230F42D5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_230F42D98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_230F42DE0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const char *ThumbnailKey.recentObjectId.unsafeMutableAddressor()
{
  return "Recent";
}

uint64_t static ThumbnailKey.recentObjectId.getter()
{
  return 0x746E65636552;
}

uint64_t ThumbnailKey.accountId.getter()
{
  return sub_230F42EB8(&OBJC_IVAR___ICThumbnailKey_accountId);
}

id sub_230F42E54(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*(_QWORD *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_230F47390();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t ThumbnailKey.objectId.getter()
{
  return sub_230F42EB8(&OBJC_IVAR___ICThumbnailKey_objectId);
}

uint64_t sub_230F42EB8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ThumbnailKey.thumbnailId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  swift_bridgeObjectRetain();
  return v1;
}

id ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v6[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v6[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.__allocating_init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return ThumbnailKey.init(accountId:objectId:)(a1, a2, a3, a4);
}

id ThumbnailKey.init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!a2)
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v7 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = (void *)sub_230F47390();
  v9 = objc_msgSend(v4, sel_initWithAccountId_objectId_thumbnailId_, v6, v7, v8);

  return v9;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  objc_class *v10;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v10 = v9;
  v18 = objc_allocWithZone(v10);
  if (!a6)
  {
    v19 = 0;
    if (a8)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v19 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
  if (!a8)
    goto LABEL_5;
LABEL_3:
  v20 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v23) = 0;
  v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v19, v20, a9, 0, 0, a2, a3, a4, v23);

  return v21;
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;

  if (!a6)
  {
    v16 = 0;
    if (a8)
      goto LABEL_3;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v16 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
  if (!a8)
    goto LABEL_5;
LABEL_3:
  v17 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v20) = 0;
  v18 = objc_msgSend(v9, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v16, v17, a9, 0, 0, a2, a3, a4, v20);

  return v18;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  return ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a1, a7, a8, a2, a3, a4, a5, a6);
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v8;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v25;

  if (!a5)
  {
    v14 = 0;
    if (a7)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
  if (!a7)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
LABEL_6:
  objc_msgSend(a8, sel_displayScale);
  v17 = v16;
  v18 = objc_msgSend(a8, sel_userInterfaceStyle) == (id)2;
  v19 = objc_msgSend(a8, sel_layoutDirection) == (id)1;
  v20 = objc_msgSend(a8, sel_preferredContentSizeCategory);
  sub_230F4739C();

  v21 = (void *)sub_230F47390();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(a8, sel_legibilityWeight) == (id)1;
  BYTE3(v25) = 0;
  BYTE2(v25) = objc_msgSend(a8, sel_accessibilityContrast) == (id)1;
  LOWORD(v25) = v22;
  v23 = objc_msgSend(v8, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v14, v15, v18, v19, v21, a2, a3, v17, v25);

  return v23;
}

uint64_t ThumbnailKey.description.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v5 = v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  v7 = *(_QWORD *)(v5 + 8);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = (char *)MEMORY[0x24BEE4AF8];
    if (!v3)
      goto LABEL_12;
    goto LABEL_7;
  }
  v8 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v9 = sub_230F4500C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v11 = *((_QWORD *)v9 + 2);
  v10 = *((_QWORD *)v9 + 3);
  if (v11 >= v10 >> 1)
    v9 = sub_230F4500C((char *)(v10 > 1), v11 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v11 + 1;
  v12 = &v9[16 * v11];
  *((_QWORD *)v12 + 4) = v8;
  *((_QWORD *)v12 + 5) = v2;
  if (v3)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_230F4500C(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v14 = *((_QWORD *)v9 + 2);
    v13 = *((_QWORD *)v9 + 3);
    if (v14 >= v13 >> 1)
      v9 = sub_230F4500C((char *)(v13 > 1), v14 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v14 + 1;
    v15 = &v9[16 * v14];
    *((_QWORD *)v15 + 4) = v4;
    *((_QWORD *)v15 + 5) = v3;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = sub_230F4500C(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
    v9 = sub_230F4500C((char *)(v16 > 1), v17 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[16 * v17];
  *((_QWORD *)v18 + 4) = v6;
  *((_QWORD *)v18 + 5) = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_230F4510C(&qword_255EACE18);
  sub_230F4514C();
  v19 = sub_230F47384();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t ThumbnailKey.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;
  _BYTE v13[24];
  uint64_t v14;

  v2 = v1;
  swift_getObjectType();
  sub_230F4510C(&qword_255EACE28);
  v4 = sub_230F473C0();
  swift_unknownObjectRelease();
  if (v4 == v2)
  {
    v8 = 1;
    return v8 & 1;
  }
  sub_230F451DC(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_230F45224((uint64_t)v13);
    goto LABEL_25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    v8 = 0;
    return v8 & 1;
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v6 = *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_accountId + 8];
  if (v5)
  {
    if (!v6)
      goto LABEL_24;
    v7 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_accountId]
      && v5 == v6;
    if (!v7 && (sub_230F4742C() & 1) == 0)
      goto LABEL_24;
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  v9 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v10 = *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_objectId + 8];
  if (v9)
  {
    if (v10
      && (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_objectId]
       && v9 == v10
       || (sub_230F4742C() & 1) != 0))
    {
      goto LABEL_20;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v10)
    goto LABEL_24;
LABEL_20:
  if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId]
    && *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId
                                                                                     + 8])
  {

    v8 = 1;
  }
  else
  {
    v8 = sub_230F4742C();

  }
  return v8 & 1;
}

uint64_t ThumbnailKey.hash.getter()
{
  uint64_t v0;

  sub_230F47474();
  if (*(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    sub_230F47450();
    swift_bridgeObjectRetain();
    sub_230F473A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_230F47450();
  }
  if (*(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
  {
    sub_230F47450();
    swift_bridgeObjectRetain();
    sub_230F473A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_230F47450();
  }
  swift_bridgeObjectRetain();
  sub_230F473A8();
  swift_bridgeObjectRelease();
  return sub_230F4745C();
}

id ThumbnailKey.copy(with:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  id result;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8);
  v10 = (char *)objc_allocWithZone(ObjectType);
  v11 = &v10[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v11 = v5;
  *((_QWORD *)v11 + 1) = v4;
  v12 = &v10[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v12 = v7;
  *((_QWORD *)v12 + 1) = v6;
  v13 = &v10[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v13 = v9;
  *((_QWORD *)v13 + 1) = v8;
  v15.receiver = v10;
  v15.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v15, sel_init);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t sub_230F441BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  v36 = a1;
  v3 = sub_230F47360();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v33 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v33 - v17;
  if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v34 = v4;
    v20 = v3;
    v21 = v19;
    v22 = (void *)sub_230F47390();
    v23 = objc_msgSend(v21, sel_applicationDocumentsURLForAccountIdentifier_, v22);
    v35 = v2;
    v24 = v23;

    v3 = v20;
    sub_230F47354();

    sub_230F4739C();
    sub_230F4733C();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v34 + 8);
    v25(v10, v3);
    sub_230F4733C();
    v25(v13, v3);
    sub_230F4739C();
    sub_230F4733C();
    swift_bridgeObjectRelease();
    v25(v16, v3);
    if (*(_QWORD *)(v35 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      v26 = (void *)sub_230F47390();
      v27 = objc_msgSend(v26, sel_ic_sanitizedFilenameString);

      sub_230F4739C();
    }
    sub_230F4733C();
    swift_bridgeObjectRelease();
    v31 = v18;
  }
  else
  {
    v28 = objc_msgSend((id)objc_opt_self(), sel_applicationDocumentsURL);
    sub_230F47354();

    sub_230F4739C();
    sub_230F4733C();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v4 + 8);
    v25(v16, v3);
    if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      v29 = (void *)sub_230F47390();
      v30 = objc_msgSend(v29, sel_ic_sanitizedFilenameString);

      sub_230F4739C();
    }
    sub_230F4733C();
    swift_bridgeObjectRelease();
    v31 = v7;
  }
  return ((uint64_t (*)(char *, uint64_t))v25)(v31, v3);
}

id sub_230F44578(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v5 = sub_230F47360();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  sub_230F44628(a3, (uint64_t)v8);

  v10 = (void *)sub_230F47330();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

uint64_t sub_230F44628@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t (*v15)(char *, uint64_t);
  uint64_t v16;
  void (*v18)(uint64_t);
  uint64_t v19;

  v18 = a1;
  v19 = a2;
  v2 = sub_230F47378();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_230F47360();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v18 - v11;
  sub_230F441BC((uint64_t)v10);
  v13 = (void *)sub_230F47390();
  v14 = objc_msgSend(v13, sel_ic_sanitizedFilenameString, v18, v19);

  sub_230F4739C();
  sub_230F4733C();
  swift_bridgeObjectRelease();
  v15 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v16 = v15(v10, v6);
  v18(v16);
  sub_230F4736C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_230F47348();
  swift_bridgeObjectRelease();
  return v15(v12, v6);
}

id ThumbnailKey.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ThumbnailKey.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

BOOL sub_230F44844(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_230F44858()
{
  sub_230F47438();
  sub_230F47444();
  return sub_230F47468();
}

uint64_t sub_230F4489C()
{
  return sub_230F47444();
}

uint64_t sub_230F448C4()
{
  sub_230F47438();
  sub_230F47444();
  return sub_230F47468();
}

uint64_t sub_230F44904()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x64497463656A626FLL;
  if (*v0 != 1)
    v1 = 0x69616E626D756874;
  if (*v0)
    return v1;
  else
    return 0x49746E756F636361;
}

uint64_t sub_230F4496C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230F46688(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230F44990()
{
  return 0;
}

void sub_230F4499C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_230F449A8()
{
  sub_230F45264();
  return sub_230F47498();
}

uint64_t sub_230F449D0()
{
  sub_230F45264();
  return sub_230F474A4();
}

id ThumbnailKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ThumbnailKey.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = sub_230F4510C(&qword_255EACE30);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_230F46800(a1, a1[3]);
  sub_230F45264();
  sub_230F4748C();
  v8[15] = 0;
  sub_230F473FC();
  if (!v1)
  {
    v8[14] = 1;
    sub_230F473FC();
    v8[13] = 2;
    sub_230F47408();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

id ThumbnailKey.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ThumbnailKey.init(from:)(a1);
}

id ThumbnailKey.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  objc_class *ObjectType;
  objc_super v23;
  char v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v21 = sub_230F4510C(&qword_255EACE38);
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230F46800(a1, a1[3]);
  sub_230F45264();
  v7 = v1;
  sub_230F47480();
  if (v2)
  {
    v20 = ObjectType;
    sub_230F46824((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v8 = v4;
    v24 = 0;
    v9 = v21;
    v10 = sub_230F473E4();
    v12 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_accountId];
    *v12 = v10;
    v12[1] = v13;
    v24 = 1;
    v14 = sub_230F473E4();
    v15 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_objectId];
    *v15 = v14;
    v15[1] = v16;
    v24 = 2;
    v17 = sub_230F473F0();
    v18 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *v18 = v17;
    v18[1] = v19;

    v23.receiver = v7;
    v23.super_class = ObjectType;
    v20 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    sub_230F46824((uint64_t)a1);
  }
  return v20;
}

id sub_230F44E84@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = ThumbnailKey.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_230F44ED0(_QWORD *a1)
{
  return ThumbnailKey.encode(to:)(a1);
}

char *sub_230F44EF0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_230F44F0C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_230F44F0C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_230F4510C(&qword_255EACEC8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_230F4500C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_230F4510C(&qword_255EACEC8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_230F4510C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CA2F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_230F4514C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EACE20;
  if (!qword_255EACE20)
  {
    v1 = sub_230F45198(&qword_255EACE18);
    result = MEMORY[0x2348CA310](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255EACE20);
  }
  return result;
}

uint64_t sub_230F45198(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CA304](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230F451DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_230F4510C(&qword_255EACE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_230F45224(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_230F4510C(&qword_255EACE28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_230F45264()
{
  unint64_t result;

  result = qword_255EACED0[0];
  if (!qword_255EACED0[0])
  {
    result = MEMORY[0x2348CA310](&unk_230F47C90, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, qword_255EACED0);
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailKey()
{
  return objc_opt_self();
}

_BYTE *initializeBufferWithCopyOfBuffer for ThumbnailKey.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailKey.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_230F453B4 + 4 * byte_230F47B05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_230F453E8 + 4 * byte_230F47B00[v4]))();
}

uint64_t sub_230F453E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230F453F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230F453F8);
  return result;
}

uint64_t sub_230F45404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230F4540CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230F45410(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230F45418(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230F45424(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_230F45430(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailKey.CodingKeys()
{
  return &type metadata for ThumbnailKey.CodingKeys;
}

unint64_t sub_230F4544C()
{
  unint64_t result;

  result = qword_255EAD0E0[0];
  if (!qword_255EAD0E0[0])
  {
    result = MEMORY[0x2348CA310](&unk_230F47C68, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, qword_255EAD0E0);
  }
  return result;
}

unint64_t sub_230F45494()
{
  unint64_t result;

  result = qword_255EAD1F0;
  if (!qword_255EAD1F0)
  {
    result = MEMORY[0x2348CA310](&unk_230F47BD8, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255EAD1F0);
  }
  return result;
}

unint64_t sub_230F454DC()
{
  unint64_t result;

  result = qword_255EAD1F8[0];
  if (!qword_255EAD1F8[0])
  {
    result = MEMORY[0x2348CA310](&unk_230F47C00, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, qword_255EAD1F8);
  }
  return result;
}

id sub_230F45520(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  objc_super v26;
  uint64_t v27;

  v5 = *(_QWORD *)(a5 + 16);
  if (v5)
  {
    v6 = result;
    v7 = (uint64_t *)(a5 + 40);
    v8 = MEMORY[0x24BEE4AF8];
    do
    {
      v12 = *(v7 - 1);
      v13 = *v7;
      v14 = HIBYTE(*v7) & 0xF;
      if ((*v7 & 0x2000000000000000) == 0)
        v14 = v12 & 0xFFFFFFFFFFFFLL;
      if (v14)
      {
        swift_bridgeObjectRetain();
        v27 = v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_230F44EF0(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v27;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_230F44EF0((char *)(v9 > 1), v10 + 1, 1);
          v8 = v27;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        v11 = v8 + 16 * v10;
        *(_QWORD *)(v11 + 32) = v12;
        *(_QWORD *)(v11 + 40) = v13;
      }
      v7 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    v27 = v8;
    sub_230F4510C(&qword_255EACE18);
    sub_230F4514C();
    v15 = sub_230F47384();
    v17 = v16;
    swift_release();
    v18 = (objc_class *)type metadata accessor for ThumbnailKey();
    v19 = (char *)objc_allocWithZone(v18);
    v20 = &v19[OBJC_IVAR___ICThumbnailKey_accountId];
    *(_QWORD *)v20 = v6;
    *((_QWORD *)v20 + 1) = a2;
    v21 = &v19[OBJC_IVAR___ICThumbnailKey_objectId];
    *(_QWORD *)v21 = a3;
    *((_QWORD *)v21 + 1) = a4;
    v22 = (uint64_t *)&v19[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *v22 = v15;
    v22[1] = v17;
    v26.receiver = v19;
    v26.super_class = v18;
    return objc_msgSendSuper2(&v26, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_230F456C8(uint64_t a1)
{
  uint64_t result;

  result = 0x656D686361747441;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 1702129486;
      break;
    case 2:
      result = 0x6174744165746F4ELL;
      break;
    case 3:
    case 5:
      result = 0xD000000000000013;
      break;
    case 4:
      result = 0x7268437265706150;
      break;
    case 6:
      result = 0xD000000000000012;
      break;
    case 7:
      result = 0x6572507265706150;
      break;
    case 8:
      result = 0x726174617641;
      break;
    case 10:
      result = 0xD000000000000014;
      break;
    case 11:
      result = 0xD000000000000014;
      break;
    default:
      result = sub_230F473D8();
      __break(1u);
      break;
  }
  return result;
}

void sub_230F45860(double a1, double a2)
{
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_230F47414();
  sub_230F473B4();
  if ((~*(_QWORD *)&a2 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a2 < 9.22337204e18)
  {
    sub_230F47414();
    sub_230F473B4();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_230F45978(double a1)
{
  uint64_t result;

  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
  {
    sub_230F47414();
    sub_230F473B4();
    swift_bridgeObjectRelease();
    sub_230F473B4();
    return 64;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_230F45A2C(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;

  if (a2)
    v2 = (id)sub_230F47390();
  else
    v2 = (id)*MEMORY[0x24BEBE0D8];
  v3 = v2;
  v4 = sub_230F4739C();
  v6 = v5;
  if (v4 == sub_230F4739C() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v9 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_18:

    return 21336;
  }
  v10 = sub_230F4739C();
  v12 = v11;
  if (v10 == sub_230F4739C() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  v15 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_21:

    return 83;
  }
  v16 = sub_230F4739C();
  v18 = v17;
  if (v16 == sub_230F4739C() && v18 == v19)
    goto LABEL_16;
  v22 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_23;
  v23 = sub_230F4739C();
  v25 = v24;
  if (v23 == sub_230F4739C() && v25 == v26)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
LABEL_23:

    return 77;
  }
  v27 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
    goto LABEL_23;
  v28 = sub_230F4739C();
  v30 = v29;
  if (v28 == sub_230F4739C() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:

    return 76;
  }
  v32 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_31;
  v33 = sub_230F4739C();
  v35 = v34;
  if (v33 == sub_230F4739C() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:

    return 19544;
  }
  v37 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_36;
  v38 = sub_230F4739C();
  v40 = v39;
  if (v38 == sub_230F4739C() && v40 == v41)
    goto LABEL_39;
  v42 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_41;
  v43 = sub_230F4739C();
  v45 = v44;
  if (v43 == sub_230F4739C() && v45 == v46)
  {
LABEL_39:
    swift_bridgeObjectRelease_n();
LABEL_41:
    v20 = 5003314;

    return v20;
  }
  v47 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_41;
  v48 = sub_230F4739C();
  v50 = v49;
  if (v48 == sub_230F4739C() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_49:

    return 19777;
  }
  v52 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
    goto LABEL_49;
  v53 = sub_230F4739C();
  v55 = v54;
  if (v53 == sub_230F4739C() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:

    return 19521;
  }
  v57 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
    goto LABEL_54;
  v58 = sub_230F4739C();
  v60 = v59;
  if (v58 == sub_230F4739C() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:

    return 5003329;
  }
  v62 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v62 & 1) != 0)
    goto LABEL_59;
  v20 = 1280848705;
  v63 = sub_230F4739C();
  v65 = v64;
  if (v63 == sub_230F4739C() && v65 == v66)
  {
    swift_bridgeObjectRelease_n();
LABEL_64:

    return 1280848449;
  }
  v67 = sub_230F4742C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v67 & 1) != 0)
    goto LABEL_64;
  v68 = sub_230F4739C();
  v70 = v69;
  if (v68 == sub_230F4739C() && v70 == v71)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v72 = sub_230F4742C();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v72 & 1) == 0)
      return 0;
  }
  return v20;
}

id sub_230F460F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, char a12, char a13, char a14)
{
  void *v14;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t inited;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;

  switch(a1)
  {
    case 0:
      v25 = a4;
      v24 = a2;
      v60 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_230F4510C(&qword_255EACEC8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_230F47CF0;
      *(_QWORD *)(inited + 32) = 0x656D686361747441;
      *(_QWORD *)(inited + 40) = 0xEA0000000000746ELL;
      sub_230F45860(a9, a10);
      *(_QWORD *)(inited + 48) = v61;
      *(_QWORD *)(inited + 56) = v62;
      *(_QWORD *)(inited + 64) = sub_230F45978(a11);
      *(_QWORD *)(inited + 72) = v63;
      goto LABEL_28;
    case 1:
    case 2:
    case 3:
      v24 = a2;
      v25 = a4;
      v26 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_230F4510C(&qword_255EACEC8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_230F47D10;
      *(_QWORD *)(inited + 32) = sub_230F456C8(a1);
      *(_QWORD *)(inited + 40) = v28;
      sub_230F45860(a9, a10);
      *(_QWORD *)(inited + 48) = v29;
      *(_QWORD *)(inited + 56) = v30;
      if (!a6)
      {
        v31 = 0xE500000000000000;
        v32 = 0x746867694CLL;
        goto LABEL_21;
      }
      if (a6 == 1)
      {
        v31 = 0xE400000000000000;
        v32 = 1802658116;
LABEL_21:
        *(_QWORD *)(inited + 64) = v32;
        *(_QWORD *)(inited + 72) = v31;
        *(_QWORD *)(inited + 80) = sub_230F45978(a11);
        *(_QWORD *)(inited + 88) = v49;
LABEL_28:
        v57 = v24;
        v58 = a3;
        v59 = v25;
LABEL_29:
        v64 = a5;
        goto LABEL_37;
      }
      goto LABEL_39;
    case 4:
    case 7:
    case 10:
    case 11:
      swift_getObjectType();
      sub_230F4510C(&qword_255EACEC8);
      v33 = swift_initStackObject();
      *(_OWORD *)(v33 + 16) = xmmword_230F47D00;
      *(_QWORD *)(v33 + 32) = sub_230F456C8(a1);
      *(_QWORD *)(v33 + 40) = v34;
      if (a6)
      {
        if (a6 == 1)
        {
          v35 = 0xE400000000000000;
          v36 = 1802658116;
          goto LABEL_8;
        }
        while (1)
        {
LABEL_39:
          sub_230F473D8();
          __break(1u);
        }
      }
      v35 = 0xE500000000000000;
      v36 = 0x746867694CLL;
LABEL_8:
      *(_QWORD *)(v33 + 48) = v36;
      *(_QWORD *)(v33 + 56) = v35;
      v37 = sub_230F45A2C(a7, a8);
      v39 = v38;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v33 + 64) = v37;
      *(_QWORD *)(v33 + 72) = v39;
      v40 = 0x5472616C75676552;
      if ((a12 & 1) != 0)
        v40 = 0x74786554646C6F42;
      v41 = 0xEB00000000747865;
      if ((a12 & 1) != 0)
        v41 = 0xE800000000000000;
      *(_QWORD *)(v33 + 80) = v40;
      *(_QWORD *)(v33 + 88) = v41;
      v42 = 0x4372616C75676552;
      if ((a13 & 1) != 0)
        v42 = 0x6F4372656B726144;
      v43 = 0xED000073726F6C6FLL;
      if ((a13 & 1) != 0)
        v43 = 0xEC00000073726F6CLL;
      *(_QWORD *)(v33 + 96) = v42;
      *(_QWORD *)(v33 + 104) = v43;
      v44 = sub_230F45520(a2, a3, a4, a5, v33);
LABEL_38:
      swift_deallocPartialClassInstance();
      return v44;
    case 5:
    case 6:
      v45 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_230F4510C(&qword_255EACEC8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_230F47CF0;
      *(_QWORD *)(inited + 32) = sub_230F456C8(a1);
      *(_QWORD *)(inited + 40) = v46;
      if (a6)
      {
        if (a6 != 1)
          goto LABEL_39;
        v47 = 0xE400000000000000;
        v48 = 1802658116;
      }
      else
      {
        v47 = 0xE500000000000000;
        v48 = 0x746867694CLL;
      }
      *(_QWORD *)(inited + 48) = v48;
      *(_QWORD *)(inited + 56) = v47;
      v65 = 0x4372616C75676552;
      if ((a13 & 1) != 0)
        v65 = 0x6F4372656B726144;
      v66 = 0xED000073726F6C6FLL;
      if ((a13 & 1) != 0)
        v66 = 0xEC00000073726F6CLL;
      *(_QWORD *)(inited + 64) = v65;
      *(_QWORD *)(inited + 72) = v66;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      v64 = 0;
LABEL_37:
      v44 = sub_230F45520(v57, v58, v59, v64, inited);
      goto LABEL_38;
    case 8:
      v52 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_230F4510C(&qword_255EACEC8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_230F47CF0;
      *(_QWORD *)(inited + 32) = 0x726174617641;
      *(_QWORD *)(inited + 40) = 0xE600000000000000;
      sub_230F45860(a9, a10);
      *(_QWORD *)(inited + 48) = v53;
      *(_QWORD *)(inited + 56) = v54;
      v55 = 0x726564726F426F4ELL;
      if ((a14 & 1) != 0)
        v55 = 0x726564726F42;
      v56 = 0xE800000000000000;
      if ((a14 & 1) != 0)
        v56 = 0xE600000000000000;
      *(_QWORD *)(inited + 64) = v55;
      *(_QWORD *)(inited + 72) = v56;
      v57 = a2;
      v58 = a3;
      v59 = a4;
      goto LABEL_29;
    default:
      goto LABEL_39;
  }
}

uint64_t sub_230F46688(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x49746E756F636361 && a2 == 0xE900000000000064;
  if (v2 || (sub_230F4742C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64497463656A626FLL && a2 == 0xE800000000000000 || (sub_230F4742C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEB0000000064496CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_230F4742C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *sub_230F46800(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_230F46824(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_230F46848()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "applications installed or uninstalled: %@", v2);
  sub_230F42D6C();
}

void sub_230F468AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Enabling Notes for ephemeral account %@", v2);
  sub_230F42D6C();
}

void sub_230F46910()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42DD4();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Handling deleting account: %@", v2);
  sub_230F42D6C();
}

void sub_230F46978()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F42DC8();
  objc_msgSend((id)sub_230F42DE0(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyDataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D74();
  sub_230F42D38(&dword_230F3E000, v4, v5, "Dirty dataclass properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F42D4C();
}

void sub_230F46A08()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F42DC8();
  objc_msgSend((id)sub_230F42DE0(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyAccountProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D74();
  sub_230F42D38(&dword_230F3E000, v4, v5, "Dirty account properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F42D4C();
}

void sub_230F46A98()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F42DC8();
  objc_msgSend((id)sub_230F42DE0(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D74();
  sub_230F42D38(&dword_230F3E000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F42D4C();
}

void sub_230F46B28(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D38(&dword_230F3E000, v2, v3, "Account changed %@ %@", v4, v5, v6, v7, 2u);

  sub_230F42D4C();
}

void sub_230F46BCC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Not processing account with account type identifier %@", v2);
  sub_230F42D6C();
}

void sub_230F46C30(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, a2, v4, "Not processing account modified for account identifier %@ because enabledDataclasses did not change", v5);

  sub_230F42DB0();
}

void sub_230F46CB0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F42DC8();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dirtyProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D74();
  sub_230F42D38(&dword_230F3E000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F42D4C();
}

void sub_230F46D40()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Deleting search index domains: %@", v2);
  sub_230F42D6C();
}

void sub_230F46DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42DD4();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Deleted search index domains: %@", v2);
  sub_230F42D6C();
}

void sub_230F46E0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42D8C();
  sub_230F42D98(&dword_230F3E000, v0, v1, "Error deleting search index domain after deleting account: %@", v2, v3, v4, v5, v6);
  sub_230F42D6C();
}

void sub_230F46E6C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_230F42DBC();
  _os_log_error_impl(&dword_230F3E000, v0, OS_LOG_TYPE_ERROR, "No modern persistent stores in accounts plugin", v1, 2u);
  sub_230F42DA8();
}

void sub_230F46EA4(NSObject *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6DDD8], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoresByAccountId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, a1, v4, "Current persistent stores by account ID = %@", v5);

  sub_230F42D4C();
}

void sub_230F46F44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42DBC();
  sub_230F42D5C(&dword_230F3E000, v0, v1, "Loading persistent stores...", v2, v3, v4, v5, v6);
  sub_230F42DA8();
}

void sub_230F46F70(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, a2, v4, "Creating modern account if necessary %@", v5);

  sub_230F42DB0();
}

void sub_230F46FF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42DBC();
  sub_230F42D5C(&dword_230F3E000, v0, v1, "Finished loading persistent stores.", v2, v3, v4, v5, v6);
  sub_230F42DA8();
}

void sub_230F47020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42D8C();
  sub_230F42D98(&dword_230F3E000, v0, v1, "Error saving context after adding account: %@", v2, v3, v4, v5, v6);
  sub_230F42D6C();
}

void sub_230F47080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42DBC();
  sub_230F42D5C(&dword_230F3E000, v0, v1, "No existing ACAccount properties for migration", v2, v3, v4, v5, v6);
  sub_230F42DA8();
}

void sub_230F470AC(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)sub_230F42DE0(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, a2, v4, "Creating modern account %@", v5);

  sub_230F42DB0();
}

void sub_230F4712C()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_230F42DD4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_230F3E000, v1, OS_LOG_TYPE_ERROR, "Error updating migration flags for ACAccount (%@): %@", v2, 0x16u);
  sub_230F42D6C();
}

void sub_230F471AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42D8C();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "Deleting modern account if necessary %@", v2);
  sub_230F42D6C();
}

void sub_230F47210()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230F42DD4();
  sub_230F42D2C(&dword_230F3E000, v0, v1, "No modern account found for batch delete for ACAccount %@", v2);
  sub_230F42D6C();
}

void sub_230F47278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42D8C();
  sub_230F42D98(&dword_230F3E000, v0, v1, "Cannot remove recent System Paper thumbnails {error: %@}", v2, v3, v4, v5, v6);
  sub_230F42D6C();
}

void sub_230F472D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42DBC();
  sub_230F42D5C(&dword_230F3E000, v0, v1, "Removing recent System Paper thumbnails", v2, v3, v4, v5, v6);
  sub_230F42DA8();
}

void sub_230F47304()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230F42DBC();
  sub_230F42D5C(&dword_230F3E000, v0, v1, "Timed out while fetching migration state", v2, v3, v4, v5, v6);
  sub_230F42DA8();
}

uint64_t sub_230F47330()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_230F4733C()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_230F47348()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_230F47354()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_230F47360()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_230F4736C()
{
  return MEMORY[0x24BEE6250]();
}

uint64_t sub_230F47378()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_230F47384()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_230F47390()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230F4739C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230F473A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230F473B4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_230F473C0()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_230F473CC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_230F473D8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_230F473E4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_230F473F0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_230F473FC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_230F47408()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_230F47414()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_230F47420()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_230F4742C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230F47438()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230F47444()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_230F47450()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_230F4745C()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_230F47468()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_230F47474()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_230F47480()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_230F4748C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_230F47498()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_230F474A4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return MEMORY[0x24BE6DEA0]();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return MEMORY[0x24BE6DEB0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

