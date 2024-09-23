@implementation WFAddToReadingListAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (id)service
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSSReadingListClass_softClass;
  v9 = getSSReadingListClass_softClass;
  if (!getSSReadingListClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getSSReadingListClass_block_invoke;
    v5[3] = &unk_24F8BB430;
    v5[4] = &v6;
    __getSSReadingListClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "defaultReadingList");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addReadingListItem:(id)a3 title:(id)a4 previewText:(id)a5 withService:(id)a6 error:(id *)a7
{
  id v8;

  objc_msgSend(a6, "addReadingListItemWithURL:title:previewText:error:", a3, a4, a5, a7);
  v8 = (id)objc_opt_new();
  -[WFAddToReadingListAction setExtendedOperation:](self, "setExtendedOperation:", v8);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[WFAddToReadingListAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

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
    WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to your Reading List?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%@” to add item(s) to your Reading List?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__WFAddToReadingListAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC1748]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  uint64_t v15;
  id v16;

  v6 = a2;
  v7 = a4;
  v8 = objc_msgSend(v6, "numberOfItems");
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_24F8B1298;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_4;
    v13[3] = &unk_24F8BB050;
    v13[4] = v15;
    v12 = v10;
    objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v14, v13);

  }
  else
  {
    objc_msgSend(v9, "finishRunningWithError:", v7);
  }

}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "contentPermissionRequestor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_3;
  v12[3] = &unk_24F8B1270;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v9;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v11, "getTitleWithPermissionRequestor:completionHandler:", v8, v12);

}

uint64_t __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFAddToReadingListAction_runAsynchronouslyWithInput___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[6];
  v9 = 0;
  objc_msgSend(v3, "addReadingListItem:title:previewText:withService:error:", v6, v5, 0, v7, &v9);

  v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();

}

@end
