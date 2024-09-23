@implementation WFTrimVideoAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFC9F8;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_24F8B96B0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "getFileRepresentation:forType:", v8, 0);

}

void __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v7 = (void *)getUIVideoEditorControllerClass_softClass;
    v25 = getUIVideoEditorControllerClass_softClass;
    if (!getUIVideoEditorControllerClass_softClass)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __getUIVideoEditorControllerClass_block_invoke;
      v21[3] = &unk_24F8BB430;
      v21[4] = &v22;
      __getUIVideoEditorControllerClass_block_invoke((uint64_t)v21);
      v7 = (void *)v23[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "canEditVideoAtPath:", v10);

    if ((v8 & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = objc_alloc(MEMORY[0x24BDD17B8]);
      objc_msgSend(v5, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithURL:", v13);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke_2;
      v19[3] = &unk_24F8B1B98;
      v19[4] = *(_QWORD *)(a1 + 32);
      v20 = v5;
      objc_msgSend(v11, "showWithVideo:completionHandler:", v14, v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The input was not a video that can be edited."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 2048, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v18);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

void __54__WFTrimVideoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(a2, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileWithURL:options:", v6, 13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addFile:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);

}

@end
