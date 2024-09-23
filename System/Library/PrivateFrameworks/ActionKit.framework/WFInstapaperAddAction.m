@implementation WFInstapaperAddAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAddAction;
  -[WFInstapaperAddAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke;
  v11[3] = &unk_24F8B37A0;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke_2;
  v10[3] = &unk_24F8BB050;
  v10[4] = self;
  objc_msgSend(v9, "enumerateObjectRepresentations:forClass:completionHandler:", v11, objc_opt_class(), v10);

}

- (id)connectionTypes
{
  return &unk_24F93C1F8;
}

- (void)engine:(id)a3 connection:(id)a4 didAddBookmark:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[WFInstapaperAction identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[WFInstapaperAction identifiers](self, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFInstapaperAction engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifierForConnection:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v10);

  }
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "instapaperLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to Instapaper?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to add content to Instapaper?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "wfName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v15, "isEqualToString:", v9);

  v11 = v15;
  if (v10)
  {

    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addBookmarkWithURL:title:description:folder:resolveFinalURL:userInfo:", v8, v11, 0, *(_QWORD *)(a1 + 40), 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v14);
  v7[2](v7, 0);

}

uint64_t __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "finishRunningWithError:", 0);
  return result;
}

@end
