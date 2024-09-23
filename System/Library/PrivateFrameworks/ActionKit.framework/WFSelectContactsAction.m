@implementation WFSelectContactsAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD248;
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
  v10.super_class = (Class)&OBJC_METACLASS___WFSelectContactsAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithProperties_selectMultiple_completionHandler_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithProperties_selectMultiple_completionHandler_, 0, 1);

  return v2;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v5 = a3;
  -[WFSelectContactsAction definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ContactProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSelectContactsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectMultiple"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_24F8BB6B0;
  v10[4] = self;
  objc_msgSend(v5, "showWithProperties:selectMultiple:completionHandler:", v7, v9, v10);

}

- (void)outputContacts:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  void (**v29)(_QWORD);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    -[WFSelectContactsAction definition](self, "definition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ContactProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_compactMap:", &__block_literal_global_181);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_opt_new();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v14);
      }

      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke_2;
      v28[3] = &unk_24F8B9560;
      v28[4] = self;
      v29 = v7;
      objc_msgSend(v11, "generateCollectionByCoercingToItemClasses:completionHandler:", v10, v28);

    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21);
            -[WFSelectContactsAction output](self, "output", (_QWORD)v24);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        }
        while (v19);
      }

      if (v7)
        v7[2](v7);
    }

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

uint64_t __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __59__WFSelectContactsAction_outputContacts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Phone")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("Email")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("URL")))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke_2;
    v9[3] = &unk_24F8BA480;
    v9[4] = v8;
    v10 = v6;
    objc_msgSend(v8, "outputContacts:completionHandler:", v5, v9);

  }
  else
  {
    objc_msgSend(v8, "finishRunningWithError:", v6);
  }

}

uint64_t __59__WFSelectContactsAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", *(_QWORD *)(a1 + 40));
}

@end
