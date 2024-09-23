@implementation WFTrelloAddCardAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloAddCardAction;
  -[WFTrelloAddCardAction initializeParameters](&v4, sel_initializeParameters);
  -[WFTrelloAddCardAction parameterForKey:](self, "parameterForKey:", CFSTR("WFTrelloList"));
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFTrelloSessionManager *v17;
  void *v18;
  WFTrelloSessionManager *v19;
  void *v20;
  WFTrelloSessionManager *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  WFTrelloSessionManager *v46;
  uint64_t v47;
  WFTrelloSessionManager *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  -[WFTrelloAddCardAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloBoard"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloList"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (v10)
      {
LABEL_4:
        -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloName"), objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloCardPosition"), objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloDescription"), objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloDueDate"), objc_opt_class());
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE194C8], "datesInString:error:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v40 = objc_claimAutoreleasedReturnValue();

        -[WFTrelloAddCardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTrelloAttachments"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          v16 = (void *)objc_opt_new();
        v42 = v8;
        v43 = v6;
        if (v12)
        {
          v17 = [WFTrelloSessionManager alloc];
          objc_msgSend(v8, "token");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[WFTrelloSessionManager initWithConfiguration:token:](v17, "initWithConfiguration:token:", 0, v18);

          objc_msgSend(v10, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke;
          v44[3] = &unk_24F8B77F8;
          v44[4] = self;
          v45 = v16;
          v46 = v19;
          v21 = v19;
          v22 = (void *)v40;
          -[WFTrelloSessionManager createCardWithName:listIdentifier:dueDate:cardPosition:cardDescription:completionHandler:](v21, "createCardWithName:listIdentifier:dueDate:cardPosition:cardDescription:completionHandler:", v12, v20, v40, v13, v14, v44);

        }
        else
        {
          v36 = (void *)MEMORY[0x24BDD1540];
          v39 = *MEMORY[0x24BEC4270];
          v47 = *MEMORY[0x24BDD0FC8];
          WFLocalizedString(CFSTR("You must provide a name to use for the new Trello Card."));
          v21 = (WFTrelloSessionManager *)objc_claimAutoreleasedReturnValue();
          v48 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", v39, 5, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTrelloAddCardAction finishRunningWithError:](self, "finishRunningWithError:", v38);

          v22 = (void *)v40;
        }

        v8 = v42;
        v6 = v43;
        goto LABEL_13;
      }
    }
    else
    {
      +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDBCF20];
      v51[0] = objc_opt_class();
      v51[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithArray:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectOfClasses:forKeyComponents:", v28, v29, CFSTR("WFTrelloLists"), 0);
      v30 = v8;
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectMatchingKey:value:", CFSTR("name"), v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v8 = v30;
      v10 = (void *)v33;
      if (v33)
        goto LABEL_4;
    }
    v34 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BEC4270];
    v49 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must select a list to create the card on."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTrelloAddCardAction finishRunningWithError:](self, "finishRunningWithError:", v14);
LABEL_13:

    goto LABEL_14;
  }
  v23 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BEC4270];
  v52 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("You must select a board to create the card on."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTrelloAddCardAction finishRunningWithError:](self, "finishRunningWithError:", v13);
LABEL_14:

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
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello card with %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Trello card?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_2;
  v9[3] = &unk_24F8B77D0;
  v6 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_4;
  v8[3] = &unk_24F8BB050;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v6, "enumerateFileRepresentations:forType:completionHandler:", v9, 0, v8);

}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_24F8B8FC0;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "uploadFile:onCard:completionHandler:", v10, v8, v11);

}

uint64_t __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BEC4270];
    v13 = *MEMORY[0x24BDD0FC8];
    v8 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Uploading %@ as an attachment failed."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -1, v12);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
