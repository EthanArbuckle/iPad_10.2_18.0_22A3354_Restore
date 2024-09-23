@implementation WFPocketAddAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  dispatch_group_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  WFPocketAddAction *v11;
  _QWORD v12[4];
  NSObject *v13;
  WFPocketAddAction *v14;

  v4 = a3;
  v5 = dispatch_group_create();
  -[WFPocketAddAction setAddGroup:](self, "setAddGroup:", v5);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke;
  v12[3] = &unk_24F8B37A0;
  v13 = v5;
  v14 = self;
  v7 = objc_opt_class();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_2;
  v9[3] = &unk_24F8B37C8;
  v10 = v13;
  v11 = self;
  v8 = v13;
  objc_msgSend(v4, "enumerateObjectRepresentations:forClass:completionHandler:", v12, v7, v9);

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFPocketAddAction setAddGroup:](self, "setAddGroup:", 0);
  -[WFPocketAddAction setLastError:](self, "setLastError:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFPocketAddAction;
  -[WFPocketAddAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

}

- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6
{
  NSObject *v7;

  if (a6)
    -[WFPocketAddAction setLastError:](self, "setLastError:", a6, a4, a5);
  -[WFPocketAddAction addGroup](self, "addGroup", a3, a4, a5);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v7);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "pocketLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to Pocket?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to add content to Pocket?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (OS_dispatch_group)addGroup
{
  return self->_addGroup;
}

- (void)setAddGroup:(id)a3
{
  objc_storeStrong((id *)&self->_addGroup, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_addGroup, 0);
}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(NSObject **)(a1 + 32);
  v10 = a4;
  dispatch_group_enter(v9);
  v19[0] = CFSTR("url");
  objc_msgSend(v7, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = CFSTR("title");
  v12 = objc_msgSend(v8, "length");
  v13 = v8;
  if (!v12)
  {
    objc_msgSend(v7, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v13;
  v19[2] = CFSTR("tags");
  objc_msgSend(*(id *)(a1 + 40), "parameterValueForKey:ofClass:", CFSTR("WFPocketTags"), objc_opt_class());
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_24F8BBA48;
  if (v14)
    v16 = (const __CFString *)v14;
  v20[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  +[PocketAPI sharedAPI](PocketAPI, "sharedAPI");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "callAPIMethod:withHTTPMethod:arguments:delegate:", CFSTR("add"), 1, v17, *(_QWORD *)(a1 + 40));

  v10[2](v10, 0);
}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = *(NSObject **)(a1 + 32);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_24F8BA480;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(v5, v6, v8);

}

void __48__WFPocketAddAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "lastError");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v3;
  if (!v3)
    v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "finishRunningWithError:", v3);

}

@end
