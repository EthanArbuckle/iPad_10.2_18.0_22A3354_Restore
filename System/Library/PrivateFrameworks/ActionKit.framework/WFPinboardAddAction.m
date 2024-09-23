@implementation WFPinboardAddAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B81B0;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "pinboardLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to Pinboard?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to add content to Pinboard?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  WFPinboardSessionManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v7 = a2;
  v8 = a3;
  if (v7)
  {
    v9 = objc_alloc_init(WFPinboardSessionManager);
    +[WFPinboardAccessResource pinboardUsername](WFPinboardAccessResource, "pinboardUsername");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPinboardSessionManager setUsername:](v9, "setUsername:", v10);

    +[WFPinboardAccessResource pinboardPassword](WFPinboardAccessResource, "pinboardPassword");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPinboardSessionManager setPassword:](v9, "setPassword:", v11);

    +[WFPinboardAccessResource pinboardToken](WFPinboardAccessResource, "pinboardToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPinboardSessionManager setApiToken:](v9, "setApiToken:", v12);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPinTitle"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "length"))
    {
      if (v8)
      {
        v14 = v8;
      }
      else
      {
        objc_msgSend(v7, "absoluteString");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      v13 = v15;
    }
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPinTags"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" ,"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "removeObject:", &stru_24F8BBA48);
    v20 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPinDescription"), objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("extended"));

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPinPublic"), objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v22, CFSTR("shared"));

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPinUnread"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v23, CFSTR("toread"));

    objc_msgSend(v20, "setValue:forKey:", v19, CFSTR("tags"));
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke_2;
    v24[3] = &unk_24F8B7FF0;
    v24[4] = *(_QWORD *)(a1 + 32);
    -[WFPinboardSessionManager addBookmark:withTitle:parameters:completion:](v9, "addBookmark:withTitle:parameters:completion:", v7, v13, v20, v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("WFPinboardErrorDomain")))
    goto LABEL_4;
  v5 = objc_msgSend(v8, "code");

  if (v5 == 1000)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceObjectsOfClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "logOut");
LABEL_4:

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

@end
