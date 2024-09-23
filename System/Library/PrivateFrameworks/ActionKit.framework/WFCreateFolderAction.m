@implementation WFCreateFolderAction

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFStorageServiceAction filePathKey](self, "filePathKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCreateFolderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0B88];
    v27[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No path specified"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v27[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please make sure to specify a path for the new folder in the Create Folder action."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 4, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCreateFolderAction finishRunningWithError:](self, "finishRunningWithError:", v22);

    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  -[WFCreateFolderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFolder"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "fileURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "wf_fileIsDirectory"),
        v11,
        (v12 & 1) == 0))
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0B88];
    v25[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No folder specified!"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v25[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must specify where the folder should be created."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCreateFolderAction finishRunningWithError:](self, "finishRunningWithError:", v19);

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v10, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wf_fileProviderItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v24[3] = &unk_24F8B96D8;
    v24[4] = self;
    objc_msgSend(v5, "createFolderAtPath:parentDirectoryItem:completionHandler:", v7, v14, v24);
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v23[3] = &unk_24F8B96D8;
    v23[4] = self;
    objc_msgSend(v5, "createFolderAtPath:inDirectory:completionHandler:", v7, v10, v23);
  }
LABEL_11:

}

- (id)filenamePlaceholderText
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;

  -[WFStorageServiceAction storageService](self, "storageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageLocationPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("/"));

  if (v4)
    v5 = CFSTR("Adventure/");
  else
    v5 = CFSTR("/Adventure/");
  WFLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCreateFolderAction;
  return -[WFStorageServiceAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFCreateFolderAction input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BE19470];
    -[WFCreateFolderAction input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getContentLocationFromFile:completionHandler:", v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a folder name in %3$@?"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v11, v8, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)minimumSupportedClientVersion
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFCreateFolderAction;
  -[WFCreateFolderAction minimumSupportedClientVersion](&v5, sel_minimumSupportedClientVersion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFMaximumBundleVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFileWithOriginAttribution:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

void __66__WFCreateFolderAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFileWithOriginAttribution:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

@end
