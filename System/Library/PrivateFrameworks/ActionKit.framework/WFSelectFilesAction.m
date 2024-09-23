@implementation WFSelectFilesAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD0D8;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___WFSelectFilesAction;
  objc_msgSendSuper2(&v12, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_retrieveFilesWithConsumingBundleID_options_completionHandler_, 1, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_retrieveFilesWithConsumingBundleID_options_completionHandler_, 0, 1);

  return v2;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v5 = a3;
  -[WFSelectFilesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPickingMode"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSelectFilesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("SelectMultiple"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
    v9 = 2;
  else
    v9 = 0;
  v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("Folders"));
  v11 = 4;
  if (v10)
    v11 = 8;
  v12 = v11 | v9;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke;
  v15[3] = &unk_24F8BB6B0;
  v15[4] = self;
  objc_msgSend(v5, "retrieveFilesWithConsumingBundleID:options:completionHandler:", v14, v12, v15);

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__25564;
    v12 = __Block_byref_object_dispose__25565;
    v13 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke_171;
    v7[3] = &unk_24F8B5370;
    v7[4] = *(_QWORD *)(a1 + 32);
    v7[5] = &v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9[5]);
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

void __56__WFSelectFilesAction_runWithRemoteUserInterface_input___block_invoke_171(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(a2, "wrappedURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileWithURL:options:", v8, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    *a4 = 1;
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC4270];
    v18 = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Select Files finished with an error."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  objc_msgSend(*(id *)(a1 + 32), "output");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addFileWithOriginAttribution:", v9);

}

@end
