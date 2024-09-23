@implementation INAddTasksIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (v5)
  {
    objc_msgSend(a3, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "underlyingInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "intentResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "intentResponse");
      v9 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = (void *)v9;
      else
        v10 = 0;
      v11 = v10;
      objc_msgSend(v11, "modifiedTaskList");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE84D80], "acs_uniquelyIdentifiedCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE84F80], "acs_uniquelyIdentifiedCardSection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "spokenPhrase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v16);

      objc_msgSend(v14, "setIsCentered:", 1);
      objc_msgSend(v14, "setSeparatorStyle:", 5);
      objc_msgSend(v14, "setTitleAlign:", 1);
      objc_msgSend(v14, "setTitleWeight:", &unk_24D479BC8);
      v17 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromSelector(sel_modifiedTaskList);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_title);
      v32 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acs_setParameters:", v22);

      objc_msgSend(v13, "addObject:", v14);
      objc_msgSend(MEMORY[0x24BE84F10], "acs_wildCardSection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v23);

      objc_msgSend(v11, "addedTasks");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __57__INAddTasksIntent_ACSCardRequesting__requestCard_reply___block_invoke;
      v33[3] = &unk_24D478728;
      v34 = v13;
      v25 = v13;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v33);

      v6 = v32;
      objc_msgSend(v12, "setCardSections:", v25);
      objc_msgSend(v12, "acs_setInteraction:", v7);
      v5[2](v5, v12, 0);

      v26 = v31;
      v27 = v30;
    }
    else
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BE15488];
      v36 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 400, v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v5)[2](v5, 0, v12);
    }

  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end
