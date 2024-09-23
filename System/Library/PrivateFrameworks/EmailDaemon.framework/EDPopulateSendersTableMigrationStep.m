@implementation EDPopulateSendersTableMigrationStep

void ___ef_log_EDPopulateSendersTableMigrationStep_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDPopulateSendersTableMigrationStep");
  v1 = (void *)_ef_log_EDPopulateSendersTableMigrationStep_log;
  _ef_log_EDPopulateSendersTableMigrationStep_log = (uint64_t)v0;

}

+ (BOOL)runWithConnection:(id)a3 sentMailboxURLs:(id)a4 contactStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "_clearSendersAddressesTableWithConnection:", v8)
    && objc_msgSend(a1, "_clearSendersTableWithConnection:", v8))
  {
    objc_msgSend(v9, "ef_compactMapSelector:", sel_absoluteString);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_allSenderAddressIDsWithConnection:sentMailboxURLStrings:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(a1, "_addressesForSenderIDs:withConnection:", v12, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v22 = 0;
        v23 = 0;
        objc_msgSend(a1, "_senderIDsGroupedByContactsForSenderAddressesToIDs:withContactStore:unmatchedEmailAddresses:otherEmailAddressesByContact:", v13, v10, &v23, &v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v23;
        v20 = v22;
        objc_msgSend(a1, "_senderIDsGroupedByContactsForEmailAddressesByContact:withConnection:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_combineDictionary:withDictionary:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(a1, "_insertSendersGroupedByContact:withConnection:", v16, v8))
        {
          objc_msgSend(a1, "_senderIDsGroupedBySimpleAddressForEmailAddresses:senderIDsByEmailAddress:", v21, v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(a1, "_insertGroupedSendersWithoutContact:withConnection:", v17, v8);

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_allSenderAddressIDsWithConnection:(id)a3 sentMailboxURLStrings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("recipients"));
  v8 = *MEMORY[0x1E0D1EE00];
  v9 = (id)objc_msgSend(v7, "join:sourceColumn:targetColumn:", CFSTR("addresses"), CFSTR("address"), *MEMORY[0x1E0D1EE00]);
  objc_msgSend(v7, "join:sourceColumn:targetColumn:", CFSTR("messages"), CFSTR("message"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "join:sourceColumn:targetColumn:", CFSTR("mailboxes"), CFSTR("mailbox"), v8);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("mailboxes"), CFSTR("url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "in:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhere:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__EDPopulateSendersTableMigrationStep__allSenderAddressIDsWithConnection_sentMailboxURLStrings___block_invoke;
  v22[3] = &unk_1E949AF78;
  v15 = v14;
  v23 = v15;
  v21 = 0;
  v16 = objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v7, v22, &v21);
  v17 = v21;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(v15, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _allSenderAddressIDsWithConnection:sentMailboxURLStrings:].cold.1();
    }

    v18 = 0;
  }

  return v18;
}

void __96__EDPopulateSendersTableMigrationStep__allSenderAddressIDsWithConnection_sentMailboxURLStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_addressesForSenderIDs:(id)a3 withConnection:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1F040]);
  v8 = *MEMORY[0x1E0D1EE00];
  v9 = (void *)objc_msgSend(v7, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("addresses"));
  objc_msgSend(v9, "addResultColumn:", CFSTR("comment"));
  objc_msgSend(v9, "addResultColumn:", CFSTR("address"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "in:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWhere:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__EDPopulateSendersTableMigrationStep__addressesForSenderIDs_withConnection___block_invoke;
  v21[3] = &unk_1E949AF78;
  v13 = v12;
  v22 = v13;
  v20 = 0;
  v14 = objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v9, v21, &v20);
  v15 = v20;
  v16 = v13;
  if ((v14 & 1) == 0)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _addressesForSenderIDs:withConnection:].cold.1();
    }

    v16 = 0;
  }
  v18 = v16;

  return v18;
}

void __77__EDPopulateSendersTableMigrationStep__addressesForSenderIDs_withConnection___block_invoke(uint64_t a1, void *a2)
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

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v8);
  objc_msgSend(v9, "setDisplayName:", v6);
  objc_msgSend(v9, "emailAddressValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v10);

}

+ (id)_senderIDsGroupedByContactsForEmailAddressesByContact:(id)a3 withConnection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D1F040]);
  v8 = (void *)objc_msgSend(v7, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("addresses"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke;
  v13[3] = &unk_1E949FBF8;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v10 = v8;
  objc_msgSend(v5, "ef_mapValues:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  id obj;
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v19;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v19);
  if (v3)
  {
    v4 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "simpleAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "equalTo:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("comment"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "equalTo:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_alloc(MEMORY[0x1E0D1EF90]);
          v28[0] = v9;
          v28[1] = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithExpressions:", v14);
          objc_msgSend(*(id *)(a1 + 32), "setWhere:", v15);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setWhere:", v9);
        }
        v17 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(a1 + 40);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke_2;
        v22[3] = &unk_1E949AF78;
        v23 = v21;
        objc_msgSend(v16, "executeSelectStatement:withBlock:error:", v17, v22, 0);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v3);
  }

  return v21;
}

void __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (BOOL)_insertSendersGroupedByContact:(id)a3 withConnection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __85__EDPopulateSendersTableMigrationStep__insertSendersGroupedByContact_withConnection___block_invoke;
  v14 = &unk_1E949FC20;
  v16 = &v25;
  v18 = a1;
  v7 = v6;
  v15 = v7;
  v17 = &v19;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &v11);
  if (*((_BYTE *)v26 + 24))
  {
    v8 = 1;
  }
  else
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v20[5], "ef_publicDescription", v11, v12, v13, v14);
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _insertSendersGroupedByContact:withConnection:].cold.1();
    }

    v8 = *((_BYTE *)v26 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

void __85__EDPopulateSendersTableMigrationStep__insertSendersGroupedByContact_withConnection___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id obj;

  v7 = a2;
  v8 = a3;
  v9 = a1[4];
  v10 = (void *)a1[7];
  v11 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "_insertSenderWithAddresses:contact:connection:error:", v8, v7, v9, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v12;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;

}

+ (BOOL)_insertGroupedSendersWithoutContact:(id)a3 withConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = 0;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    while (2)
    {
      v12 = 0;
      v13 = v9;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v19 = v13;
        v15 = objc_msgSend(a1, "_insertSenderWithAddresses:contact:connection:error:", v14, 0, v7, &v19);
        v9 = v19;

        if ((v15 & 1) == 0)
        {

          _ef_log_EDPopulateSendersTableMigrationStep();
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            +[EDPopulateSendersTableMigrationStep _insertGroupedSendersWithoutContact:withConnection:].cold.1();
          }

          v16 = 0;
          goto LABEL_13;
        }
        ++v12;
        v13 = v9;
      }
      while (v10 != v12);
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 1;
  v17 = v8;
LABEL_13:

  return v16;
}

+ (BOOL)_clearSendersTableWithConnection:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("senders"));
  v9[0] = 0;
  v5 = objc_msgSend(v3, "executeDeleteStatement:error:", v4, v9);
  v6 = v9[0];
  if (v6)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _clearSendersTableWithConnection:].cold.1();
    }

  }
  return v5;
}

+ (BOOL)_clearSendersAddressesTableWithConnection:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("sender_addresses"));
  v9[0] = 0;
  v5 = objc_msgSend(v3, "executeDeleteStatement:error:", v4, v9);
  v6 = v9[0];
  if (v6)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _clearSendersAddressesTableWithConnection:].cold.1();
    }

  }
  return v5;
}

+ (BOOL)_insertSenderWithAddresses:(id)a3 contact:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v24 = a4;
  v8 = a5;
  v23 = v8;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E94E4958, CFSTR("bucket"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E94E4970, CFSTR("user_initiated"));
  if (v24)
  {
    objc_msgSend(v24, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, CFSTR("contact_identifier"));

  }
  if (objc_msgSend(v8, "executeInsertStatement:error:", v25, a6, a6))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("sender_addresses"), 4);
    v11 = objc_msgSend(v8, "lastInsertedDatabaseID");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v22;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v10, "addValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("address"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("sender"));

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v18 = objc_msgSend(v23, "executeInsertStatement:error:", v10, v21);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_senderIDsGroupedByContactsForSenderAddressesToIDs:(id)a3 withContactStore:(id)a4 unmatchedEmailAddresses:(id *)a5 otherEmailAddressesByContact:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id *v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];

  v50[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = *MEMORY[0x1E0C966C0];
  v50[0] = *MEMORY[0x1E0C966D0];
  v50[1] = v11;
  v50[2] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = a6;
  objc_msgSend(v13, "ef_compactMapSelector:", sel_simpleAddress);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v38);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = v10;
  v33 = v9;
  v31 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke;
  v42[3] = &unk_1E949FC48;
  v16 = v10;
  v43 = v16;
  v17 = v12;
  v44 = v17;
  v18 = v34;
  v45 = v18;
  v19 = v9;
  v46 = v19;
  v20 = v35;
  v47 = v20;
  v21 = v37;
  v48 = v21;
  v22 = v14;
  v49 = v22;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v42, v31, v32, v33, v34, v35);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke_2;
  v39[3] = &unk_1E949FC70;
  v24 = v17;
  v40 = v24;
  v41 = v23;
  v25 = v23;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v39);
  v26 = objc_retainAutorelease(v22);
  *a5 = v26;
  v27 = objc_retainAutorelease(v25);
  *v36 = v27;
  v28 = v41;
  v29 = v18;

  return v29;
}

void __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
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
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v23 = a3;
  objc_msgSend(*(id *)(a1 + 32), "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v22, *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v21 = v6;
      objc_msgSend(v6, "addObject:", v23);
    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v23, 0, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_compactMapSelector:", sel_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "emailAddressValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "displayName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15 == 0;

              if (!v16)
                goto LABEL_20;
            }
            else
            {
              v17 = *(void **)(a1 + 64);
              objc_msgSend(v13, "simpleAddress");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v17, "containsObject:", v18);

              if ((v17 & 1) != 0)
                goto LABEL_20;
            }
            objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "ef_addObjectIfAbsent:", v5);
            }
            else
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
              objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:");
            }

          }
LABEL_20:

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v22);
  }

}

void __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v11, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "em_bestMatchForName:fromContacts:keysToCheck:", v7, v5, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ef_addObjectIfAbsent:", v11);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    }

  }
}

+ (id)_senderIDsGroupedBySimpleAddressForEmailAddresses:(id)a3 senderIDsByEmailAddress:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  objc_msgSend(a3, "ef_groupBy:", &__block_literal_global_56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_2;
  v11[3] = &unk_1E949FCE0;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "ef_compactMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "simpleAddress");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_3;
  v6[3] = &unk_1E949FCB8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ef_compactMap:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_notEmpty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_combineDictionary:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v14 = v6;
LABEL_6:
    v13 = v14;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v14 = v5;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke;
  v19[3] = &unk_1E949FD08;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v19);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke_2;
  v16[3] = &unk_1E949FD08;
  v17 = v5;
  v11 = v10;
  v18 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  v12 = v18;
  v13 = v11;

LABEL_7:
  return v13;
}

void __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v6;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_flatten");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);
  }

}

void __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

+ (void)_allSenderAddressIDsWithConnection:sentMailboxURLStrings:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to find recipients of sent messages with error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_addressesForSenderIDs:withConnection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to get addresses for recipients of sent messages: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_insertSendersGroupedByContact:withConnection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to insert senders with contacts with error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_insertGroupedSendersWithoutContact:withConnection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to insert senders without contacts with error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_clearSendersTableWithConnection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to clear senders table: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_clearSendersAddressesTableWithConnection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to clear sender addresses table: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
