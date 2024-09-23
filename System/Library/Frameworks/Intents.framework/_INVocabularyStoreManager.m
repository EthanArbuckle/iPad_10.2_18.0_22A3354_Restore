@implementation _INVocabularyStoreManager

+ (id)savedCustomVocabularyOverviewDictionary
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iterateVocabularyWithSummary:optionalBlock:", v3, 0);
  return v3;
}

- (id)deleteEverything
{
  NSObject *v3;
  NSString *appBundleID;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    appBundleID = self->_appBundleID;
    v10 = 136315394;
    v11 = "-[_INVocabularyStoreManager deleteEverything]";
    v12 = 2112;
    v13 = appBundleID;
    _os_log_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_INFO, "%s deleting user-vocabulary for %@", (uint8_t *)&v10, 0x16u);
  }
  -[_INVocabularyStoreManager baseDirectoryPath](self, "baseDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyStoreManager deleteVocabularyStoreItemAt:](self, "deleteVocabularyStoreItemAt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  notify_post("INVoocabularyChangedNotification");
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_appBundleID;
      v10 = 136315650;
      v11 = "-[_INVocabularyStoreManager deleteEverything]";
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Failed to delete user-vocabulary for %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return v6;
}

- (id)deleteVocabularyStoreItemAt:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_customVocabularyDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", v4) & 1) != 0)
  {
    INRemoveItemAtPath(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _CleanUpDirectoryAsNeeded(v6, v4);

      v5 = 0;
    }
  }
  else
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[_INVocabularyStoreManager deleteVocabularyStoreItemAt:]";
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Attempt to delete a files outside of the vocabulary-directory we manage. Offending file: %@", buf, 0x16u);
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2AA0];
    v12 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 4000, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (void)_iterateVocabularyWithSummary:(id)a3 optionalBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;

  v6 = a3;
  v23 = a4;
  objc_msgSend(a1, "_customVocabularyDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E23F96D8);
  v10 = (void *)MEMORY[0x1E0C99E60];
  +[_INVocabulary supportedVocabularyStringTypes](_INVocabulary, "supportedVocabularyStringTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v13 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke;
  v33[3] = &unk_1E2289D38;
  v36 = v37;
  v14 = v8;
  v34 = v14;
  v15 = v9;
  v35 = v15;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D7812C4](v33);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_39;
  v24[3] = &unk_1E2289DB0;
  v17 = v7;
  v25 = v17;
  v18 = v16;
  v29 = v18;
  v19 = v6;
  v26 = v19;
  v20 = v12;
  v27 = v20;
  v21 = v23;
  v31 = v37;
  v32 = a1;
  v30 = v21;
  v22 = v14;
  v28 = v22;
  ((void (**)(_QWORD, id, _QWORD *))v16)[2](v18, v17, v24);

  _Block_object_dispose(v37, 8);
}

+ (id)appDatastoreDirectoryForAppBundleID:(id)a3 bundlePath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "_hashOfAppPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_customVocabularyDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_customVocabularyDirectory
{
  void *v2;
  void *v3;

  INUserSupportDirectoryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CustomVocabulary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hashOfAppPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t i;
  unsigned __int8 md[8];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_QWORD *)md = 0;
  v9 = 0;
  v10 = 0;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 40);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);

  return v5;
}

- (void)checkIfSyncSlot:(id)a3 isAllowedWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSString *appBundleID;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _INVocabularyStringTypeFromSlotName(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_INVocabularyStoreManager _validator](self, "_validator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      appBundleID = self->_appBundleID;
      v11 = objc_msgSend(v8, "integerValue");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __69___INVocabularyStoreManager_checkIfSyncSlot_isAllowedWithCompletion___block_invoke;
      v13[3] = &unk_1E228BBD0;
      v14 = v7;
      objc_msgSend(v9, "determineIfBundleID:canProvideVocabularyOfType:completion:", appBundleID, v11, v13);

    }
    else
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[_INVocabularyStoreManager checkIfSyncSlot:isAllowedWithCompletion:]";
        v17 = 2114;
        v18 = v6;
        _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s '%{public}@' is not a valid slot", buf, 0x16u);
      }
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

- (void)_writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _INVocabularyGenerationDocument *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  -[_INVocabularyStoreManager _baseDirectoryPathForIntentSlot:](self, "_baseDirectoryPathForIntentSlot:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count")
    || (buf[0] = 0,
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, buf),
        v12,
        buf[0]))
  {
    -[_INVocabularyStoreManager _documentWithItems:forIntentSlot:](self, "_documentWithItems:forIntentSlot:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("LatestVocabulary.plist"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeToFile:createIntermediateDirectories:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[_INVocabularyStoreManager _writeLatestVocabularyItems:forIntentSlot:completion:]";
        v24 = 2114;
        v25 = v15;
        _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s error writing sync state %{public}@", buf, 0x16u);
      }
      v17 = v15;
      v18 = 0;
    }
    else
    {
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("SentVocabulary.plist"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_INVocabularyGenerationDocument initWithContentsOfFile:]([_INVocabularyGenerationDocument alloc], "initWithContentsOfFile:", v21);
      objc_msgSend(v13, "diffFromPreviousDocument:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "hasChanges");

    }
    v10[2](v10, v18, v15);

  }
  else
  {
    v10[2](v10, 0, 0);
  }

}

- (id)_validator
{
  _INVocabularyValidator *validator;
  _INVocabularyValidator *v4;
  _INVocabularyValidator *v5;

  validator = self->_validator;
  if (!validator)
  {
    v4 = objc_alloc_init(_INVocabularyValidator);
    v5 = self->_validator;
    self->_validator = v4;

    validator = self->_validator;
  }
  return validator;
}

- (id)_baseDirectoryPathForIntentSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("VoiceCommandNameType")))
    objc_msgSend((id)objc_opt_class(), "appDatastoreDirectoryForAppBundleID:bundlePath:", CFSTR("com.apple.siriVoiceShortcuts"), 0);
  else
    -[_INVocabularyStoreManager baseDirectoryPath](self, "baseDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)baseDirectoryPath
{
  return self->_baseDirectoryPath;
}

- (id)_documentWithItems:(id)a3 forIntentSlot:(id)a4
{
  id v6;
  id v7;
  _INVocabularyGenerationDocument *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_INVocabularyGenerationDocument);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("VoiceCommandNameType")))
  {
    -[_INVocabularyGenerationDocument setAppBundleID:](v8, "setAppBundleID:", CFSTR("com.apple.siriVoiceShortcuts"));
  }
  else
  {
    -[_INVocabularyStoreManager appBundleID](self, "appBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INVocabularyGenerationDocument setAppBundleID:](v8, "setAppBundleID:", v9);

  }
  -[_INVocabularyGenerationDocument setVocabularyItems:](v8, "setVocabularyItems:", v7);

  -[_INVocabularyGenerationDocument setIntentSlot:](v8, "setIntentSlot:", v6);
  return v8;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

+ (id)managerForBundleID:(id)a3 bundlePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315650;
      v14 = "+[_INVocabularyStoreManager managerForBundleID:bundlePath:]";
      v15 = 2114;
      v16 = v6;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s radar://24597826 ignoring that %{public}@ is installed at '%{public}@'. All installed instances will share the same vocabulary.", (uint8_t *)&v13, 0x20u);
    }

  }
  +[_INVocabularyStoreManager appDatastoreDirectoryForAppBundleID:bundlePath:](_INVocabularyStoreManager, "appDatastoreDirectoryForAppBundleID:bundlePath:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseDirectory:appBundleID:appBundlePath:", v10, v6, 0);

  return v11;
}

- (_INVocabularyStoreManager)initWithBaseDirectory:(id)a3 appBundleID:(id)a4 appBundlePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _INVocabularyStoreManager *v11;
  uint64_t v12;
  NSString *appBundleID;
  uint64_t v14;
  NSString *appBundlePath;
  uint64_t v16;
  NSString *baseDirectoryPath;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_INVocabularyStoreManager;
  v11 = -[_INVocabularyStoreManager init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    appBundleID = v11->_appBundleID;
    v11->_appBundleID = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    appBundlePath = v11->_appBundlePath;
    v11->_appBundlePath = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    baseDirectoryPath = v11->_baseDirectoryPath;
    v11->_baseDirectoryPath = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.%@"), v19, v11->_appBundleID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_retainAutorelease(v20);
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v22;

  }
  return v11;
}

- (void)writeLatestVocabularyItems:(id)a3 forIntentSlot:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _INVocabularyStoreManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81___INVocabularyStoreManager_writeLatestVocabularyItems_forIntentSlot_completion___block_invoke;
  v15[3] = &unk_1E2291FA8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (_INVocabularyStoreManager)init
{
  __assert_rtn("-[_INVocabularyStoreManager init]", "_INVocabularyStoreManager.m", 146, "false && \"Use the designated initilizer!\");
}

- (id)deleteIntentSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_INVocabularyStoreManager baseDirectoryPath](self, "baseDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_INVocabularyStoreManager deleteVocabularyStoreItemAt:](self, "deleteVocabularyStoreItemAt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getPathToLatestVocabulary:(id *)a3 pathDuringReading:(id *)a4 sentVocabulary:(id *)a5 forIntentSlot:(id)a6
{
  void *v9;
  void *v10;

  -[_INVocabularyStoreManager _baseDirectoryPathForIntentSlot:](self, "_baseDirectoryPathForIntentSlot:", a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("LatestVocabulary.plist"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("StagedVocabulary.plist"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("SentVocabulary.plist"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appBundlePath
{
  return self->_appBundlePath;
}

- (void)setAppBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundlePath, 0);
  objc_storeStrong((id *)&self->_baseDirectoryPath, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)_globalClassQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___INVocabularyStoreManager__globalClassQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_globalClassQueue_onceToken != -1)
    dispatch_once(&_globalClassQueue_onceToken, block);
  return (id)_globalClassQueue_stGlobalClassQueue;
}

+ (id)_latestVocabularyStringsAt:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  _INVocabularyGenerationDocument *v9;
  void *v10;
  _INVocabularyGenerationDocument *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v28[0] = CFSTR("LatestVocabulary.plist");
  v28[1] = CFSTR("StagedVocabulary.plist");
  v28[2] = CFSTR("SentVocabulary.plist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = [_INVocabularyGenerationDocument alloc];
        objc_msgSend(v3, "stringByAppendingPathComponent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[_INVocabularyGenerationDocument initWithContentsOfFile:](v9, "initWithContentsOfFile:", v10);

        if (v11)
        {
          v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          -[_INVocabularyGenerationDocument vocabularyItems](v11, "vocabularyItems", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "string");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                  objc_msgSend(v5, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v14);
          }

          goto LABEL_20;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_20:

  return v5;
}

+ (void)enumerateVocabularyUsingBlock:(id)a3
{
  if (a3)
    objc_msgSend(a1, "_iterateVocabularyWithSummary:optionalBlock:", 0, a3);
}

+ (void)deleteAllUserVocabularyFromAllAppsAsync
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]";
    _os_log_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_msgSend(a1, "_globalClassQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___INVocabularyStoreManager_deleteAllUserVocabularyFromAllAppsAsync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);

}

@end
