@implementation ICMigrationUtilities

+ (void)fetchMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__ICMigrationUtilities_fetchMigrationStateForAccountID_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E76CB3B8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:", a3, v8);

}

uint64_t __78__ICMigrationUtilities_fetchMigrationStateForAccountID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  return result;
}

+ (void)fetchMigrationStateAndUserRecordForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[8];
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;
  _QWORD v29[3];
  char v30;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = +[ICCloudContext newNotesContainerForAccountID:](ICCloudContext, "newNotesContainerForAccountID:", v5);
  objc_msgSend(MEMORY[0x1E0C94E18], "fetchCurrentUserRecordOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  objc_msgSend(v8, "setQualityOfService:", 17);
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v7, "privateCloudDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDatabase:", v10);

  v11 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ICMigrationUtilities fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:].cold.1();

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__26;
  v23[4] = __Block_byref_object_dispose__26;
  v24 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E76CB3E0;
  v22[4] = v29;
  v22[5] = v27;
  v22[6] = v25;
  v22[7] = v23;
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v22);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5;
  v15[3] = &unk_1E76CB408;
  objc_copyWeak(&v21, &location);
  v13 = v6;
  v16 = v13;
  v17 = v29;
  v18 = v27;
  v19 = v25;
  v20 = v23;
  objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v15);
  objc_msgSend(v7, "privateCloudDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v8);

  objc_destroyWeak(&v21);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  objc_destroyWeak(&location);

}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Migration");
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_2();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DidChooseToMigrate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DidFinishMigration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DidMigrateOnMac"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v12, "BOOLValue");

    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = v6;
    v9 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1();
  }

}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_2((uint64_t)a1);

  if (v4)
  {
    v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1();

  }
  v7 = a1[4];
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v7 + 16))(v7, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), v4);

}

+ (void)fetchAndSetMigrationStateForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:withCompletionHandler:].cold.2();

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke;
      v20[3] = &unk_1E76CB458;
      v21 = v9;
      v22 = v6;
      v24 = a1;
      v23 = v7;
      objc_msgSend(a1, "fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:", v22, v20);

      v12 = v21;
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
    +[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v9, "primaryICloudACAccount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_15;
    }
    else
    {

    }
  }
  v16 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[ICMigrationUtilities fetchAndSetMigrationStateForAccountID:withCompletionHandler:].cold.1();

  if (v7)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D63F58];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("No CloudKit account while fetching migration state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 203, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v19);

    goto LABEL_14;
  }
LABEL_15:

}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke(uint64_t a1, char a2, char a3, char a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  char v24;
  char v25;
  char v26;

  v11 = a5;
  v12 = a6;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E76CB430;
  v19 = v12;
  v20 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v24 = a2;
  v25 = a3;
  v26 = a4;
  v21 = v14;
  v22 = v11;
  *(_OWORD *)v17 = *(_OWORD *)(a1 + 48);
  v15 = v17[0];
  v23 = *(_OWORD *)v17;
  v16 = v11;
  v17[0] = v12;
  objc_msgSend(v13, "performBlockAndWait:", v18);

}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iCloudACAccountWithIdentifier:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_11;
  }
  else
  {
    +[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "primaryICloudACAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_11;
  }
  if (v7)
  {
    if (v2)
      goto LABEL_13;
    v8 = objc_msgSend(v5, "didChooseToMigrate");
    v9 = *(unsigned __int8 *)(a1 + 80);
    if (v9 != v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x1E0D640D8], 0);

      objc_msgSend(v5, "setDidChooseToMigrate:", *(unsigned __int8 *)(a1 + 80));
    }
    objc_msgSend(v5, "setDidFinishMigration:", *(unsigned __int8 *)(a1 + 81));
    objc_msgSend(v5, "setDidMigrateOnMac:", *(unsigned __int8 *)(a1 + 82));
    objc_msgSend(v5, "setServerRecord:", *(_QWORD *)(a1 + 56));
    v11 = *(void **)(a1 + 72);
    v12 = *(unsigned __int8 *)(a1 + 80);
    v13 = *(unsigned __int8 *)(a1 + 81);
    v14 = *(unsigned __int8 *)(a1 + 82);
    objc_msgSend(v7, "accountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveDidChooseToMigrate:didFinishMigration:didMigrateOnMac:toACAccount:inStore:completionHandler:", v12, v13, v14, v7, v15, 0);

    v2 = 0;
    if (v9 != v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D640D0];
      v24 = *MEMORY[0x1E0D640C8];
      objc_msgSend(v5, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:userInfo:](v16, "postNotificationName:object:userInfo:", v17, 0, v19);

      v2 = 0;
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_11:
  if (v2)
    goto LABEL_13;
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0D63F58];
  v26 = *MEMORY[0x1E0CB2D50];
  v27[0] = CFSTR("No CloudKit account after fetching migration state");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 203, v22);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
LABEL_13:
    v16 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2_cold_1();
    goto LABEL_15;
  }
LABEL_16:
  v23 = *(_QWORD *)(a1 + 64);
  if (v23)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v23 + 16))(v23, objc_msgSend(v5, "didChooseToMigrate"), objc_msgSend(v5, "didFinishMigration"), v2);

}

+ (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 didMigrateOnMac:(BOOL)a5 toACAccount:(id)a6 inStore:(id)a7 completionHandler:(id)a8
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  BOOL v37;
  BOOL v38;
  char v39;
  uint8_t buf[4];
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v31 = a5;
  v32 = a4;
  v33 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a7;
  v12 = a8;
  v13 = os_log_create("com.apple.notes", "Migration");
  v30 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v41 = v33;
    v42 = 1024;
    v43 = v32;
    v44 = 1024;
    v45 = v31;
    v46 = 2112;
    v47 = v28;
    _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Trying to set didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", buf, 0x1Eu);

  }
  v14 = *MEMORY[0x1E0D63E90];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E90]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D63E98];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63E98]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D63EA0];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63EA0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v15, "BOOLValue");
  v21 = objc_msgSend(v17, "BOOLValue");
  v22 = objc_msgSend(v19, "BOOLValue");
  if (!v15 || !v17 || !v19 || ((v20 ^ v33) & 1) != 0 || ((v21 ^ v32) & 1) != 0 || v22 != v31)
  {
    v24 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v41 = v33;
      v42 = 1024;
      v43 = v32;
      v44 = 1024;
      v45 = v31;
      v46 = 2112;
      v47 = v29;
      _os_log_debug_impl(&dword_1BD918000, v24, OS_LOG_TYPE_DEBUG, "Actually setting didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", buf, 0x1Eu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, v18);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke;
    v34[3] = &unk_1E76CB480;
    v37 = v33;
    v38 = v32;
    v39 = v31;
    v35 = v10;
    v36 = v12;
    v23 = v30;
    objc_msgSend(v30, "saveAccount:withCompletionHandler:", v35, v34);

  }
  else
  {
    v23 = v30;
    if (v12)
      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
  }

}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a3;
  v6 = os_log_create("com.apple.notes", "Migration");
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_2();
  }
  else
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_1(a1, v8);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

+ (void)updateLegacyAccountMigrationStateForModernAccount:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ICMigrationUtilities updateLegacyAccountMigrationStateForModernAccount:].cold.1(v3);

  v5 = objc_alloc_init(MEMORY[0x1E0D629F0]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke;
  v12[3] = &unk_1E76C73B0;
  v13 = v3;
  v14 = v5;
  v6 = v5;
  v7 = v3;
  v8 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
  v8[2](v8, v9, v10, v11);

}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[16];
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "accountType");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_2;
    v19[3] = &unk_1E76C7730;
    v21 = &v22;
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v6, "performBlockAndWait:", v19);

    +[ICLegacyAccountUtilities legacyAccountForPrimaryICloudAccountWithContext:](ICLegacyAccountUtilities, "legacyAccountForPrimaryICloudAccountWithContext:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v2 != 3)
    {
      v5 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", *MEMORY[0x1E0D643A0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
    *((_BYTE *)v23 + 24) = v4;

    +[ICLegacyAccountUtilities legacyAccountForLocalAccountWithContext:](ICLegacyAccountUtilities, "legacyAccountForLocalAccountWithContext:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    v7 = objc_msgSend(v5, "didChooseToMigrate");
    if (*((unsigned __int8 *)v23 + 24) != v7)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "didFinishMigration"))
      {
        v8 = (void *)MEMORY[0x1E0D641A8];
        objc_msgSend(v5, "accountIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "markAccountReindexedForMigration:", v9);

        v10 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "accountIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_3(v11, (uint64_t)v27, v10);
        }

      }
      v12 = os_log_create("com.apple.notes", "Migration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "accountIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_2(v13, (uint64_t)v26, v12);
      }

      objc_msgSend(v5, "setDidChooseToMigrate:", *((unsigned __int8 *)v23 + 24));
      v14 = *(void **)(a1 + 40);
      v18 = 0;
      v15 = objc_msgSend(v14, "save:", &v18);
      v16 = v18;
      if ((v15 & 1) == 0)
      {
        v17 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_1();

      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v22, 8);

}

uint64_t __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "didChooseToMigrate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)updateAllLegacyAccountMigrationStatesInContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ICMigrationUtilities updateAllLegacyAccountMigrationStatesInContext:].cold.1();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ICMigrationUtilities_updateAllLegacyAccountMigrationStatesInContext___block_invoke;
  v7[3] = &unk_1E76CAB58;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

void __71__ICMigrationUtilities_updateAllLegacyAccountMigrationStatesInContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "updateLegacyAccountMigrationStateForModernAccount:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)deleteMigratedHTMLAccountsInContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ICMigrationUtilities_deleteMigratedHTMLAccountsInContext___block_invoke;
  v6[3] = &unk_1E76CAB58;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

void __60__ICMigrationUtilities_deleteMigratedHTMLAccountsInContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "deleteMigratedHTMLAccountIfNecessaryForModernAccount:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)deleteMigratedHTMLAccountIfNecessaryForModernAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "didFinishMigration"))
  {
    v4 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[ICMigrationUtilities deleteMigratedHTMLAccountIfNecessaryForModernAccount:].cold.1(v3);

    ICNewLegacyContext();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke;
    v9[3] = &unk_1E76C7708;
    v10 = v3;
    v11 = v5;
    v12 = v6;
    v7 = v6;
    v8 = v5;
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "accountType");
  if (v3 == 1)
  {
    +[ICLegacyAccountUtilities legacyAccountForICloudAccount:context:](ICLegacyAccountUtilities, "legacyAccountForICloudAccount:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 3)
      goto LABEL_9;
    +[ICLegacyAccountUtilities legacyAccountForLocalAccountWithContext:](ICLegacyAccountUtilities, "legacyAccountForLocalAccountWithContext:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (v4)
  {
    v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_2(v2);

    objc_opt_class();
    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICCheckedDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceDeleteAccount:", v8);

    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", CFSTR("Deleting migrated HTML account"));
    goto LABEL_12;
  }
LABEL_9:
  v5 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_1(v2);

LABEL_12:
}

+ (void)fetchMigrationStateAndUserRecordForAccountID:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Fetching migration state from user record: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Per-record error fetching user record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetched user record", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching user record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetch user record operation completed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)fetchAndSetMigrationStateForAccountID:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Trying to fetch migration state with no CloudKit account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)fetchAndSetMigrationStateForAccountID:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching and setting migration state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __84__ICMigrationUtilities_fetchAndSetMigrationStateForAccountID_withCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error while fetching and setting migration state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  int v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(unsigned __int8 *)(a1 + 49);
  v5 = *(unsigned __int8 *)(a1 + 50);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109890;
  v7[1] = v3;
  v8 = 1024;
  v9 = v4;
  v10 = 1024;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Saved didChooseToMigrate=%d didFinishMigration=%d didMigrateOnMac=%d on ACAccount (%@)", (uint8_t *)v7, 0x1Eu);

}

void __120__ICMigrationUtilities_saveDidChooseToMigrate_didFinishMigration_didMigrateOnMac_toACAccount_inStore_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error saving migration state to ACAccount: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)updateLegacyAccountMigrationStateForModernAccount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Updating migration state for HTML account associated with %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error saving legacy context after updating migration state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a3, (uint64_t)a3, "Updating migration state for legacy account %@", (uint8_t *)a2);

}

void __74__ICMigrationUtilities_updateLegacyAccountMigrationStateForModernAccount___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a3, (uint64_t)a3, "Marked this legacy account to avoid it triggering reindexing %@", (uint8_t *)a2);

}

+ (void)updateAllLegacyAccountMigrationStatesInContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Updating all account migration states", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)deleteMigratedHTMLAccountIfNecessaryForModernAccount:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to delete HTML account for modern account %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Couldn't find HTML account for modern account %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __77__ICMigrationUtilities_deleteMigratedHTMLAccountIfNecessaryForModernAccount___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Deleting HTML account for modern account %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
