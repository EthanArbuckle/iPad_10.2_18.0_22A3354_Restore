@implementation WFGetPostersAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[WFGetPostersAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPosterType"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BEC3F90]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_24F8BA068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getPostersWithCompletionHandler:", v7);

}

- (void)finishWithPosters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[WFGetPostersAction output](self, "output");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[WFGetPostersAction finishRunningWithError:](self, "finishRunningWithError:", 0);

}

- (id)disabledOnPlatforms
{
  return &unk_24F93C570;
}

void __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "localizedName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v9);

    goto LABEL_9;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("All")))
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Current")))
      goto LABEL_10;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v10 = (void *)getPRSServiceClass_softClass;
    v19 = getPRSServiceClass_softClass;
    v11 = MEMORY[0x24BDAC760];
    if (!getPRSServiceClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getPRSServiceClass_block_invoke;
      v15[3] = &unk_24F8BB430;
      v15[4] = &v16;
      __getPRSServiceClass_block_invoke((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v16, 8);
    v8 = objc_alloc_init(v12);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_2;
    v13[3] = &unk_24F8B5218;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    objc_msgSend(v8, "fetchActivePosterConfiguration:", v13);

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithPosters:", v5);
LABEL_10:

}

void __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "lockScreenPosterConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_3;
    v21[3] = &unk_24F8B51F0;
    v8 = v6;
    v22 = v8;
    objc_msgSend(v7, "if_firstObjectPassingTest:", v21);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = *(void **)(a1 + 32);
    if (v9)
    {
      v23 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithPosters:", v12);
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BEC4270];
      v24[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Unable to Get All Wallpapers"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v24[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("An error occurred getting the current wallpaper."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 6, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishRunningWithError:", v20);

    }
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishRunningWithError:", v15);

  }
}

uint64_t __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

@end
