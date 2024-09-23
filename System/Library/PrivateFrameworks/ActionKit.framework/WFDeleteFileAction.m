@implementation WFDeleteFileAction

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  char v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    -[WFDeleteFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDeleteImmediatelyDelete"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = objc_msgSend((id)objc_opt_class(), "resultItemClass");
    if (v10 == objc_opt_class())
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
      v14[3] = &unk_24F8BB370;
      v14[4] = self;
      objc_msgSend(v7, "deleteFiles:deleteImmediately:completionHandler:", v6, v9, v14);
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
      v11[3] = &unk_24F8B4FA0;
      v11[4] = self;
      v12 = v7;
      v13 = v9;
      objc_msgSend(v6, "getFileRepresentations:forType:", v11, 0);

    }
  }
  else
  {
    -[WFDeleteFileAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

uint64_t __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[7];
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3;
  v32[3] = &unk_24F8B4F50;
  v10 = v7;
  v33 = v10;
  v11 = v8;
  v34 = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);
  if (objc_msgSend(v10, "count")
    || (objc_msgSend(v11, "items"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13))
  {
    v14 = dispatch_group_create();
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__24026;
    v30[4] = __Block_byref_object_dispose__24027;
    v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__24026;
    v28[4] = __Block_byref_object_dispose__24027;
    v29 = 0;
    if (objc_msgSend(v10, "count"))
    {
      dispatch_group_enter(v14);
      v15 = *(void **)(a1 + 40);
      v16 = *(unsigned __int8 *)(a1 + 48);
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_116;
      v25[3] = &unk_24F8B4F78;
      v27 = v30;
      v26 = v14;
      objc_msgSend(v15, "deleteItems:deleteImmediately:completionHandler:", v10, v16, v25);

    }
    objc_msgSend(v11, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      dispatch_group_enter(v14);
      v19 = *(void **)(a1 + 40);
      v20 = *(unsigned __int8 *)(a1 + 48);
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2_117;
      v22[3] = &unk_24F8B4F78;
      v24 = v28;
      v23 = v14;
      objc_msgSend(v19, "deleteFiles:deleteImmediately:completionHandler:", v11, v20, v22);

    }
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3_118;
    v21[3] = &unk_24F8B5F00;
    v21[4] = *(_QWORD *)(a1 + 32);
    v21[5] = v30;
    v21[6] = v28;
    dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], v21);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_fileProviderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  else
    objc_msgSend(*(id *)(a1 + 40), "addFile:", v5);

}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_116(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2_117(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3_118(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if (!v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  return objc_msgSend(v2, "finishRunningWithError:", v3);
}

@end
