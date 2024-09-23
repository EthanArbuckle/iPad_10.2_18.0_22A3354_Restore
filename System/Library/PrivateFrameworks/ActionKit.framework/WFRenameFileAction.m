@implementation WFRenameFileAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFRenameFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNewFilename"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__WFRenameFileAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8B96B0;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v4, "getFileRepresentation:forType:", v13, 0);

  }
  else
  {
    WFLocalizedString(CFSTR("No Name Provided"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Please pass a name to the Rename File action."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC4270];
    v10 = *MEMORY[0x24BDD0FC8];
    v15[0] = *MEMORY[0x24BDD0FD8];
    v15[1] = v10;
    v16[0] = v6;
    v16[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRenameFileAction finishRunningWithError:](self, "finishRunningWithError:", v12);

  }
}

- (void)renameFile:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFDefaultFileStorageService *v9;
  uint64_t v10;
  id v11;
  WFDefaultFileStorageService *v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
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
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[5];
  _QWORD aBlock[4];
  id v32;
  WFDefaultFileStorageService *v33;
  id v34;
  WFRenameFileAction *v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "updatedFilenameForUserEnteredName:addingExtensionIfNecessary:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(WFDefaultFileStorageService);
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFRenameFileAction_renameFile_name___block_invoke;
  aBlock[3] = &unk_24F8B9728;
  v11 = v6;
  v32 = v11;
  v12 = v9;
  v33 = v12;
  v13 = v8;
  v34 = v13;
  v35 = self;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v11, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFDefaultFileStorageService fileIsInProtectedList:](v12, "fileIsInProtectedList:", v17))
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Allow this shortcut to make a change to shell configuration file?"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    WFLocalizedString(CFSTR("The content of this file will be executed automatically and could be malicious."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMessage:", v20);

    v21 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("Don’t Allow"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_6;
    v30[3] = &unk_24F8BB638;
    v30[4] = self;
    objc_msgSend(v21, "buttonWithTitle:style:handler:", v22, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButton:", v23);

    v24 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("OK"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_7;
    v28[3] = &unk_24F8BB608;
    v29 = v14;
    objc_msgSend(v24, "buttonWithTitle:style:preferred:handler:", v25, 0, 1, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButton:", v26);

    -[WFRenameFileAction userInterface](self, "userInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "presentAlert:", v18);

  }
  else
  {
    v14[2](v14);
  }

}

- (void)finishRunningWithFile:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[WFRenameFileAction isRunning](self, "isRunning"))
  {
    if (v8)
    {
      -[WFRenameFileAction output](self, "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addFileWithOriginAttribution:", v8);

    }
    -[WFRenameFileAction finishRunningWithError:](self, "finishRunningWithError:", v6);
  }

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFRenameFileAction input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BE19470];
    -[WFRenameFileAction input](self, "input");
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
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to rename a file in “%2$@” using %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to rename a file in “%2$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (WFFileRepresentation)parentDirectory
{
  return self->_parentDirectory;
}

- (void)setParentDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_parentDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentDirectory, 0);
}

void __38__WFRenameFileAction_renameFile_name___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_fileProviderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_2;
    v30[3] = &unk_24F8B96D8;
    v30[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "renameItem:name:withManagedLevel:progress:completionHandler:", v3, v5, 0, 0, v30);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workflowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolveFilePath:workflowID:error:", v9, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14 = (void *)MEMORY[0x24BE194F8];
      objc_msgSend(v12, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileWithURL:options:", v15, 8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setParentDirectory:", v16);

      v18 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_3;
      v29[3] = &unk_24F8B96D8;
      v29[4] = *(_QWORD *)(a1 + 56);
      objc_msgSend(v17, "moveFile:destination:withManagedLevel:progress:completionHandler:", v18, v13, 0, 0, v29);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "variableSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_4;
      v23[3] = &unk_24F8B9700;
      v21 = v7;
      v22 = *(_QWORD *)(a1 + 56);
      v24 = v21;
      v25 = v22;
      v26 = *(id *)(a1 + 40);
      v27 = *(id *)(a1 + 32);
      v28 = v13;
      objc_msgSend(v19, "requestAccessToFileAtURLs:completionHandler:", v20, v23);

    }
  }

}

void __38__WFRenameFileAction_renameFile_name___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithFile:error:", a2, a3);
}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithFile:error:", a2, a3);
}

void __38__WFRenameFileAction_renameFile_name___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "resolveFilePath:workflowID:error:", v3, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v6)
  {
    v8 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileWithURL:options:", v9, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setParentDirectory:", v10);

    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __38__WFRenameFileAction_renameFile_name___block_invoke_5;
    v14[3] = &unk_24F8B96D8;
    v13 = *(void **)(a1 + 48);
    v14[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v13, "moveFile:destination:withManagedLevel:progress:completionHandler:", v11, v12, 0, 0, v14);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v7);
  }

}

uint64_t __38__WFRenameFileAction_renameFile_name___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithFile:error:", a2, a3);
}

uint64_t __49__WFRenameFileAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "renameFile:name:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

@end
