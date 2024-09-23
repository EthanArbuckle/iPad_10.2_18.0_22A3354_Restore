@implementation WFTrelloCreateBoardAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFTrelloSessionManager *v11;
  void *v12;
  WFTrelloSessionManager *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  -[WFTrelloCreateBoardAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTrelloCreateBoardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloName"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTrelloCreateBoardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloDescription"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [WFTrelloSessionManager alloc];
  objc_msgSend(v8, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFTrelloSessionManager initWithConfiguration:token:](v11, "initWithConfiguration:token:", 0, v12);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__WFTrelloCreateBoardAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_24F8B6578;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  -[WFTrelloSessionManager createBoardWithName:boardDescription:completionHandler:](v13, "createBoardWithName:boardDescription:completionHandler:", v9, v10, v15);

}

- (void)updateBoardCacheOnAccount:(id)a3
{
  id v4;
  WFTrelloSessionManager *v5;
  void *v6;
  WFTrelloSessionManager *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  if ((objc_msgSend(v4, "isValid") & 1) != 0)
  {
    v5 = [WFTrelloSessionManager alloc];
    objc_msgSend(v4, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFTrelloSessionManager initWithConfiguration:token:](v5, "initWithConfiguration:token:", 0, v6);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke;
    v9[3] = &unk_24F8BB6B0;
    v9[4] = self;
    -[WFTrelloSessionManager getOpenBoardsWithCompletionHandler:](v7, "getOpenBoardsWithCompletionHandler:", v9);

  }
  else
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:completion:", CFSTR("WFTrelloBoards"), 0);

    -[WFTrelloCreateBoardAction finishRunningWithError:](self, "finishRunningWithError:", 0);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello board with %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello board?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

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
    if (v9)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke_2;
      v12[3] = &unk_24F8BB638;
      v12[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "setObject:forKey:completion:", v6, CFSTR("WFTrelloBoards"), v12);

      goto LABEL_6;
    }
    objc_msgSend(v10, "removeObjectForKey:completion:", CFSTR("WFTrelloBoards"), 0);

    v7 = *(void **)(a1 + 32);
    v8 = 0;
  }
  objc_msgSend(v7, "finishRunningWithError:", v8);
LABEL_6:

}

uint64_t __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFTrelloBoardParameterNeedsUpdateNotification"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __56__WFTrelloCreateBoardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "updateBoardCacheOnAccount:", *(_QWORD *)(a1 + 40));
  }

}

@end
