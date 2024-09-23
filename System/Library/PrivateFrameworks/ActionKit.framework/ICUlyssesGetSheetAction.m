@implementation ICUlyssesGetSheetAction

- (BOOL)outputsMultipleItems
{
  return 0;
}

- (id)outputContentClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v12 = a6;
  v17 = a7;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v18[3] = &unk_24F8B4498;
  v19 = v12;
  v16[1] = 3221225472;
  v16[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3;
  v16[3] = &unk_24F8B8C28;
  v15.receiver = self;
  v15.super_class = (Class)ICUlyssesGetSheetAction;
  v16[0] = MEMORY[0x24BDAC760];
  v13 = v17;
  v14 = v12;
  -[ICSchemeAction performActionWithInput:parameters:userInterface:successHandler:errorHandler:](&v15, sel_performActionWithInput_parameters_userInterface_successHandler_errorHandler_, a3, a4, a5, v18, v16);

}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  _QWORD v4[4];
  id v5;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v4[3] = &unk_24F8B72E0;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(a2, "getStringRepresentation:", v4);

  }
}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "code") == 4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("WFUlyssesAccessToken"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("WFUlyssesAccessResourceAvailabilityChangedNotification"), 0);

    v10[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Ulysses Access Required"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v10[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please re-authorize Shortcuts with Ulysses to access this sheet."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4638], 0, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__ICUlyssesGetSheetAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v15 = v5;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;

      if (v7)
      {
        v14 = v8;
        objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v7, &v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v14;

        if (v9)
        {
          v10 = (void *)MEMORY[0x24BE19438];
          objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "collectionWithItems:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
        v9 = 0;
        v5 = v8;
      }
    }
    else
    {
      v13 = 0;
      v9 = 0;
      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
