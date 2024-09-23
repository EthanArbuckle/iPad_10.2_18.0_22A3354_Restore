@implementation HDSharingAuthorizationsEntity

+ (id)databaseTable
{
  return CFSTR("sharing_authorizations");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharingAuthorizationsEntityColumnDefinitions;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("recipient");
  v3[1] = CFSTR("authorization_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertOrReplaceWithRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  char v19;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  objc_msgSend(a1, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:error:", v10, v12, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;
  v15 = v14;
  if (!v13)
  {
    v15 = v14;
    if (v15)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    goto LABEL_18;
  }
  if (objc_msgSend(v13, "count"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __120__HDSharingAuthorizationsEntity_insertOrReplaceWithRecipientIdentifier_sharingAuthorizations_databaseTransaction_error___block_invoke;
    v22[3] = &unk_1E6CE8328;
    v23 = v11;
    objc_msgSend(v13, "hk_filter:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "count"))
    {
LABEL_6:

      goto LABEL_7;
    }
    v21 = v15;
    v17 = objc_msgSend(a1, "deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:", v16, v10, v12, &v21);
    v18 = v21;

    if ((v17 & 1) != 0)
    {
      v15 = v18;
      goto LABEL_6;
    }
    v15 = v18;
    if (v15)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
LABEL_7:
  v19 = objc_msgSend(a1, "addSharingAuthorizations:forRecipientIdentifier:databaseTransaction:error:", v11, v10, v12, a6);
LABEL_19:

  return v19;
}

uint64_t __120__HDSharingAuthorizationsEntity_insertOrReplaceWithRecipientIdentifier_sharingAuthorizations_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (BOOL)addSharingAuthorizations:(id)a3 forRecipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  void *v6;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  id *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v24 = a6;
    v16 = 0;
    v17 = *(_QWORD *)v31;
    while (2)
    {
      v18 = 0;
      v6 = v16;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
        v29 = v6;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __107__HDSharingAuthorizationsEntity_addSharingAuthorizations_forRecipientIdentifier_databaseTransaction_error___block_invoke;
        v26[3] = &unk_1E6CE7750;
        v27 = v12;
        v28 = v19;
        v20 = objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR IGNORE INTO sharing_authorizations (recipient, authorization_identifier, display_name, display_subtitle) VALUES (?, ?, ?, ?)"), &v29, v26, 0);
        v16 = v29;

        if ((v20 & 1) == 0)
        {
          v21 = v16;
          v22 = v21;
          LOBYTE(v6) = v21 == 0;
          if (v21)
          {
            if (v24)
              *v24 = objc_retainAutorelease(v21);
            else
              _HKLogDroppedError();
          }

          goto LABEL_16;
        }

        ++v18;
        v6 = v16;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v15)
        continue;
      break;
    }
LABEL_16:

  }
  else
  {
    v20 = 1;
  }

  return (v6 | v20) & 1;
}

void __107__HDSharingAuthorizationsEntity_addSharingAuthorizations_forRecipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  HDStringRepresentationForRecipientIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  objc_msgSend(*(id *)(a1 + 40), "authorizationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindStringToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  objc_msgSend(*(id *)(a1 + 40), "displaySubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "displaySubtitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindStringToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }
}

+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "sharingAuthorizationsForRecipientIdentifier:databaseTransaction:includeMarkedForDeletion:error:", a3, a4, 0, a5);
}

+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 includeMarkedForDeletion:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0D29838];
  HDStringRepresentationForRecipientIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("delete_on_commit"), MEMORY[0x1E0C9AAA0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D29840];
    v21[0] = v14;
    v21[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateMatchingAllPredicates:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
  }
  +[HDSharingAuthorizationsEntity _sharingAuthorizationsForRecipientIdentifier:databaseTransaction:predicate:error:]((uint64_t)a1, v11, v14, (uint64_t)a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_sharingAuthorizationsForRecipientIdentifier:(uint64_t)a1 databaseTransaction:(void *)a2 predicate:(void *)a3 error:(uint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "databaseForEntityClass:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "queryWithDatabase:predicate:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("authorization_identifier");
  v19[1] = CFSTR("display_name");
  v19[2] = CFSTR("display_subtitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__HDSharingAuthorizationsEntity__sharingAuthorizationsForRecipientIdentifier_databaseTransaction_predicate_error___block_invoke;
  v17[3] = &unk_1E6CF6008;
  v18 = v9;
  v13 = v9;
  if (objc_msgSend(v11, "enumerateProperties:error:enumerationHandler:", v12, a4, v17))
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

+ (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  v10 = a3;
  HDStringRepresentationForRecipientIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("delete_on_commit"), MEMORY[0x1E0C9AAB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D29840];
  v19[0] = v12;
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSharingAuthorizationsEntity _sharingAuthorizationsForRecipientIdentifier:databaseTransaction:predicate:error:]((uint64_t)a1, v9, v16, (uint64_t)a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)recipientIdentifiersForSharingAuthorization:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  const __CFString *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  v12 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v8, "authorizationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("authorization_identifier"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(v8, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithProperty:equalToValue:", CFSTR("display_name"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("display_name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)MEMORY[0x1E0D29840];
  v32[0] = v14;
  v32[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateMatchingAllPredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "databaseForEntityClass:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = CFSTR("recipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __103__HDSharingAuthorizationsEntity_recipientIdentifiersForSharingAuthorization_databaseTransaction_error___block_invoke;
  v29[3] = &unk_1E6CF6008;
  v30 = v11;
  v25 = v11;
  if (objc_msgSend(v23, "enumerateProperties:error:enumerationHandler:", v24, a5, v29))
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

uint64_t __103__HDSharingAuthorizationsEntity_recipientIdentifiersForSharingAuthorization_databaseTransaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB6BB8], "sharingRecipientIdentifierFromStringRepresentation:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
  return 1;
}

+ (BOOL)deleteSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  return +[HDSharingAuthorizationsEntity _deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:]((uint64_t)a1, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_deleteSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a2;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_self();
  objc_msgSend(v9, "databaseForEntityClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D29838];
  HDStringRepresentationForRecipientIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[HDSharingAuthorizationsEntity _predicateForSharingAuthorizations:]((uint64_t)v11, v8);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v19 = 1;
      goto LABEL_6;
    }
    v17 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  v19 = objc_msgSend(v11, "deleteEntitiesInDatabase:predicate:error:", v12, v15, a5);
LABEL_6:

  return v19;
}

+ (BOOL)deleteAllSharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return +[HDSharingAuthorizationsEntity _deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:]((uint64_t)a1, 0, a3, a4, (uint64_t)a5);
}

+ (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D29838];
  HDStringRepresentationForRecipientIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSharingAuthorizationsEntity _predicateForSharingAuthorizations:]((uint64_t)a1, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("delete_on_commit");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v18, v17, v12, a6, &__block_literal_global_196);

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (id)_predicateForSharingAuthorizations:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "hk_map:", &__block_literal_global_217);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __116__HDSharingAuthorizationsEntity_markSharingAuthorizationsForDeletion_recipientIdentifier_databaseTransaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (BOOL)deleteAllMarkedSharingAuthorizationsWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("delete_on_commit"), MEMORY[0x1E0C9AAB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v6, v7, a4);

  return (char)a4;
}

id __68__HDSharingAuthorizationsEntity__predicateForSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(a2, "authorizationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", CFSTR("authorization_identifier"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __114__HDSharingAuthorizationsEntity__sharingAuthorizationsForRecipientIdentifier_databaseTransaction_predicate_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNonEmptyString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNonEmptyString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6B90]), "initWithAuthorizationIdentifier:displayName:displaySubtitle:", v2, v3, v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  return 1;
}

@end
