@implementation WFTodoistAddAction

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTodoistAddAction;
  -[WFTodoistAddAction initializeParameters](&v7, sel_initializeParameters);
  -[WFTodoistAddAction resourceManager](self, "resourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceObjectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTodoistAddAction parameterForKey:](self, "parameterForKey:", CFSTR("WFTodoistProject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessResource:", v5);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(void);
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  WFTodoistAddAction *v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD aBlock[5];
  _QWORD v49[4];
  _QWORD v50[5];
  id v51;

  v4 = a3;
  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistContent"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistProject"), objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistDueDate"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistReminder"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistReminderType"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v8, "reminderServiceWithReminderType:", v9);

  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistPriority"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 5 - objc_msgSend(v10, "integerValue");

  -[WFTodoistAddAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTodoistNotes"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTodoistAddAction parameterForKey:](self, "parameterForKey:", CFSTR("WFTodoistProject"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v5;
  objc_msgSend(v23, "projectNamed:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__13982;
  v50[4] = __Block_byref_object_dispose__13983;
  v51 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v49[3] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke;
  aBlock[3] = &unk_24F8BB638;
  aBlock[4] = self;
  v14 = _Block_copy(aBlock);
  v43[0] = v13;
  v43[1] = 3221225472;
  v43[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_2;
  v43[3] = &unk_24F8B2D20;
  v46 = v50;
  v47 = v49;
  v22 = v4;
  v44 = v22;
  v45 = v14;
  v15 = _Block_copy(v43);
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_7;
  v31[3] = &unk_24F8B2D70;
  v39 = v50;
  v16 = v12;
  v32 = v16;
  v17 = v27;
  v33 = v17;
  v18 = v6;
  v34 = v18;
  v19 = v7;
  v35 = v19;
  v41 = v26;
  v42 = v25;
  v20 = v11;
  v36 = v20;
  v37 = self;
  v40 = v49;
  v38 = v15;
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_9;
  v28[3] = &unk_24F8B2DC0;
  v29 = _Block_copy(v31);
  v30 = v50;
  v28[4] = self;
  v21 = (void (**)(void))_Block_copy(v28);
  v21[2]();

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "todoistLocation", a3);
}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_3;
  v4[3] = &unk_24F8B2CF8;
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "getFileRepresentations:forType:", v4, 0);

}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_7(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v1 = (void *)a1[10];
  v2 = *(void **)(*(_QWORD *)(a1[11] + 8) + 40);
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v8 = a1[13];
  v7 = a1[14];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_8;
  v11[3] = &unk_24F8B2D48;
  v10 = a1[8];
  v9 = a1[9];
  v13 = a1[12];
  v11[4] = v9;
  v12 = v1;
  objc_msgSend(v2, "createItemInProject:content:dueDateString:reminderDateString:reminderService:priority:note:completionHandler:", v3, v4, v5, v6, v8, v7, v10, v11);

}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceObjectsOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_10;
  v12[3] = &unk_24F8B2D98;
  v13 = v8;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v10 = v8;
  objc_msgSend(v10, "refreshWithCompletionHandler:", v12);

}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1)
{
  WFTodoistSessionManager *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(WFTodoistSessionManager);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCredential:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v10 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://todoist.com/showTask?id=%ld"), a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    v5 = v10;
  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_4;
  v5[3] = &unk_24F8B2CD0;
  v6 = *(_OWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_6;
  v3[3] = &unk_24F8B9110;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_mapAsynchronously:completionHandler:", v5, v3);

}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_5;
  v11[3] = &unk_24F8B2CA8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "createFileOnItemWithId:withFile:completionHandler:", v9, a2, v11);

}

uint64_t __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__WFTodoistAddAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

+ (int64_t)reminderServiceWithReminderType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Text Message")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Push Notification"));

  return v4;
}

@end
