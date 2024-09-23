@implementation WFSaveDropboxFileAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFE060;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFSaveDropboxFileAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithServiceName_input_managedLevel_options_completionHandler_, 1, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithServiceName_input_managedLevel_options_completionHandler_, 0, 1);

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
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  id v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v21 = 0;
    objc_msgSend(v6, "attributionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEligibleToShareWithResultManagedLevel:", &v21);

    if ((v9 & 1) != 0)
    {
      v10 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
      aBlock[3] = &unk_24F8BB0A0;
      aBlock[4] = self;
      v11 = v6;
      v19 = v11;
      v20 = v7;
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_4;
      v16[3] = &unk_24F8BB108;
      v16[4] = self;
      v17 = _Block_copy(aBlock);
      v12 = v17;
      objc_msgSend(v11, "enumerateFileRepresentations:forType:completionHandler:", &__block_literal_global_47794, 0, v16);

    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      -[WFSaveDropboxFileAction localizedName](self, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sharingMixedMDMContentErrorWithActionName:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSaveDropboxFileAction finishRunningWithError:](self, "finishRunningWithError:", v15);

    }
  }
  else
  {
    -[WFSaveDropboxFileAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke;
  v18[3] = &unk_24F8BB1D0;
  v18[4] = self;
  v19 = v12;
  v20 = v10;
  v21 = v13;
  v22 = v11;
  v14 = v11;
  v15 = v13;
  v16 = v10;
  v17 = v12;
  objc_msgSend(v17, "getFileRepresentations:forType:", v18, 0);

}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFSaveDropboxFileAction actionUserInterface](self, "actionUserInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WFSaveDropboxFileAction saveOperation](self, "saveOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)WFSaveDropboxFileAction;
  -[WFSaveDropboxFileAction cancel](&v5, sel_cancel);
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFSaveDropboxFileAction setSaveOperation:](self, "setSaveOperation:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFSaveDropboxFileAction;
  -[WFSaveDropboxFileAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

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
    WFLocalizedString(CFSTR("Allow “%1$@” to save %2$@ on Dropbox?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to save a file on Dropbox?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WFSaveDropboxFileActionUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (void)setActionUserInterface:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserInterface, a3);
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
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *, void *, void *);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;

  v5 = a2;
  if (v5)
  {
    v31 = 0;
    objc_msgSend(*(id *)(a1 + 40), "attributionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isEligibleToShareWithResultManagedLevel:", &v31);

    if (*(_QWORD *)(a1 + 48))
    {
      v7 = (id)*MEMORY[0x24BEC1770];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2;
      v29[3] = &unk_24F8BB158;
      v30 = v7;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4;
      v24[3] = &unk_24F8BB1A8;
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = *(id *)(a1 + 48);
      v26 = *(id *)(a1 + 56);
      v28 = v31;
      v27 = *(id *)(a1 + 40);
      objc_msgSend(v5, "if_mapAsynchronously:completionHandler:", v29, v24);

      v8 = v30;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSaveFileOverwrite"), objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      v11 = v10;
      v12 = v31;
      v13 = *(void **)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_7;
      v20 = &unk_24F8BB348;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 40);
      objc_msgSend(v13, "saveFiles:withManagedLevel:toPath:options:progress:completionHandler:", v5, v12, v14, v11, v15, &v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSaveOperation:", v16, v17, v18, v19, v20, v21);

      v8 = v22;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a2, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3;
  v10[3] = &unk_24F8BB130;
  v11 = v6;
  v9 = v6;
  +[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:](WFFileStorageServiceResult, "getResultWithFileURL:consumingBundleID:resultBlock:", v7, v8, v10);

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_5;
    v10[3] = &unk_24F8BB348;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v7, "showWithServiceName:input:managedLevel:options:completionHandler:", v8, v5, v9, 0, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(a1[4], "isRunning"))
  {
    if (v6)
    {
      objc_msgSend(a1[4], "finishRunningWithError:", v6);
    }
    else
    {
      v7 = (void *)MEMORY[0x24BE19390];
      objc_msgSend(a1[5], "associatedAppDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationWithAppDescriptor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "progress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_8;
      v12[3] = &unk_24F8BB180;
      v12[4] = a1[4];
      v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);

    }
  }

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = a2;
  if (!a2)
    v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", v3);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(a1[4], "isRunning"))
  {
    if (v6)
    {
      objc_msgSend(a1[4], "finishRunningWithError:", v6);
    }
    else
    {
      v7 = (void *)MEMORY[0x24BE19390];
      objc_msgSend(a1[5], "associatedAppDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationWithAppDescriptor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "progress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_6;
      v12[3] = &unk_24F8BB180;
      v12[4] = a1[4];
      v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);

    }
  }

}

void __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = a2;
  if (!a2)
    v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", v3);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __80__WFSaveDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(id *a1)
{
  int v2;
  id v3;
  __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v2 = objc_msgSend(a1[4], "showsFilePicker");
  v3 = a1[4];
  if (v2)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v9[3] = &unk_24F8BB078;
    v9[4] = v3;
    v10 = a1[5];
    v11 = a1[6];
    objc_msgSend(v3, "requestInterfacePresentationWithCompletionHandler:", v9);

  }
  else
  {
    objc_msgSend(v3, "parameterValueForKey:ofClass:", CFSTR("WFFileDestinationPath"), objc_opt_class());
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString hasPrefix:](v7, "hasPrefix:", CFSTR("/")) & 1) != 0)
    {
      v4 = v7;
    }
    else
    {
      if (v7)
        v5 = v7;
      else
        v5 = &stru_24F8BBA48;
      objc_msgSend(CFSTR("/"), "stringByAppendingString:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v6;
    }
    objc_msgSend(a1[4], "runWithRemoteUserInterface:path:input:storageService:", 0, v4);

  }
}

uint64_t __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void (**v5)(id, void *);
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "representationType") == 1
    && (objc_msgSend(v4, "fileURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "wf_fileIsDirectory"),
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” is a folder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” could not be saved because it is a folder or package. Consider zipping this file using Make Archive before saving."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD1128];
    v18 = *MEMORY[0x24BDD0FC8];
    v21[0] = *MEMORY[0x24BDD0FD8];
    v21[1] = v18;
    v22[0] = v11;
    v22[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 21, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v20);
  }
  else
  {
    v5[2](v5, 0);
  }

}

uint64_t __69__WFSaveDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "runWithRemoteUserInterface:path:input:storageService:", a2, 0, a1[5], a1[6]);
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

@end
