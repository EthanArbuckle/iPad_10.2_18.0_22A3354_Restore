@implementation WFMoveFileAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  WFMoveFileAction *v16;
  char v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems") == 1)
  {
    -[WFMoveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFolder"), objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WFMoveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFReplaceExisting"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke;
      v14[3] = &unk_24F8B20B0;
      v5 = v5;
      v17 = v7;
      v15 = v5;
      v16 = self;
      objc_msgSend(v4, "getFileRepresentation:forType:", v14, 0);

    }
    else
    {
      -[WFMoveFileAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }
  }
  else
  {
    WFLocalizedString(CFSTR("No Input"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("No files were passed as input to the Move File action."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BEC4270];
    v11 = *MEMORY[0x24BDD0FC8];
    v18[0] = *MEMORY[0x24BDD0FD8];
    v18[1] = v11;
    v19[0] = v5;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMoveFileAction finishRunningWithError:](self, "finishRunningWithError:", v13);

  }
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[WFMoveFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFolder"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19470], "contentLocationForFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  -[WFMoveFileAction input](self, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItems");

  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10 <= 1)
    v12 = CFSTR("Allow “%1$@” to move a file in “%2$@”?");
  else
    v12 = CFSTR("Allow “%1$@” to move files in “%2$@”?");
  WFLocalizedString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFDefaultFileStorageService *v4;
  uint64_t v5;
  id v6;
  WFDefaultFileStorageService *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  void (**v28)(_QWORD);
  _QWORD v29[5];
  _QWORD aBlock[4];
  id v31;
  id v32;
  WFDefaultFileStorageService *v33;
  uint64_t v34;
  char v35;

  v3 = a2;
  v4 = objc_alloc_init(WFDefaultFileStorageService);
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_2;
  aBlock[3] = &unk_24F8B2088;
  v6 = v3;
  v31 = v6;
  v32 = *(id *)(a1 + 32);
  v7 = v4;
  v35 = *(_BYTE *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v33 = v7;
  v34 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFDefaultFileStorageService fileIsInProtectedList:](v7, "fileIsInProtectedList:", v13))
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Allow this shortcut to make a change to shell configuration file?"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    WFLocalizedString(CFSTR("The content of this file will be executed automatically and could be malicious."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMessage:", v16);

    v17 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("Don’t Allow"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_5;
    v29[3] = &unk_24F8BB638;
    v29[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "buttonWithTitle:style:handler:", v18, 1, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", v19);

    v20 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("OK"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    v25 = 3221225472;
    v26 = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_6;
    v27 = &unk_24F8BB608;
    v28 = v9;
    objc_msgSend(v20, "buttonWithTitle:style:preferred:handler:", v21, 0, 1, &v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", v22, v24, v25, v26, v27);

    objc_msgSend(*(id *)(a1 + 40), "userInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentAlert:", v14);

  }
  else
  {
    v9[2](v9);
  }

}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_fileProviderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wf_fileProviderItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(unsigned __int8 *)(a1 + 64);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_24F8B96D8;
    v7 = *(void **)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "moveItem:replaceExisting:withManagedLevel:toDirectory:progress:completionHandler:", v3, v6, 0, v5, 0, v13);

  }
  else
  {
    v8 = *(unsigned __int8 *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_4;
    v12[3] = &unk_24F8B96D8;
    v11 = *(void **)(a1 + 48);
    v12[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v11, "moveFile:replaceExisting:withManagedLevel:toDirectory:progress:completionHandler:", v9, v8, 0, v10, 0, v12);
  }

}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

uint64_t __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v6 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v6, "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addFileWithOriginAttribution:", v8);

      v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(v6, "finishRunningWithError:", v5);
  }

}

void __47__WFMoveFileAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v6 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v6, "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addFileWithOriginAttribution:", v8);

      v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(v6, "finishRunningWithError:", v5);
  }

}

@end
