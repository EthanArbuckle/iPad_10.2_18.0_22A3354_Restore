@implementation WFOpenInAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFCAC0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFOpenInAction;
  objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_showWithFile_contentManaged_completionHandler_, 0, 0);

  return v2;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[WFOpenInAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFOpenInAskWhenRun"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFOpenInAction;
    -[WFOpenInAction runAsynchronouslyWithInput:](&v8, sel_runAsynchronouslyWithInput_, v4);
  }
  else
  {
    -[WFOpenInAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectedApp"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[WFOpenInAction openContentInSelectedApp:](self, "openContentInSelectedApp:", v4);
    else
      -[WFOpenInAction openContentUsingDefaultApp:](self, "openContentUsingDefaultApp:", v4);

  }
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_24F8B1C98;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "getFileRepresentationAndAttributionSet:forType:", v10, 0);

}

- (void)openContentInSelectedApp:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[WFOpenInAction selectedApp](self, "selectedApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__WFOpenInAction_openContentInSelectedApp___block_invoke;
  v8[3] = &unk_24F8B1C98;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "getFileRepresentationAndAttributionSet:forType:", v8, 0);

}

- (void)openContentUsingDefaultApp:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke;
  v8[3] = &unk_24F8B1CE8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "getFileRepresentationAndAttributionSet:forType:", v8, 0);

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFSelectedApp")))
  {
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpenInAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v12, CFSTR("WFOpenInAppIdentifier"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFOpenInAction;
  v13 = -[WFOpenInAction setParameterState:forKey:](&v15, sel_setParameterState_forKey_, v6, v7);
  if (v13)
    -[WFOpenInAction updateContentClasses](self, "updateContentClasses");

  return v13;
}

- (BOOL)inputsMultipleItems
{
  return 0;
}

- (void)updateContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  NSArray *contentClasses;
  NSArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[WFOpenInAction selectedApp](self, "selectedApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_10089);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x24BE19460], "sharedRegistry", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "contentItemClassForType:", v12);

          if (v14)
            objc_msgSend(v6, "addObject:", v14);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "array");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contentClasses = self->_contentClasses;
    self->_contentClasses = v15;

  }
  else
  {
    v17 = self->_contentClasses;
    self->_contentClasses = 0;

  }
}

- (id)inputContentClasses
{
  NSArray *contentClasses;
  objc_super v5;

  contentClasses = self->_contentClasses;
  if (!contentClasses)
  {
    -[WFOpenInAction updateContentClasses](self, "updateContentClasses");
    contentClasses = self->_contentClasses;
  }
  if (-[NSArray count](contentClasses, "count"))
    return self->_contentClasses;
  v5.receiver = self;
  v5.super_class = (Class)WFOpenInAction;
  -[WFOpenInAction inputContentClasses](&v5, sel_inputContentClasses);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectedApp
{
  return (id)-[WFOpenInAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectedApp"), objc_opt_class());
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFOpenInAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v7, "length");
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@” with %3$@?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@”?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)contentClasses
{
  return self->_contentClasses;
}

- (void)setContentClasses:(id)a3
{
  objc_storeStrong((id *)&self->_contentClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClasses, 0);
}

void __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_24F8BABC0;
    v4 = *(id *)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "getFileRepresentations:forType:", v5, 0);

  }
}

void __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  v19 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_13:
    v6();
    goto LABEL_14;
  }
  if (!objc_msgSend(v5, "count"))
    goto LABEL_12;
  objc_msgSend(v19, "if_firstObjectPassingTest:", &__block_literal_global_387);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v19, "if_firstObjectPassingTest:", &__block_literal_global_391);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BE19470], "javaScript");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFOpenInAskWhenRun"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedApp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x24BE19390];
        v16 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "selectedApp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "locationWithAppDescriptor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v18, 0);

        goto LABEL_14;
      }
    }
LABEL_12:
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_13;
  }
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BE19470], "webpagesLocation");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, v9, 0);

LABEL_14:
}

uint64_t __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "mappedDataWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "wf_stringWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("<script>"));

  return v8;
}

uint64_t __61__WFOpenInAction_getContentDestinationWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("webloc"));

  return v4;
}

uint64_t __38__WFOpenInAction_updateContentClasses__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", a2);
}

void __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v9))
    {
      v10 = (void *)MEMORY[0x24BEC39E8];
      objc_msgSend(v7, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "documentWithURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke_2;
      v19[3] = &unk_24F8B1CC0;
      v13 = v7;
      v14 = *(_QWORD *)(a1 + 32);
      v20 = v13;
      v21 = v14;
      objc_msgSend(v12, "openInDefaultAppWithCompletionHandler:", v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0B88];
      v22 = *MEMORY[0x24BDD0CB8];
      objc_msgSend(v7, "fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v12);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __45__WFOpenInAction_openContentUsingDefaultApp___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDD1128];
    v11 = *MEMORY[0x24BDD0FC8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Could not open the file %1$@."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 79, v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v3);

}

void __43__WFOpenInAction_openContentInSelectedApp___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (a1[5])
    {
      objc_msgSend(a1[6], "attributionSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEligibleToShareWithResultManagedLevel:", 0);

      if ((v11 & 1) != 0)
      {
        v12 = (void *)MEMORY[0x24BEC39E8];
        objc_msgSend(v7, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "documentWithURL:annotation:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[5], "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __43__WFOpenInAction_openContentInSelectedApp___block_invoke_2;
        v28[3] = &unk_24F8B8B80;
        v29 = a1[5];
        v16 = v7;
        v17 = a1[4];
        v30 = v16;
        v31 = v17;
        objc_msgSend(v14, "openWithAppBundleIdentifier:completionHandler:", v15, v28);

      }
      else
      {
        v24 = a1[4];
        v25 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v24, "localizedName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sharingMixedMDMContentErrorWithActionName:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "finishRunningWithError:", v27);

      }
    }
    else
    {
      v18 = a1[4];
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BEC4270];
      v32 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Open In… failed because it couldn’t find an app to open in."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 5, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "finishRunningWithError:", v23);

    }
  }
  else
  {
    objc_msgSend(a1[4], "finishRunningWithError:", v9);
  }

}

void __43__WFOpenInAction_openContentInSelectedApp___block_invoke_2(id *a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDD1128];
    v12 = *MEMORY[0x24BDD0FC8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$@ is not installed or could not open the file %2$@."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 79, v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1[6], "finishRunningWithError:", v3);

}

void __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if (a2)
  {
    objc_msgSend(a2, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_2;
    v8[3] = &unk_24F8B1C70;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v7 = *MEMORY[0x24BEC1770];
    v8[1] = 3221225472;
    v9 = v6;
    v10 = *(id *)(a1 + 48);
    +[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:](WFFileStorageServiceResult, "getResultWithFileURL:consumingBundleID:resultBlock:", v5, v7, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
}

void __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    v14 = 0;
    objc_msgSend(*(id *)(a1 + 40), "attributionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEligibleToShareWithResultManagedLevel:", &v14);

    if ((v7 & 1) != 0)
    {
      v8 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_3;
      v13[3] = &unk_24F8BB370;
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "showWithFile:contentManaged:completionHandler:", v5, v14 == 2, v13);
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      v10 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v9, "localizedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharingMixedMDMContentErrorWithActionName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishRunningWithError:", v12);

    }
  }

}

uint64_t __51__WFOpenInAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
