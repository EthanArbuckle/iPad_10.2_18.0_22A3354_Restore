@implementation _DPToolCommand

+ (id)supportedCommands
{
  if (supportedCommands_onceToken != -1)
    dispatch_once(&supportedCommands_onceToken, &__block_literal_global_9);
  return (id)_DPToolSupportedCommands;
}

+ (id)supportedMetadataKeys
{
  if (supportedMetadataKeys_onceToken != -1)
    dispatch_once(&supportedMetadataKeys_onceToken, &__block_literal_global_50);
  return (id)_DPToolSupportedMetadataKeys;
}

- (_DPToolCommand)init
{

  return 0;
}

- (_DPToolCommand)initWithAction:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8
{
  _BOOL4 v8;
  id v15;
  id v16;
  id v17;
  _DPToolCommand *v18;
  _DPToolCommand *v19;
  uint64_t v20;
  void *storage;
  uint64_t v22;
  _DPStorage *v23;
  _DPToolCommand *v24;
  id v26;
  id v27;
  objc_super v28;

  v8 = a8;
  v27 = a3;
  v26 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_DPToolCommand;
  v18 = -[_DPToolCommand init](&v28, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_6;
  objc_storeStrong((id *)&v18->_action, a3);
  objc_storeStrong((id *)&v19->_arguments, a4);
  objc_storeStrong((id *)&v19->_metadata, a5);
  objc_storeStrong((id *)&v19->_recordKey, a6);
  objc_storeStrong((id *)&v19->_databasePath, a7);
  v19->_writeOK = v8;
  if (v17)
  {
    +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v17, !v8, v26, v27);
    v20 = objc_claimAutoreleasedReturnValue();
    storage = v19->_storage;
    v19->_storage = (_DPStorage *)v20;
  }
  else
  {
    +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath", v26, v27);
    storage = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", storage, !v8);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v19->_storage;
    v19->_storage = (_DPStorage *)v22;

  }
  if (!v19->_storage)
    v24 = 0;
  else
LABEL_6:
    v24 = v19;

  return v24;
}

+ (id)command:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAction:arguments:metadata:recordKey:databasePath:writeOK:", v18, v17, v16, v15, v14, v8);

  return v19;
}

- (BOOL)executeCommand
{
  NSString **p_action;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FILE **v9;
  uint64_t i;
  FILE *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_action = &self->_action;
  if (-[NSString isEqualToString:](self->_action, "isEqualToString:", CFSTR("recordnumbers")))
    return -[_DPToolCommand recordNumbers:metadata:forKey:](self, "recordNumbers:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordnumbersvectors")))
    return -[_DPToolCommand recordNumbersVectors:metadata:forKey:](self, "recordNumbersVectors:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordbitvalues")))
    return -[_DPToolCommand recordBitValues:metadata:forKey:](self, "recordBitValues:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordbitvectors")))
    return -[_DPToolCommand recordBitVectors:metadata:forKey:](self, "recordBitVectors:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordfloatvectors")))
    return -[_DPToolCommand recordFloatVectors:metadata:forKey:](self, "recordFloatVectors:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordstrings")))
    return -[_DPToolCommand recordStrings:metadata:forKey:](self, "recordStrings:metadata:forKey:", self->_arguments, self->_metadata, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("recordwords")))
    return -[_DPToolCommand recordWords:forKey:](self, "recordWords:forKey:", self->_arguments, self->_recordKey);
  if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("query")))
  {
    -[_DPToolCommand queryForKey:](self, "queryForKey:", self->_recordKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      v9 = (FILE **)MEMORY[0x1E0C80C20];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v11 = *v9;
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "description");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          fprintf(v11, "%s\n", (const char *)objc_msgSend(v12, "UTF8String"));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    return 1;
  }
  else if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("submitrecords")))
  {
    return -[_DPToolCommand submitRecordsForKey:](self, "submitRecordsForKey:", self->_recordKey);
  }
  else if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("listreports")))
  {
    return -[_DPToolCommand listReportsFor:](self, "listReportsFor:", self->_arguments);
  }
  else if (-[NSString isEqualToString:](*p_action, "isEqualToString:", CFSTR("listkeys")))
  {
    return -[_DPToolCommand listKeys](self, "listKeys");
  }
  else
  {
    +[_DPLog tool](_DPLog, "tool");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DPToolCommand executeCommand].cold.1((uint64_t)p_action, v13, v14, v15, v16, v17, v18, v19);

    return 0;
  }
}

- (BOOL)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _DPNumericDataRecorder *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dp_dictionaryFromJsonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPNumericDataRecorder initWithKey:]([_DPNumericDataRecorder alloc], "initWithKey:", v9);

  if (v11)
  {
    objc_msgSend(v7, "dp_numbersFromCSVString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[_DPNumericDataRecorder record:metadata:](v11, "record:metadata:", v12, v10);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = -[_DPNumericDataRecorder record:](v11, "record:", v12);
    }
    v14 = v13;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _DPNumericDataRecorder *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dp_dictionaryFromJsonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPNumericDataRecorder initWithKey:]([_DPNumericDataRecorder alloc], "initWithKey:", v9);

  if (v11)
  {
    objc_msgSend(v7, "dp_numbersVectorsFromCSVString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[_DPNumericDataRecorder recordNumbersVectors:metadata:](v11, "recordNumbersVectors:metadata:", v12, v10);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = -[_DPNumericDataRecorder recordNumbersVectors:](v11, "recordNumbersVectors:", v12);
    }
    v14 = v13;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _DPBitValueRecorder *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dp_dictionaryFromJsonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPBitValueRecorder initWithKey:]([_DPBitValueRecorder alloc], "initWithKey:", v9);

  if (v11)
  {
    objc_msgSend(v7, "dp_numbersFromCSVString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[_DPBitValueRecorder record:metadata:](v11, "record:metadata:", v12, v10);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = -[_DPBitValueRecorder record:](v11, "record:", v12);
    }
    v14 = v13;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  _DPBitValueRecorder *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[_DPBitValueRecorder initWithKey:]([_DPBitValueRecorder alloc], "initWithKey:", v9);

  if (v10)
  {
    objc_msgSend(v7, "dp_bitVectorsFromCSVString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dp_dictionaryFromJsonString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = -[_DPBitValueRecorder recordBitVectors:metadata:](v10, "recordBitVectors:metadata:", v11, v12);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        +[_DPLog tool](_DPLog, "tool");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[_DPToolCommand recordBitVectors:metadata:forKey:].cold.1((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);

        v14 = 0;
        goto LABEL_10;
      }
      v13 = -[_DPBitValueRecorder recordBitVectors:](v10, "recordBitVectors:", v11);
    }
    v14 = v13;
LABEL_10:

    goto LABEL_11;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _DPFloatValueRecorder *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dp_dictionaryFromJsonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPFloatValueRecorder initWithKey:]([_DPFloatValueRecorder alloc], "initWithKey:", v9);

  if (v11)
  {
    objc_msgSend(v7, "dp_floatVectorsFromCSVString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[_DPFloatValueRecorder recordFloatVectors:metadata:](v11, "recordFloatVectors:metadata:", v12, v10);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = -[_DPFloatValueRecorder recordFloatVectors:](v11, "recordFloatVectors:", v12);
    }
    v14 = v13;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _DPStringRecorder *v11;
  void *v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dp_dictionaryFromJsonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPStringRecorder initWithKey:]([_DPStringRecorder alloc], "initWithKey:", v9);

  if (v11)
  {
    objc_msgSend(v7, "dp_stringsFromCSVString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = -[_DPStringRecorder record:metadata:](v11, "record:metadata:", v12, v10);
    }
    else
    {
      if (objc_msgSend(v8, "length"))
      {
        v14 = 0;
        goto LABEL_8;
      }
      v13 = -[_DPStringRecorder record:](v11, "record:", v12);
    }
    v14 = v13;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)recordWords:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  _DPWordRecorder *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = -[_DPWordRecorder initWithKey:]([_DPWordRecorder alloc], "initWithKey:", v6);

  if (v7)
  {
    objc_msgSend(v5, "dp_wordRecordsFromCSVString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_DPWordRecorder record:](v7, "record:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)queryForKey:(id)a3
{
  id v5;
  NSString *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = self->_databasePath;
  v7 = !self->_writeOK;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[_DPRecordQueryPredicates entityForKey:](_DPRecordQueryPredicates, "entityForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject keyPatternsAllowed](v11, "keyPatternsAllowed"))
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:](_DPRecordQueryPredicates, "predicateForRecordsNotSubmittedForKeyBeginsWith:", v5);
      else
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKey:](_DPRecordQueryPredicates, "predicateForRecordsNotSubmittedForKey:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__6;
      v31 = __Block_byref_object_dispose__6;
      v32 = 0;
      v20 = dispatch_semaphore_create(0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __30___DPToolCommand_queryForKey___block_invoke;
      v23[3] = &unk_1E95D99D0;
      v25 = &v27;
      v26 = a2;
      v21 = v20;
      v24 = v21;
      objc_msgSend(v9, "fetchRecordsFor:predicate:fetchLimit:fetchOffset:withCompletion:", v10, v19, 1000, 0, v23);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      v12 = (id)v28[5];

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      +[_DPLog tool](_DPLog, "tool");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPToolCommand queryForKey:].cold.1((uint64_t)v5, v11, v13, v14, v15, v16, v17, v18);
      v12 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (BOOL)submitRecordsForKey:(id)a3
{
  id v4;
  NSString *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_databasePath;
  v6 = !self->_writeOK;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  v8 = (void *)objc_opt_new();
  +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generateReportForKeys:storage:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)listReportsFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("all")))
  {
    +[_DPReportFileManager submittedReports](_DPReportFileManager, "submittedReports");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("pending")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "reportsNotYetSubmitted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  NSLog(CFSTR("%@"), v4);

  v6 = 1;
LABEL_7:

  return v6;
}

- (BOOL)listKeys
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[_DPKeyNames allKeyNames](_DPKeyNames, "allKeyNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          if (objc_msgSend(v10, "keyPatternsAllowed"))
            v12 = CFSTR("%@*");
          else
            v12 = CFSTR("%@");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, v9);
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          puts((const char *)objc_msgSend(v13, "UTF8String"));

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { recordKey=%@ ; action=%@ ; arguments=%@ }"),
    v5,
    self->_recordKey,
    self->_action,
    self->_arguments);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)arguments
{
  return self->_arguments;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)writeOK
{
  return self->_writeOK;
}

- (_DPStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executeCommand
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Command (%@) not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)recordBitVectors:(uint64_t)a3 metadata:(uint64_t)a4 forKey:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Fail to parse metadata = (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)queryForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Fail to find entityName for key=(%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
