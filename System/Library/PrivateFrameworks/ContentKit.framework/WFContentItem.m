@implementation WFContentItem

- (id)itemProviderForTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  WFContentItem *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v19 = *MEMORY[0x24BDF8510];
    v20 = *MEMORY[0x24BDF85F0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
        }
        else
        {
          if (objc_msgSend(v11, "isEqualToClass:", objc_opt_class()))
          {
            v13 = (void *)MEMORY[0x24BEC14A0];
            v14 = v20;
          }
          else
          {
            if (!objc_msgSend(v11, "isEqualToClass:", objc_opt_class()))
              goto LABEL_15;
            v13 = (void *)MEMORY[0x24BEC14A0];
            v14 = v19;
          }
          objc_msgSend(v13, "typeWithUTType:", v14, v19);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v12;
        if (v12)
        {
          objc_msgSend(v12, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke;
          v21[3] = &unk_24C4DBDC0;
          v22 = v15;
          v23 = self;
          v17 = v15;
          objc_msgSend(v5, "registerItemForTypeIdentifier:loadHandler:", v16, v21);

        }
LABEL_15:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)extensionItemWithItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFContentItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    -[WFContentItem name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:", v8);
    objc_msgSend(v5, "setAttributedTitle:", v9);

  }
  v20[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttachments:", v10);

  objc_msgSend(v5, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("link.contentkit.sourceapp"));

  -[WFContentItem metadataForSerialization](self, "metadataForSerialization");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v18);

  objc_msgSend(v5, "setUserInfo:", v15);
  return v5;
}

- (NSItemProvider)itemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFContentItem supportedTypes](self, "supportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[WFContentItem includesFileRepresentationInSerializedItem](self, "includesFileRepresentationInSerializedItem"))
  {
    -[WFContentItem preferredFileType](self, "preferredFileType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (!-[WFContentItem hasStringOutput](self, "hasStringOutput"))
  {
    +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v6);

  }
  -[WFContentItem itemProviderForTypes:](self, "itemProviderForTypes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSItemProvider *)v7;
}

- (NSExtensionItem)extensionItem
{
  void *v3;
  void *v4;

  -[WFContentItem itemProvider](self, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem extensionItemWithItemProvider:](self, "extensionItemWithItemProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSExtensionItem *)v4;
}

- (NSItemProvider)minimalItemProvider
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToClass:", objc_opt_class());

  if (!v4)
  {
    v6 = (void *)objc_opt_new();
    if (-[WFContentItem includesFileRepresentationInSerializedItem](self, "includesFileRepresentationInSerializedItem"))
    {
      -[WFContentItem preferredFileType](self, "preferredFileType");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[WFContentItem hasStringOutput](self, "hasStringOutput"))
      {
LABEL_8:
        -[WFContentItem itemProviderForTypes:](self, "itemProviderForTypes:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    objc_msgSend(v6, "addObject:", v9);

    goto LABEL_8;
  }
  v5 = (void *)MEMORY[0x24BDBCF00];
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem itemProviderForTypes:](self, "itemProviderForTypes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return (NSItemProvider *)v8;
}

- (NSExtensionItem)minimalExtensionItem
{
  void *v3;
  void *v4;

  -[WFContentItem minimalItemProvider](self, "minimalItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem extensionItemWithItemProvider:](self, "extensionItemWithItemProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSExtensionItem *)v4;
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = *(id *)(a1 + 32);
  if (objc_msgSend(v6, "isEqualToUTType:", *MEMORY[0x24BDF83A8]))
  {
    objc_msgSend(*(id *)(a1 + 40), "preferredFileType");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  if ((!a3 || (void *)objc_opt_class() == a3)
    && ((objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF8348]) & 1) != 0
     || objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF85F0])))
  {
    a3 = (void *)objc_opt_class();
  }
  if (a3 == (void *)objc_opt_class())
  {
    v10 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_2;
    v17[3] = &unk_24C4E2ED8;
    v18 = v5;
    objc_msgSend(v10, "getFileRepresentation:forType:", v17, v6);
    v9 = v18;
    goto LABEL_17;
  }
  if ((a3 == (void *)objc_opt_class() || a3 == (void *)objc_opt_class())
    && (objc_msgSend(*(id *)(a1 + 32), "isEqualToUTType:", *MEMORY[0x24BDF85F0]) & 1) == 0)
  {
    v12 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_3;
    v15[3] = &unk_24C4E2ED8;
    v16 = v5;
    objc_msgSend(v12, "getFileRepresentation:forType:", v15, v6);
    v9 = v16;
    goto LABEL_17;
  }
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_25473D770))
  {
    v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_4;
    v13[3] = &unk_24C4E2DF8;
    v13[4] = v8;
    v14 = v5;
    objc_msgSend(v8, "getObjectRepresentation:forClass:", v13, a3);
    v9 = v14;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0E40], -1100, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);

LABEL_18:
}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "fileURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __55__WFContentItem_NSExtensionItem__itemProviderForTypes___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = a4;
  if (objc_msgSend((id)objc_opt_class(), "errorIsBadCoercionError:", v6))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0E40], -1100, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)richListTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContentItem name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1618], "parseAnnotatedString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v4 = (void (**)(id, void *))a3;
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (-[WFContentItem name](self, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[WFContentItem internalName](self, "internalName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    if (v4)
    {
      -[WFContentItem internalName](self, "internalName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11);

    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)getListAltText:(id)a3
{
  return 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  return 0;
}

- (BOOL)loadsListContentAsynchronously
{
  return -[WFContentItem loadsListAltTextAsynchronously](self, "loadsListAltTextAsynchronously")
      || -[WFContentItem loadsListSubtitleAsynchronously](self, "loadsListSubtitleAsynchronously")
      || -[WFContentItem loadsListThumbnailAsynchronously](self, "loadsListThumbnailAsynchronously");
}

- (BOOL)loadsListAltTextAsynchronously
{
  return 0;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 0;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 0;
}

- (unint64_t)preferredDisplayStyle
{
  return 0;
}

- (void)dealloc
{
  void (**v3)(_QWORD);
  objc_super v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__WFContentItem_dealloc__block_invoke;
  aBlock[3] = &unk_24C4E2198;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v3[2](v3);
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], v3);

  v4.receiver = self;
  v4.super_class = (Class)WFContentItem;
  -[WFContentItem dealloc](&v4, sel_dealloc);
}

- (void)getRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  WFContentItem *v23;
  void (**v24)(id, uint64_t, id);
  _QWORD v25[4];
  id v26;
  WFContentItem *v27;
  id v28;
  void (**v29)(id, uint64_t, id);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  if (-[WFContentItem coercionOptions:allowCoercionsToType:](self, "coercionOptions:allowCoercionsToType:", v9, v8))
  {
    v30 = 0;
    -[WFContentItem _getRepresentationsForType:options:error:](self, "_getRepresentationsForType:options:error:", v8, v9, &v30);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (unint64_t)v30;
    if (v11 | v12)
    {
      v10[2](v10, v11, (id)v12);
    }
    else
    {
      -[WFContentItem supportedTypes](self, "supportedTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = WFAnyInTypesConformsToType(v14, v8);

      if (v15)
      {
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke;
        v25[3] = &unk_24C4E3400;
        v26 = v9;
        v27 = self;
        v28 = v8;
        v29 = v10;
        -[WFContentItem generateRepresentationsForType:options:completionHandler:](self, "generateRepresentationsForType:options:completionHandler:", v28, v26, v25);

      }
      else
      {
        -[WFContentItem allSupportedTypes](self, "allSupportedTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = WFAnyInTypesConformsToType(v16, v8);

        if (v17)
        {
          +[WFContentCoercionSearch searchForCoercingItem:toType:options:](WFContentCoercionSearch, "searchForCoercingItem:toType:options:", self, v8, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_2;
          v20[3] = &unk_24C4E3400;
          v24 = v10;
          v21 = v8;
          v22 = v9;
          v23 = self;
          objc_msgSend(v18, "runCoercion:", v20);

        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v19);

        }
      }
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v13);

  }
}

- (id)_getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  WFContentItem *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[WFContentItem representationsForType:](self, "representationsForType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (-[WFContentItem canGenerateRepresentationForType:](self, "canGenerateRepresentationForType:", v8))
    {
      getWFContentGraphLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "typeDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
        {
          objc_msgSend(v8, "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = 136315650;
        v19 = "-[WFContentItem _getRepresentationsForType:options:error:]";
        v20 = 2114;
        v21 = v13;
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_INFO, "%s Generating %{public}@ representation from %@", (uint8_t *)&v18, 0x20u);
        if (!v12)

      }
      -[WFContentItem generateRepresentationsForType:options:error:](self, "generateRepresentationsForType:options:error:", v8, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v9, "itemClassPrioritizationType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v10, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "wfType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContentItem setRepresentations:forType:](self, "setRepresentations:forType:", v10, v16);

        }
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)getRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[WFContentItem coercionOptions:allowCoercionsToType:](self, "coercionOptions:allowCoercionsToType:", v9, v8))
  {
    v21 = 0;
    -[WFContentItem _getRepresentationsForType:options:error:](self, "_getRepresentationsForType:options:error:", v8, v9, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    v12 = v11;
    if (a5 && v11)
      *a5 = objc_retainAutorelease(v11);
    if (v10)
    {
      v13 = v10;
    }
    else
    {
      v14 = objc_msgSend(v8, "isEqualToClass:", objc_opt_class());
      v13 = 0;
      if (!v12 && v14)
      {
        -[WFContentItem internalName](self, "internalName");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15
          && (v16 = (void *)v15, v17 = -[WFContentItem hasStringOutput](self, "hasStringOutput"),
                                 v16,
                                 !v17))
        {
          -[WFContentItem internalName](self, "internalName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }
      }
    }

  }
  else if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getRepresentationsForType:(id)a3 error:(id *)a4
{
  id v6;
  WFCoercionOptions *v7;
  void *v8;

  v6 = a3;
  v7 = +[WFCoercionOptions new](WFCoercionOptions, "new");
  -[WFContentItem getRepresentationsForType:options:error:](self, "getRepresentationsForType:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)generateRepresentationsForType:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "coercionForCoercingToType:concurrencyMode:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performAsynchronousCoercionWithContentItem:forType:options:completionHandler:", self, v13, v8, v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFContentItem generateObjectRepresentations:options:forClass:](self, "generateObjectRepresentations:options:forClass:", v9, v8, objc_msgSend(v13, "objectClass"));
    else
      -[WFContentItem generateFileRepresentations:options:forType:](self, "generateFileRepresentations:options:forType:", v9, v8, v13);
  }

}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__WFContentItem_generateFileRepresentations_options_forType___block_invoke;
  v10[3] = &unk_24C4E2ED8;
  v11 = v8;
  v9 = v8;
  -[WFContentItem generateFileRepresentation:options:forType:](self, "generateFileRepresentation:options:forType:", v10, a4, a5);

}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__WFContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v10[3] = &unk_24C4E21E8;
  v11 = v8;
  v9 = v8;
  -[WFContentItem generateObjectRepresentation:options:forClass:](self, "generateObjectRepresentation:options:forClass:", v10, a4, a5);

}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, _QWORD, id))a3 + 2))(v7, 0, v8);
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  id v8;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a3 + 2))(v7, 0, 0, v8);

}

- (id)generateRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "coercionForCoercingToType:concurrencyMode:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performSynchronousCoercionWithContentItem:forType:options:error:", self, v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFContentItem generateObjectRepresentationsForClass:options:error:](self, "generateObjectRepresentationsForClass:options:error:", objc_msgSend(v8, "objectClass"), v9, a5);
    else
      -[WFContentItem generateFileRepresentationsForType:options:error:](self, "generateFileRepresentationsForType:options:error:", v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)generateFileRepresentationsForType:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[WFContentItem generateFileRepresentationForType:options:error:](self, "generateFileRepresentationForType:options:error:", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[WFContentItem generateObjectRepresentationForClass:options:error:](self, "generateObjectRepresentationForClass:options:error:", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (WFRepresentation)internalRepresentation
{
  void *v3;
  void *v4;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem representationForType:](self, "representationForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFRepresentation *)v4;
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)getTitleWithPermissionRequestor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[WFContentItem name](self, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (NSString)internalName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wfName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[WFContentItem name](self, "name");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    -[WFContentItem name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (BOOL)hasStringOutput
{
  return objc_msgSend((id)objc_opt_class(), "hasStringOutput");
}

- (id)internalRepresentationForCopyingWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  WFCoercionOptions *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDeclared");

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[WFContentItem preferredFileType](self, "preferredFileType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[WFCoercionOptions new](WFCoercionOptions, "new");
        -[WFContentItem getRepresentationsForType:options:error:](self, "getRepresentationsForType:options:error:", v8, v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = v11;

          v5 = v12;
        }

      }
    }
  }
  v13 = v5;

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WFContentItem copyWithName:zone:](self, "copyWithName:zone:", 0, a3);
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[WFContentItem internalRepresentationForCopyingWithName:](self, "internalRepresentationForCopyingWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(v7, "copyWithName:zone:", v6, a4);
  }
  else
  {
    -[WFContentItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithName:zone:", v10, a4);

  }
  v11 = -[WFContentItem classForCopying](self, "classForCopying");
  -[WFContentItem attributionSet](self, "attributionSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class itemWithRepresentation:attributionSet:cachingIdentifier:](v11, "itemWithRepresentation:attributionSet:cachingIdentifier:", v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItem copyStateToItem:](self, "copyStateToItem:", v14);
  return v14;
}

- (id)copyWithName:(id)a3
{
  return -[WFContentItem copyWithName:zone:](self, "copyWithName:zone:", a3, 0);
}

- (Class)classForCopying
{
  return (Class)objc_opt_class();
}

- (WFContentItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WFContentItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("attributionSet")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cachingIdentifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cachingIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("internalRepresentation")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internalRepresentationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(v7, "objectClass"));
      -[WFContentItem allowedClassesForDecodingInternalRepresentations](self, "allowedClassesForDecodingInternalRepresentations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        -[WFContentItem allowedClassesForDecodingInternalRepresentations](self, "allowedClassesForDecodingInternalRepresentations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v11);

      }
    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("internalRepresentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFContentItem initWithRepresentation:forType:attributionSet:cachingIdentifier:](self, "initWithRepresentation:forType:attributionSet:cachingIdentifier:", v12, v7, v5, v6);
    v13 = self;
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("serializationMetadata")))
    {
      v13 = 0;
      goto LABEL_16;
    }
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend((id)objc_opt_class(), "pasteboardValueClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("serializationMetadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("link.contentkit.name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("link.contentkit.contentattributionset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet objectWithWFSerializedRepresentation:](WFContentAttributionSet, "objectWithWFSerializedRepresentation:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("link.contentkit.cachingidentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v18);
    objc_msgSend((id)objc_opt_class(), "itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:", v7, 0, v8, v12, v19);
    v13 = (WFContentItem *)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:

  return v13;
}

- (BOOL)canEncodeWithCoder:(id)a3
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  int isKindOfClass;
  int v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEncodable");
  objc_msgSend(v4, "wfFileCoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFContentItem alwaysEncodeUsingWFSerializableContent](self, "alwaysEncodeUsingWFSerializableContent");
  v9 = (void *)objc_opt_class();
  objc_msgSend(v4, "wfFileCoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isAvailableOnPlatform:", objc_msgSend(v10, "targetPlatform"));

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v6 && (!v7 ? (v13 = 1) : (v13 = v11), !v8 && ((v13 | isKindOfClass) & 1) != 0))
  {
    if (!v7)
    {
      getWFContentGraphLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v19 = 136315138;
        v20 = "-[WFContentItem encodeWithCoder:]";
        _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_FAULT, "%s WFContentItem representation is being encoded without using a WFFileCoder. This could result in a significant spike in memory usage, and is not recommended.", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internalRepresentation"));
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("internalRepresentationType");
  }
  else
  {
    -[WFContentItem metadataForSerialization](self, "metadataForSerialization");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("serializationMetadata");
  }
  objc_msgSend(v4, "encodeObject:forKey:", v14, v15);

  -[WFContentItem attributionSet](self, "attributionSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("attributionSet"));

  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("cachingIdentifier"));

}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  -[objc_class ownedTypes](a3, "ownedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem outputTypes](self, "outputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__WFContentItem_intermediaryTypesForCoercionToItemClass___block_invoke;
  v11[3] = &unk_24C4E2210;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredOrderedSetUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;
  WFContentItem *v20;
  id v21;
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
  if (-[WFContentItem coercionOptions:allowCoercionsToItemClass:](self, "coercionOptions:allowCoercionsToItemClass:", v8, a3))
  {
    -[WFContentItem intermediaryTypesForCoercionToItemClass:](self, "intermediaryTypesForCoercionToItemClass:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    {
      v12 = (void *)MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__19472;
    v30 = __Block_byref_object_dispose__19473;
    v31 = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke;
    aBlock[3] = &unk_24C4E2260;
    v14 = v11;
    v19 = v14;
    v23 = v9;
    v24 = &v26;
    v20 = self;
    v25 = a3;
    v21 = v8;
    v15 = v12;
    v22 = v15;
    v16 = _Block_copy(aBlock);
    v17 = (void *)v27[5];
    v27[5] = (uint64_t)v16;

    (*(void (**)(void))(v27[5] + 16))();
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForItemClass:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v10);
  }

}

- (id)generateFirstLevelSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  Class v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v29 = a3;
  -[WFContentItem intermediaryTypesForCoercionToItemClass:](self, "intermediaryTypesForCoercionToItemClass:", a3);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        -[WFContentItem getRepresentationsForType:options:error:](self, "getRepresentationsForType:options:error:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13), v8, a5);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v16 = (void *)v14;
          v27 = v9;
          v28 = v8;
          v15 = (void *)objc_opt_new();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v31;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v31 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21);
                -[WFContentItem attributionSet](self, "attributionSet");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                +[WFContentItem itemWithRepresentation:attributionSet:](WFContentItem, "itemWithRepresentation:attributionSet:", v22, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                  objc_msgSend(v15, "addObject:", v24);

                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v19);
          }

          v8 = v28;
          objc_msgSend(v28, "itemClassPrioritizationType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            -[WFContentItem setSubItems:forClass:](self, "setSubItems:forClass:", v15, v29);

          v9 = v27;
          goto LABEL_23;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForItemClass:", v29);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_23:

  return v15;
}

- (void)generateSubItemsForItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  WFContentItem *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__170;
  v36[4] = __Block_byref_object_dispose__171;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__170;
  v34[4] = __Block_byref_object_dispose__171;
  v35 = 0;
  objc_msgSend(v9, "itemClassPrioritizationType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SupportedTypes"));

  if (v12)
  {
    -[WFContentItem supportedItemClasses](self, "supportedItemClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v8;
  }
  else
  {
    v14 = v8;
    -[WFContentItem supportedItemClasses](self, "supportedItemClasses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke;
  v28[3] = &unk_24C4E22B8;
  v18 = v15;
  v29 = v18;
  v30 = self;
  v31 = v9;
  v32 = v34;
  v33 = v36;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_3;
  v22[3] = &unk_24C4E22E0;
  v26 = v34;
  v27 = v36;
  v19 = v10;
  v25 = v19;
  v22[4] = self;
  v20 = v8;
  v23 = v20;
  v21 = v31;
  v24 = v21;
  objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v28, v22);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

- (id)generateSubItemsForItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v8 = a4;
  -[WFContentItem supportedItemClasses](self, "supportedItemClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", a3);

  if (v10)
  {
    -[WFContentItem generateFirstLevelSubItemsForItemClass:options:error:](self, "generateFirstLevelSubItemsForItemClass:options:error:", a3, v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFContentItem allSupportedItemClasses](self, "allSupportedItemClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", a3);

    if (v13)
    {
      +[WFContentCoercionSearch searchForCoercingItem:toItemClass:options:](WFContentCoercionSearch, "searchForCoercingItem:toItemClass:options:", self, a3, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "runCoercionSynchronouslyWithError:", a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v8, "itemClassPrioritizationType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          -[WFContentItem setSubItems:forClass:](self, "setSubItems:forClass:", v11, a3);
      }

    }
    else if (a5)
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForItemClass:", a3);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)contentItemByMergingAttributionSet:(id)a3
{
  id v4;
  WFContentItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  WFType *internalRepresentationType;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *representationsByType;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *subItemsByClass;
  uint64_t v16;
  NSUUID *cachingIdentifier;
  WFContentItem *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFContentAttributionSet isSupersetOfAttributionSet:](self->_attributionSet, "isSupersetOfAttributionSet:", v4))
  {
    v5 = self;
  }
  else
  {
    v27[0] = self->_attributionSet;
    v27[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v5 = (WFContentItem *)objc_opt_new();
    if (v5)
    {
      -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
      v8 = objc_claimAutoreleasedReturnValue();
      internalRepresentationType = v5->_internalRepresentationType;
      v5->_internalRepresentationType = (WFType *)v8;

      -[WFContentItem representationsByType](self, "representationsByType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");
      representationsByType = v5->_representationsByType;
      v5->_representationsByType = (NSMutableDictionary *)v11;

      -[WFContentItem subItemsByClass](self, "subItemsByClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "mutableCopy");
      subItemsByClass = v5->_subItemsByClass;
      v5->_subItemsByClass = (NSMutableDictionary *)v14;

      objc_storeStrong((id *)&v5->_attributionSet, v7);
      -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      cachingIdentifier = v5->_cachingIdentifier;
      v5->_cachingIdentifier = (NSUUID *)v16;

      -[WFContentItem copyStateToItem:](self, "copyStateToItem:", v5);
      v18 = v5;
    }
    else
    {
      getWFContentGraphLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136315394;
        v24 = "-[WFContentItem contentItemByMergingAttributionSet:]";
        v25 = 2112;
        v26 = v21;
        _os_log_impl(&dword_20BBAD000, v19, OS_LOG_TYPE_FAULT, "%s Failed to create content item object of type %@", (uint8_t *)&v23, 0x16u);

      }
    }

  }
  return v5;
}

- (id)typeForCoercionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  v6 = v5;
  if (!v5)
  {
    if (objc_msgSend(v4, "objectClass"))
    {
      +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_msgSend(v4, "objectClass"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend(v4, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFContentItem supportedTypes](self, "supportedTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", v11);
      objc_msgSend(v13, "intersectOrderedSet:", v14);
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }

    }
    if (v6)
    {
      if (v6 != 1)
      {
        v9 = 0;
        goto LABEL_20;
      }
      -[WFContentItem preferredFileType](self, "preferredFileType");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFContentItem preferredObjectType](self, "preferredObjectType");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v15;
LABEL_20:

    goto LABEL_21;
  }
  if (v5 == 2)
  {
    v9 = 0;
    goto LABEL_21;
  }
  if (v5 != 1)
    goto LABEL_9;
  objc_msgSend(v4, "fileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
  objc_msgSend(v4, "fileType");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (void *)v8;
LABEL_21:

  return v9;
}

- (void)performCoercion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  WFContentItem *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  switch(v5)
  {
    case 0:
      -[WFContentItem typeForCoercionRequest:](self, "typeForCoercionRequest:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __33__WFContentItem_performCoercion___block_invoke_2;
      v14[3] = &unk_24C4E2330;
      v15 = v4;
      -[WFContentItem getRepresentationsForType:options:completionHandler:](self, "getRepresentationsForType:options:completionHandler:", v9, v10, v14);

      v8 = v15;
      goto LABEL_6;
    case 1:
      -[WFContentItem typeForCoercionRequest:](self, "typeForCoercionRequest:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileRepresentationResultHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem getRepresentationsForType:options:completionHandler:](self, "getRepresentationsForType:options:completionHandler:", v11, v12, v13);

      break;
    case 2:
      objc_msgSend(v4, "contentItemClasses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __33__WFContentItem_performCoercion___block_invoke;
      v16[3] = &unk_24C4E2308;
      v17 = v4;
      v18 = self;
      -[WFContentItem coerceToItemClasses:options:completionHandler:](self, "coerceToItemClasses:options:completionHandler:", v6, v7, v16);

      v8 = v17;
LABEL_6:

      break;
  }

}

- (BOOL)canPerformCoercion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "requestType") == 2)
  {
    objc_msgSend(v4, "contentItemClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFContentCoercionSearch searchForCoercingItem:toItemClasses:options:](WFContentCoercionSearch, "searchForCoercingItem:toItemClasses:options:", self, v5, v6);
  }
  else
  {
    -[WFContentItem typeForCoercionRequest:](self, "typeForCoercionRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFContentCoercionSearch searchForCoercingItem:toType:options:](WFContentCoercionSearch, "searchForCoercingItem:toType:options:", self, v5, v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextPathNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (BOOL)coercionOptions:(id)a3 allowCoercionsToType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "contentItemClassForType:", v7);

  if (v9)
    v10 = -[WFContentItem coercionOptions:allowCoercionsToItemClass:](self, "coercionOptions:allowCoercionsToItemClass:", v6, v9);
  else
    v10 = 1;

  return v10;
}

- (BOOL)coercionOptions:(id)a3 allowCoercionsToItemClass:(Class)a4
{
  void *v5;
  id v6;
  void *v7;
  char v8;

  v5 = (void *)MEMORY[0x24BDBCF00];
  v6 = a3;
  objc_msgSend(v5, "orderedSetWithObjects:", objc_opt_class(), a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "coercionPathIsDisallowed:", v7);

  return v8 ^ 1;
}

- (void)coerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  WFContentItem *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if (objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v16, (_QWORD)v18)
          && -[WFContentItem coercionOptions:allowCoercionsToItemClass:](self, "coercionOptions:allowCoercionsToItemClass:", v9, v16))
        {
          v22 = self;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v17, 0);

          goto LABEL_12;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  -[WFContentItem forceCoerceToItemClasses:options:completionHandler:](self, "forceCoerceToItemClasses:options:completionHandler:", v11, v9, v10);
LABEL_12:

}

- (void)forceCoerceToItemClasses:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[WFContentItem subItemsForClass:](self, "subItemsForClass:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17
          && -[WFContentItem coercionOptions:allowCoercionsToItemClass:](self, "coercionOptions:allowCoercionsToItemClass:", v9, v16))
        {
          v10[2](v10, v17, 0);

          v18 = v11;
          goto LABEL_12;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__WFContentItem_forceCoerceToItemClasses_options_completionHandler___block_invoke;
  v19[3] = &unk_24C4E33B0;
  v20 = v10;
  -[WFContentItem generateSubItemsForItemClasses:options:completionHandler:](self, "generateSubItemsForItemClasses:options:completionHandler:", v11, v9, v19);
  v18 = v20;
LABEL_12:

}

- (id)itemsByCoercingToItemClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a4;
  -[WFContentItem subItemsForClass:](self, "subItemsForClass:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && -[WFContentItem coercionOptions:allowCoercionsToItemClass:](self, "coercionOptions:allowCoercionsToItemClass:", v8, a3))
  {
    v10 = v9;
  }
  else
  {
    -[WFContentItem generateSubItemsForItemClass:options:error:](self, "generateSubItemsForItemClass:options:error:", a3, v8, a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)getSerializedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "objectClass");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend((id)objc_opt_class(), "pasteboardValueClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v7, "isSubclassOfClass:", v13))
          {
            -[WFContentItem objectForClass:](self, "objectForClass:", v7);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFContentItem nativePasteboardTypeForObjectRepresentationOfClass:](self, "nativePasteboardTypeForObjectRepresentationOfClass:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v5, "setObject:forKey:", v14, v15);

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  -[WFContentItem metadataForSerialization](self, "metadataForSerialization");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v16);

  if (-[WFContentItem includesFileRepresentationInSerializedItem](self, "includesFileRepresentationInSerializedItem"))
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __35__WFContentItem_getSerializedItem___block_invoke;
    v17[3] = &unk_24C4E3180;
    v19 = v4;
    v18 = v5;
    -[WFContentItem getFileRepresentationsForSerialization:](self, "getFileRepresentationsForSerialization:", v17);

  }
  else
  {
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v5, 0);
  }

}

- (void)getFileRepresentationsForSerialization:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__WFContentItem_getFileRepresentationsForSerialization___block_invoke;
  v6[3] = &unk_24C4E2ED8;
  v7 = v4;
  v5 = v4;
  -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v6, 0);

}

- (id)nativePasteboardTypeForObjectRepresentationOfClass:(Class)a3
{
  void *v4;
  int v5;
  id v6;
  id *v7;

  if ((Class)objc_opt_class() == a3)
  {
    v7 = (id *)MEMORY[0x24BDF85F0];
LABEL_6:
    objc_msgSend(*v7, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((Class)objc_opt_class() != a3)
  {
    +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToClass:", a3);

    if (!v5)
    {
      if ((Class)objc_opt_class() != a3)
      {
        v6 = 0;
        return v6;
      }
      v7 = (id *)MEMORY[0x24BDF8620];
      goto LABEL_6;
    }
  }
  v6 = (id)*MEMORY[0x24BEC18A0];
  return v6;
}

- (NSDictionary)metadataForSerialization
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[WFContentItem additionalRepresentationsForSerialization](self, "additionalRepresentationsForSerialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), CFSTR("link.contentkit.itemclass."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("link.contentkit.itemclass.identifier"));
  -[WFContentItem name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("link.contentkit.name"));

  -[WFContentItem attributionSet](self, "attributionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wfSerializedRepresentationWithPrivateItemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("link.contentkit.contentattributionset"));

  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("link.contentkit.cachingidentifier"));

  return (NSDictionary *)v4;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFSerializableContentProvider sharedProvider](WFSerializableContentProvider, "sharedProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serializedRepresentationForObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "hasPrefix:", CFSTR("link.contentkit.")) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v16 = a2;
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v16, self, CFSTR("WFContentItem.m"), 1007, CFSTR("All serialized item keys must have the prefix link.contentkit."));

              a2 = v16;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      v14 = v7;
    }
    else
    {
      v14 = (id)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    v14 = (id)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v14;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 1;
}

- (NSArray)allowedClassesForDecodingInternalRepresentations
{
  return 0;
}

- (BOOL)alwaysEncodeUsingWFSerializableContent
{
  return 0;
}

- (id)preferredTypeOfClass:(Class)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[WFContentItem supportedTypes](self, "supportedTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = v11;

            goto LABEL_22;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v8)
          continue;
        break;
      }
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WFContentItem allSupportedTypes](self, "allSupportedTypes", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = v17;

            goto LABEL_22;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v14)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_22:

  return v5;
}

- (WFObjectType)preferredObjectType
{
  return (WFObjectType *)-[WFContentItem preferredTypeOfClass:](self, "preferredTypeOfClass:", objc_opt_class());
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)-[WFContentItem preferredTypeOfClass:](self, "preferredTypeOfClass:", objc_opt_class());
}

- (WFImage)icon
{
  void *v2;
  void *v3;

  -[WFContentItem preferredFileType](self, "preferredFileType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFImage *)v3;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WFContentLocation genericLocation](WFContentLocation, "genericLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:", v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    objc_msgSend(v8, "originalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v15[0] = v7;
      objc_msgSend(v8, "originalURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFURLContentItem attributionSetContentOfURL:](WFURLContentItem, "attributionSetContentOfURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }

  }
  return v7;
}

- (NSUUID)cachingIdentifier
{
  NSUUID *cachingIdentifier;
  NSUUID *v4;
  NSUUID *v5;

  cachingIdentifier = self->_cachingIdentifier;
  if (!cachingIdentifier)
  {
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    v5 = self->_cachingIdentifier;
    self->_cachingIdentifier = v4;

    cachingIdentifier = self->_cachingIdentifier;
  }
  return cachingIdentifier;
}

- (WFContentItemChangeTransaction)changeTransaction
{
  return -[WFContentItemChangeTransaction initWithContentItem:]([WFContentItemChangeTransaction alloc], "initWithContentItem:", self);
}

- (void)getPreferredFileExtension:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, void *))a3;
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
  }
  else
  {
    -[WFContentItem preferredFileType](self, "preferredFileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileExtension");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (void)getPreferredFileSize:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__WFContentItem_getPreferredFileSize___block_invoke;
  v6[3] = &unk_24C4E2ED8;
  v7 = v4;
  v5 = v4;
  -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v6, 0);

}

- (NSOrderedSet)ownedTypes
{
  WFContentItem *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__WFContentItem_ownedTypes__block_invoke;
  v5[3] = &unk_24C4E2550;
  v5[4] = self;
  v2 = self;
  objc_getAssociatedObject(v2, &ownedTypes_cachedValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __27__WFContentItem_ownedTypes__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v2, &ownedTypes_cachedValue, v3, (void *)0x303);
  }

  return (NSOrderedSet *)v3;
}

- (NSOrderedSet)outputTypes
{
  void (**v3)(_QWORD);
  WFContentItem *v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__WFContentItem_outputTypes__block_invoke;
  aBlock[3] = &unk_24C4E2578;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[WFContentItem cachesSupportedTypes](self, "cachesSupportedTypes"))
  {
    v4 = self;
    v5 = v3;
    objc_getAssociatedObject(v4, &outputTypes_cachedValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v5[2](v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v4, &outputTypes_cachedValue, v6, (void *)0x303);
    }

  }
  else
  {
    v3[2](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSOrderedSet *)v6;
}

- (NSOrderedSet)supportedTypes
{
  void *v3;
  void *v4;
  void *v5;

  -[WFContentItem ownedTypes](self, "ownedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem outputTypes](self, "outputTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetByAddingObjectsFromOrderedSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v5;
}

- (BOOL)cachesSupportedTypes
{
  return 1;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "coercionForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "coercionIsAvailableForItem:", self);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)canGenerateIntermediaryRepresentationForItemClass:(Class)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[WFContentItem outputTypes](self, "outputTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[objc_class ownedTypes](a3, "ownedTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "conformsToType:", v10) & 1) != 0)
              {

                v16 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (NSOrderedSet)supportedItemClasses
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[WFContentItem supportedTypes](self, "supportedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedItemClassesForItemClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v5;
}

- (NSOrderedSet)allSupportedItemClasses
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[WFContentItem allSupportedTypes](self, "allSupportedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedItemClassesForItemClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFContentItem;
  -[WFContentItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5
{
  return -[WFContentItem initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:](self, "initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", a3, a4, a5, 0, 0);
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  return -[WFContentItem initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:](self, "initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", a3, a4, a5, 0, a6);
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6
{
  return -[WFContentItem initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:](self, "initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", a3, a4, a5, a6, 0);
}

- (WFContentItem)initWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  WFContentItem *v17;
  WFContentItem *v18;
  void *v19;
  void *v20;
  WFContentItem *v21;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v8 = a6;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentItem.m"), 1476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("representation"));

  }
  v17 = -[WFContentItem init](self, "init");
  if (v17)
  {
    v18 = v17;
    v24 = v13;
    v25 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[WFContentItem initWithRepresentationsByType:forType:subItemsByClass:attributionSet:includesDefaultAttributionSet:cachingIdentifier:](v18, "initWithRepresentationsByType:forType:subItemsByClass:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", v20, v14, 0, v15, v8, v16);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (WFContentItem)initWithRepresentationsByType:(id)a3 forType:(id)a4 subItemsByClass:(id)a5 attributionSet:(id)a6 includesDefaultAttributionSet:(BOOL)a7 cachingIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WFContentItem *v19;
  id *p_isa;
  id *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  WFContentItem *v29;
  id v30;
  _QWORD v32[4];
  id *v33;
  objc_super v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)WFContentItem;
  v19 = -[WFContentItem init](&v34, sel_init);
  p_isa = (id *)&v19->super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_internalRepresentationType, a4);
    if (v18)
      objc_storeStrong(p_isa + 1, a8);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __134__WFContentItem_initWithRepresentationsByType_forType_subItemsByClass_attributionSet_includesDefaultAttributionSet_cachingIdentifier___block_invoke;
    v32[3] = &unk_24C4E25E0;
    v21 = p_isa;
    v33 = v21;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v32);
    objc_msgSend(v21, "representationForType:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v29 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v23 = objc_msgSend(v16, "mutableCopy");
    v24 = v21[4];
    v21[4] = (id)v23;

    if (v17)
    {
      if (a7)
      {
        v35[0] = v17;
        objc_msgSend(v21, "defaultSourceForRepresentation:", v22);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v35[1] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFContentAttributionSet attributionSetByMergingAttributionSets:](WFContentAttributionSet, "attributionSetByMergingAttributionSets:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v21[2];
        v21[2] = (id)v27;

LABEL_13:
        v29 = v21;
        goto LABEL_14;
      }
      v30 = v17;
    }
    else
    {
      objc_msgSend(v21, "defaultSourceForRepresentation:", v22);
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v21[2];
    v21[2] = v30;
    goto LABEL_13;
  }
  v29 = 0;
LABEL_15:

  return v29;
}

- (NSMutableDictionary)representationsByType
{
  NSMutableDictionary *representationsByType;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  representationsByType = self->_representationsByType;
  if (!representationsByType)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_representationsByType;
    self->_representationsByType = v4;

    representationsByType = self->_representationsByType;
  }
  return representationsByType;
}

- (id)representationsForType:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContentItem representationsByType](self, "representationsByType");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x24BDF8350];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "conformsToType:", v4, (_QWORD)v16) & 1) == 0)
        {
          if (!objc_msgSend(v4, "isEqualToUTType:", v9))
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v11, "fileExtension");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (!v13)
            continue;
        }
        objc_msgSend(v5, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)representationForType:(id)a3
{
  void *v3;
  void *v4;

  -[WFContentItem representationsForType:](self, "representationsForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRepresentations:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = a4;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "filterRepresentationsForAllowedContent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFContentItem representationsByType](self, "representationsByType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v10);

LABEL_6:
      v9 = v10;
      goto LABEL_7;
    }
  }
  v9 = v10;
  if (v10)
  {
    -[WFContentItem representationsByType](self, "representationsByType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v10);
    goto LABEL_6;
  }
LABEL_7:

}

- (id)fileRepresentationsForType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFContentItem representationsForType:](self, "representationsForType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fileRepresentationForType:(id)a3
{
  void *v3;
  void *v4;

  -[WFContentItem fileRepresentationsForType:](self, "fileRepresentationsForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectRepresentationsForClass:(Class)a3
{
  void *v4;
  void *v5;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem representationsForType:](self, "representationsForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectRepresentationForClass:(Class)a3
{
  void *v3;
  void *v4;

  -[WFContentItem objectRepresentationsForClass:](self, "objectRepresentationsForClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setObjectRepresentations:(id)a3 forClass:(Class)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentItem setRepresentations:forType:](self, "setRepresentations:forType:", v6, v7);

}

- (id)objectsForClass:(Class)a3
{
  void *v3;
  void *v4;

  -[WFContentItem objectRepresentationsForClass:](self, "objectRepresentationsForClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_285);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectForClass:(Class)a3
{
  void *v3;
  void *v4;

  -[WFContentItem objectRepresentationForClass:](self, "objectRepresentationForClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)subItemsByClass
{
  NSMutableDictionary *subItemsByClass;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  subItemsByClass = self->_subItemsByClass;
  if (!subItemsByClass)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_subItemsByClass;
    self->_subItemsByClass = v4;

    subItemsByClass = self->_subItemsByClass;
  }
  return subItemsByClass;
}

- (void)setSubItems:(id)a3 forClass:(Class)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFContentItem subItemsByClass](self, "subItemsByClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, a4);
  else
    objc_msgSend(v6, "removeObjectForKey:", a4);

}

- (id)subItemsForClass:(Class)a3
{
  void *v4;
  void *v5;

  -[WFContentItem subItemsByClass](self, "subItemsByClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)subItemForClass:(Class)a3
{
  void *v3;
  void *v4;

  -[WFContentItem subItemsForClass:](self, "subItemsForClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFContentAttributionSet)attributionSet
{
  return self->_attributionSet;
}

- (void)setAttributionSet:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSet, a3);
}

- (void)setRepresentationsByType:(id)a3
{
  objc_storeStrong((id *)&self->_representationsByType, a3);
}

- (void)setSubItemsByClass:(id)a3
{
  objc_storeStrong((id *)&self->_subItemsByClass, a3);
}

- (WFType)internalRepresentationType
{
  return self->_internalRepresentationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRepresentationType, 0);
  objc_storeStrong((id *)&self->_subItemsByClass, 0);
  objc_storeStrong((id *)&self->_representationsByType, 0);
  objc_storeStrong((id *)&self->_attributionSet, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
}

uint64_t __33__WFContentItem_objectsForClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __134__WFContentItem_initWithRepresentationsByType_forType_subItemsByClass_attributionSet_includesDefaultAttributionSet_cachingIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRepresentations:forType:", a3, a2);
}

id __28__WFContentItem_outputTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "outputTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(*(id *)(a1 + 32), "hasStringOutput") & 1) == 0)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "supportedTypeMustBeDeterminedByInstance:", v3);

    if ((v5 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v2, "orderedSetByAddingObject:", v3);
    v4 = v2;
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  v6 = (void *)objc_msgSend(v2, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "canGenerateRepresentationForType:", v12, (_QWORD)v15) & 1) == 0)
          objc_msgSend(v6, "removeObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

id __27__WFContentItem_ownedTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "ownedTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "canGenerateRepresentationForType:", v9, (_QWORD)v12) & 1) == 0)
          objc_msgSend(v3, "removeObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

uint64_t __38__WFContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "fileSize"));
}

void __56__WFContentItem_getFileRepresentationsForSerialization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD, id);
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
    v7 = a3;
    v9(v3, 0, v7);
    v8 = 0;
  }

}

void __35__WFContentItem_getSerializedItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (*v18)(void);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "wfType", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

            goto LABEL_14;
          }
          v16 = *(void **)(a1 + 32);
          objc_msgSend(v12, "mappedData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v18();
LABEL_14:

}

uint64_t __68__WFContentItem_forceCoerceToItemClasses_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__WFContentItem_performCoercion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeContentItemCoercionRequestWithResultItems:originalItem:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

void __33__WFContentItem_performCoercion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectRepresentationResultHandler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)MEMORY[0x24BDBCEB8];
  v9 = v5;
  v10 = v6;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithCapacity:", objc_msgSend(v9, "count"));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __WFInvokeObjectRepresentationsResultHandlerWithRepresentations_block_invoke;
  v14[3] = &unk_24C4E2648;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v9, "if_compactMap:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, id, id))v7)[2](v7, v13, v12, v10);
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;

  v8 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) != 0)
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_2;
    v11[3] = &unk_24C4E2290;
    v13 = *(_OWORD *)(a1 + 56);
    v14 = a5;
    v12 = v8;
    objc_msgSend(v9, "generateFirstLevelSubItemsForItemClass:options:completionHandler:", a2, v10, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[WFContentCoercionSearch searchForCoercingItem:toItemClasses:options:](WFContentCoercionSearch, "searchForCoercingItem:toItemClasses:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_4;
    v5[3] = &unk_24C4E3400;
    v6 = *(id *)(a1 + 48);
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v7 = v3;
    v8 = v4;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v2, "runCoercion:", v5);

  }
}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemClassPrioritizationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = *(id *)(a1 + 40);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v8, "isSubclassOfClass:", v15, (_QWORD)v16))
              objc_msgSend(*(id *)(a1 + 48), "setSubItems:forClass:", v5, v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __74__WFContentItem_generateSubItemsForItemClasses_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  **(_BYTE **)(a1 + 56) = objc_msgSend(v12, "count") != 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_2;
    v16[3] = &unk_24C4E2238;
    v22 = *(_QWORD *)(a1 + 72);
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v17 = v7;
    v18 = v8;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 80);
    v19 = v10;
    v23 = v11;
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v5, "getRepresentationsForType:options:completionHandler:", v4, v6, v16);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v12 + 16))(*(_QWORD *)(a1 + 64), 0, v3);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForItemClass:", *(_QWORD *)(a1 + 80));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
}

void __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v24 = v6;
    v8 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "attributionSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFContentItem itemWithRepresentation:attributionSet:includesDefaultAttributionSet:](WFContentItem, "itemWithRepresentation:attributionSet:includesDefaultAttributionSet:", v14, v15, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v8, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 48), "itemClassPrioritizationType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(*(id *)(a1 + 40), "setSubItems:forClass:", v8, *(_QWORD *)(a1 + 80));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_3;
    block[3] = &unk_24C4E2DD0;
    v20 = *(NSObject **)(a1 + 56);
    v29 = *(id *)(a1 + 64);
    v27 = v8;
    v7 = v24;
    v28 = v24;
    v21 = v8;
    dispatch_async(v20, block);

    v5 = v25;
  }
  else
  {
    v23 = v6;
    if (!v6)
      v23 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v23);
  }

}

uint64_t __82__WFContentItem_generateFirstLevelSubItemsForItemClass_options_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __57__WFContentItem_intermediaryTypesForCoercionToItemClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToTypes:", *(_QWORD *)(a1 + 32));
}

void __64__WFContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (a2)
  {
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __61__WFContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD, id);
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
    v7 = a3;
    v9(v3, 0, v7);
    v8 = 0;
  }

}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "itemClassPrioritizationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(*(id *)(a1 + 40), "setRepresentations:forType:", v5, *(_QWORD *)(a1 + 48));
  }
  v8 = objc_msgSend(*(id *)(a1 + 48), "isEqualToClass:", objc_opt_class());
  if (!v5
    && v8
    && objc_msgSend((id)objc_opt_class(), "errorIsBadCoercionError:", v6)
    && (objc_msgSend(*(id *)(a1 + 40), "internalName"), (v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = (void *)v9, v11 = objc_msgSend(*(id *)(a1 + 40), "hasStringOutput"), v10, (v11 & 1) == 0))
  {
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "internalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v15, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_3;
    v13[3] = &unk_24C4E21C0;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_5;
    v8[3] = &unk_24C4E3400;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = v6;
    v10 = v7;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(a2, "if_flatMapAsynchronously:completionHandler:", v13, v8);

  }
}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v10[2] = __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_4;
  v10[3] = &unk_24C4E33B0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a2, "getRepresentationsForType:options:completionHandler:", v8, v7, v10);

}

void __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "itemClassPrioritizationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(*(id *)(a1 + 40), "setRepresentations:forType:", v7, *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __69__WFContentItem_getRepresentationsForType_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __24__WFContentItem_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

+ (id)itemWithObject:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithObject:named:", a3, 0);
}

+ (id)itemWithObject:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  +[WFContentItemPrivacyConfiguration configurationWithOrigin:disclosureLevel:](WFContentItemPrivacyConfiguration, "configurationWithOrigin:disclosureLevel:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithObject:privacyConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)itemWithObject:(id)a3 privacyConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "disclosureLevel");
  objc_msgSend(v6, "disclosureWarnings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  WFMakeContentAttributionSetFromOrigin(v8, v9, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v7, 0, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)itemWithObject:(id)a3 attributionSet:(id)a4
{
  return (id)objc_msgSend(a1, "itemWithObject:named:attributionSet:", a3, 0, a4);
}

+ (id)itemWithObject:(id)a3 named:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 87, CFSTR("object should not be a WFFileRepresentation, use itemWithFile: for files"));

  }
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 92, CFSTR("object should not be a WFFileRepresentation, use itemWithFile: for files"));

  }
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:attributionSet:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)itemWithObject:(id)a3 named:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 97, CFSTR("object should not be a WFFileRepresentation, use itemWithFile: for files"));

  }
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:attributionSet:cachingIdentifier:", v15, v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4
{
  return (id)objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:", a3, a4, 0);
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5
{
  return (id)objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:", a3, a4, a5, 1);
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  return (id)objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", a3, a4, a5, 1, a6);
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6
{
  return (id)objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", a3, a4, a5, a6, 0);
}

+ (id)itemWithRepresentation:(id)a3 forType:(id)a4 attributionSet:(id)a5 includesDefaultAttributionSet:(BOOL)a6 cachingIdentifier:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v8 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(a1, "isContentItemSubclass"))
  {
    v31 = v14;
    v32 = v12;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(a1, "ownedTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      v20 = *MEMORY[0x24BDF8350];
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v13, "conformsToType:", v22) & 1) == 0)
          {
            if (!objc_msgSend(v22, "isEqualToUTType:", v20))
              continue;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
          v28 = objc_alloc((Class)a1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v22;
          else
            v29 = v13;
          v14 = v31;
          v12 = v32;
          v23 = (void *)objc_msgSend(v28, "initWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:cachingIdentifier:", v32, v29, v31, v8, v15);

          goto LABEL_22;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v18)
          continue;
        break;
      }
    }

    v23 = 0;
    v14 = v31;
    v12 = v32;
  }
  else
  {
    +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "contentItemClassForType:", v13);

    if (!v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
        v26 = objc_claimAutoreleasedReturnValue();

        +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v27, "contentItemClassForType:", v26);

        v13 = (id)v26;
      }
      else
      {
        v25 = 0;
      }
    }
    objc_msgSend(v25, "itemWithRepresentation:forType:attributionSet:cachingIdentifier:", v12, v13, v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v23;
}

+ (id)itemWithRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:forType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "wfType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "wfType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:cachingIdentifier:", v10, v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)itemWithRepresentation:(id)a3 attributionSet:(id)a4 includesDefaultAttributionSet:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "wfType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithRepresentation:forType:attributionSet:includesDefaultAttributionSet:", v9, v10, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)itemWithFile:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithFile:attributionSet:", a3, 0);
}

+ (id)itemWithFile:(id)a3 attributionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 158, CFSTR("object must be a WFFileRepresentation, use itemWithObject: for objects"));

  }
  objc_msgSend(a1, "itemWithRepresentation:attributionSet:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)itemWithFile:(id)a3 attributionSet:(id)a4 cachingIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 163, CFSTR("object must be a WFFileRepresentation, use itemWithObject: for objects"));

  }
  objc_msgSend(a1, "itemWithRepresentation:attributionSet:cachingIdentifier:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)itemWithFile:(id)a3 origin:(id)a4 disclosureLevel:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 168, CFSTR("object must be a WFFileRepresentation, use itemWithObject: for objects"));

  }
  v16 = 0;
  WFMakeContentAttributionSetFromOrigin(v10, a5, MEMORY[0x24BDBD1A8], &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  objc_msgSend(a1, "itemWithFile:attributionSet:cachingIdentifier:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)isContentItemSubclass
{
  return objc_opt_class() != (_QWORD)a1;
}

+ (BOOL)hasStringOutput
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[WFStringContentItem ownedTypes](WFStringContentItem, "ownedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ownedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "intersectsOrderedSet:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[WFStringContentItem ownedTypes](WFStringContentItem, "ownedTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "outputTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "intersectsOrderedSet:", v7);

  }
  return v5;
}

+ (BOOL)hasFileOutput
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "ownedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "outputTypes", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
LABEL_11:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v8)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v8) = 1;
  }
LABEL_19:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)getContentItemFromSerializedItem:(id)a3 sourceName:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  Class v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t m;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v92;
  void *v93;
  id v94;
  void (**v95)(id, uint64_t, _QWORD);
  void *v96;
  id obj;
  id obja;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v94 = a4;
  v95 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  WFPopStringForKey(v7, CFSTR("link.contentkit.name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    WFPopStringForKey(v7, (void *)*MEMORY[0x24BEC18A8]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v93 = v10;

  WFPopStringForKey(v7, CFSTR("link.contentkit.itemclass.identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(v12, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.contentattributionset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("link.contentkit.contentattributionset"));
  v96 = v12;

  if (v13)
  {
    +[WFContentAttributionSet objectWithWFSerializedRepresentation:](WFContentAttributionSet, "objectWithWFSerializedRepresentation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  WFPopStringForKey(v12, CFSTR("link.contentkit.cachingidentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v15);
  if (v14)
    goto LABEL_12;
  if (objc_msgSend(v94, "isEqualToString:", CFSTR("Clipboard")))
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[WFContentLocation clipboardLocation](WFContentLocation, "clipboardLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithOrigin:disclosureLevel:originalItemIdentifier:", v17, 1, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    if (!v11)
      goto LABEL_17;
    goto LABEL_13;
  }
  v14 = 0;
  if (!v11)
    goto LABEL_17;
LABEL_13:
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("link.contentkit.itemclass."), &stru_24C4E3948, 8, 0, objc_msgSend(CFSTR("link.contentkit.itemclass."), "length"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = NSClassFromString(v18);
  if (-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
  {
    -[objc_class itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:](v19, "itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:", v12, 0, v93, v14, v16);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      v95[2](v95, v20, 0);

      goto LABEL_90;
    }
  }

LABEL_17:
  objc_msgSend(v12, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "if_map:", &__block_literal_global_19627);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentItemClasses");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v123, v133, 16);
  v90 = v16;
  v85 = v13;
  v86 = v11;
  v84 = v15;
  v92 = v14;
  if (v25)
  {
    v26 = *(_QWORD *)v124;
    v87 = v24;
    v76 = *(_QWORD *)v124;
    do
    {
      v27 = 0;
      v78 = v25;
      do
      {
        if (*(_QWORD *)v124 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v27);
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        objc_msgSend(v28, "ownedPasteboardTypes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
        if (v82)
        {
          v30 = *(_QWORD *)v120;
          obj = v29;
          v80 = *(_QWORD *)v120;
          do
          {
            for (i = 0; i != v82; ++i)
            {
              if (*(_QWORD *)v120 != v30)
                objc_enumerationMutation(v29);
              v32 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
              v115 = 0u;
              v116 = 0u;
              v117 = 0u;
              v118 = 0u;
              v33 = v89;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v116;
                while (2)
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v116 != v36)
                      objc_enumerationMutation(v33);
                    v38 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
                    if (objc_msgSend(v38, "conformsToType:", v32))
                    {
                      objc_msgSend(a1, "itemFromSerializedItem:withItemClass:forType:nameIfKnown:sourceName:attributionSet:cachingIdentifier:completionHandler:", v12, v28, v38, v93, v94, v92, v90, v95);
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (v39)
                      {
                        v49 = (void *)v39;
                        v95[2](v95, v39, 0);

                        v16 = v90;
                        v50 = v87;
                        goto LABEL_89;
                      }
                    }
                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
                  if (v35)
                    continue;
                  break;
                }
              }

              v30 = v80;
              v29 = obj;
            }
            v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
          }
          while (v82);
        }

        ++v27;
        v26 = v76;
        v24 = v87;
      }
      while (v27 != v78);
      v25 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v123, v133, 16);
    }
    while (v25);
  }

  v40 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obja = v89;
  v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v112 != v44)
          objc_enumerationMutation(obja);
        v46 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
        +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "contentItemClassForType:", v46);

        if (v48)
          objc_msgSend(v40, "addObject:", v48);
        if (v48 == objc_opt_class())
          v43 |= objc_msgSend(v46, "isDynamic") ^ 1;
      }
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
    }
    while (v42);
  }
  else
  {
    LOBYTE(v43) = 0;
  }

  v51 = objc_msgSend(v40, "count");
  v16 = v90;
  if (v51 >= 2)
  {
    v52 = v51;
    v53 = objc_msgSend(v40, "indexOfObject:", NSClassFromString(CFSTR("WFRichTextContentItem")));
    if (v53 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "moveObjectsAtIndexes:toIndex:", v54, 0);

    }
    v55 = objc_msgSend(v40, "indexOfObject:", NSClassFromString(CFSTR("WFStringContentItem")));
    if (v55 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "moveObjectsAtIndexes:toIndex:", v56, v52 - 1);

    }
    if ((v43 & 1) == 0)
    {
      v57 = objc_msgSend(v40, "indexOfObject:", objc_opt_class());
      if (v57 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "moveObjectsAtIndexes:toIndex:", v58, v52 - 1);

      }
    }
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v50 = v40;
  v59 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v108;
    v88 = v50;
    v75 = *(_QWORD *)v108;
    do
    {
      v61 = 0;
      v77 = v59;
      do
      {
        if (*(_QWORD *)v108 != v60)
          objc_enumerationMutation(v50);
        v62 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v61);
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        objc_msgSend(v62, "ownedTypes");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
        if (v81)
        {
          v64 = *(_QWORD *)v104;
          v83 = v63;
          v79 = *(_QWORD *)v104;
          do
          {
            for (m = 0; m != v81; ++m)
            {
              if (*(_QWORD *)v104 != v64)
                objc_enumerationMutation(v63);
              v66 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * m);
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v67 = obja;
              v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
              if (v68)
              {
                v69 = v68;
                v70 = *(_QWORD *)v100;
                while (2)
                {
                  for (n = 0; n != v69; ++n)
                  {
                    if (*(_QWORD *)v100 != v70)
                      objc_enumerationMutation(v67);
                    v72 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * n);
                    if (objc_msgSend(v72, "conformsToType:", v66))
                    {
                      objc_msgSend(a1, "itemFromSerializedItem:withItemClass:forType:nameIfKnown:sourceName:attributionSet:cachingIdentifier:completionHandler:", v96, v62, v72, v93, v94, v92, v90, v95);
                      v73 = objc_claimAutoreleasedReturnValue();
                      if (v73)
                      {
                        v74 = (void *)v73;
                        v95[2](v95, v73, 0);

                        v50 = v88;
                        goto LABEL_89;
                      }
                    }
                  }
                  v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
                  if (v69)
                    continue;
                  break;
                }
              }

              v63 = v83;
              v64 = v79;
            }
            v60 = v75;
            v81 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
          }
          while (v81);
        }

        ++v61;
        v50 = v88;
      }
      while (v61 != v77);
      v59 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
    }
    while (v59);
  }

  v95[2](v95, 0, 0);
LABEL_89:

  v13 = v85;
  v11 = v86;
  v15 = v84;
  v14 = v92;
LABEL_90:

}

+ (id)itemFromSerializedItem:(id)a3 withItemClass:(Class)a4 forType:(id)a5 nameIfKnown:(id)a6 sourceName:(id)a7 attributionSet:(id)a8 cachingIdentifier:(id)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v17 && v18)
  {
    if ((objc_msgSend(v16, "isEqualToUTType:", *MEMORY[0x24BDF85F0]) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringFromDate:dateStyle:timeStyle:", v22, 2, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v18, v24);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[objc_class itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:](a4, "itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:", v15, v16, v17, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a1, "ownedTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v27 = a1;
    v28 = v12;
    v18 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v20;
          v22 = objc_msgSend(v21, "objectClass");
          +[WFSerializableContentProvider sharedProvider](WFSerializableContentProvider, "sharedProvider");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectOfClass:withSerializedRepresentation:", v22, v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v12 = v28;
            objc_msgSend(v27, "itemWithObject:named:attributionSet:cachingIdentifier:", v24, v28, v13, v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
        continue;
      break;
    }
    v25 = 0;
    v12 = v28;
  }
  else
  {
    v25 = 0;
  }
LABEL_14:

  return v25;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return 1;
}

+ (id)ownedTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
}

+ (id)ownedPasteboardTypes
{
  return 0;
}

+ (id)outputTypesFromCoercions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "cachedCoercions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCF00]);
  objc_msgSend(v2, "if_map:", &__block_literal_global_207_19616);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return v5;
}

+ (NSString)typeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "isContentItemSubclass"))
  {
    objc_msgSend(a1, "ownedTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8350]))
    {
      WFDeferrableLocalizedStringWithKey(CFSTR("File"), CFSTR("File"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "typeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "capitalizedStringWithLocale:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    WFDeferrableLocalizedStringWithKey(CFSTR("Anything (Singular)"), CFSTR("Anything"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

+ (NSString)localizedTypeDescription
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "typeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFResolveDeferrableLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)pluralTypeDescription
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!objc_msgSend(a1, "isContentItemSubclass"))
    goto LABEL_5;
  objc_msgSend(a1, "ownedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToUTType:", *MEMORY[0x24BDF8350]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItem.m"), 1106, CFSTR("Subclasses of WFContentItem should provide a plural description of the type"));

LABEL_5:
    WFDeferrableLocalizedStringWithKey(CFSTR("Anything (Plural)"), CFSTR("Anything"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v6;
  }
  WFDeferrableLocalizedStringWithKey(CFSTR("Files"), CFSTR("Files"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)localizedPluralTypeDescription
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pluralTypeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFResolveDeferrableLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)countDescription
{
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a1, "isContentItemSubclass"))
    goto LABEL_5;
  objc_msgSend(a1, "ownedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8350]) & 1) == 0)
  {

LABEL_5:
    WFLocalizedPluralString(CFSTR("%d Items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v5;
  }
  WFLocalizedPluralString(CFSTR("%d Files"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

+ (int64_t)tableTemplateSubjectType
{
  return 0;
}

+ (id)namePropertyBuilder
{
  void *v2;
  void *v3;
  void *v4;

  WFLocalizedContentPropertyNameMarker(CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("name"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo:", CFSTR("WFItemName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)propertyBuilders
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
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  objc_msgSend(a1, "namePropertyBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "hasFileOutput") & 1) != 0)
  {
    v19[0] = v4;
    WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_244, v18, objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userInfo:", CFSTR("WFFileSizeProperty"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortable:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filterable:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gettable:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v5;
    WFLocalizedContentPropertyNameMarker(CFSTR("File Extension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_250_19581, v6, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo:", CFSTR("WFFileExtensionProperty"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "caseInsensitive:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortable:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterable:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gettable:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (NSArray)properties
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__WFContentItem_properties__block_invoke;
  v5[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v5[4] = a1;
  v2 = a1;
  objc_getAssociatedObject(v2, &properties_cachedValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __27__WFContentItem_properties__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v2, &properties_cachedValue, v3, (void *)0x303);
  }

  return (NSArray *)v3;
}

+ (NSArray)allProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "superclass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(a1, "superclass"), "allProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __30__WFContentItem_allProperties__block_invoke;
        v15[3] = &unk_24C4E24E8;
        v15[4] = v12;
        v13 = objc_msgSend(v3, "indexOfObjectPassingTest:", v15);
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v3, "insertObject:atIndex:", v12, 0);
        else
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v13, v12);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

+ (id)propertyForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("name"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "allProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("displayName"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(a1, "allProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectMatchingKey:value:", CFSTR("singularItemName"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

+ (BOOL)hasLibrary
{
  return 0;
}

+ (WFContentItemStringConversionBehavior)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "localizedTypeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior coercingToStringWithDescription:](WFContentItemStringConversionBehavior, "coercingToStringWithDescription:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFContentItemStringConversionBehavior *)v3;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  +[WFContentItem contentPropertySubstitutor](WFContentItem, "contentPropertySubstitutor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "runWithObjects:propertySubstitutor:completionHandler:", v9, v11, v8);

}

+ (id)supportedPropertyForProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "isEquivalentToProperty:", v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)contentPropertySubstitutor
{
  return &__block_literal_global_266;
}

+ (BOOL)contentItems:(id)a3 haveContentProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char HaveProperties;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "contentPropertySubstitutor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HaveProperties = WFContentObjectsHaveProperties(v7, v6, v8);

  return HaveProperties;
}

+ (id)cachedCoercions
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__WFContentItem_cachedCoercions__block_invoke;
  v5[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v5[4] = a1;
  v2 = a1;
  objc_getAssociatedObject(v2, &cachedCoercions_cachedValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __32__WFContentItem_cachedCoercions__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v2, &cachedCoercions_cachedValue, v3, (void *)0x303);
  }

  return v3;
}

+ (id)coercions
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)coercionForCoercingToType:(id)a3 concurrencyMode:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cachedCoercions");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "canProduceType:withConcurrencyMode:", v5, a4, (_QWORD)v14) & 1) != 0)
        {
          v12 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)coercionForType:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "cachedCoercions");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "type", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToType:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (NSOrderedSet)supportedTypes
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__WFContentItem_supportedTypes__block_invoke;
  v5[3] = &__block_descriptor_40_e5__8__0l;
  v5[4] = a1;
  v2 = a1;
  objc_getAssociatedObject(v2, &supportedTypes_cachedValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __31__WFContentItem_supportedTypes__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v2, &supportedTypes_cachedValue, v3, (void *)0x303);
  }

  return (NSOrderedSet *)v3;
}

+ (BOOL)supportedItemClassMustBeDeterminedByInstance:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[objc_class ownedTypes](a3, "ownedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "intersectOrderedSet:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(a1, "supportedTypeMustBeDeterminedByInstance:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "coercionForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "handler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasAvailabilityCheck");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportedTypesMustBeDeterminedByInstance
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "supportedTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(a1, "supportedTypeMustBeDeterminedByInstance:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (NSOrderedSet)supportedTypesExcludingInstanceSpecificTypes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "supportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__WFContentItem_supportedTypesExcludingInstanceSpecificTypes__block_invoke;
  v7[3] = &__block_descriptor_40_e33_B24__0__WFType_8__NSDictionary_16l;
  v7[4] = a1;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredOrderedSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v5;
}

+ (NSOrderedSet)supportedItemClassesExcludingInstanceSpecificTypes
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "supportedTypesExcludingInstanceSpecificTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedItemClassesForItemClass((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)supportedItemClasses
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "supportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedItemClassesForItemClass((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

+ (NSOrderedSet)allSupportedItemClasses
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "allSupportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedItemClassesForItemClass((uint64_t)a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

+ (NSArray)contentCategories
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

+ (id)filterRepresentationsForAllowedContent:(id)a3
{
  return a3;
}

+ (id)badCoercionErrorDefaultResponsibleComponent
{
  return WFLocalizedString(CFSTR("The operation"));
}

+ (id)populateBadCoercionError:(id)a3 withResponsibleComponent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "badCoercionErrorDefaultResponsibleComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v16[0] = *MEMORY[0x24BDD0FD8];
  objc_msgSend(v7, "localizedFailureReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[1] = *MEMORY[0x24BDD0FC8];
  v17[0] = v12;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFContentItemErrorDomain"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __61__WFContentItem_supportedTypesExcludingInstanceSpecificTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "supportedTypeMustBeDeterminedByInstance:", a2) ^ 1;
}

id __31__WFContentItem_supportedTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "ownedTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outputTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetByAddingObjectsFromOrderedSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "hasStringOutput") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "supportedTypeMustBeDeterminedByInstance:", v5))
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "orderedSetByAddingObject:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

uint64_t __32__WFContentItem_cachedCoercions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coercions");
}

id __43__WFContentItem_contentPropertySubstitutor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedPropertyForProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __30__WFContentItem_allProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

id __27__WFContentItem_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "propertyBuilders");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_map:", &__block_literal_global_254);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __27__WFContentItem_properties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "build");
}

uint64_t __33__WFContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "getPreferredFileExtension:", a4);
}

void __33__WFContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WFContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __33__WFContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

uint64_t __41__WFContentItem_outputTypesFromCoercions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type");
}

uint64_t __79__WFContentItem_getContentItemFromSerializedItem_sourceName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", a2);
}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4 options:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__WFContentItem_CoercionConvenience__getObjectRepresentation_forClass_options___block_invoke;
  v10[3] = &unk_24C4E3468;
  v11 = v8;
  v9 = v8;
  -[WFContentItem getObjectRepresentations:forClass:options:](self, "getObjectRepresentations:forClass:options:", v10, a4, a5);

}

- (void)getFileRepresentation:(id)a3 forType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__WFContentItem_CoercionConvenience__getFileRepresentation_forType_options___block_invoke;
  v10[3] = &unk_24C4E33B0;
  v11 = v8;
  v9 = v8;
  -[WFContentItem getFileRepresentations:forType:options:](self, "getFileRepresentations:forType:options:", v10, a4, a5);

}

- (void)getFileRepresentations:(id)a3 forType:(id)a4 options:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[WFCoercionRequest requestForCoercingToFileType:completionHandler:](WFCoercionRequest, "requestForCoercingToFileType:completionHandler:", a4, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOptions:", v8);

  -[WFContentItem performCoercion:](self, "performCoercion:", v9);
}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4 options:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[WFCoercionRequest requestForCoercingToObjectClass:completionHandler:](WFCoercionRequest, "requestForCoercingToObjectClass:completionHandler:", a4, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOptions:", v8);

  -[WFContentItem performCoercion:](self, "performCoercion:", v9);
}

- (BOOL)isCoercibleToItemClass:(Class)a3
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFContentItem isCoercibleToItemClasses:](self, "isCoercibleToItemClasses:", v4);

  return (char)self;
}

- (BOOL)isCoercibleToItemClasses:(id)a3
{
  void *v4;

  +[WFCoercionRequest requestForCoercingToContentClasses:completionHandler:](WFCoercionRequest, "requestForCoercingToContentClasses:completionHandler:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFContentItem canPerformCoercion:](self, "canPerformCoercion:", v4);

  return (char)self;
}

- (void)coerceToItemClass:(Class)a3 completionHandler:(id)a4
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
  -[WFContentItem coerceToItemClasses:completionHandler:](self, "coerceToItemClasses:completionHandler:", v7, v6, v8, v9);

}

- (void)coerceToItemClasses:(id)a3 completionHandler:(id)a4
{
  id v5;

  +[WFCoercionRequest _requestForCoercingToContentClasses:itemCompletionHandler:](WFCoercionRequest, "_requestForCoercingToContentClasses:itemCompletionHandler:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContentItem performCoercion:](self, "performCoercion:", v5);

}

- (void)getObjectRepresentation:(id)a3 forClass:(Class)a4
{
  -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", a3, a4, 0);
}

- (void)getObjectRepresentations:(id)a3 forClass:(Class)a4
{
  -[WFContentItem getObjectRepresentations:forClass:options:](self, "getObjectRepresentations:forClass:options:", a3, a4, 0);
}

- (void)getFileRepresentation:(id)a3 forType:(id)a4
{
  -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", a3, a4, 0);
}

- (void)getFileRepresentations:(id)a3 forType:(id)a4
{
  -[WFContentItem getFileRepresentations:forType:options:](self, "getFileRepresentations:forType:options:", a3, a4, 0);
}

void __76__WFContentItem_CoercionConvenience__getFileRepresentation_forType_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __79__WFContentItem_CoercionConvenience__getObjectRepresentation_forClass_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a4;
  objc_msgSend(a3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v8 = 0;
  }
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, id))(v9 + 16))(v9, v10, v8, v7);

}

+ (NSArray)pasteboardValueClasses
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2, v5, v6, v7, v8, v9, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "objectClass");
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (BOOL)errorIsBadCoercionError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("WFContentItemErrorDomain")))
    v5 = objc_msgSend(v3, "code") == 0;
  else
    v5 = 0;

  return v5;
}

+ (id)badCoercionErrorWithReasonString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLocalizedString(CFSTR("Conversion Error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%@ failed because %@."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "badCoercionErrorDefaultResponsibleComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v15[0] = *MEMORY[0x24BDD0FD8];
  v15[1] = v11;
  v16[0] = v5;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFContentItemErrorDomain"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)badCoercionErrorForTypeDescription:(id)a3 toTypeDescription:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a3;
  if (v6)
  {
    WFLocalizedString(CFSTR("Shortcuts couldn’t convert from %@ to %@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Shortcuts couldn’t convert from %@ to the required type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v13);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "badCoercionErrorWithReasonString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)badCoercionErrorForItemClasses:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "valueForKey:", CFSTR("localizedTypeDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v8);

      v9 = objc_msgSend(v4, "count") + v6;
      v10 = CFSTR(", ");
      if (v9 > 2
        || objc_msgSend(v4, "count") - 2 == v7 && (v11 = objc_msgSend(v4, "count"), v10 = CFSTR(", or "), v11 > 2)
        || objc_msgSend(v4, "count") == 2 && (v10 = CFSTR(" or "), !v7))
      {
        WFLocalizedString(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

      }
      ++v7;
      --v6;
    }
    while (v7 < objc_msgSend(v4, "count"));
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(a1, "localizedTypeDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "badCoercionErrorForTypeDescription:toTypeDescription:", v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)badCoercionErrorForItemClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "localizedTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class localizedTypeDescription](a3, "localizedTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badCoercionErrorForTypeDescription:toTypeDescription:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)badCoercionErrorForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "contentItemClassForType:", v4);

  if ((objc_msgSend(v6, "isSubclassOfClass:", a1) & 1) != 0)
    objc_msgSend(v4, "typeDescription");
  else
    objc_msgSend(v6, "localizedTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend(a1, "localizedTypeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "badCoercionErrorForTypeDescription:toTypeDescription:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)badCoercionErrorForObjectClass:(Class)a3
{
  void *v4;
  void *v5;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "badCoercionErrorForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
