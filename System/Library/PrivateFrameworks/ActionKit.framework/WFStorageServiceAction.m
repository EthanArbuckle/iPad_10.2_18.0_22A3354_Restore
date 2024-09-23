@implementation WFStorageServiceAction

- (id)prioritizedParameterKeysForRemoteExecution
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[WFStorageServiceAction showPickerKey](self, "showPickerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFStorageServiceAction showPickerKey](self, "showPickerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFStorageServiceAction;
  return -[WFStorageServiceAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (id)storageService
{
  return objc_alloc_init(WFDefaultFileStorageService);
}

- (BOOL)showsFilePicker
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[WFStorageServiceAction showPickerKey](self, "showPickerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFStorageServiceAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v3, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "BOOLValue");
    }
    else
    {
      -[WFStorageServiceAction parameterStateForKey:](self, "parameterStateForKey:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "number");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "BOOLValue");

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFStorageServiceAction storageService](self, "storageService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFStorageServiceAction runAsynchronouslyWithInput:storageService:](self, "runAsynchronouslyWithInput:storageService:", v4, v5);

}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WFStorageServiceAction storageService](self, "storageService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  if (v4 == (void *)objc_opt_class())
  {
    v10.receiver = self;
    v10.super_class = (Class)WFStorageServiceAction;
    -[WFStorageServiceAction outputContentClasses](&v10, sel_outputContentClasses);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v4, "resultItemClass");
    if (v5)
    {
      v11 = v5;
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = &v11;
    }
    else
    {
      v12[0] = objc_opt_class();
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v12;
    }
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)WFStorageServiceAction;
  -[WFStorageServiceAction localizedKeywordsWithContext:](&v22, sel_localizedKeywordsWithContext_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storageServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend((id)objc_opt_class(), "serviceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

  return v7;
}

- (BOOL)showsSettingsWhenResourcesUnavailable
{
  return 0;
}

- (void)updatePathPrefix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFStorageServiceAction filePathKey](self, "filePathKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStorageServiceAction parameterForKey:](self, "parameterForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[WFStorageServiceAction filenamePlaceholderText](self, "filenamePlaceholderText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedPlaceholder:", v4);

  -[WFStorageServiceAction storageService](self, "storageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageLocationPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefix:", v6);

}

- (id)filenamePlaceholderText
{
  void *v2;
  void *v3;
  void *v4;

  -[WFStorageServiceAction storageService](self, "storageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageLocationPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    WFLocalizedString(CFSTR("optional"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)initializeParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFStorageServiceAction;
  -[WFStorageServiceAction initializeParameters](&v3, sel_initializeParameters);
  -[WFStorageServiceAction selectedStorageServiceChanged](self, "selectedStorageServiceChanged");
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFStorageServiceAction;
  return -[WFStorageServiceAction setParameterState:forKey:](&v5, sel_setParameterState_forKey_, a3, a4);
}

- (id)filePathKey
{
  return CFSTR("WFFilePath");
}

- (id)showPickerKey
{
  return 0;
}

- (void)selectedStorageServiceChanged
{
  -[WFStorageServiceAction updatePathPrefix](self, "updatePathPrefix");
  -[WFStorageServiceAction outputDetailsUpdated](self, "outputDetailsUpdated");
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFStorageServiceAction storageService](self, "storageService", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedAppDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

@end
