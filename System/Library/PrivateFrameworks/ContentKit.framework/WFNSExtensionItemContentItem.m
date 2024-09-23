@implementation WFNSExtensionItemContentItem

- (NSExtensionItem)extensionItem
{
  return (NSExtensionItem *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)itemProviderItems
{
  uint64_t v3;
  WFCoercionOptions *v4;
  void *v5;

  v3 = objc_opt_class();
  v4 = +[WFCoercionOptions new](WFCoercionOptions, "new");
  -[WFContentItem itemsByCoercingToItemClass:options:error:](self, "itemsByCoercingToItemClass:options:error:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemProviders
{
  void *v2;
  void *v3;

  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)extensionItemName
{
  void *v2;
  void *v3;
  void *v4;

  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[WFNSExtensionItemContentItem extensionItemName](self, "extensionItemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFNSExtensionItemContentItem;
    -[WFContentItem name](&v8, sel_name);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)itemProvidersSupportType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", v11);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if ((Class)objc_opt_class() == a3)
  {
    -[WFNSExtensionItemContentItem itemProviders](self, "itemProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFNSExtensionItemContentItem extensionItemName](self, "extensionItemName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation objects:named:](WFObjectRepresentation, "objects:named:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else if ((Class)objc_opt_class() == a3
         && (-[WFNSExtensionItemContentItem extensionItem](self, "extensionItem"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v11, "attributedContentText"),
             v12 = (void *)objc_claimAutoreleasedReturnValue(),
             v11,
             v12))
  {
    -[WFNSExtensionItemContentItem extensionItemName](self, "extensionItemName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    return 0;
  }
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;
  }
  else
  {
    if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
    {
      -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;

      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
    {
      v10.receiver = self;
      v10.super_class = (Class)WFNSExtensionItemContentItem;
      v7 = -[WFContentItem canGenerateRepresentationForType:](&v10, sel_canGenerateRepresentationForType_, v4);
      goto LABEL_10;
    }
    -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedContentText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = 1;
    else
      v7 = -[WFNSExtensionItemContentItem itemProvidersSupportType:](self, "itemProvidersSupportType:", v4);
  }

LABEL_10:
  return v7;
}

- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedContentText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
    goto LABEL_5;
  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedContentText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNSExtensionItemContentItem extensionItemName](self, "extensionItemName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItem itemWithObject:named:](WFContentItem, "itemWithObject:named:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "supportedTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v8);
  LODWORD(v16) = objc_msgSend(v18, "intersectsSet:", v19);

  if (!(_DWORD)v16)
  {

LABEL_5:
    -[WFNSExtensionItemContentItem extensionSubItems](self, "extensionSubItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke;
    v24[3] = &unk_24C4E33D8;
    v25 = v8;
    v26 = v9;
    v22[0] = v21;
    v22[1] = 3221225472;
    v22[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_3;
    v22[3] = &unk_24C4E33B0;
    v23 = v10;
    objc_msgSend(v20, "if_flatMapAsynchronously:completionHandler:", v24, v22);

    goto LABEL_6;
  }
  objc_msgSend(v17, "coerceToItemClasses:options:completionHandler:", v8, v9, v10);

LABEL_6:
}

- (void)preloadImportantItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  WFNSExtensionItemContentItem *v21;
  char v22;

  v4 = a3;
  -[WFNSExtensionItemContentItem itemProviderItems](self, "itemProviderItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNSExtensionItemContentItem extensionItem](self, "extensionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("WFPhotosAssetIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  LOBYTE(v9) = v9 == objc_msgSend(v5, "count");
  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke;
  v18[3] = &unk_24C4E2FD0;
  v22 = v9;
  v19 = v8;
  v20 = v10;
  v21 = self;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_5;
  v15[3] = &unk_24C4E2FF8;
  v16 = v20;
  v17 = v4;
  v15[4] = self;
  v12 = v20;
  v13 = v4;
  v14 = v8;
  objc_msgSend(v5, "if_mapAsynchronously:completionHandler:", v18, v15);

}

- (BOOL)cachesSupportedTypes
{
  return 0;
}

- (NSArray)extensionSubItems
{
  return self->_extensionSubItems;
}

- (void)setExtensionSubItems:(id)a3
{
  objc_storeStrong((id *)&self->_extensionSubItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionSubItems, 0);
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char v20;

  v7 = a2;
  v8 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_24C4E2FA8;
  v20 = *(_BYTE *)(a1 + 56);
  v18 = v8;
  v14 = v7;
  v15 = *(id *)(a1 + 32);
  v19 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v16 = v9;
  v17 = v10;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v11, "preloadImportantItemsWithCompletionHandler:", v13);

}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v25 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setExtensionSubItems:", v5);
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKey:", v7, objc_opt_class());

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = (void *)objc_opt_class();
        if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
          v14 = (void *)objc_opt_class();
        objc_msgSend(v6, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "addObject:", v13);
        }
        else
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v13, 0);
          objc_msgSend(v6, "setObject:forKey:", v17, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v18, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setSubItems:forClass:", v24, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v3 = a2;
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 80))
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3;
      v20[3] = &unk_24C4E2F58;
      v6 = *(id *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 72);
      v21 = v6;
      v24 = v7;
      v22 = *(id *)(a1 + 32);
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v5, "getFileRepresentation:forType:", v20, 0);

      v8 = v21;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "itemProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x24BDF8530], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v10);

      if (!v11)
      {
        v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        goto LABEL_3;
      }
      v12 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4;
      v15[3] = &unk_24C4E2F80;
      v19 = *(id *)(a1 + 64);
      v16 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      v14 = *(_QWORD *)(a1 + 56);
      v17 = v13;
      v18 = v14;
      objc_msgSend(v12, "getObjectRepresentation:forClass:", v15, objc_opt_class());

      v8 = v19;
    }

    goto LABEL_9;
  }
  v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_3:
  v4();
LABEL_9:

}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[7];
  v5 = a2;
  objc_msgSend(v3, "objectAtIndex:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[WFPhotoItemProviderContentItem itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:](WFPhotoItemProviderContentItem, "itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:", a1[5], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (!v6)
    v7 = (void *)a1[5];
  (*(void (**)(_QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], v7, 0);

}

void __75__WFNSExtensionItemContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  WFJavaScriptRunner *v4;
  void *v5;
  WFJavaScriptRunner *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDD0C40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [WFJavaScriptRunner alloc];
    objc_msgSend(*(id *)(a1 + 32), "itemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFJavaScriptRunner initWithItemProvider:](v4, "initWithItemProvider:", v5);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v8);
    +[WFShareSheetSafariWebPage webPageFromPreprocessingResult:javaScriptRunnerIdentifier:](WFShareSheetSafariWebPage, "webPageFromPreprocessingResult:javaScriptRunnerIdentifier:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObjectRepresentations:forClass:", v12, objc_opt_class());

    +[WFContentItem itemWithObject:](WFSafariWebPageContentItem, "itemWithObject:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_2;
  v10[3] = &unk_24C4E33B0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a2, "coerceToItemClasses:options:completionHandler:", v8, v7, v10);

}

uint64_t __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__WFNSExtensionItemContentItem_coerceToItemClasses_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)itemWithObject:(id)a3 sourceAppBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v7);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolvedAppMatchingDescriptor:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAccountBasedSourceApp:", v7);

    if (v16)
    {
      objc_msgSend(v10, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v18 = (_QWORD *)get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr;
      v29 = get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr;
      if (!get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke;
        v31 = &unk_24C4E3118;
        v32 = &v26;
        __get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke(buf);
        v18 = (_QWORD *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *get_UINSExtensionItemUserInfoIsContentManagedKey(void)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFNSExtensionItemContentItem.m"), 27, CFSTR("%s"), dlerror());

        __break(1u);
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", *v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (objc_msgSend(v19, "BOOLValue"))
          v20 = 2;
        else
          v20 = 1;
      }
      else
      {
        v20 = 0;
      }
      +[WFAppContentLocation locationWithAppDescriptor:managedLevel:](WFAppContentLocation, "locationWithAppDescriptor:managedLevel:", v13, v20);
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = v22;
    }
    if (v10)
      objc_msgSend(a1, "itemWithObject:origin:disclosureLevel:", v10, v14, 1);
    else
      objc_msgSend(a1, "itemWithObject:origin:disclosureLevel:", v8, v14, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFNSExtensionItemContentItem itemWithObject:sourceAppBundleIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_20BBAD000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve app descriptor with bundle identifier: %@", buf, 0x16u);
    }
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFNSExtensionItemContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Extension item"), CFSTR("Extension item"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Extension items"), CFSTR("Extension items"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Extension items"));
}

@end
