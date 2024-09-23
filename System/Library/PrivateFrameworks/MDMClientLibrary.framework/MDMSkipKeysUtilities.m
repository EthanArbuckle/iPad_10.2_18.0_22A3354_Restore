@implementation MDMSkipKeysUtilities

- (id)currentSkipKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[MDMSkipKeysUtilities _cloudConfigSkipKeys](self, "_cloudConfigSkipKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMSkipKeysUtilities _payloadSkipKeys](self, "_payloadSkipKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[MDMSkipKeysUtilities _specialSkipKeys](self, "_specialSkipKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (BOOL)isBuddyPaneSkipped:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MDMSkipKeysUtilities currentSkipKeys](self, "currentSkipKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_cloudConfigSkipKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshDetailsFromDisk");

  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skipSetupKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMSkipKeysUtilities _validateAndUpdateSkipKeys:](self, "_validateAndUpdateSkipKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_payloadSkipKeys
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[MDMSkipKeysUtilities testSetupAssistantPayloadPath](self, "testSetupAssistantPayloadPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    MDMSetupAssistantSettingsFilePath();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SkipSetupItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SkipSetupItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMSkipKeysUtilities _validateAndUpdateSkipKeys:](self, "_validateAndUpdateSkipKeys:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MDMSkipKeysUtilities _validateAndUpdateSkipKeys:](self, "_validateAndUpdateSkipKeys:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_specialSkipKeys
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  DMCDeviceManagementDaemonSetupOptionDirectoryPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
    objc_msgSend(v2, "addObject:", *MEMORY[0x1E0D1BF50]);
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

- (id)_validateAndUpdateSkipKeys:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = (void *)MEMORY[0x1E0D1BE98];
  v5 = a3;
  objc_msgSend(v4, "allSkipKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v5;
  else
    v8 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D1BF48]))
  {
    v10 = objc_msgSend(v7, "mutableCopy");

    v9 = (void *)v10;
  }
  else
  {
    objc_msgSend(v9, "intersectSet:", v7);
  }
  objc_msgSend(v9, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)testSetupAssistantPayloadPath
{
  return self->_testSetupAssistantPayloadPath;
}

- (void)setTestSetupAssistantPayloadPath:(id)a3
{
  objc_storeStrong((id *)&self->_testSetupAssistantPayloadPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSetupAssistantPayloadPath, 0);
}

@end
