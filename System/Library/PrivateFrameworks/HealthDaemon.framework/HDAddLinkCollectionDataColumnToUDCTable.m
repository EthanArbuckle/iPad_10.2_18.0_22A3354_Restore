@implementation HDAddLinkCollectionDataColumnToUDCTable

uint64_t ___HDAddLinkCollectionDataColumnToUDCTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];

  v5 = HDSQLiteColumnAsInt64();
  v6 = *(id *)(a1 + 32);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_2;
  v20[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = v5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_3;
  v18[3] = &unk_1E6CE8CF8;
  v9 = v7;
  v19 = v9;
  if (objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_HDInsertSerializedUDCLinkDataForConceptWithIdentifier_enumerateStatementKey, a3, &__block_literal_global_147, v20, v18))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D00]), "_initWithLinks:", v9);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_5;
      v15[3] = &unk_1E6CE82D8;
      v16 = v11;
      v17 = v5;
      v13 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_HDInsertSerializedUDCLinkDataForConceptWithIdentifier_updateStatementKey, a3, &__block_literal_global_245_1, v15, 0);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
