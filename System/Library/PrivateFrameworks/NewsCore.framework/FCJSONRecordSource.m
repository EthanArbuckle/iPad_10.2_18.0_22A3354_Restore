@implementation FCJSONRecordSource

- (id)recordIDPrefixes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[FCJSONRecordSource schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordIDPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FCJSONRecordSourceSchema)schema
{
  return self->_schema;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v6;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  char *v37;
  objc_class *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  _QWORD v62[2];
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  v47 = objc_alloc_init(MEMORY[0x1E0D626F8]);
  objc_msgSend(v47, "setBase:", v46);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("_recordName"));

  -[FCJSONRecordSource dateFormatter](self, "dateFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("_recordCreationDate"));

  -[FCJSONRecordSource dateFormatter](self, "dateFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v6;
  objc_msgSend(v6, "modificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("_recordModificationDate"));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[FCJSONRecordSource schema](self, "schema");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v54;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v23);
        -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v24;
        objc_msgSend(v51, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28
          || (objc_msgSend(v51, "objectForKeyedSubscript:", v27),
              (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[FCJSONRecordSource dateFormatter](self, "dateFormatter");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringFromDate:", v28);
            v31 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v31 = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
            v32 = objc_claimAutoreleasedReturnValue();

            v31 = v32;
          }
          v33 = (void *)MEMORY[0x1E0CB36D8];
          v63 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v33) = objc_msgSend(v33, "isValidJSONObject:", v34);

          if ((_DWORD)v33)
          {
            v35 = v28;

            v31 = v35;
            goto LABEL_16;
          }
          if (v31)
          {
LABEL_16:
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v31, v27);
            goto LABEL_17;
          }
          v36 = (void *)FCRecordSourceLog;
          if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
          {
            v31 = v36;
            -[FCJSONRecordSource schema](self, "schema");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "recordType");
            v37 = (char *)objc_claimAutoreleasedReturnValue();
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v58 = v37;
            v59 = 2112;
            v60 = v27;
            v61 = 2112;
            v62[0] = v39;
            _os_log_error_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_ERROR, "dropping record value that can't be encoded as JSON: %@.%@ = %@", buf, 0x20u);

LABEL_17:
          }

        }
        ++v23;
      }
      while (v21 != v23);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      v21 = v40;
    }
    while (v40);
  }

  v52 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v50, 0, &v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v52;
  if (v41)
  {
    v43 = v47;
    objc_msgSend(v47, "setJson:", v41);
  }
  else
  {
    v43 = v47;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to encode record as JSON with error: %@"), v42);
      *(_DWORD *)buf = 136315906;
      v58 = "-[FCJSONRecordSource recordFromCKRecord:base:]";
      v59 = 2080;
      v60 = "FCJSONRecordSource.m";
      v61 = 1024;
      LODWORD(v62[0]) = 220;
      WORD2(v62[0]) = 2114;
      *(_QWORD *)((char *)v62 + 6) = v45;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

  return v43;
}

- (NFLazy)dateFormatter
{
  return self->_dateFormatter;
}

- (int)pbRecordType
{
  return 9;
}

- (void)fetchRecordsWithIDs:(id)a3 cachePolicy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  -[FCRecordSource fetchOperationForRecordsWithIDs:](self, "fetchOperationForRecordsWithIDs:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCachePolicy:", objc_msgSend(v9, "cachePolicy"));
  objc_msgSend(v9, "maximumCachedAge");
  v12 = v11;

  objc_msgSend(v10, "setMaximumCachedAge:", v12);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke;
  v15[3] = &unk_1E463B608;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v10, "setFetchCompletionBlock:", v15);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v10);

  }
  else
  {
    objc_msgSend(v10, "start");
  }

}

uint64_t __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "json");
}

id __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "base");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recordType
{
  void *v2;
  void *v3;

  -[FCJSONRecordSource schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keyValueRepresentationOfRecord:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(v5, "json");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "JSONObjectWithData:options:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v10 = v8;

  return v10;
}

void __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_8_3, &__block_literal_global_10_2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, 0);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v6);
  }

}

- (id)localizableKeys
{
  void *v2;
  void *v3;

  -[FCJSONRecordSource schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizableKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nonLocalizableKeys
{
  void *v2;
  void *v3;

  -[FCJSONRecordSource schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)storeVersion
{
  return 2;
}

- (id)storeFilename
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[FCJSONRecordSource schema](self, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-record-source"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCJSONRecordSource)initWithSchema:(id)a3 contentDatabase:(id)a4 contentDirectory:(id)a5 experimentationSuffix:(id)a6 activeTreatmentID:(id)a7
{
  id v12;
  FCJSONRecordSource *v13;
  uint64_t v14;
  FCJSONRecordSourceSchema *schema;
  uint64_t v16;
  NFLazy *dateFormatter;
  objc_super v19;

  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCJSONRecordSource;
  v13 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:](&v19, sel_initWithContentDatabase_contentDirectory_appActivityMonitor_backgroundTaskable_experimentalizableFieldsPostfix_activeTreatmentID_, a4, a5, 0, 0, a6, a7);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    schema = v13->_schema;
    v13->_schema = (FCJSONRecordSourceSchema *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_125);
    dateFormatter = v13->_dateFormatter;
    v13->_dateFormatter = (NFLazy *)v16;

  }
  return v13;
}

- (id)alwaysLocalizedKeys
{
  void *v2;
  void *v3;

  -[FCJSONRecordSource schema](self, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alwaysLocalizedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __110__FCJSONRecordSource_initWithSchema_contentDatabase_contentDirectory_experimentationSuffix_activeTreatmentID___block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v0, "setFormatOptions:", 3955);
  return v0;
}

- (void)fetchRecordsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FCJSONRecordSource fetchRecordsWithIDs:cachePolicy:completion:](self, "fetchRecordsWithIDs:cachePolicy:completion:", v7, v8, v6);

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 2000000;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 5000000;
}

- (void)setSchema:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setDateFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
