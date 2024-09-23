@implementation WFTrelloGetItemsAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloGetItemsAction;
  -[WFTrelloGetItemsAction initializeParameters](&v4, sel_initializeParameters);
  -[WFTrelloGetItemsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFTrelloList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFTrelloSessionManager *v9;
  void *v10;
  WFTrelloSessionManager *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[2];
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  -[WFTrelloGetItemsAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isValid") & 1) != 0)
  {
    v9 = [WFTrelloSessionManager alloc];
    objc_msgSend(v8, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFTrelloSessionManager initWithConfiguration:token:](v9, "initWithConfiguration:token:", 0, v10);

    -[WFTrelloGetItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloBoard"), objc_opt_class());
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[WFTrelloGetItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloItemType"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Boards")))
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke;
      v44[3] = &unk_24F8BA068;
      v44[4] = self;
      v45 = v8;
      -[WFTrelloSessionManager getOpenBoardsWithCompletionHandler:](v11, "getOpenBoardsWithCompletionHandler:", v44);
      v14 = v45;
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Lists")))
    {
      if (v12)
      {
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_2;
        v41[3] = &unk_24F8BB348;
        v41[4] = self;
        v12 = v12;
        v42 = v12;
        v43 = v8;
        -[WFTrelloSessionManager getListsForBoard:completionHandler:](v11, "getListsForBoard:completionHandler:", v12, v41);

        v14 = v42;
        goto LABEL_8;
      }
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BEC4270];
      v51 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("You must select a board to retrieve lists from."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v26;
      v27 = (void *)MEMORY[0x24BDBCE70];
      v28 = &v52;
      v29 = &v51;
LABEL_18:
      objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 5, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", v31);

      v12 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("Cards")))
      goto LABEL_9;
    if (!v12)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BEC4270];
      v49 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("You must select a board to retrieve cards from."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v26;
      v27 = (void *)MEMORY[0x24BDBCE70];
      v28 = &v50;
      v29 = &v49;
      goto LABEL_18;
    }
    -[WFTrelloGetItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloList"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDBCF20];
      v48[0] = objc_opt_class();
      v48[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectOfClasses:forKeyComponents:", v20, v21, CFSTR("WFTrelloLists"), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectMatchingKey:value:", CFSTR("name"), v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v23;
    }
    if (v17)
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_3;
      v40[3] = &unk_24F8BB6B0;
      v40[4] = self;
      -[WFTrelloSessionManager getCardsForList:completionHandler:](v11, "getCardsForList:completionHandler:", v17, v40);
    }
    else
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BEC4270];
      v46 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("You must select a list to retrieve cards from."));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v39, 5, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", v35);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BEC4270];
    v53 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Your Trello account couldn’t be verified. Please sign out and try again!"));
    v11 = (WFTrelloSessionManager *)objc_claimAutoreleasedReturnValue();
    v54[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", v13);
  }
LABEL_9:

}

- (void)updateBoards:(id)a3 onAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  if (objc_msgSend(a4, "isValid") && objc_msgSend(v6, "count"))
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke;
    v9[3] = &unk_24F8BB638;
    v9[4] = self;
    objc_msgSend(v7, "setObject:forKey:completion:", v6, CFSTR("WFTrelloBoards"), v9);

  }
  else
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:completion:", CFSTR("WFTrelloBoards"), 0);

    -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)updateListCache:(id)a3 board:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFDiskCacheKey(v12, v13, v14, v15, v16, v17, v18, v19, CFSTR("WFTrelloLists"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isValid") && objc_msgSend(v8, "count"))
    {
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke;
      v23[3] = &unk_24F8BB638;
      v23[4] = self;
      objc_msgSend(v21, "setObject:forKey:completion:", v8, v20, v23);

    }
    else
    {
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObjectForKey:completion:", v20, 0);

      -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }

  }
  else
  {
    -[WFTrelloGetItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

uint64_t __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_145);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("WFTrelloListParameterNeedsUpdate"), 0);

}

uint64_t __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_13811);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("WFTrelloBoardParameterNeedsUpdateNotification"), 0);

}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "output");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "updateBoards:onAccount:", v6, *(_QWORD *)(a1 + 40));
  }

}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "output");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "updateListCache:board:account:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "output");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    v7 = *(void **)(a1 + 32);
    v8 = 0;
  }
  objc_msgSend(v7, "finishRunningWithError:", v8);

}

@end
