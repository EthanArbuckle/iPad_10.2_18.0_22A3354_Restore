@implementation WFContentCollection

- (NSArray)extensionItems
{
  void *v2;
  void *v3;

  -[WFContentCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_1180);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)minimalExtensionItems
{
  void *v2;
  void *v3;

  -[WFContentCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_145);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __61__WFContentCollection_NSExtensionItem__minimalExtensionItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minimalExtensionItem");
}

uint64_t __54__WFContentCollection_NSExtensionItem__extensionItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "extensionItem");
}

- (id)requiredResourcesForContent
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContentCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_135);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("WFPhotoAccessResource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)copyToPasteboard:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFContentCollection items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_3;
  v15[3] = &unk_24C4E2FF8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "if_mapAsynchronously:completionHandler:", &__block_literal_global_149_7403, v15);

}

void __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v6 = *(_QWORD *)(a1 + 40);
  else
    v6 = MEMORY[0x24BDBD1B8];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "setItems:options:", v8, v6);
  objc_msgSend(*(id *)(a1 + 32), "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  getWFActionsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[WFContentCollection(WFPasteboard) copyToPasteboard:options:completionHandler:]_block_invoke_3";
    v16 = 2048;
    v17 = v10;
    _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_DEFAULT, "%s Copied %ld items to clipboard", (uint8_t *)&v14, 0x16u);
  }

  v12 = *(_QWORD *)(a1 + 48);
  v13 = objc_msgSend(v8, "count");

  (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v13, v7);
}

void __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_2;
  v7[3] = &unk_24C4DE198;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getSerializedItem:", v7);

}

uint64_t __80__WFContentCollection_WFPasteboard__copyToPasteboard_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__WFContentCollection_WFPasteboard__requiredResourcesForContent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)requiredResourcesForContentInPasteboard:(id)a3
{
  return WFPasteboardRequiredAccessResources(a3);
}

+ (void)getContentItemsForPasteboardItems:(id)a3 resultBlock:(id)a4
{
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", &__block_literal_global_139, a4);
}

+ (void)generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WFPasteboardRequiredAccessResources(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BEC15B0], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __88__WFContentCollection_WFPasteboard__generateCollectionFromPasteboard_completionHandler___block_invoke;
    v10[3] = &unk_24C4DE110;
    v13 = a1;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v9, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v8, v10);

  }
  else
  {
    objc_msgSend(a1, "_generateCollectionFromPasteboard:completionHandler:", v6, v7);
  }

}

+ (void)_generateCollectionFromPasteboard:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "pasteboardTypesForItemSet:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __WFUIPasteboardParseItems_block_invoke;
    v16[3] = &unk_24C4DE1C8;
    v17 = v8;
    objc_msgSend(v9, "if_map:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }

  v14 = v7;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke;
  v15[3] = &__block_descriptor_40_e58_v32__0__WFPasteboardItem_8Q16___v____NSArray___NSError__24l;
  v15[4] = a1;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke_2;
  v13[3] = &unk_24C4E33B0;
  v12 = v7;
  objc_msgSend(v11, "if_flatMapAsynchronously:completionHandler:", v15, v13);

}

void __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "fileURLItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6[2](v6, v7, 0);
  }
  else
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v5, "itemsByType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getContentItemsForPasteboardItems:resultBlock:", v10, v6);

  }
}

void __89__WFContentCollection_WFPasteboard___generateCollectionFromPasteboard_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

uint64_t __88__WFContentCollection_WFPasteboard__generateCollectionFromPasteboard_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_generateCollectionFromPasteboard:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke_2;
  v7[3] = &unk_24C4DE0E8;
  v8 = v5;
  v6 = v5;
  +[WFContentItem getContentItemFromSerializedItem:sourceName:completionHandler:](WFContentItem, "getContentItemFromSerializedItem:sourceName:completionHandler:", a2, CFSTR("Clipboard"), v7);

}

uint64_t __83__WFContentCollection_WFPasteboard__getContentItemsForPasteboardItems_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (WFContentCollection)init
{
  return -[WFContentCollection initWithItems:defaultCoercionOptions:](self, "initWithItems:defaultCoercionOptions:", 0, 0);
}

- (WFContentCollection)initWithDefaultCoercionOptions:(id)a3
{
  return -[WFContentCollection initWithItems:defaultCoercionOptions:](self, "initWithItems:defaultCoercionOptions:", 0, a3);
}

- (WFContentCollection)initWithItems:(id)a3 defaultCoercionOptions:(id)a4
{
  id v6;
  id v7;
  WFContentCollection *v8;
  uint64_t v9;
  NSMutableArray *mutableItems;
  uint64_t v11;
  WFCoercionOptions *defaultCoercionOptions;
  uint64_t v13;
  NSLock *itemWriteLock;
  WFContentCollection *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFContentCollection;
  v8 = -[WFContentCollection init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    mutableItems = v8->_mutableItems;
    v8->_mutableItems = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    defaultCoercionOptions = v8->_defaultCoercionOptions;
    v8->_defaultCoercionOptions = (WFCoercionOptions *)v11;

    v13 = objc_opt_new();
    itemWriteLock = v8->_itemWriteLock;
    v8->_itemWriteLock = (NSLock *)v13;

    v15 = v8;
  }

  return v8;
}

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[WFContentCollection mutableItems](self, "mutableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)addItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[WFContentCollection mutableItems](self, "mutableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[WFContentCollection mutableItems](self, "mutableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[WFContentCollection itemWriteLock](self, "itemWriteLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (NSMutableArray)mutableItems
{
  NSMutableArray *mutableItems;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mutableItems = self->_mutableItems;
  if (!mutableItems)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_mutableItems;
    self->_mutableItems = v4;

    mutableItems = self->_mutableItems;
  }
  return mutableItems;
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[WFContentCollection mutableItems](self, "mutableItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (WFContentAttributionSet)attributionSet
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContentCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("attributionSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFContentAttributionSet *)v4;
}

- (WFCoercionOptions)defaultCoercionOptions
{
  WFCoercionOptions *defaultCoercionOptions;
  WFCoercionOptions *v4;
  WFCoercionOptions *v5;

  defaultCoercionOptions = self->_defaultCoercionOptions;
  if (!defaultCoercionOptions)
  {
    v4 = +[WFCoercionOptions new](WFCoercionOptions, "new");
    v5 = self->_defaultCoercionOptions;
    self->_defaultCoercionOptions = v4;

    defaultCoercionOptions = self->_defaultCoercionOptions;
  }
  return defaultCoercionOptions;
}

- (void)addObject:(id)a3
{
  id v4;

  +[WFContentItem itemWithObject:named:](WFContentItem, "itemWithObject:named:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection addItem:](self, "addItem:", v4);

}

- (void)addObject:(id)a3 named:(id)a4
{
  id v5;

  +[WFContentItem itemWithObject:named:](WFContentItem, "itemWithObject:named:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection addItem:](self, "addItem:", v5);

}

- (void)addFile:(id)a3
{
  id v4;

  +[WFContentItem itemWithFile:](WFContentItem, "itemWithFile:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection addItem:](self, "addItem:", v4);

}

- (void)addFileWithOriginAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WFContentLocation contentLocationForFile:](WFContentLocation, "contentLocationForFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[WFContentItem itemWithFile:origin:disclosureLevel:](WFContentItem, "itemWithFile:origin:disclosureLevel:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCollection addItem:](self, "addItem:", v6);

  }
  else
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[WFContentCollection addFileWithOriginAttribution:]";
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_FAULT, "%s Should not add content location for in-memory file", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)addFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v6;

  +[WFContentItem itemWithFile:origin:disclosureLevel:](WFContentItem, "itemWithFile:origin:disclosureLevel:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection addItem:](self, "addItem:", v6);

}

- (id)collectionByMergingAttributionSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[WFContentCollection items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__WFContentCollection_collectionByMergingAttributionSet___block_invoke;
  v10[3] = &unk_24C4DE398;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithItems:defaultCoercionOptions:", v7, self->_defaultCoercionOptions);
  return v8;
}

- (void)enumerateObjectRepresentations:(id)a3 forClass:(Class)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  Class v20;
  _QWORD v21[4];

  v8 = a3;
  v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  -[WFContentCollection items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke;
  v17[3] = &unk_24C4DE438;
  v19 = v21;
  v20 = a4;
  v12 = v8;
  v17[4] = self;
  v18 = v12;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_5;
  v14[3] = &unk_24C4E0A10;
  v13 = v9;
  v15 = v13;
  v16 = v21;
  objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v14);

  _Block_object_dispose(v21, 8);
}

- (void)enumerateFileRepresentations:(id)a3 forType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  WFContentCollection *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  -[WFContentCollection items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke;
  v19[3] = &unk_24C4DE4B0;
  v13 = v9;
  v20 = v13;
  v23 = v24;
  v14 = v8;
  v21 = self;
  v22 = v14;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_5;
  v16[3] = &unk_24C4E0A10;
  v15 = v10;
  v17 = v15;
  v18 = v24;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v16);

  _Block_object_dispose(v24, 8);
}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFContentCollection_getObjectRepresentation_forClass___block_invoke;
  v8[3] = &unk_24C4DE4D8;
  v9 = v6;
  v7 = v6;
  -[WFContentCollection getObjectRepresentationAndAttributionSet:forClass:](self, "getObjectRepresentationAndAttributionSet:forClass:", v8, a4);

}

- (void)getObjectRepresentationAndAttributionSet:(id)a3 forClass:(Class)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  WFContentCollection *v20;
  id v21;
  uint64_t *v22;
  Class v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *(*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke;
    v33[3] = &unk_24C4DE500;
    v9 = v6;
    v33[4] = self;
    v34 = v9;
    -[WFContentCollection getObjectRepresentations:forClass:](self, "getObjectRepresentations:forClass:", v33, objc_opt_class());
    v10 = v34;
  }
  else
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDAC9B8];
      v8 = MEMORY[0x24BDAC9B8];
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2;
    aBlock[3] = &unk_24C4DE528;
    v10 = v7;
    v31 = v10;
    v32 = v6;
    v12 = _Block_copy(aBlock);
    -[WFContentCollection items](self, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__8024;
    v28 = __Block_byref_object_dispose__8025;
    v29 = 0;
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_129;
    v18[3] = &unk_24C4DE578;
    v15 = v14;
    v19 = v15;
    v9 = v12;
    v22 = &v24;
    v23 = a4;
    v20 = self;
    v21 = v9;
    v16 = _Block_copy(v18);
    v17 = (void *)v25[5];
    v25[5] = (uint64_t)v16;

    (*(void (**)(void))(v25[5] + 16))();
    _Block_object_dispose(&v24, 8);

  }
}

- (void)getFileRepresentation:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__WFContentCollection_getFileRepresentation_forType___block_invoke;
  v8[3] = &unk_24C4DE5A0;
  v9 = v6;
  v7 = v6;
  -[WFContentCollection getFileRepresentationAndAttributionSet:forType:](self, "getFileRepresentationAndAttributionSet:forType:", v8, a4);

}

- (void)getFileRepresentationAndAttributionSet:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  WFContentCollection *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *(*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC9B8];
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke;
  aBlock[3] = &unk_24C4DE5C8;
  v11 = v8;
  v33 = v11;
  v34 = v6;
  v12 = _Block_copy(aBlock);
  -[WFContentCollection items](self, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__8024;
  v30 = __Block_byref_object_dispose__8025;
  v31 = 0;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_3;
  v20[3] = &unk_24C4DE618;
  v15 = v14;
  v21 = v15;
  v16 = v12;
  v24 = v16;
  v25 = &v26;
  v17 = v7;
  v22 = v17;
  v23 = self;
  v18 = _Block_copy(v20);
  v19 = (void *)v27[5];
  v27[5] = (uint64_t)v18;

  (*(void (**)(void))(v27[5] + 16))();
  _Block_object_dispose(&v26, 8);

}

- (BOOL)canPerformCoercion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[WFContentCollection effectiveCoercionOptionsForRequest:](self, "effectiveCoercionOptionsForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOptions:", v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFContentCollection items](self, "items", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "canPerformCoercion:", v5) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)performCoercion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFContentCollection effectiveCoercionOptionsForRequest:](self, "effectiveCoercionOptionsForRequest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "requestType");
  switch(v5)
  {
    case 0:
      objc_msgSend(v8, "objectRepresentationResultHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentCollection getObjectRepresentations:options:forClass:](self, "getObjectRepresentations:options:forClass:", v6, v4, objc_msgSend(v8, "objectClass"));
LABEL_8:

      break;
    case 1:
      objc_msgSend(v8, "fileRepresentationResultHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentCollection getFileRepresentations:options:forType:](self, "getFileRepresentations:options:forType:", v6, v4, v7);
      goto LABEL_7;
    case 2:
      objc_msgSend(v8, "contentItemClasses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentCollectionResultHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentCollection generateCollectionByCoercingToItemClasses:options:completionHandler:](self, "generateCollectionByCoercingToItemClasses:options:completionHandler:", v6, v4, v7);
LABEL_7:

      goto LABEL_8;
  }

}

- (id)effectiveCoercionOptionsForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFContentCollection defaultCoercionOptions](self, "defaultCoercionOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "optionsByAddingContentsOfOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  Class v17;

  v8 = a3;
  v9 = a4;
  -[WFContentCollection items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke;
  v15[3] = &unk_24C4DE640;
  v16 = v9;
  v17 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_3;
  v13[3] = &unk_24C4E33B0;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "if_flatMapAsynchronously:completionHandler:", v15, v13);

}

- (void)getFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[WFContentCollection items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke;
  v14[3] = &unk_24C4E33D8;
  v15 = v9;
  v16 = v8;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "if_flatMapAsynchronously:completionHandler:", v14, v10);

}

- (void)generateCollectionByCoercingToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__139;
  v22[4] = __Block_byref_object_dispose__140;
  v23 = (id)objc_opt_new();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke;
  v18[3] = &unk_24C4DE6D0;
  v12 = v8;
  v19 = v12;
  v21 = v22;
  v13 = v9;
  v20 = v13;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_3;
  v15[3] = &unk_24C4DE6F8;
  v15[4] = self;
  v17 = v22;
  v14 = v10;
  v16 = v14;
  -[WFContentCollection transformItemsAndFlattenUsingBlock:completionHandler:](self, "transformItemsAndFlattenUsingBlock:completionHandler:", v18, v15);

  _Block_object_dispose(v22, 8);
}

- (id)collectionByFilteringItemsWithBlock:(id)a3 excludedItems:(id *)a4
{
  unsigned int (**v6)(id, _QWORD);
  WFContentCollection *v7;
  WFContentCollection *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  WFContentCollection *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, _QWORD))a3;
  v7 = -[WFContentCollection initWithDefaultCoercionOptions:]([WFContentCollection alloc], "initWithDefaultCoercionOptions:", self->_defaultCoercionOptions);
  v8 = -[WFContentCollection initWithDefaultCoercionOptions:]([WFContentCollection alloc], "initWithDefaultCoercionOptions:", self->_defaultCoercionOptions);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[WFContentCollection items](self, "items", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v6[2](v6, v14))
          v15 = v7;
        else
          v15 = v8;
        -[WFContentCollection addItem:](v15, "addItem:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (id)collectionByFilteringToItemClass:(Class)a3 excludedItems:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__WFContentCollection_collectionByFilteringToItemClass_excludedItems___block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__WFContentItem_8lu32l8;
  v5[4] = a3;
  -[WFContentCollection collectionByFilteringItemsWithBlock:excludedItems:](self, "collectionByFilteringItemsWithBlock:excludedItems:", v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)generateCollectionByEvaluatingQuery:(id)a3 forContentItemClass:(Class)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  Class v30;
  _QWORD v31[5];
  _QWORD aBlock[5];
  id v33;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke;
  aBlock[3] = &unk_24C4E3180;
  v24 = v12;
  aBlock[4] = self;
  v33 = v24;
  v14 = _Block_copy(aBlock);
  -[WFContentCollection items](self, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection collectionByFilteringToItemClass:excludedItems:](self, "collectionByFilteringToItemClass:excludedItems:", a4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfItems");
  v18 = -[WFContentCollection numberOfItems](self, "numberOfItems");

  if (v17 == v18)
  {
    -[objc_class runQuery:withItems:permissionRequestor:completionHandler:](a4, "runQuery:withItems:permissionRequestor:completionHandler:", v10, v15, v11, v14);
    v19 = v10;
LABEL_10:
    v23 = v24;
    goto LABEL_11;
  }
  v19 = v10;
  if (objc_msgSend(v15, "count"))
  {
    +[WFContentItem contentPropertySubstitutor](WFContentItem, "contentPropertySubstitutor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "canEvaluateObjects:withPropertySubstitutor:", v15, v20);

    if (v21)
    {
      +[WFContentItem contentPropertySubstitutor](WFContentItem, "contentPropertySubstitutor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "runWithObjects:propertySubstitutor:completionHandler:", v15, v22, v14);

      goto LABEL_10;
    }
  }
  if (-[objc_class hasLibrary](a4, "hasLibrary")
    && !-[WFContentCollection isCoercibleToItemClass:](self, "isCoercibleToItemClass:", a4))
  {
    -[objc_class runQuery:withItems:permissionRequestor:completionHandler:](a4, "runQuery:withItems:permissionRequestor:completionHandler:", v10, 0, v11, v14);
    goto LABEL_10;
  }
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_2;
  v31[3] = &__block_descriptor_40_e55_v32__0__WFContentItem_8Q16___v____NSArray___NSError__24lu32l8;
  v31[4] = a4;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_4;
  v25[3] = &unk_24C4DE760;
  v23 = v24;
  v28 = v24;
  v30 = a4;
  v26 = v19;
  v27 = v11;
  v29 = v14;
  objc_msgSend(v15, "if_mapAsynchronously:completionHandler:", v31, v25);

LABEL_11:
}

- (void)getStringRepresentation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__WFContentCollection_getStringRepresentation___block_invoke;
  v6[3] = &unk_24C4E21E8;
  v7 = v4;
  v5 = v4;
  -[WFContentCollection getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v6, objc_opt_class());

}

- (void)getStringRepresentations:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFContentCollection_getStringRepresentations___block_invoke;
  v6[3] = &unk_24C4E3468;
  v7 = v4;
  v5 = v4;
  -[WFContentCollection getObjectRepresentations:forClass:](self, "getObjectRepresentations:forClass:", v6, objc_opt_class());

}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4
{
  id v5;

  +[WFCoercionRequest requestForCoercingToObjectClass:completionHandler:](WFCoercionRequest, "requestForCoercingToObjectClass:completionHandler:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection performCoercion:](self, "performCoercion:", v5);

}

- (void)getFileRepresentations:(id)a3 forType:(id)a4
{
  id v5;

  +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection performCoercion:](self, "performCoercion:", v5);

}

- (void)getBoolRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__WFContentCollection_getBoolRepresentation___block_invoke;
  v8[3] = &unk_24C4E21E8;
  v9 = v4;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = v4;
  objc_msgSend(v5, "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

- (BOOL)isCoercibleToItemClass:(Class)a3
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFContentCollection isCoercibleToItemClasses:](self, "isCoercibleToItemClasses:", v4);

  return (char)self;
}

- (BOOL)isCoercibleToItemClasses:(id)a3
{
  void *v4;

  +[WFCoercionRequest requestForCoercingToContentClasses:completionHandler:](WFCoercionRequest, "requestForCoercingToContentClasses:completionHandler:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFContentCollection canPerformCoercion:](self, "canPerformCoercion:", v4);

  return (char)self;
}

- (void)generateCollectionByCoercingToItemClass:(Class)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  Class v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection generateCollectionByCoercingToItemClasses:completionHandler:](self, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v6, v8, v9);

}

- (void)generateCollectionByCoercingToItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  Class v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection generateCollectionByCoercingToItemClasses:options:completionHandler:](self, "generateCollectionByCoercingToItemClasses:options:completionHandler:", v10, v9, v8, v11, v12);

}

- (void)generateCollectionByCoercingToItemClasses:(id)a3 completionHandler:(id)a4
{
  id v5;

  +[WFCoercionRequest requestForCoercingToContentClasses:completionHandler:](WFCoercionRequest, "requestForCoercingToContentClasses:completionHandler:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection performCoercion:](self, "performCoercion:", v5);

}

- (BOOL)isEqual:(id)a3
{
  WFContentCollection *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFContentCollection *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      -[WFContentCollection items](self, "items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentCollection items](v4, "items");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFContentCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContentCollection;
  -[WFContentCollection description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCollection items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[WFContentCollection mutableItems](self, "mutableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithItems:defaultCoercionOptions:", v5, self->_defaultCoercionOptions);

  return v6;
}

- (WFContentCollection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFContentCollection *v10;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[WFContentCollection initWithItems:defaultCoercionOptions:](self, "initWithItems:defaultCoercionOptions:", v9, 0);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[WFContentCollection items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__WFContentCollection_encodeWithCoder___block_invoke;
  v8[3] = &unk_24C4E3568;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_objectsPassingTest:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("items"));
}

- (void)setDefaultCoercionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCoercionOptions, a3);
}

- (void)setMutableItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableItems, a3);
}

- (NSLock)itemWriteLock
{
  return self->_itemWriteLock;
}

- (void)setItemWriteLock:(id)a3
{
  objc_storeStrong((id *)&self->_itemWriteLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemWriteLock, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_defaultCoercionOptions, 0);
}

uint64_t __39__WFContentCollection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canEncodeWithCoder:", *(_QWORD *)(a1 + 32));
}

void __45__WFContentCollection_getBoolRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v9 = a2;
  v6 = a4;
  v7 = v9;
  v8 = (id)v6;
  if (!(v9 | v6))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __48__WFContentCollection_getStringRepresentations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__WFContentCollection_getStringRepresentation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  WFContentCollection *v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  v8 = -[WFContentCollection initWithItems:defaultCoercionOptions:]([WFContentCollection alloc], "initWithItems:defaultCoercionOptions:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  (*(void (**)(uint64_t, WFContentCollection *, id))(v5 + 16))(v5, v8, v6);
}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_3;
  v11[3] = &unk_24C4E3180;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v9, "coerceToItemClass:completionHandler:", v8, v11);

}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v27 = a1;
    v28 = v6;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v16 = v14;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(v7, "setObject:forKey:", v15, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v18);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    v21 = *(void **)(v27 + 64);
    v22 = *(_QWORD *)(v27 + 32);
    objc_msgSend(v7, "keyEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(v27 + 40);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_5;
    v30[3] = &unk_24C4E3180;
    v31 = v7;
    v32 = *(id *)(v27 + 56);
    v26 = v7;
    objc_msgSend(v21, "runQuery:withItems:permissionRequestor:completionHandler:", v22, v24, v25, v30);

    v6 = v28;
    v5 = v29;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13, (_QWORD)v19);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = v14;
        else
          v16 = v13;
        objc_msgSend(v7, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);

}

void __117__WFContentCollection_generateCollectionByEvaluatingQuery_forContentItemClass_permissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v5, "count"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = v5;
    v10[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

uint64_t __70__WFContentCollection_collectionByFilteringToItemClass_excludedItems___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_2;
  v12[3] = &unk_24C4DE6A8;
  v8 = a1[6];
  v14 = v6;
  v15 = v8;
  v13 = v5;
  v9 = v6;
  v10 = v5;
  +[WFCoercionRequest _requestForCoercingToContentClasses:itemCompletionHandler:](WFCoercionRequest, "_requestForCoercingToContentClasses:itemCompletionHandler:", v7, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", a1[5]);
  objc_msgSend(v10, "performCoercion:", v11);

}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "setDefaultCoercionOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_4;
    v13[3] = &unk_24C4E3568;
    v14 = v7;
    objc_msgSend(v8, "if_objectsPassingTest:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __91__WFContentCollection_generateCollectionByCoercingToItemClasses_options_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addItem:", a1[4]);
  (*(void (**)(void))(a1[5] + 16))();

}

void __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke_2;
  v11[3] = &unk_24C4E33B0;
  v12 = v6;
  v8 = v6;
  v9 = a2;
  +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "performCoercion:", v10);

}

uint64_t __62__WFContentCollection_getFileRepresentations_options_forType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a2;
  v7 = a4;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "preferredObjectType");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_2;
  v14[3] = &unk_24C4E33B0;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v6, "getRepresentationsForType:options:completionHandler:", v11, v12, v14);

}

void __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "if_map:", &__block_literal_global_8019);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_map:", &__block_literal_global_138_8020);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfName");
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __65__WFContentCollection_getObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_2;
  v15[3] = &unk_24C4DF8A8;
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, v15);

}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_4;
    v13 = &unk_24C4DE5F0;
    v17 = *(_QWORD *)(a1 + 64);
    v14 = v3;
    v16 = *(id *)(a1 + 56);
    v6 = v4;
    v15 = v6;
    +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", v5, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v10, v11, v12, v13);
    objc_msgSend(v6, "performCoercion:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void (***)(_QWORD, _QWORD))(v6 + 40);
  if (v5)
  {
    *(_QWORD *)(v6 + 40) = 0;

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "attributionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v8 + 16))(v8, v5, v9, v11);

  }
  else
  {
    v10 = v11;
    if (!v11)
      v10 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, id))v7)[2](v7, v10);
  }

}

uint64_t __70__WFContentCollection_getFileRepresentationAndAttributionSet_forType___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __53__WFContentCollection_getFileRepresentation_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24C4E3948;
  }
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v10 = 0;
  }
  if (v8)
  {

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "attributionSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, __CFString *, void *, void *, id))(v11 + 16))(v11, v9, v10, v12, v8);

}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_3;
  block[3] = &unk_24C4DEB90;
  v13 = *(NSObject **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v23 = v12;
  v24 = v14;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  dispatch_async(v13, block);

}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2_130;
    v13 = &unk_24C4DE550;
    v5 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 56);
    v14 = v3;
    v16 = *(id *)(a1 + 48);
    v6 = v4;
    v15 = v6;
    +[WFCoercionRequest requestForCoercingToObjectClass:completionHandler:](WFCoercionRequest, "requestForCoercingToObjectClass:completionHandler:", v5, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v10, v11, v12, v13);
    objc_msgSend(v6, "performCoercion:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_2_130(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v7 = a4;
  objc_msgSend(a3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v8 = 0;
  }
  objc_msgSend(v15, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void (***)(_QWORD, _QWORD))(v10 + 40);
  if (v9)
  {
    *(_QWORD *)(v10 + 40) = 0;

    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "attributionSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, id))(v12 + 16))(v12, v9, v8, v13, v7);

  }
  else
  {
    v14 = v7;
    if (!v7)
      v14 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, id))v11)[2](v11, v14);
  }

}

uint64_t __73__WFContentCollection_getObjectRepresentationAndAttributionSet_forClass___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __56__WFContentCollection_getObjectRepresentation_forClass___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_2;
  v13[3] = &unk_24C4DE488;
  v14 = v6;
  v12 = *(_OWORD *)(a1 + 48);
  v8 = (id)v12;
  v15 = v12;
  v9 = v6;
  v10 = a2;
  +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", v7, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v10, "performCoercion:", v11);

}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  __int128 v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_3;
    v12[3] = &unk_24C4DE460;
    v9 = *(_OWORD *)(a1 + 40);
    v8 = (id)v9;
    v13 = v9;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_4;
    v10[3] = &unk_24C4DE3E8;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v12, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_3(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__WFContentCollection_enumerateFileRepresentations_forType_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 56);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_2;
  v13[3] = &unk_24C4DE410;
  v14 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v8 = (id)v12;
  v15 = v12;
  v9 = v6;
  v10 = a2;
  +[WFCoercionRequest requestForCoercingToObjectClass:completionHandler:](WFCoercionRequest, "requestForCoercingToObjectClass:completionHandler:", v7, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v10, "performCoercion:", v11);

}

uint64_t __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_3;
    v15[3] = &unk_24C4DE3C0;
    v16 = v8;
    v12 = *(_OWORD *)(a1 + 40);
    v11 = (id)v12;
    v17 = v12;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_4;
    v13[3] = &unk_24C4DE3E8;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v15, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __81__WFContentCollection_enumerateObjectRepresentations_forClass_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__WFContentCollection_collectionByMergingAttributionSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentItemByMergingAttributionSet:", *(_QWORD *)(a1 + 32));
}

+ (id)collectionWithItems:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItems:defaultCoercionOptions:", v4, 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)generateCollectionFromDragItems:(id)a3 allowedItemClasses:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "if_map:", &__block_literal_global_8307);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercionRequest requestForCoercingToContentClasses:completionHandler:](WFCoercionRequest, "requestForCoercingToContentClasses:completionHandler:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = CFSTR("WFCoercionOptionItemClassPrioritizationType");
  v15[0] = CFSTR("SupportedTypes");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercionOptions optionsWithDictionary:](WFCoercionOptions, "optionsWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", v13);

  objc_msgSend(v10, "performCoercion:", v11);
}

id __104__WFContentCollection_UIDragItem__generateCollectionFromDragItems_allowedItemClasses_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItem itemWithObject:](WFNSItemProviderContentItem, "itemWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setUseNewLoadingAPI:", 1);
  return v3;
}

- (void)getRichTextRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFContentCollection items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke;
  v13[3] = &unk_24C4E1E60;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_4;
  v10[3] = &unk_24C4E1E88;
  v11 = v14;
  v12 = v4;
  v8 = v14;
  v9 = v4;
  objc_msgSend(v6, "if_enumerateAsynchronouslyInSequence:completionHandler:", v13, v10);

}

void __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, _QWORD);
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD);

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v9);
    v7[2](v7, 0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_2;
      v14[3] = &unk_24C4E2F00;
      v16 = v7;
      v15 = *(id *)(a1 + 32);
      objc_msgSend(v6, "getObjectRepresentation:forClass:", v14, objc_opt_class());

      v10 = v16;
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_3;
      v11[3] = &unk_24C4E1E38;
      v13 = v7;
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v6, "getFileRepresentation:forType:", v11, 0);

      v10 = v13;
    }

  }
}

uint64_t __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
}

uint64_t __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", a2);
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

void __69__WFContentCollection_RichTextGeneration__getRichTextRepresentation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = objc_alloc(getNSTextAttachmentClass());
    objc_msgSend(v9, "mappedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wfType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithData:ofType:", v4, v6);

    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)transformItemsUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[WFContentCollection items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke;
  v13[3] = &unk_24C4E3158;
  v14 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_3;
  v11[3] = &unk_24C4E3180;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v13, v11);

}

- (void)transformItemsAndFlattenUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[WFContentCollection items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke;
  v13[3] = &unk_24C4E31D0;
  v14 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_4;
  v11[3] = &unk_24C4E3180;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v13, v11);

}

- (void)transformObjectRepresentationsForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  Class v12;

  v8 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke;
  v10[3] = &unk_24C4E3270;
  v11 = v8;
  v12 = a3;
  v10[4] = self;
  v9 = v8;
  -[WFContentCollection transformItemsAndFlattenUsingBlock:completionHandler:](self, "transformItemsAndFlattenUsingBlock:completionHandler:", v10, a5);

}

- (void)transformFileRepresentationsForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WFContentCollection *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke;
  v12[3] = &unk_24C4E32C0;
  v14 = self;
  v15 = v9;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[WFContentCollection transformItemsAndFlattenUsingBlock:completionHandler:](self, "transformItemsAndFlattenUsingBlock:completionHandler:", v12, a5);

}

- (void)transformFirstObjectRepresentationForClass:(Class)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  WFContentCollection *v21;
  id v22;
  id v23;
  uint64_t *v24;
  Class v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *(*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a4;
  v9 = a5;
  -[WFContentCollection items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23174;
  v30 = __Block_byref_object_dispose__23175;
  v31 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke;
  v19[3] = &unk_24C4E3310;
  v12 = v11;
  v20 = v12;
  v13 = v9;
  v22 = v13;
  v24 = &v26;
  v25 = a3;
  v14 = v8;
  v23 = v14;
  v21 = self;
  v15 = _Block_copy(v19);
  v16 = (void *)v27[5];
  v27[5] = (uint64_t)v15;

  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27[5] + 16))(v27[5], 0, v17, v18);
  _Block_object_dispose(&v26, 8);

}

- (void)transformFirstFileRepresentationForType:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  WFContentCollection *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *(*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFContentCollection items](self, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__23174;
  v32 = __Block_byref_object_dispose__23175;
  v33 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke;
  v21[3] = &unk_24C4E3360;
  v13 = v12;
  v22 = v13;
  v14 = v10;
  v25 = v14;
  v27 = &v28;
  v15 = v8;
  v23 = v15;
  v16 = v9;
  v26 = v16;
  v24 = self;
  v17 = _Block_copy(v21);
  v18 = (void *)v29[5];
  v29[5] = (uint64_t)v17;

  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29[5] + 16))(v29[5], 0, v19, v20);
  _Block_object_dispose(&v28, 8);

}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_2;
    v13[3] = &unk_24C4E3338;
    v18 = *(_QWORD *)(a1 + 72);
    v14 = v3;
    v16 = *(id *)(a1 + 64);
    v6 = v4;
    v15 = v6;
    v17 = *(id *)(a1 + 56);
    +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", v5, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "defaultCoercionOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOptions:", v8);

    objc_msgSend(v6, "performCoercion:", v7);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", MEMORY[0x24BDBD1A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v3);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void (***)(_QWORD, _QWORD))(v7 + 40);
  if (v6)
  {
    *(_QWORD *)(v7 + 40) = 0;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_3;
    v11[3] = &unk_24C4E3590;
    v9 = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, void *, id, _QWORD *))(v9 + 16))(v9, v6, v5, v11);

  }
  else
  {
    v10 = v5;
    if (!v5)
      v10 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, id))v8)[2](v8, v10);
  }

}

void __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_4;
      v11[3] = &unk_24C4E31A8;
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v5, "if_compactMap:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "attributionSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WFConvertObjectToContentItem(v5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __103__WFContentCollection_Transform__transformFirstFileRepresentationForType_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "attributionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFConvertObjectToContentItem(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_2;
    v13[3] = &unk_24C4E32E8;
    v5 = *(_QWORD *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 64);
    v14 = v3;
    v16 = *(id *)(a1 + 56);
    v6 = v4;
    v15 = v6;
    v17 = *(id *)(a1 + 48);
    +[WFCoercionRequest requestForCoercingToObjectClass:completionHandler:](WFCoercionRequest, "requestForCoercingToObjectClass:completionHandler:", v5, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "defaultCoercionOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOptions:", v8);

    objc_msgSend(v6, "performCoercion:", v7);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v3);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a2;
  v8 = a4;
  objc_msgSend(a3, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v9 = 0;
  }
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void (***)(_QWORD, _QWORD))(v11 + 40);
  if (v10)
  {
    *(_QWORD *)(v11 + 40) = 0;

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_3;
    v15[3] = &unk_24C4E3590;
    v13 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, void *, void *, id, _QWORD *))(v13 + 16))(v13, v10, v9, v8, v15);

  }
  else
  {
    v14 = v8;
    if (!v8)
      v14 = *(id *)(a1 + 32);
    ((void (**)(_QWORD, id))v12)[2](v12, v14);
  }

}

void __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_4;
      v11[3] = &unk_24C4E31A8;
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v5, "if_compactMap:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "attributionSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WFConvertObjectToContentItem(v5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __106__WFContentCollection_Transform__transformFirstObjectRepresentationForClass_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "attributionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFConvertObjectToContentItem(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_2;
  v14 = &unk_24C4E3248;
  v15 = v5;
  v16 = *(id *)(a1 + 48);
  v7 = v5;
  v8 = a2;
  +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "defaultCoercionOptions", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOptions:", v10);

  objc_msgSend(v8, "performCoercion:", v9);
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_3;
    v10[3] = &unk_24C4E3298;
    v12 = *(id *)(a1 + 40);
    v11 = v6;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_5;
    v8[3] = &unk_24C4E33B0;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_flatMapAsynchronously:completionHandler:", v10, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v9 = a1 + 32;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v9 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_4;
  v12[3] = &unk_24C4E31F8;
  v13 = v6;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16);
  v11 = v6;
  v10(v8, a2, v7, v12);

}

uint64_t __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__WFContentCollection_Transform__transformFileRepresentationsForType_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v8 = v5;
  objc_opt_class();
  v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "defaultCoercionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v5, "preferredObjectType");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_2;
  v13[3] = &unk_24C4E3248;
  v14 = v6;
  v15 = *(id *)(a1 + 40);
  v12 = v6;
  objc_msgSend(v5, "getRepresentationsForType:options:completionHandler:", v11, v7, v13);

}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_3;
    v10[3] = &unk_24C4E3220;
    v12 = *(id *)(a1 + 40);
    v11 = v6;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_5;
    v8[3] = &unk_24C4E33B0;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_flatMapAsynchronously:completionHandler:", v10, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, uint64_t, _QWORD *);
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v8, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wfName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_4;
  v14[3] = &unk_24C4E31F8;
  v15 = v6;
  v12 = *(void (**)(uint64_t, void *, void *, uint64_t, _QWORD *))(v7 + 16);
  v13 = v6;
  v12(v7, v9, v10, v11, v14);

}

uint64_t __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__WFContentCollection_Transform__transformObjectRepresentationsForClass_usingBlock_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v8 = v5;
  objc_opt_class();
  v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, id, _QWORD *);
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_24C4E3180;
  v13 = v6;
  v14 = v7;
  v9 = *(void (**)(uint64_t, id, _QWORD *))(v8 + 16);
  v10 = v7;
  v11 = v6;
  v9(v8, v11, v12);

}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultCoercionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultCoercionOptions:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_3;
  v8[3] = &unk_24C4E31A8;
  v9 = *(id *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "if_compactMap:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __87__WFContentCollection_Transform__transformItemsAndFlattenUsingBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "attributionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFConvertObjectToContentItem(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, id, _QWORD *);
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_2;
  v12[3] = &unk_24C4E3590;
  v13 = v6;
  v14 = v7;
  v9 = *(void (**)(uint64_t, id, _QWORD *))(v8 + 16);
  v10 = v6;
  v11 = v7;
  v9(v8, v10, v12);

}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[WFContentCollection collectionWithItems:](WFContentCollection, "collectionWithItems:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultCoercionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultCoercionOptions:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__WFContentCollection_Transform__transformItemsUsingBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "attributionSet");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WFConvertObjectToContentItem(v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);
}

@end
