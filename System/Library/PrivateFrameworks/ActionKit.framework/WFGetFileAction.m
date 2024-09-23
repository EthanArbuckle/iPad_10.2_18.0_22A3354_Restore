@implementation WFGetFileAction

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WFGetFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetFilePath"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(v8, "substringFromIndex:", 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
  v12[3] = &unk_24F8B18D8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v6, "getFileRepresentation:forType:", v12, 0);

}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFGetFileAction;
  return -[WFStorageServiceAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFFileErrorIfNotFound"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGetFolderContents"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      v10 = v7 | 0x10;
    else
      v10 = v7;
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v13[3] = &unk_24F8BB6B0;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "retrieveFileAtPath:fromDirectory:options:completionHandler:", v12, v5, v10, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_6765);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "output");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addItems:", v4);

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
}

id __61__WFGetFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE19450];
  v3 = (void *)MEMORY[0x24BE19470];
  v4 = a2;
  objc_msgSend(v3, "contentLocationForFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithFile:origin:disclosureLevel:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
