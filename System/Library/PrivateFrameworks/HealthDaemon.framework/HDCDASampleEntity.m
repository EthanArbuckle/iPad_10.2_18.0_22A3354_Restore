@implementation HDCDASampleEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("cda_documents");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_102;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDCDASampleEntity.m"), 74, CFSTR("Subclasses must override %s"), "+[HDCDASampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  if (objc_msgSend(v12, "prepareForSaving:", a7))
  {
    objc_msgSend(v12, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_compressedDocumentData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((unint64_t)objc_msgSend(v17, "length") <= 0x300000)
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
        v28[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v28[4] = a1;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
        v24[3] = &unk_1E6CE7C30;
        v20 = v14;
        v25 = v20;
        v26 = v18;
        v27 = v16;
        if (objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_5, a7, v28, v24, 0))v21 = v20;
        else
          v21 = 0;
        v19 = v21;

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Unable to save CDA sample with document data length (%ld) which is greater than maximum allowed data length (%ld)"), objc_msgSend(v18, "length"), 3145728);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 3, CFSTR("Unable to save CDA samples without document data."));
    }
    v19 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v19 = 0;
LABEL_15:

  return v19;
}

id __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?)"), v2, CFSTR("data_id"), CFSTR("document_data"), CFSTR("title"), CFSTR("patient_name"), CFSTR("author_name"), CFSTR("custodian_name"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __83__HDCDASampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
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

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  _HDSQLiteValueForData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 48), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 48), "patientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 48), "authorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 48), "custodianName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addCdaDocumentSamples:", a3);
  return a3 != 0;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "cdaDocumentSamples");
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDCDASampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDCDASampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end
