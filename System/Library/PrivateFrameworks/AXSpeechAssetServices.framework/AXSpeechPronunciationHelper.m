@implementation AXSpeechPronunciationHelper

- (id)_assetUpdaterClient
{
  if (_assetUpdaterClient_onceToken != -1)
    dispatch_once(&_assetUpdaterClient_onceToken, &__block_literal_global);
  return (id)_assetUpdaterClient_Client;
}

void __50__AXSpeechPronunciationHelper__assetUpdaterClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", CFSTR("AXSpeechPronunciationClient"), CFSTR("AXAssetAndDataServer"));
  v1 = (void *)_assetUpdaterClient_Client;
  _assetUpdaterClient_Client = v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXSpeechPronunciationHelper;
  -[AXSpeechPronunciationHelper dealloc](&v4, sel_dealloc);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  self->_inSession = 0;
}

- (BOOL)supportsPronunciationSessions
{
  int v2;
  void *v3;
  char v4;

  v2 = MGGetBoolAnswer();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "dictationIsEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ignoreLogging");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      AXColorizeFormatLog();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_impl(&dword_2172DC000, v12, v13, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (a5 == 4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("results"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("error"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("error"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*((void (**)(id))self->_resultCallback + 2))(self->_resultCallback);
    self->_inSession = 0;

  }
  return 0;
}

- (float)audioLevel
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (!self->_inSession)
    return 0.0;
  -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSynchronousMessage:withIdentifier:error:", MEMORY[0x24BDBD1B8], 7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("audioLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (void)startPronunciationSession:(id)a3 resultCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  id resultCallback;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 inSession;
  id v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ignoreLogging");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      AXColorizeFormatLog();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      inSession = self->_inSession;
      _AXStringForArgs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v15;
        _os_log_impl(&dword_2172DC000, v12, v13, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (!self->_inSession)
  {
    v16 = (void *)objc_msgSend(v7, "copy");
    resultCallback = self->_resultCallback;
    self->_resultCallback = v16;

    self->_inSession = 1;
    objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ignoreLogging");

    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v21, v22))
      {
        AXColorizeFormatLog();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        inSession = (_BOOL8)v6;
        _AXStringForArgs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v24;
          _os_log_impl(&dword_2172DC000, v21, v22, "%{public}@", buf, 0xCu);
        }

      }
    }
    v38 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v38, inSession);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v38;
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "ignoreLogging");

      if ((v28 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v30 = objc_claimAutoreleasedReturnValue();

        v31 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v30, v31))
        {
          AXColorizeFormatLog();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v33;
            _os_log_impl(&dword_2172DC000, v30, v31, "%{public}@", buf, 0xCu);
          }

        }
      }
    }
    if (v25)
    {
      -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("options");
      v40 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v35, 4, v36, 0);

    }
  }

}

- (void)stopPronunciationSession
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_2172DC000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (self->_inSession)
  {
    -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 5, v11, 0);

  }
}

- (void)cancelPronunciationSession
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4C8], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_2172DC000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (self->_inSession)
  {
    -[AXSpeechPronunciationHelper _assetUpdaterClient](self, "_assetUpdaterClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 6, v11, &__block_literal_global_245);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCallback, 0);
}

@end
