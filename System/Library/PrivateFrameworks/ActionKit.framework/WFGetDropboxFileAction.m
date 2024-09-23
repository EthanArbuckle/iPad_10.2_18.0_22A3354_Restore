@implementation WFGetDropboxFileAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFDF18;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGetDropboxFileAction;
  objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithServiceName_directoryPath_options_completionHandler_, 0, 1);

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
  __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[WFStorageServiceAction showsFilePicker](self, "showsFilePicker"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__WFGetDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v11[3] = &unk_24F8B9688;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[WFGetDropboxFileAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v11);

  }
  else
  {
    -[WFGetDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetFilePath"), objc_opt_class());
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("/")) & 1) == 0)
    {
      if (v8)
        v9 = v8;
      else
        v9 = &stru_24F8BBA48;
      objc_msgSend(CFSTR("/"), "stringByAppendingString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v10;
    }
    -[WFGetDropboxFileAction runWithRemoteUserInterface:path:input:storageService:](self, "runWithRemoteUserInterface:path:input:storageService:", 0, v8, v6, v7);

  }
}

- (void)runWithRemoteUserInterface:(id)a3 path:(id)a4 input:(id)a5 storageService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  id *v22;
  id *v23;
  id v24;
  id v25;
  void *v26;
  unsigned int v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFGetDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetFileInitialDirectoryPath"), objc_opt_class());
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    if (v14)
      v15 = v14;
    else
      v15 = &stru_24F8BBA48;
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v16;
  }
  v17 = objc_opt_class();
  if (v10)
  {
    -[WFGetDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("SelectMultiple"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
      v20 = 2;
    else
      v20 = 0;
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke;
    v32[3] = &unk_24F8BB348;
    v22 = &v33;
    v32[4] = self;
    v33 = v13;
    v23 = &v34;
    v34 = v12;
    v24 = v12;
    v25 = v13;
    objc_msgSend(v10, "showWithServiceName:directoryPath:options:completionHandler:", v21, v14, v20, v32);
  }
  else
  {
    -[WFGetDropboxFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFileErrorIfNotFound"), v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    -[WFGetDropboxFileAction progress](self, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3;
    v29[3] = &unk_24F8BB348;
    v22 = &v30;
    v29[4] = self;
    v30 = v13;
    v23 = &v31;
    v31 = v12;
    v28 = v12;
    objc_msgSend(v13, "retrieveFilesAtPath:options:progress:completionHandler:", v11, v27, v21, v29);
  }

}

- (id)filePathKey
{
  return CFSTR("WFGetFilePath");
}

- (id)showPickerKey
{
  return CFSTR("WFShowFilePicker");
}

- (id)filenamePlaceholderText
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;

  -[WFGetDropboxFileAction storageService](self, "storageService");
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

- (BOOL)multipleSelectionEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[WFGetDropboxFileAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("SelectMultiple"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "number");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "number");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)outputsMultipleItems
{
  _BOOL4 v3;

  if (!-[WFStorageServiceAction showsFilePicker](self, "showsFilePicker")
    || (v3 = -[WFGetDropboxFileAction multipleSelectionEnabled](self, "multipleSelectionEnabled")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFGetDropboxFileAction;
  v7 = -[WFStorageServiceAction setParameterState:forKey:](&v11, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    -[WFGetDropboxFileAction showPickerKey](self, "showPickerKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (v9)
      -[WFGetDropboxFileAction updateVisibleParameters](self, "updateVisibleParameters");
  }

  return v7;
}

- (void)initializeParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFGetDropboxFileAction;
  -[WFStorageServiceAction initializeParameters](&v3, sel_initializeParameters);
  -[WFGetDropboxFileAction updateVisibleParameters](self, "updateVisibleParameters");
}

- (void)updateVisibleParameters
{
  _BOOL4 v3;
  void *v4;
  id v5;

  -[WFGetDropboxFileAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetFileInitialDirectoryPath"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WFStorageServiceAction showsFilePicker](self, "showsFilePicker");
  if (v3 && -[WFStorageServiceAction showsFilePicker](self, "showsFilePicker"))
  {
    -[WFGetDropboxFileAction storageService](self, "storageService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "supportsJumpingToSubdirectoryInUI") ^ 1);

  }
  else
  {
    objc_msgSend(v5, "setHidden:", !v3);
  }

}

- (id)storageService
{
  return objc_alloc_init(WFDropboxStorageService);
}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke(id *a1, void *a2, void *a3)
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
      v12[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2;
      v12[3] = &unk_24F8BB180;
      v12[4] = a1[4];
      v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);

    }
  }

}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_3(id *a1, void *a2, void *a3)
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
      v12[2] = __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4;
      v12[3] = &unk_24F8BB180;
      v12[4] = a1[4];
      v13 = a1[6];
      WFContentCollectionFromStorageServiceResult(v5, v9, v11, v12);

    }
  }

}

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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

void __79__WFGetDropboxFileAction_runWithRemoteUserInterface_path_input_storageService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t __68__WFGetDropboxFileAction_runAsynchronouslyWithInput_storageService___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "runWithRemoteUserInterface:path:input:storageService:", a2, 0, a1[5], a1[6]);
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

@end
