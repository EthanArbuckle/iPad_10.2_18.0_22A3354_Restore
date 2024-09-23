@implementation WFSocialAction

- (BOOL)convertsAnimatedImagesToVideo
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFSocialAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ConvertsAnimatedImagesToVideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315906;
      v12 = "WFEnforceClass";
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v4;
      v8 = v16;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);

    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  v9 = objc_msgSend(v6, "BOOLValue");
  return v9;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[5];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSocialAction postPrefix](self, "postPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v4, "numberOfItems") == 1)
  {
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v4, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BE19438];
      v12 = (void *)MEMORY[0x24BE19450];
      -[WFSocialAction postPrefix](self, "postPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v19[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "collectionWithItems:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v16;
    }
  }
  else
  {

  }
  if (-[WFSocialAction convertsAnimatedImagesToVideo](self, "convertsAnimatedImagesToVideo"))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __45__WFSocialAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_24F8BA5C8;
    v18[4] = self;
    -[WFSocialAction convertAnimatedImagesToVideoWithInput:completionHandler:](self, "convertAnimatedImagesToVideoWithInput:completionHandler:", v4, v18);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WFSocialAction;
    -[WFSocialAction runAsynchronouslyWithInput:](&v17, sel_runAsynchronouslyWithInput_, v4);
  }

}

- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WFSocialAction *v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke;
  v12[3] = &unk_24F8BA5F8;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[WFSocialAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v12);

}

- (void)convertAnimatedImagesToVideoWithInput:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_4;
  v7[3] = &unk_24F8BA688;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "transformItemsUsingBlock:completionHandler:", &__block_literal_global_46038, v7);

}

- (NSString)postPrefix
{
  return (NSString *)-[WFSocialAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSocialPostPrefix"), objc_opt_class());
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFSocialAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to share %2$@ on %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to share content on %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "preferredFileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF83D8];
  v8 = objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF83D8]);

  if (v8)
  {
    v10 = MEMORY[0x24BDAC760];
    v12 = v5;
    v11 = v4;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v7, v10, 3221225472, __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_2, &unk_24F8BA660);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getFileRepresentation:forType:", &v10, v9);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v5 + 2))(v5, v4, 0);
  }

}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char IsAnimatedGIF;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "mappedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsAnimatedGIF = WFImageDataIsAnimatedGIF();

  if ((IsAnimatedGIF & 1) != 0)
  {
    v8 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v6 = (id)WFGenerateVideoFromGIF();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __74__WFSocialAction_convertAnimatedImagesToVideoWithInput_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v9)
  {
    v7 = *(_QWORD *)(a1 + 40);
LABEL_5:
    v6 = 0;
    v8 = *(void **)(a1 + 32);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  if (!v6)
    goto LABEL_5;
LABEL_6:
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

}

void __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  if (a2)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2;
    v8[3] = &unk_24F8BB6B0;
    v8[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "showWithArchivedItems:isContentManaged:extensionBundleIdentifier:extensionPointIdentifier:completionHandler:", v3, v2, v4, CFSTR("com.apple.share-services"), v8);
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v5, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = v5;
    v7.super_class = (Class)WFSocialAction;
    objc_msgSendSuper2(&v7, sel_runAsynchronouslyWithInput_, v6);

  }
}

void __85__WFSocialAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

id __45__WFSocialAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WFSocialAction;
  return objc_msgSendSuper2(&v3, sel_runAsynchronouslyWithInput_, a2);
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFDF78;
}

@end
