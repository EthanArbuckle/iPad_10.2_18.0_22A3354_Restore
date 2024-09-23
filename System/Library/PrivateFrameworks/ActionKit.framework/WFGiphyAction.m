@implementation WFGiphyAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFCE80;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGiphyAction;
  objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithQuery_selectMultiple_completionHandler_, 0, 1);

  return v2;
}

- (WFGiphySessionManager)sessionManager
{
  WFGiphySessionManager *sessionManager;
  WFGiphySessionManager *v4;
  WFGiphySessionManager *v5;

  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    v4 = (WFGiphySessionManager *)objc_opt_new();
    v5 = self->_sessionManager;
    self->_sessionManager = v4;

    -[WFGiphySessionManager setApiKey:](self->_sessionManager, "setApiKey:", CFSTR("3rgXBOG8ANnZAaq4Vi"));
    sessionManager = self->_sessionManager;
  }
  return sessionManager;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFGiphyAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGiphyShowPicker"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__WFGiphyAction_runAsynchronouslyWithInput___block_invoke;
    v7[3] = &unk_24F8B48C0;
    v7[4] = self;
    v8 = v4;
    -[WFGiphyAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v7);

  }
  else
  {
    -[WFGiphyAction runWithNoUserInterface](self, "runWithNoUserInterface");
  }

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  v5 = a3;
  -[WFGiphyAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGiphyQuery"), objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24F8BBA48;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[WFGiphyAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGiphySelectMultiple"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__WFGiphyAction_runWithRemoteUserInterface_input___block_invoke;
  v12[3] = &unk_24F8BB6B0;
  v12[4] = self;
  objc_msgSend(v5, "showWithQuery:selectMultiple:completionHandler:", v9, v11, v12);

}

- (void)runWithNoUserInterface
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__WFGiphyAction_runWithNoUserInterface__block_invoke;
  aBlock[3] = &unk_24F8BB6B0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[WFGiphyAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGiphyLimit"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  -[WFGiphyAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGiphyQuery"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[WFGiphyAction sessionManager](self, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "search:limit:completion:", v6, v5, v3);
  else
    objc_msgSend(v8, "trendingWithLimit:completion:", v5, v3);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "giphyLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ to GIPHY?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to search for GIFs on GIPHY?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

void __39__WFGiphyAction_runWithNoUserInterface__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __50__WFGiphyAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "output", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

id __44__WFGiphyAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (id)objc_msgSend(v3, "runWithRemoteUserInterface:input:", a2, v4);
  v6.receiver = v3;
  v6.super_class = (Class)WFGiphyAction;
  return objc_msgSendSuper2(&v6, sel_runAsynchronouslyWithInput_, v4);
}

@end
