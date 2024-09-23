@implementation WFChooseFromListIntentHandler

- (void)handleChooseFromList:(id)a3 completion:(id)a4
{
  void (**v5)(id, WFChooseFromListIntentResponse *);
  id v6;
  void *v7;
  void *v8;
  WFChooseFromListIntentResponse *v9;

  v5 = (void (**)(id, WFChooseFromListIntentResponse *))a4;
  v6 = a3;
  v9 = -[WFChooseFromListIntentResponse initWithCode:userActivity:]([WFChooseFromListIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  objc_msgSend(v6, "chosenItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFChooseFromListIntentResponse setSelectedItem:](v9, "setSelectedItem:", v8);

  v5[2](v5, v9);
}

- (void)resolveChosenItemsForChooseFromList:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  objc_msgSend(v6, "chosenItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v6, "chosenItems");
  else
    objc_msgSend(v6, "originalItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    +[WFChooseFromListItemResolutionResult disambiguationWithChooseFromListItemsToDisambiguate:](WFChooseFromListItemResolutionResult, "disambiguationWithChooseFromListItemsToDisambiguate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = (void **)v16;
LABEL_9:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v12);
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "count"))
  {
    +[WFChooseFromListItemResolutionResult needsValue](WFChooseFromListItemResolutionResult, "needsValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v14;
    goto LABEL_9;
  }
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFChooseFromListItemResolutionResult successWithResolvedChooseFromListItem:](WFChooseFromListItemResolutionResult, "successWithResolvedChooseFromListItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v13);

LABEL_10:
}

- (void)provideChosenItemsOptionsCollectionForChooseFromList:(id)a3 withCompletion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDD9ED0];
  v6 = a4;
  v7 = [v5 alloc];
  v8 = (id)objc_msgSend(v7, "initWithItems:", MEMORY[0x24BDBD1A8]);
  (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v8, 0);

}

- (void)resolvePromptForChooseFromList:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(v13, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = (void *)MEMORY[0x24BDDA218];
  if (v7)
  {
    objc_msgSend(v13, "prompt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD9CC0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deferredLocalizedIntentsStringWithFormat:fromTable:bundle:", CFSTR("DisambiguationSelectionPromptDialog"), CFSTR("Localizable"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedString:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, (void *)v12);

    v5 = (void (**)(id, void *))v12;
  }

}

@end
