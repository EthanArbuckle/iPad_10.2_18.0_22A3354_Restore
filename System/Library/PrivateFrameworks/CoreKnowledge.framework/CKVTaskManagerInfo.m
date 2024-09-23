@implementation CKVTaskManagerInfo

- (CKVTaskManagerInfo)initWithRootDirectoryURL:(id)a3 error:(id *)a4
{
  id v6;
  CKVTaskManagerInfo *v7;
  uint64_t v8;
  KVDictionaryLog *log;
  uint64_t v10;
  CCSetChangeRegistry *changeRegistry;
  uint64_t v12;
  NSURL *donateDirectory;
  CKVTaskManagerInfo *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKVTaskManagerInfo;
  v7 = -[CKVTaskManagerInfo init](&v19, sel_init);
  if (!v7)
    goto LABEL_6;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D42BC8]), "initWithFilename:protectionClass:directory:readOnly:create:error:", CFSTR("Info"), 4, v6, 0, 1, a4);
  log = v7->_log;
  v7->_log = (KVDictionaryLog *)v8;

  if (!v7->_log
    || (v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0D410]), "initWithFilename:directory:protectionClass:error:", CFSTR("Registry"), v6, 0xFFFFFFFFLL, a4), changeRegistry = v7->_changeRegistry, v7->_changeRegistry = (CCSetChangeRegistry *)v10, changeRegistry, !v7->_changeRegistry))
  {
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Donate"), 1, v6);
  v12 = objc_claimAutoreleasedReturnValue();
  donateDirectory = v7->_donateDirectory;
  v7->_donateDirectory = (NSURL *)v12;

  KVGetOrCreateDirectoryURL();
  v14 = (CKVTaskManagerInfo *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("TaskHandlerInfo", v15);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

LABEL_6:
    v14 = v7;
  }
LABEL_8:

  return v14;
}

- (BOOL)clear:(id *)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__965;
  v11[4] = __Block_byref_object_dispose__966;
  v12 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CKVTaskManagerInfo_clear___block_invoke;
  block[3] = &unk_1E4D29220;
  block[4] = self;
  block[5] = &v7;
  block[6] = v11;
  dispatch_sync(queue, block);
  KVSetError();
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

- (id)schemaVersion
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__965;
  v10 = __Block_byref_object_dispose__966;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CKVTaskManagerInfo_schemaVersion__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)updateSchemaVersion:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__CKVTaskManagerInfo_updateSchemaVersion_error___block_invoke;
  v10[3] = &unk_1E4D29248;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (id)lastMaintenance
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__965;
  v10 = __Block_byref_object_dispose__966;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CKVTaskManagerInfo_lastMaintenance__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)recordMaintenanceCompleted:(id *)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKVTaskManagerInfo_recordMaintenanceCompleted___block_invoke;
  block[3] = &unk_1E4D29270;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)siriLanguageCode
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__965;
  v10 = __Block_byref_object_dispose__966;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CKVTaskManagerInfo_siriLanguageCode__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)dictationLanguageCodes
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__965;
  v10 = __Block_byref_object_dispose__966;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CKVTaskManagerInfo_dictationLanguageCodes__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)updateSiriLanguageCode:(id)a3 dictationLanguageCodes:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v16 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CKVTaskManagerInfo updateSiriLanguageCode:dictationLanguageCodes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = 0;
      _os_log_error_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_ERROR, "%s invalid Siri language code: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v19 = v17;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CKVTaskManagerInfo updateSiriLanguageCode:dictationLanguageCodes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_error_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_ERROR, "%s Unexpected dictation languages class: %@", buf, 0x16u);

    }
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v36[0] = v7;
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = CFSTR("siriLanguageCode");
  v35[1] = CFSTR("dictationLanguageCodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy__965;
  v33 = __Block_byref_object_dispose__966;
  v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CKVTaskManagerInfo_updateSiriLanguageCode_dictationLanguageCodes_error___block_invoke;
  block[3] = &unk_1E4D292C0;
  v25 = &v27;
  block[4] = self;
  v13 = v10;
  v23 = v13;
  v14 = v11;
  v24 = v14;
  v26 = buf;
  dispatch_sync(queue, block);
  KVSetError();
  v15 = *((_BYTE *)v28 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v27, 8);

LABEL_9:
  return v15;
}

- (BOOL)shouldRunMigration
{
  NSObject *queue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__965;
  v10 = __Block_byref_object_dispose__966;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[5] != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)recordMigrationCompletedWithSettings:(id)a3 error:(id *)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CKVTaskSettings buildVersion](CKVTaskSettings, "buildVersion");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[CKVTaskSettings projectNameAndSourceVersion](CKVTaskSettings, "projectNameAndSourceVersion");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriLanguageCode");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictationLanguageCodes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = v6;
  else
    v11 = &stru_1E4D29D08;
  v12 = v11;

  if (v7)
    v13 = v7;
  else
    v13 = &stru_1E4D29D08;
  v14 = v13;

  if (v9)
    v15 = v9;
  else
    v15 = &stru_1E4D29D08;
  v16 = v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  v38[0] = v12;
  v38[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v18;
  v38[3] = &unk_1E4D31BC8;
  v38[4] = v16;
  v38[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = CFSTR("migratedBuildVersion");
  v37[1] = CFSTR("migratedProjectVersion");
  v37[2] = CFSTR("lastMigration");
  v37[3] = CFSTR("migrationAttempts");
  v37[4] = CFSTR("siriLanguageCode");
  v37[5] = CFSTR("dictationLanguageCodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__965;
  v31[4] = __Block_byref_object_dispose__966;
  v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CKVTaskManagerInfo_recordMigrationCompletedWithSettings_error___block_invoke;
  block[3] = &unk_1E4D292C0;
  v29 = &v33;
  block[4] = self;
  v22 = v19;
  v27 = v22;
  v23 = v20;
  v28 = v23;
  v30 = v31;
  dispatch_sync(queue, block);
  KVSetError();
  LOBYTE(queue) = *((_BYTE *)v34 + 24) != 0;

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  return (char)queue;
}

- (BOOL)didCompleteMigrationMoreRecentlyThanMaintenance
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__CKVTaskManagerInfo_didCompleteMigrationMoreRecentlyThanMaintenance__block_invoke;
  v5[3] = &unk_1E4D29298;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSURL)donateDirectory
{
  return self->_donateDirectory;
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_donateDirectory, 0);
  objc_storeStrong((id *)&self->_migrationStartTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __69__CKVTaskManagerInfo_didCompleteMigrationMoreRecentlyThanMaintenance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("lastMigration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("lastMaintenance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "compare:", v3) == 1;
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    v2 = v4;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __65__CKVTaskManagerInfo_recordMigrationCompletedWithSettings_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "writeUpdatedObjects:forKeys:error:", v2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v7 = a1[4];
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
}

void __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  dispatch_time_t v25;
  __int128 v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD block[4];
  __int128 v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  _BYTE v35[10];
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  if (v2)
  {
    v3 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      objc_msgSend(v2, "ISO8601String");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
      v34 = 2112;
      *(_QWORD *)v35 = v5;
      _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Migration is currently in-progress from (%@)", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 8), "objectForKey:", CFSTR("migratedBuildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("migratedProjectVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("lastMigration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ISO8601String");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKVTaskSettings buildVersion](CKVTaskSettings, "buildVersion");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[CKVTaskSettings projectNameAndSourceVersion](CKVTaskSettings, "projectNameAndSourceVersion");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqual:](v11, "isEqual:", v7)
      && -[__CFString isEqual:](v12, "isEqual:", v8))
    {
      v13 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        v34 = 2112;
        *(_QWORD *)v35 = v10;
        *(_WORD *)&v35[8] = 2112;
        v36 = v11;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_INFO, "%s Migration already completed (%@) for version: %@|%@", buf, 0x2Au);
      }
    }
    else
    {
      v14 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("version: %@|%@ completed (%@)"), v7, v8, v10);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = CFSTR("no record of prior migration");
        }
        *(_DWORD *)buf = 136315906;
        v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        v34 = 2112;
        *(_QWORD *)v35 = v11;
        *(_WORD *)&v35[8] = 2112;
        v36 = v12;
        v37 = 2112;
        v38 = v15;
        _os_log_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_INFO, "%s Migration is required. Current version: %@|%@ global log shows %@", buf, 0x2Au);
        if (v10)

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("migrationAttempts"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedShortValue");

      v18 = CKLogContextVocabulary;
      if (v17 < 5)
      {
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
          v34 = 1024;
          *(_DWORD *)v35 = v17;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = 5;
          _os_log_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_INFO, "%s Prior migration attempts: %hu retry limit: %hu", buf, 0x18u);
        }
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17 + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        LOBYTE(v19) = objc_msgSend(v19, "writeUpdatedObject:forKey:error:", v20, CFSTR("migrationAttempts"), &v31);
        v21 = v31;

        if ((v19 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(v23 + 24);
          *(_QWORD *)(v23 + 24) = v22;

          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
          v25 = dispatch_time(0, 3600000000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          v26 = *(_OWORD *)(a1 + 32);
          v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
          block[2] = __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke_35;
          block[3] = &unk_1E4D29298;
          v30 = v26;
          dispatch_after(v25, v27, block);
        }
        else
        {
          v28 = CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
            v34 = 2112;
            *(_QWORD *)v35 = v21;
            _os_log_error_impl(&dword_1A48B3000, v28, OS_LOG_TYPE_ERROR, "%s Failed to record migration attempt: %@", buf, 0x16u);
          }
        }

      }
      else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
        v34 = 1024;
        *(_DWORD *)v35 = v17;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = 5;
        _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s Migration attempts (%hu) have reached retry limit: %hu", buf, 0x18u);
      }
    }

  }
}

void __40__CKVTaskManagerInfo_shouldRunMigration__block_invoke_35(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  if (v2 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "ISO8601String");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "-[CKVTaskManagerInfo shouldRunMigration]_block_invoke";
      v9 = 2112;
      v10 = &unk_1E4D31B98;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_ERROR, "%s Timed out waiting %@ seconds for migration from (%@) to complete.", (uint8_t *)&v7, 0x20u);

      v1 = *(_QWORD *)(a1 + 32);
      v2 = *(void **)(v1 + 24);
    }
    *(_QWORD *)(v1 + 24) = 0;

  }
}

void __74__CKVTaskManagerInfo_updateSiriLanguageCode_dictationLanguageCodes_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "writeUpdatedObjects:forKeys:error:", v2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

void __44__CKVTaskManagerInfo_dictationLanguageCodes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("dictationLanguageCodes"));
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  v4 = v5;
  if (v5)
  {

    v4 = v5;
  }

}

void __38__CKVTaskManagerInfo_siriLanguageCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("siriLanguageCode"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__CKVTaskManagerInfo_recordMaintenanceCompleted___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2, "writeUpdatedObject:forKey:error:", v3, CFSTR("lastMaintenance"), a1[6]);

}

void __37__CKVTaskManagerInfo_lastMaintenance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("lastMaintenance"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __48__CKVTaskManagerInfo_updateSchemaVersion_error___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "writeUpdatedObject:forKey:error:", a1[5], CFSTR("schemaVersion"), a1[7]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __35__CKVTaskManagerInfo_schemaVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("schemaVersion"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__CKVTaskManagerInfo_clear___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  id obj;

  v2 = *(void **)(a1[4] + 40);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "clearAllBookmarksAndCommit:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = *(void **)(a1[4] + 8);
    v6 = *(_QWORD *)(a1[6] + 8);
    v8 = *(id *)(v6 + 40);
    v7 = objc_msgSend(v5, "clear:", &v8);
    objc_storeStrong((id *)(v6 + 40), v8);
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
}

@end
