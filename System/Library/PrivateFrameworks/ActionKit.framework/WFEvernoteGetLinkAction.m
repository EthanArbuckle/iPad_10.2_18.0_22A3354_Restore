@implementation WFEvernoteGetLinkAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  char v13;

  v4 = a3;
  -[WFEvernoteGetLinkAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteShareInAppLink"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v10[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_24F8B2B20;
  v13 = v6;
  v12 = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke_3;
  v10[3] = &unk_24F8BAFA8;
  v9 = v7;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v8, v11, v10);

}

void __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD v31[4];
  id v32;

  v7 = a2;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!*(_BYTE *)(a1 + 40))
  {
    v17 = *(void **)(a1 + 32);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke_2;
    v31[3] = &unk_24F8B72E0;
    v32 = v8;
    objc_msgSend(v17, "shareNote:completion:", v7, v31);

    goto LABEL_14;
  }
  v10 = (void *)MEMORY[0x24BDBCF48];
  v11 = *(void **)(a1 + 32);
  v12 = v7;
  v13 = v11;
  v14 = v12;
  v15 = v13;
  if (objc_msgSend(v14, "type"))
  {
    if (objc_msgSend(v14, "type") == 1)
    {
      objc_msgSend(v15, "businessUser");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v14, "type") != 2)
      {
        v19 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v14, "linkedNotebook");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v15, "user");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v16;
  objc_msgSend(v16, "shardId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "user");
    v29 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "id");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "intValue");
    objc_msgSend(v14, "guid");
    v30 = v9;
    v24 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "guid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("evernote:///view/%d/%@/%@/%@/"), v23, v19, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v24;
    v9 = v30;

    v10 = v29;
  }
  else
  {
    v27 = 0;
  }

  objc_msgSend(v10, "URLWithString:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v28, 0);

LABEL_14:
}

void __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __54__WFEvernoteGetLinkAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
