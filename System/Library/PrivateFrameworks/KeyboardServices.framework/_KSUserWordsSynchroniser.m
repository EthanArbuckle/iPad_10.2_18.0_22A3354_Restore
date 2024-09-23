@implementation _KSUserWordsSynchroniser

+ (id)generateKeyWithSize:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = malloc_type_malloc(a3, 0xF5D78EEBuLL);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], a3, v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  free(v4);
  return v5;
}

+ (id)generateRecordNameForFilename:(id)a3 withKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  const void *v8;
  size_t v9;
  id v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  void *v14;
  char v16;
  _BYTE v17[7];
  _BYTE macOut[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v6);
  CCHmac(2u, v8, v9, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), macOut);
  v11 = 0;
  v12 = v17;
  do
  {
    v13 = macOut[v11];
    *(v12 - 1) = a0123456789abcd[v13 >> 4];
    *v12 = a0123456789abcd[v13 & 0xF];
    v12 += 2;
    ++v11;
  }
  while (v11 != 32);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v16, 64, 4);

  return v14;
}

+ (id)sharedAcrossLanguagesNegativeLearningValue
{
  return CFSTR("SharedAcrossLanguagesNegativeLearning");
}

+ (id)sharedAcrossLanguagesVulgarWordUsageValue
{
  return CFSTR("SharedAcrossLanguagesVulgarWordUsage");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___KSUserWordsSynchroniser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_synchroniser;
}

- (id)containerID
{
  return CFSTR("com.apple.textinput.KeyboardServices.Secure");
}

- (id)initForTestingWithManager:(id)a3 enablePushing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _KSUserWordsSynchroniser *v7;
  _KSUserWordsSynchroniser *v8;
  NSArray *languagesIfOffline;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  _KSControlFileController *v13;
  void *v14;
  uint64_t v15;
  _KSControlFileController *controlFile;
  NSObject *v17;
  _KSCloudKitManager *v18;
  void *cloudKitManager;
  _KSUserWordsSynchroniserCloudKitManager *v20;
  void *v21;
  uint64_t v22;
  _KSCloudKitManager *v23;
  void *v24;
  _KSRequestThrottle *v25;
  _KSRequestThrottle *identityThrottle;
  _QWORD block[4];
  _KSUserWordsSynchroniser *v29;
  objc_super v30;

  v4 = a4;
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_KSUserWordsSynchroniser;
  v7 = -[_KSUserWordsSynchroniser init](&v30, sel_init);
  v8 = v7;
  if (v7)
  {
    languagesIfOffline = v7->_languagesIfOffline;
    v7->_languagesIfOffline = (NSArray *)MEMORY[0x24BDBD1A8];

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.keyboardServices.userWords.workQueue", v10);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;

    v13 = [_KSControlFileController alloc];
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "infoClass"), "keyboardDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_KSControlFileController initWithName:inDirectory:](v13, "initWithName:inDirectory:", CFSTR("UserWords"), v14);
    controlFile = v8->_controlFile;
    v8->_controlFile = (_KSControlFileController *)v15;

    if (v4)
    {
      v8->_taskRun = 1;
      v17 = v8->_workQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke;
      block[3] = &unk_24E204790;
      v29 = v8;
      dispatch_async(v17, block);

    }
    if (v6)
    {
      v18 = (_KSCloudKitManager *)v6;
      cloudKitManager = v8->_cloudKitManager;
      v8->_cloudKitManager = v18;
    }
    else
    {
      v20 = [_KSUserWordsSynchroniserCloudKitManager alloc];
      -[_KSUserWordsSynchroniser containerID](v8, "containerID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[_KSCloudKitManager initWithContainer:recordZoneName:](v20, "initWithContainer:recordZoneName:", v21, CFSTR("UserWords"));
      v23 = v8->_cloudKitManager;
      v8->_cloudKitManager = (_KSCloudKitManager *)v22;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", v8, sel_accountDidChange_, CFSTR("KSCloudKitAccountDidChange"), v8->_cloudKitManager);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      cloudKitManager = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(cloudKitManager, "addObserver:selector:name:object:", v8, sel_identitiesDidChange_, CFSTR("KSCloudKitIdentitiesDidChange"), v8->_cloudKitManager);
    }

    v25 = objc_alloc_init(_KSRequestThrottle);
    identityThrottle = v8->_identityThrottle;
    v8->_identityThrottle = v25;

    -[_KSRequestThrottle setQueue:](v8->_identityThrottle, "setQueue:", v8->_workQueue);
    -[_KSRequestThrottle setDebugIdentifier:](v8->_identityThrottle, "setDebugIdentifier:", CFSTR("identity change"));
  }

  return v8;
}

+ (Class)infoClass
{
  return (Class)objc_opt_class();
}

- (_KSUserWordsSynchroniser)init
{
  return (_KSUserWordsSynchroniser *)-[_KSUserWordsSynchroniser initForTestingWithManager:enablePushing:](self, "initForTestingWithManager:enablePushing:", 0, 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_KSUserWordsSynchroniser;
  -[_KSUserWordsSynchroniser dealloc](&v4, sel_dealloc);
}

- (void)disable
{
  id v3;

  -[_KSControlFileController reset](self->_controlFile, "reset");
  if (self->_pushTask)
  {
    +[_KSTaskScheduler sharedInstance](_KSTaskScheduler, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterTask:", self->_pushTask);

  }
}

- (id)information
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;

  if (-[_KSControlFileController checkIfExists](self->_controlFile, "checkIfExists"))
  {
    v3 = (void *)MEMORY[0x24BDD1620];
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSControlFileController contents](self->_controlFile, "contents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      KSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_KSUserWordsSynchroniser information].cold.1((uint64_t)v12, v14);

      -[_KSUserWordsSynchroniser disable](self, "disable");
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)modifyInformationWithOperations:(id)a3
{
  uint64_t (**v4)(id, BOOL, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _KSControlFileController *controlFile;
  void *v10;
  id v11;

  v4 = (uint64_t (**)(id, BOOL, uint64_t))a3;
  -[_KSUserWordsSynchroniser information](self, "information");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (v5)
  {
    v6 = objc_msgSend(v5, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  v8 = v4[2](v4, v11 != 0, v6);

  if (v8)
  {
    controlFile = self->_controlFile;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_KSControlFileController setContents:](controlFile, "setContents:", v10);

  }
}

- (NSArray)requiredLanguages
{
  void *v3;
  void *languagesIfOffline;
  void *v5;
  NSArray *v6;

  -[_KSUserWordsSynchroniser information](self, "information");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Languages"));
  languagesIfOffline = (void *)objc_claimAutoreleasedReturnValue();
  v5 = languagesIfOffline;
  if (!languagesIfOffline)
    languagesIfOffline = self->_languagesIfOffline;
  v6 = languagesIfOffline;

  return v6;
}

- (void)accountDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *workQueue;
  _QWORD block[6];
  char v17;
  char v18;
  char v19;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidChangeStatusKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidChangeUserChangedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidChangeDeviceToDeviceKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KSCloudKitAccountDidSuccessfullyCreateZone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v14, "BOOLValue");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45___KSUserWordsSynchroniser_accountDidChange___block_invoke;
  block[3] = &unk_24E205DB8;
  v17 = (char)v5;
  block[4] = self;
  block[5] = v7;
  v18 = v12;
  v19 = (char)v11;
  dispatch_async(workQueue, block);
}

- (void)identitiesDidChange:(id)a3
{
  _KSRequestThrottle *identityThrottle;
  _QWORD v4[5];

  identityThrottle = self->_identityThrottle;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke;
  v4[3] = &unk_24E204AF0;
  v4[4] = self;
  -[_KSRequestThrottle postRequest:](identityThrottle, "postRequest:", v4);
}

- (void)checkProgress:(int)a3 withInfo:(id)a4
{
  id v5;
  NSObject *v6;
  char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  KSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = checkProgress_withInfo__meanings[a3];
    v8 = 136315650;
    v9 = "-[_KSUserWordsSynchroniser checkProgress:withInfo:]";
    v10 = 2080;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21DFEB000, v6, OS_LOG_TYPE_INFO, "%s  State: %s: %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)checkForDownload:(id)a3 uploads:(id)a4 allLanguages:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *workQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _KSUserWordsSynchroniser *v18;
  id v19;
  id v20;
  _QWORD v21[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((_IsEnabled() & 1) != 0)
  {
    v11 = MEMORY[0x24BDAC760];
    if (v8)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2;
      v21[3] = &unk_24E205E78;
      v21[4] = self;
      v12 = (void *)MEMORY[0x2207A8D04](v21);
    }
    else
    {
      v12 = &__block_literal_global_10;
    }
    workQueue = self->_workQueue;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_4;
    v15[3] = &unk_24E205F68;
    v16 = v9;
    v17 = v10;
    v18 = self;
    v19 = v8;
    v20 = v12;
    v14 = v12;
    dispatch_async(workQueue, v15);

  }
  else
  {
    -[_KSUserWordsSynchroniser checkProgress:withInfo:](self, "checkProgress:withInfo:", 0, MEMORY[0x24BDBD1C0]);
  }

}

- (void)keyboardUsed
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke;
  block[3] = &unk_24E204790;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)generateKeyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _KSUserWordsSynchroniser *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  if (!*(_WORD *)&self->_attemptingConnection)
  {
    self->_attemptingConnection = 1;
    self->_needRetry = 0;
    objc_msgSend((id)objc_opt_class(), "generateKeyWithSize:", 64);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke;
    v19[3] = &unk_24E205FB8;
    v19[4] = self;
    v7 = v4;
    v20 = v7;
    v8 = (void *)MEMORY[0x2207A8D04](v19);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_24E205FE0;
    v17[4] = self;
    v18 = v7;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_127;
    v12[3] = &unk_24E206030;
    v13 = v5;
    v14 = self;
    v15 = v8;
    v16 = (id)MEMORY[0x2207A8D04](v17);
    v9 = v16;
    v10 = v5;
    v11 = v8;
    -[_KSUserWordsSynchroniser saveKey:withCompletion:](self, "saveKey:withCompletion:", v10, v12);

  }
}

- (void)checkConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_IsEnabled())
  {
    if (-[_KSControlFileController checkIfExists](self->_controlFile, "checkIfExists"))
    {
      -[_KSUserWordsSynchroniser information](self, "information");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("Key"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        return;
      v8 = MEMORY[0x24BDAC760];
      v5 = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_2;
      v6 = &v8;
    }
    else
    {
      KSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[_KSUserWordsSynchroniser checkConfiguration]";
        _os_log_impl(&dword_21DFEB000, v7, OS_LOG_TYPE_INFO, "%s  Persistent data not found, acquiring key!", buf, 0xCu);
      }

      v9 = MEMORY[0x24BDAC760];
      v5 = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke;
      v6 = &v9;
    }
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v6[3] = (uint64_t)&unk_24E206058;
    v6[4] = (uint64_t)self;
    -[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:](self, "generateKeyWithCompletionHandler:", v8);
  }
}

- (void)firstTimeDownloadWithKey:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke;
  v7[3] = &unk_24E205838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)deltaDownloadForLanguages:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54___KSUserWordsSynchroniser_deltaDownloadForLanguages___block_invoke;
  v7[3] = &unk_24E205838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (id)generateRecordListForLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _KSUserWordsSynchroniser *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSUserWordsSynchroniser information](self, "information");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Languages"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("Key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke;
  v22[3] = &unk_24E206080;
  v8 = v7;
  v23 = v8;
  v24 = self;
  -[_KSUserWordsSynchroniser loadKeyWithCompletion:](self, "loadKeyWithCompletion:", v22);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[_KSUserWordsSynchroniser recordIDForLanguage:withKey:](self, "recordIDForLanguage:withKey:", v15, v8, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)filenameForLanguage:(id)a3
{
  uint64_t (*v3)(uint64_t, uint64_t);
  id v4;
  void *v5;
  void *v6;

  v3 = (uint64_t (*)(uint64_t, uint64_t))softLinkMGCopyAnswer_0;
  v4 = a3;
  v5 = (void *)v3((uint64_t)CFSTR("DeviceName"), 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recordIDForLanguage:(id)a3 withKey:(id)a4
{
  _KSCloudKitManager *cloudKitManager;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  cloudKitManager = self->_cloudKitManager;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  -[_KSUserWordsSynchroniser filenameForLanguage:](self, "filenameForLanguage:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "generateRecordNameForFilename:withKey:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSCloudKitManager recordIDForName:](cloudKitManager, "recordIDForName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)checkErrors:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _KSCloudKitManager *cloudKitManager;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  _QWORD v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  if (!v6)
    goto LABEL_28;
  v7 = objc_msgSend(v4, "code");
  v8 = 0;
  v9 = 1;
  if (v7 <= 27)
  {
    if (v7 != 2)
    {
      if (v7 != 26)
        goto LABEL_29;
      goto LABEL_15;
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "userInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", *MEMORY[0x24BDB8EE8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          if (!-[_KSUserWordsSynchroniser checkErrors:](self, "checkErrors:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i)))
          {

            goto LABEL_18;
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v32)
          continue;
        break;
      }
    }

LABEL_28:
    v9 = 1;
    goto LABEL_29;
  }
  switch(v7)
  {
    case 28:
LABEL_15:
      KSCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_KSUserWordsSynchroniser checkErrors:].cold.2(v4, v26);

      cloudKitManager = self->_cloudKitManager;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __40___KSUserWordsSynchroniser_checkErrors___block_invoke;
      v36[3] = &unk_24E2060E8;
      v36[4] = self;
      v36[5] = v8;
      -[_KSCloudKitManager resetZoneWithDelete:withCompletionHandler:](cloudKitManager, "resetZoneWithDelete:withCompletionHandler:", v8, v36);
      goto LABEL_18;
    case 112:
      KSCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_KSUserWordsSynchroniser checkErrors:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);

      v8 = 2;
      goto LABEL_15;
    case 5006:
      KSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_KSUserWordsSynchroniser checkErrors:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

      -[_KSControlFileController reset](self->_controlFile, "reset");
LABEL_18:
      v9 = 0;
      break;
  }
LABEL_29:

  return v9;
}

- (void)readFilesWithRecordIDs:(id)a3 forColumns:(id)a4 priority:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  _KSUserWordsSynchroniser *v20;
  id v21;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BDB90E8];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithRecordIDs:", v13);

  objc_msgSend(v14, "setDesiredKeys:", v12);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __93___KSUserWordsSynchroniser_readFilesWithRecordIDs_forColumns_priority_withCompletionHandler___block_invoke;
  v19 = &unk_24E2050E0;
  v20 = self;
  v21 = v10;
  v15 = v10;
  objc_msgSend(v14, "setFetchRecordsCompletionBlock:", &v16);
  -[_KSCloudKitManager addOperation:priority:](self->_cloudKitManager, "addOperation:priority:", v14, a5, v16, v17, v18, v19, v20);

}

- (void)overwriteFilesWithRecords:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, void *);
  void *v14;
  _KSUserWordsSynchroniser *v15;
  id v16;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDB9158];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithRecordsToSave:recordIDsToDelete:", v8, 0);

  objc_msgSend(v9, "setSavePolicy:", 2);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __76___KSUserWordsSynchroniser_overwriteFilesWithRecords_withCompletionHandler___block_invoke;
  v14 = &unk_24E206110;
  v15 = self;
  v16 = v6;
  v10 = v6;
  objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v11);
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v9, v11, v12, v13, v14, v15);

}

- (void)loadKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_KSCloudKitManager recordIDForName:](self->_cloudKitManager, "recordIDForName:", CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDB90E8]);
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordIDs:", v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50___KSUserWordsSynchroniser_loadKeyWithCompletion___block_invoke;
  v11[3] = &unk_24E206138;
  v12 = v5;
  v13 = v4;
  v11[4] = self;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v11);
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v8);

}

- (void)saveKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  _KSUserWordsSynchroniser *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDB91D8];
  v8 = a3;
  v9 = [v7 alloc];
  -[_KSCloudKitManager recordIDForName:](self->_cloudKitManager, "recordIDForName:", CFSTR("key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordType:recordID:", CFSTR("UserWordData"), v10);

  objc_msgSend(v11, "encryptedValueStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("keybytes"));

  v13 = objc_alloc(MEMORY[0x24BDB9158]);
  v23[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithRecordsToSave:recordIDsToDelete:", v14, 0);

  objc_msgSend(v15, "setSavePolicy:", 0);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __51___KSUserWordsSynchroniser_saveKey_withCompletion___block_invoke;
  v20 = &unk_24E206110;
  v21 = self;
  v22 = v6;
  v16 = v6;
  objc_msgSend(v15, "setModifyRecordsCompletionBlock:", &v17);
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v15, v17, v18, v19, v20, v21);

}

- (void)dumpAllRecordsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDB90C8]);
  -[_KSCloudKitManager recordZone](self->_cloudKitManager, "recordZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithRecordZoneIDs:optionsByRecordZoneID:", v9, 0);

  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke;
  v18[3] = &unk_24E204F28;
  v12 = v5;
  v19 = v12;
  objc_msgSend(v10, "setRecordChangedBlock:", v18);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_24E204A78;
  v16 = v12;
  v17 = v4;
  v13 = v4;
  v14 = v12;
  objc_msgSend(v10, "setFetchRecordZoneChangesCompletionBlock:", v15);
  -[_KSCloudKitManager addOperation:](self->_cloudKitManager, "addOperation:", v10);

}

- (void)deleteZoneWithCompletionHandler:(id)a3
{
  -[_KSCloudKitManager resetZoneWithDelete:withCompletionHandler:](self->_cloudKitManager, "resetZoneWithDelete:withCompletionHandler:", 2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityThrottle, 0);
  objc_storeStrong((id *)&self->_languagesIfOffline, 0);
  objc_storeStrong((id *)&self->_pushTask, 0);
  objc_storeStrong((id *)&self->_controlFile, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)information
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, a2, v5, "%s  Incorrect data type in control file '%@', resetting", (uint8_t *)v6);

  OUTLINED_FUNCTION_5_0();
}

- (void)checkErrors:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Account does not support user word syncing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)checkErrors:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136315394;
  v5 = "-[_KSUserWordsSynchroniser checkErrors:]";
  v6 = 2048;
  v7 = objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_6(&dword_21DFEB000, a2, v3, "%s  Zone disappeared (%li)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5_0();
}

- (void)checkErrors:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  Identity not available - resetting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
