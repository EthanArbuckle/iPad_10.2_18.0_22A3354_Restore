@implementation WFAppendDropboxFileAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFStorageServiceAction filePathKey](self, "filePathKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppendDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    -[WFAppendDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppendOnNewLine"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    -[WFAppendDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppendFileWriteMode"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Prepend"));

    v14 = 9;
    if (!v11)
      v14 = 1;
    v15 = 2;
    if (v13)
      v15 = 4;
    v16 = v15 | v14;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v23[3] = &unk_24F8B53C0;
    v23[4] = self;
    v24 = v7;
    v25 = v9;
    v26 = v16;
    objc_msgSend(v6, "getStringRepresentation:", v23);

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BEC4270];
    v27[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No File Path Provided"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v27[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must specify a filename or path in Append to File."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 5, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppendDropboxFileAction finishRunningWithError:](self, "finishRunningWithError:", v22);

  }
}

- (id)filenamePlaceholderText
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;

  -[WFAppendDropboxFileAction storageService](self, "storageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageLocationPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("/"));

  if (v4)
    v5 = CFSTR("example.txt");
  else
    v5 = CFSTR("/example.txt");
  WFLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)storageService
{
  return objc_alloc_init(WFDropboxStorageService);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to append %2$@ to a Dropbox file?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to append content to a Dropbox file?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
  else
  {
    if (a2)
      v4 = a2;
    else
      v4 = &stru_24F8BBA48;
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v10[3] = &unk_24F8BA068;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v8, "appendText:toPath:options:completionHandler:", v4, v6, v7, v10);

  }
}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x24BE19390];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "associatedAppDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3;
  v10[3] = &unk_24F8BAFA8;
  v10[4] = *(_QWORD *)(a1 + 40);
  WFContentCollectionFromStorageServiceResult(v5, v7, v9, v10);

}

void __71__WFAppendDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
