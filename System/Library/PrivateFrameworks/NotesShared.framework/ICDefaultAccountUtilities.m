@implementation ICDefaultAccountUtilities

+ (id)defaultAccount
{
  return (id)objc_msgSend(a1, "defaultAccountWithHTMLNoteContext:", 0);
}

+ (id)defaultAccountWithHTMLNoteContext:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD v53[4];
  id v54[2];
  _QWORD v55[4];
  _QWORD v56[2];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __CFString *)ICSettingsBundleID();
  CFPreferencesAppSynchronize(v5);
  v65 = 0;
  v66[0] = &v65;
  v66[1] = 0x3032000000;
  v66[2] = __Block_byref_object_copy__53;
  v66[3] = __Block_byref_object_dispose__53;
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("DefaultNotesAccount"));
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.9((uint64_t)v66, v6, v7);

  if (objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests"))
  {
    +[ICDefaultAccountUtilities _defaultAccountIdentifierForTests](ICDefaultAccountUtilities, "_defaultAccountIdentifierForTests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_storeStrong((id *)(v66[0] + 40), v8);
      v9 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.8((uint64_t)v66, v9, v10);

    }
  }
  objc_msgSend(v4, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke;
  v63[3] = &unk_1E76C73F8;
  v13 = v4;
  v64 = v13;
  objc_msgSend(v11, "performBlockAndWait:", v63);

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__53;
  v61 = __Block_byref_object_dispose__53;
  v62 = 0;
  v14 = *(void **)(v66[0] + 40);
  if (!v14)
    goto LABEL_28;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("DeviceLocalAccount")))
  {
    objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", *MEMORY[0x1E0D643A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v17 = os_log_create("com.apple.notes", "Accounts");
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.6();

      objc_msgSend(v13, "managedObjectContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v12;
      v55[1] = 3221225472;
      v55[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_9;
      v55[3] = &unk_1E76C7730;
      v56[1] = &v57;
      v56[0] = v13;
      objc_msgSend(v19, "performBlockAndWait:", v55);

      v20 = (id *)v56;
    }
    else
    {
      if (v18)
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.7();

      v53[0] = v12;
      v53[1] = 3221225472;
      v53[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_11;
      v53[3] = &unk_1E76C7730;
      v54[1] = &v57;
      v54[0] = v3;
      objc_msgSend(v54[0], "performBlockAndWait:", v53);
      v20 = v54;
    }

  }
  if (!v58[5])
  {
    v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.5();

    objc_msgSend(v13, "managedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v12;
    v49[1] = 3221225472;
    v49[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_13;
    v49[3] = &unk_1E76C7A60;
    v51 = &v65;
    v23 = v13;
    v50 = v23;
    v52 = &v57;
    objc_msgSend(v22, "performBlockAndWait:", v49);

    if (!v58[5])
    {
      v24 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.4();

      v45[0] = v12;
      v45[1] = 3221225472;
      v45[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14;
      v45[3] = &unk_1E76C7A60;
      v47 = &v57;
      v25 = v3;
      v46 = v25;
      v48 = &v65;
      objc_msgSend(v25, "performBlockAndWait:", v45);
      v68 = 0;
      v69 = &v68;
      v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__53;
      v72 = __Block_byref_object_dispose__53;
      ICProtocolCast();
      v73 = (id)objc_claimAutoreleasedReturnValue();
      if (v69[5])
      {
        objc_msgSend(v23, "managedObjectContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v12;
        v40[1] = 3221225472;
        v40[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2;
        v40[3] = &unk_1E76CF3F8;
        v41 = v25;
        v43 = &v68;
        v42 = v23;
        v44 = &v57;
        objc_msgSend(v26, "performBlockAndWait:", v40);

      }
      _Block_object_dispose(&v68, 8);

      if (!v58[5])
      {
LABEL_28:
        v27 = os_log_create("com.apple.notes", "Accounts");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.3();

        objc_msgSend(v13, "managedObjectContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v12;
        v37[1] = 3221225472;
        v37[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_117;
        v37[3] = &unk_1E76C7730;
        v39 = &v57;
        v38 = v13;
        objc_msgSend(v28, "performBlockAndWait:", v37);

        if (!v58[5])
        {
          v29 = os_log_create("com.apple.notes", "Accounts");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.2();

          v34[0] = v12;
          v34[1] = 3221225472;
          v34[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118;
          v34[3] = &unk_1E76C76B0;
          v35 = v3;
          v36 = &v57;
          objc_msgSend(v35, "performBlockAndWait:", v34);

        }
      }
    }
  }
  v30 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)v58[5], "objectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:].cold.1(v31, (uint64_t)&v68, v30);
  }

  v32 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v65, 8);
  return v32;
}

uint64_t __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOrDeleteLocalAccountIfNecessary");
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localAccount");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "didChooseToMigrate"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_13_cold_1();

  }
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountForAccountId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__53;
  v13 = __Block_byref_object_dispose__53;
  v14 = 0;
  v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_3;
  v8[3] = &unk_1E76CA9D0;
  v3 = *(_QWORD *)(a1 + 48);
  v8[4] = &v9;
  v8[5] = v3;
  objc_msgSend(v2, "performBlockAndWait:", v8);
  v4 = v10[5];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "accountType") == 1 && objc_msgSend(v6, "didChooseToMigrate"))
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);
  }

  _Block_object_dispose(&v9, 8);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[ICLegacyAccountUtilities accountIdentifierForAccount:](ICLegacyAccountUtilities, "accountIdentifierForAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_117(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ICAccount cloudKitIfMigratedElseLocalAccountInContext:](ICAccount, "cloudKitIfMigratedElseLocalAccountInContext:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  ICCheckedDynamicCast();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsEnabledForNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountForAccountId:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v31 = v5;
      objc_msgSend(v5, "childAccounts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v33;
        v15 = *MEMORY[0x1E0C8EED8];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v17, "accountType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "syncableDataclasses");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "containsObject:", v15);

            if (v20)
            {
              objc_opt_class();
              ICCheckedDynamicCast();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "accountForAccountId:", v22);
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v25 = *(void **)(v24 + 40);
              *(_QWORD *)(v24 + 40) = v23;

              goto LABEL_13;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_13:

      v5 = v31;
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v26 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118_cold_1();

    objc_opt_class();
    ICCheckedDynamicCast();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localAccount");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
}

+ (void)_setDefaultAccountIdentifierForTests:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  v4 = (void *)ICDefaultAccountIdentifierLockForTests;
  ICDefaultAccountIdentifierLockForTests = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
}

+ (id)_defaultAccountIdentifierForTests
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  v2 = (id)ICDefaultAccountIdentifierLockForTests;
  os_unfair_lock_unlock((os_unfair_lock_t)&ICDefaultAccountIdentifierLock);
  return v2;
}

+ (void)setDefaultAccountIdentifier:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D64270], "setObject:forKey:", a3, CFSTR("DefaultNotesAccount"));
  objc_msgSend(MEMORY[0x1E0D642A0], "sharedWidget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadTimelinesWithReason:", CFSTR("Default account has changed"));

}

+ (id)defaultFolderWithHTMLNoteContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  int v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  objc_msgSend(a1, "defaultAccountWithHTMLNoteContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__53;
  v20 = __Block_byref_object_dispose__53;
  v21 = 0;
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ic_isModernAccountType");

  if (v7)
  {
    objc_msgSend(v5, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke;
    v15[3] = &unk_1E76C7730;
    v15[5] = &v16;
    v9 = v15;
    v15[4] = v5;
    objc_msgSend(v8, "performBlockAndWait:", v15);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v5, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ic_isLegacyAccountType");

  if (v11)
  {
    objc_msgSend(v5, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke_2;
    v14[3] = &unk_1E76C7730;
    v14[5] = &v16;
    v9 = v14;
    v14[4] = v5;
    objc_msgSend(v8, "performBlockAndWait:", v14);
    goto LABEL_5;
  }
LABEL_6:
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultFolder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__ICDefaultAccountUtilities_defaultFolderWithHTMLNoteContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_opt_class();
  ICCheckedProtocolCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)accountToAddNewNoteWithTagSelection:(id)a3 modernContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    v9 = objc_msgSend(v6, "copyWithManagedObjectContext:", v7);

    v6 = (id)v9;
  }
  objc_msgSend(a1, "defaultAccountWithHTMLNoteContext:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEmpty"))
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend(v6, "tags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    objc_msgSend(v6, "tags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 == 1)
    {
      objc_msgSend(v15, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "account");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v11;
      v12 = v20;

    }
    else
    {
      objc_msgSend(v15, "ic_compactMap:", &__block_literal_global_62);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count") == 1)
      {
        objc_msgSend(v22, "anyObject");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = v11;
      }
      v12 = v23;

    }
  }

  return v12;
}

uint64_t __79__ICDefaultAccountUtilities_accountToAddNewNoteWithTagSelection_modernContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "account");
}

+ (void)defaultAccountWithHTMLNoteContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a3, (uint64_t)a3, "Retrieved default account {accountID: %@}", (uint8_t *)a2);

}

+ (void)defaultAccountWithHTMLNoteContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Falling back to default HTML account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Falling back to default modern account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching HTML account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching modern account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching modern local account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching HTML local account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)defaultAccountWithHTMLNoteContext:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Overriding default account ID for testing {accountID: %@}", (uint8_t *)&v4);
}

+ (void)defaultAccountWithHTMLNoteContext:(uint64_t)a3 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Retrieved default account ID from settings {accountID: %@}", (uint8_t *)&v4);
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Ignoring unmigrated modern account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Using migrated modern account for HTML account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __63__ICDefaultAccountUtilities_defaultAccountWithHTMLNoteContext___block_invoke_118_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Falling back to local HTML account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
