@implementation WFSaveFileAction

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
  v12.super_class = (Class)&OBJC_METACLASS___WFSaveFileAction;
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

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  __CFString *v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  objc_msgSend(v6, "attributionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEligibleToShareWithResultManagedLevel:", &v25);

  if ((v9 & 1) != 0)
  {
    if (objc_msgSend(v6, "numberOfItems"))
    {
      -[WFSaveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskWhereToSave"), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      -[WFSaveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFileDestinationPath"), objc_opt_class());
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_24F8BBA48;
      if (v12)
        v14 = (__CFString *)v12;
      v15 = v14;

      if (v11)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __62__WFSaveFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
        v21[3] = &unk_24F8B4BF8;
        v21[4] = self;
        v22 = v6;
        v23 = v7;
        v24 = v15;
        -[WFSaveFileAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v21);

      }
      else
      {
        -[WFSaveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFolder"), objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSaveFileAction runWithStorageService:directory:subpath:input:](self, "runWithStorageService:directory:subpath:input:", v7, v20, v15, v6);

      }
    }
    else
    {
      -[WFSaveFileAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    -[WFSaveFileAction localizedName](self, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sharingMixedMDMContentErrorWithActionName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSaveFileAction finishRunningWithError:](self, "finishRunningWithError:", v18);

  }
}

- (void)runWithStorageService:(id)a3 directory:(id)a4 subpath:(id)a5 input:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke;
  v15[3] = &unk_24F8B7B28;
  v15[4] = self;
  v16 = v11;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v14, "getFileRepresentations:forType:", v15, 0);

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4 storageService:(id)a5 subpath:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x24BDD1488];
  v14 = a3;
  objc_msgSend(v13, "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__WFSaveFileAction_runWithRemoteUserInterface_input_storageService_subpath___block_invoke;
  v20[3] = &unk_24F8B7B28;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v10;
  v17 = v10;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v14, "retrieveFilesWithConsumingBundleID:options:completionHandler:", v16, 8, v20);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFSaveFileAction saveOperation](self, "saveOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFSaveFileAction;
  -[WFSaveFileAction cancel](&v4, sel_cancel);
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFSaveFileAction setSaveOperation:](self, "setSaveOperation:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFSaveFileAction;
  -[WFSaveFileAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

}

- (id)filePathKey
{
  return CFSTR("WFFileDestinationPath");
}

- (id)showPickerKey
{
  return CFSTR("WFAskWhereToSave");
}

- (BOOL)inputsMultipleItems
{
  return 1;
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSaveFileAction;
  return -[WFStorageServiceAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  void *v5;

  if (-[WFStorageServiceAction showsFilePicker](self, "showsFilePicker", a3))
  {
    v4 = 0;
  }
  else
  {
    -[WFSaveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFolder"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE19470], "contentLocationForFile:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to save %2$@ to a file?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to save data to a file?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)minimumSupportedClientVersion
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSaveFileAction;
  -[WFSaveFileAction minimumSupportedClientVersion](&v5, sel_minimumSupportedClientVersion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFMaximumBundleVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFFileStorageServiceOperation)saveOperation
{
  return self->_saveOperation;
}

- (void)setSaveOperation:(id)a3
{
  objc_storeStrong((id *)&self->_saveOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveOperation, 0);
}

void __76__WFSaveFileAction_runWithRemoteUserInterface_input_storageService_subpath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v6, "wrappedURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileWithURL:options:", v10, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "variableSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "captureFileRepresentation:", v11);

      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v11, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "runWithStorageService:directory:subpath:input:", v14, v15, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0B88];
      v21 = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("The Save File action failed because there was a problem with the selected destination."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 256, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v20);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  WFDefaultFileStorageService *v11;
  uint64_t v12;
  WFDefaultFileStorageService *v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFDefaultFileStorageService *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD aBlock[5];
  WFDefaultFileStorageService *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "if_map:", &__block_literal_global_23132);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(a1[5], "attributionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isEligibleToShareWithResultManagedLevel:", &v44);

    objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFSaveFileOverwrite"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = objc_alloc_init(WFDefaultFileStorageService);
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_3;
    aBlock[3] = &unk_24F8B4C80;
    aBlock[4] = a1[4];
    v13 = v11;
    v38 = v13;
    v14 = v7;
    v39 = v14;
    v42 = v44;
    v40 = a1[6];
    v41 = a1[7];
    v43 = v10;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_6;
    v30[3] = &unk_24F8B4CA8;
    v32 = &v33;
    v31 = a1[6];
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v30);
    if (*((_BYTE *)v34 + 24))
    {
      v26 = v13;
      objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Allow this shortcut to make a change to shell configuration file?"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v17);

      WFLocalizedString(CFSTR("The content of this file will be executed automatically and could be malicious."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMessage:", v18);

      v19 = (void *)MEMORY[0x24BE19378];
      WFLocalizedString(CFSTR("Don’t Allow"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_7;
      v29[3] = &unk_24F8BB638;
      v29[4] = a1[4];
      objc_msgSend(v19, "buttonWithTitle:style:handler:", v20, 1, v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addButton:", v21);

      v22 = (void *)MEMORY[0x24BE19378];
      WFLocalizedString(CFSTR("OK"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_8;
      v27[3] = &unk_24F8BB608;
      v28 = v15;
      objc_msgSend(v22, "buttonWithTitle:style:preferred:handler:", v23, 0, 1, v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addButton:", v24);

      objc_msgSend(a1[4], "userInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentAlert:", v16);

      v13 = v26;
    }
    else
    {
      v15[2](v15);
    }

    _Block_object_dispose(&v33, 8);
  }

}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v10[2] = __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_4;
  v10[3] = &unk_24F8BB6B0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  objc_msgSend(v7, "saveFiles:withManagedLevel:toDirectory:subpath:options:progress:completionHandler:", v2, v4, v3, v5, v6, v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSaveOperation:", v9);

}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(a2, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10 != 0;

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_7(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

uint64_t __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    if (v8)
    {
      objc_msgSend(v8, "if_map:", &__block_literal_global_180);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addItems:", v6);

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
    }
  }

}

uint64_t __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:", a2);
}

id __66__WFSaveFileAction_runWithStorageService_directory_subpath_input___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD17B8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithURL:readonly:", v5, 1);
  return v6;
}

uint64_t __62__WFSaveFileAction_runAsynchronouslyWithInput_storageService___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "runWithRemoteUserInterface:input:storageService:subpath:", a2, a1[5], a1[6], a1[7]);
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

@end
