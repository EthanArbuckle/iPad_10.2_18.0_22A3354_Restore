@implementation WFTrelloCreateListAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFTrelloSessionManager *v12;
  void *v13;
  WFTrelloSessionManager *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[WFTrelloCreateListAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTrelloCreateListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloBoard"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WFTrelloCreateListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloName"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloCreateListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloPosition"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [WFTrelloSessionManager alloc];
    objc_msgSend(v8, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFTrelloSessionManager initWithConfiguration:token:](v12, "initWithConfiguration:token:", 0, v13);

    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __55__WFTrelloCreateListAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_24F8B09D0;
    v18[4] = self;
    v19 = v9;
    v20 = v8;
    -[WFTrelloSessionManager createListWithName:onBoardWithIdentifier:position:completionHandler:](v14, "createListWithName:onBoardWithIdentifier:position:completionHandler:", v10, v15, v11, v18);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC4270];
    v21 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must select a board to create the list on."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 5, v11);
    v14 = (WFTrelloSessionManager *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloCreateListAction finishRunningWithError:](self, "finishRunningWithError:", v14);
  }

}

- (void)updateListCacheForBoard:(id)a3 onAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  WFTrelloSessionManager *v18;
  void *v19;
  WFTrelloSessionManager *v20;
  void *v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFDiskCacheKey(v9, v10, v11, v12, v13, v14, v15, v16, CFSTR("WFTrelloLists"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isValid") & 1) != 0)
    {
      v18 = [WFTrelloSessionManager alloc];
      objc_msgSend(v7, "token");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WFTrelloSessionManager initWithConfiguration:token:](v18, "initWithConfiguration:token:", 0, v19);

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke;
      v22[3] = &unk_24F8BA068;
      v22[4] = self;
      v23 = v17;
      -[WFTrelloSessionManager getListsForBoard:completionHandler:](v20, "getListsForBoard:completionHandler:", v6, v22);

    }
    else
    {
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:completion:", v17, 0);

      -[WFTrelloCreateListAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }

  }
  else
  {
    -[WFTrelloCreateListAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "trelloLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello list with %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello list?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke_2;
      v13[3] = &unk_24F8BB638;
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "setObject:forKey:completion:", v6, v12, v13);

      goto LABEL_6;
    }
    objc_msgSend(v10, "removeObjectForKey:completion:", *(_QWORD *)(a1 + 40), 0);

    v7 = *(void **)(a1 + 32);
    v8 = 0;
  }
  objc_msgSend(v7, "finishRunningWithError:", v8);
LABEL_6:

}

uint64_t __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFTrelloListParameterNeedsUpdate"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __55__WFTrelloCreateListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "updateListCacheForBoard:onAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

@end
