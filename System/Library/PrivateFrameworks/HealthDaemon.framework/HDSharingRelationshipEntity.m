@implementation HDSharingRelationshipEntity

+ (id)databaseTable
{
  return CFSTR("sharing_relationship");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharingRelationshipEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)insertOrReplaceWithRecipientIdentifier:(id)a3 dateModified:(id)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 databaseTransaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  objc_msgSend(a7, "protectedDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("recipient");
  v27[1] = CFSTR("date_modified");
  v27[2] = CFSTR("sync_provenance");
  v27[3] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __137__HDSharingRelationshipEntity_insertOrReplaceWithRecipientIdentifier_dateModified_syncProvenance_syncIdentity_databaseTransaction_error___block_invoke;
  v22[3] = &unk_1E6CF32F8;
  v23 = v14;
  v24 = v15;
  v25 = a5;
  v26 = a6;
  v18 = v15;
  v19 = v14;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v16, v17, a8, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __137__HDSharingRelationshipEntity_insertOrReplaceWithRecipientIdentifier_dateModified_syncProvenance_syncIdentity_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;

  HDStringRepresentationForRecipientIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("recipient"), v4);

  MEMORY[0x1BCCAB0E4](a2, CFSTR("date_modified"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 48));
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)deleteEntityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = a4;
  HDStringRepresentationForRecipientIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "deleteEntitiesInDatabase:predicate:error:", v10, v9, a5);
  return (char)a5;
}

+ (id)entityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0D29838];
  v8 = a4;
  HDStringRepresentationForRecipientIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("recipient"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)recipientIdentifierInDatabaseTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("recipient"), a3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB6BB8], "sharingRecipientIdentifierFromStringRepresentation:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Cannot create recipient identifier from string representation %@"), v5);
  }
  else
  {
    v9 = v6;
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    v8 = 0;
  }

  return v8;
}

- (id)dateModifiedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("date_modified"), a3, a4);
}

- (BOOL)setDateModified:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__HDSharingRelationshipEntity_setDateModified_databaseTransaction_error___block_invoke;
  v14[3] = &unk_1E6CE84C8;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v10, a5, v14);

  return (char)a5;
}

void __73__HDSharingRelationshipEntity_setDateModified_databaseTransaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0E4);
}

@end
