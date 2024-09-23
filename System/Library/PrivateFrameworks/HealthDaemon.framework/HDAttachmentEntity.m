@implementation HDAttachmentEntity

+ (id)databaseTable
{
  return CFSTR("attachments");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDAttachmentEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)enumerateAttachmentsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97;
  v29 = __Block_byref_object_dispose__97;
  v30 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__HDAttachmentEntity_enumerateAttachmentsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6CEAC10;
  v24 = a1;
  v14 = v13;
  v21 = v14;
  v23 = &v25;
  v15 = v12;
  v22 = v15;
  v16 = +[HDSQLiteEntity enumerateEntitiesInDatabase:predicate:error:enumerationHandler:](HDAttachmentEntity, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v14, v10, a5, v20);
  v17 = (id)v26[5];
  v18 = v17;
  if (v17)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __93__HDAttachmentEntity_enumerateAttachmentsWithPredicate_transaction_error_enumerationHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  +[HDAttachmentEntity _attachmentForEntity:database:error:](v4, a2, v3, (uint64_t)&obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[6] + 8);
    v11 = *(id *)(v8 + 40);
    v9 = (*(uint64_t (**)(void))(v7 + 16))();
    objc_storeStrong((id *)(v8 + 40), v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_attachmentForEntity:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97;
  v16 = __Block_byref_object_dispose__97;
  v17 = 0;
  +[HDAttachmentEntity _propertiesForEntity]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HDAttachmentEntity__attachmentForEntity_database_error___block_invoke;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = &v12;
  objc_msgSend(v6, "getValuesForProperties:database:error:handler:", v8, v7, a4, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)attachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97;
  v22 = __Block_byref_object_dispose__97;
  v23 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HDAttachmentEntity_attachmentWithIdentifier_profile_error___block_invoke;
  v14[3] = &unk_1E6CEC940;
  v16 = &v18;
  v17 = a1;
  v11 = v8;
  v15 = v11;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

BOOL __61__HDAttachmentEntity_attachmentWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;

  v5 = *(void **)(a1 + 32);
  v18 = 0;
  v6 = a2;
  v7 = v5;
  v8 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("identifier"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anyInDatabase:predicate:error:", v10, v9, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[HDAttachmentEntity _attachmentForEntity:database:error:]((uint64_t)v8, v11, v10, (uint64_t)&v18);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  v13 = v18;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v12;

  v16 = v13;
  if (v16)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

  return v16 == 0;
}

+ (id)attachmentWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("identifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[HDAttachmentEntity _attachmentForEntity:database:error:]((uint64_t)a1, v12, v11, (uint64_t)a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_propertiesForEntity
{
  _QWORD v1[9];

  v1[8] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("identifier");
  v1[1] = CFSTR("name");
  v1[2] = CFSTR("type");
  v1[3] = CFSTR("hash");
  v1[4] = CFSTR("size");
  v1[5] = CFSTR("creation_date");
  v1[6] = CFSTR("metadata");
  v1[7] = CFSTR("encryption_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __58__HDAttachmentEntity__attachmentForEntity_database_error___block_invoke(uint64_t a1)
{
  HDAttachment *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = [HDAttachment alloc];
  HDSQLiteColumnWithNameAsUUID();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsData();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDAttachment initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:](v2, "initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:", v14, v3, v4, v5, v6, v7, v9, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

+ (id)_insertAttachment:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v8, "metadata"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        !v13))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDAttachmentEntity _propertiesForEntity]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__HDAttachmentEntity__insertAttachment_transaction_error___block_invoke;
    v18[3] = &unk_1E6CE84C8;
    v19 = v8;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v14, v15, a5, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

void __58__HDAttachmentEntity__insertAttachment_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("name"), v5);

  objc_msgSend(*(id *)(a1 + 32), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("type"), v6);

  objc_msgSend(*(id *)(a1 + 32), "fileHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("hash"), v7);

  MEMORY[0x1BCCAB114](a2, CFSTR("size"), objc_msgSend(*(id *)(a1 + 32), "size"));
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v8);

  objc_msgSend(*(id *)(a1 + 32), "encryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    JUMPOUT(0x1BCCAB120);
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_codableMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("metadata"), v13);

}

+ (id)_insertIfDoesNotExistAttachment:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v8, "metadata"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        !v13))
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("identifier"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(a1, "anyInDatabase:predicate:error:", v16, v15, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    if (v18)
    {
      if (a5)
      {
        v19 = 0;
        *a5 = objc_retainAutorelease(v18);
      }
      else
      {
        _HKLogDroppedError();
        v19 = 0;
      }
    }
    else
    {
      if (v17)
      {
        v20 = v17;
      }
      else
      {
        objc_msgSend(a1, "_insertAttachment:transaction:error:", v8, v9, a5);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v20;
    }

  }
  return v19;
}

@end
