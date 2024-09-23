@implementation WFNSItemProviderContentItem

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)generateFileRepresentationWithNewAPI:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WFNSItemProviderContentItem *v16;
  id v17;

  v7 = a3;
  v8 = a5;
  -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke;
  v14[3] = &unk_24C4E2CB8;
  v16 = self;
  v17 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  v13 = (id)objc_msgSend(v9, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v10, v14);

}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFContentGraphLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFNSItemProviderContentItem generateFileRepresentation:options:forType:]";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_DEFAULT, "%s Loading item of type %@ from NSItemProvider", buf, 0x16u);
  }

  if (-[WFNSItemProviderContentItem useNewLoadingAPI](self, "useNewLoadingAPI"))
  {
    -[WFNSItemProviderContentItem generateFileRepresentationWithNewAPI:options:forType:](self, "generateFileRepresentationWithNewAPI:options:forType:", v8, v9, v10);
  }
  else
  {
    -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke;
    v14[3] = &unk_24C4E2D30;
    v14[4] = self;
    v15 = v10;
    v16 = v8;
    objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v13, 0, v14);

  }
}

- (void)generateObjectRepresentationWithNewAPI:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__WFNSItemProviderContentItem_generateObjectRepresentationWithNewAPI_options_forClass___block_invoke;
  v11[3] = &unk_24C4E2D58;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = (id)objc_msgSend(v8, "loadObjectOfClass:completionHandler:", a5, v11);

}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  Class v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  getWFContentGraphLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[WFNSItemProviderContentItem generateObjectRepresentation:options:forClass:]";
    v27 = 2112;
    v28 = a5;
    _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Loading item of class %@ from NSItemProvider", buf, 0x16u);
  }

  if (!-[WFNSItemProviderContentItem useNewLoadingAPI](self, "useNewLoadingAPI"))
  {
    if ((Class)objc_opt_class() == a5)
    {
      -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x24BDF85F0], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke;
      v23[3] = &unk_24C4E2D80;
      v24 = v8;
      objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v13, 0, v23);

      v14 = v24;
    }
    else if ((Class)objc_opt_class() == a5)
    {
      -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
      v21[3] = &unk_24C4E2DA8;
      v22 = v8;
      objc_msgSend(v15, "loadItemForTypeIdentifier:options:completionHandler:", v16, 0, v21);

      v14 = v22;
    }
    else
    {
      if ((Class)objc_opt_class() != a5)
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v11);

        goto LABEL_13;
      }
      -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x24BDF8510], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
      v19[3] = &unk_24C4E31F8;
      v20 = v8;
      objc_msgSend(v17, "loadItemForTypeIdentifier:options:completionHandler:", v18, 0, v19);

      v14 = v20;
    }

    goto LABEL_13;
  }
  -[WFNSItemProviderContentItem generateObjectRepresentationWithNewAPI:options:forClass:](self, "generateObjectRepresentationWithNewAPI:options:forClass:", v8, v9, a5);
LABEL_13:

}

- (id)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[WFNSItemProviderContentItem contentName](self, "contentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFNSItemProviderContentItem;
    -[WFContentItem name](&v8, sel_name);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)outputTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEE0];
  v4 = (void *)MEMORY[0x24BEC14A0];
  -[WFNSItemProviderContentItem itemProvider](self, "itemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registeredTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typesFromStrings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  -[WFNSItemProviderContentItem fileURLType](self, "fileURLType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemProviderTypeIdentifierOverridesWithFileURLType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = (void *)objc_msgSend(v8, "copy", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    v16 = *MEMORY[0x24BDF85F0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "indexOfObject:", v18), v19);
        }
        else if (objc_msgSend(v18, "conformsToUTType:", v16))
        {
          v20 = objc_msgSend(v8, "indexOfObject:", v18);
          +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v20, v21);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v22);

  return v8;
}

- (BOOL)cachesSupportedTypes
{
  return 0;
}

- (void)preloadImportantItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  -[WFNSItemProviderContentItem outputTypes](self, "outputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke;
    v21[3] = &unk_24C4E2DF8;
    v21[4] = self;
    v8 = &v22;
    v22 = v4;
    v9 = objc_opt_class();
    v10 = v21;
  }
  else
  {
    +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "containsObject:", v11);

    if (v12)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_24C4E2DF8;
      v19[4] = self;
      v8 = &v20;
      v20 = v4;
      v9 = objc_opt_class();
      v10 = v19;
    }
    else
    {
      +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "containsObject:", v13);

      if (!v14)
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4;
        v15[3] = &unk_24C4E3180;
        v15[4] = self;
        v8 = &v16;
        v16 = v4;
        -[WFContentItem getFileRepresentations:forType:](self, "getFileRepresentations:forType:", v15, 0);
        goto LABEL_8;
      }
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_24C4E2DF8;
      v17[4] = self;
      v8 = &v18;
      v18 = v4;
      v9 = objc_opt_class();
      v10 = v17;
    }
  }
  -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v10, v9);
LABEL_8:

}

- (NSString)contentName
{
  return self->_contentName;
}

- (void)setContentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)useNewLoadingAPI
{
  return self->_useNewLoadingAPI;
}

- (void)setUseNewLoadingAPI:(BOOL)a3
{
  self->_useNewLoadingAPI = a3;
}

- (WFFileType)fileURLType
{
  return self->_fileURLType;
}

- (void)setFileURLType:(id)a3
{
  objc_storeStrong((id *)&self->_fileURLType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLType, 0);
  objc_storeStrong((id *)&self->_contentName, 0);
}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "setContentName:", a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "setContentName:", a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "setContentName:", a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__WFNSItemProviderContentItem_preloadImportantItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wfName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setContentName:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x24BEC14E0];
    v6 = a2;
    a2 = (void *)objc_msgSend([v5 alloc], "initWithPlatformImage:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v6;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfURL:encoding:error:", v5, 4, &v17);
    v8 = v17;

    v5 = (id)v7;
    v6 = v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "regularFileContents");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

    v5 = (id)v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "containsString:", CFSTR("<div>")))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_4;
      v13[3] = &unk_24C4E2DD0;
      v14 = v5;
      v16 = *(id *)(a1 + 32);
      v15 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v13);

    }
    else
    {
      (*(void (**)(_QWORD, id, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, 0, v6);
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0E40], -1100, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v11 + 16))(v11, 0, 0, v12);

    }
  }

}

void __77__WFNSItemProviderContentItem_generateObjectRepresentation_options_forClass___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28[2];

  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("<html")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<!DOCTYPE html><html><head><meta charset=\"utf-8\"></head><body>%@</body></html>"), v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_21943;
  v26 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_21943;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_21943)
  {
    v5 = UIFoundationLibrary_21944();
    v4 = (id *)dlsym(v5, "NSDocumentTypeDocumentAttribute");
    v24[3] = (uint64_t)v4;
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_21943 = (uint64_t)v4;
  }
  _Block_object_dispose(&v23, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSDocumentTypeDocumentAttribute(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFNSItemProviderContentItem.m"), 21, CFSTR("%s"), dlerror(), v23);

    goto LABEL_15;
  }
  v6 = *v4;
  v27 = v6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v7 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr_21950;
  v26 = getNSHTMLTextDocumentTypeSymbolLoc_ptr_21950;
  if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr_21950)
  {
    v8 = UIFoundationLibrary_21944();
    v7 = (id *)dlsym(v8, "NSHTMLTextDocumentType");
    v24[3] = (uint64_t)v7;
    getNSHTMLTextDocumentTypeSymbolLoc_ptr_21950 = (uint64_t)v7;
  }
  _Block_object_dispose(&v23, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSHTMLTextDocumentType(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("WFNSItemProviderContentItem.m"), 22, CFSTR("%s"), dlerror(), v23);

LABEL_15:
    __break(1u);
  }
  v28[0] = *v7;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = v28[0];
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithData:options:documentAttributes:error:", v13, v11, 0, 0);

  v15 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v14, "string");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (id)v16;
  else
    v18 = v2;
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v15 + 16))(v15, v18, 0, *(_QWORD *)(a1 + 40));

}

void __87__WFNSItemProviderContentItem_generateObjectRepresentationWithNewAPI_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "itemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestedName");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void (**v10)(id, void *, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = a1[5];
    if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF83A8]))
    {
      objc_msgSend(v5, "wfFileType");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "setFileURLType:", v9);
      v8 = (id)v9;
    }
    v10 = (void (**)(id, void *, void *))a1[6];
    +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v5, 5, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, v7);
    goto LABEL_5;
  }
  objc_msgSend(v6, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0E40]))
  {

    goto LABEL_10;
  }
  v13 = objc_msgSend(v7, "code");

  if (v13 != -1100)
  {
LABEL_10:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_11;
  }
  objc_msgSend(a1[4], "itemProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v15[3] = &unk_24C4E2D08;
  v14 = a1[5];
  v15[4] = a1[4];
  v16 = v14;
  v17 = a1[6];
  objc_msgSend(v8, "loadItemForTypeIdentifier:options:completionHandler:", v11, 0, v15);

LABEL_5:
LABEL_11:

}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void (**)(id, void *, id))a1[6];
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v5, a1[5], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v6);

  }
  else
  {
    objc_msgSend(a1[4], "itemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_3;
    v11[3] = &unk_24C4E2CE0;
    v13 = a1[6];
    v12 = a1[5];
    objc_msgSend(v9, "loadItemForTypeIdentifier:options:completionHandler:", v10, 0, v11);

  }
}

void __74__WFNSItemProviderContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    if (v3)
      objc_msgSend(v3, "getFileRepresentation:forType:", v4, *(_QWORD *)(a1 + 32));
    else
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a4;
  if (v7)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__21973;
    v19[4] = __Block_byref_object_dispose__21974;
    v20 = 0;
    v9 = (void *)objc_opt_new();
    v18 = v8;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke_6;
    v13[3] = &unk_24C4E2C90;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v19;
    v17 = a3;
    objc_msgSend(v9, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 0, &v18, v13);
    v12 = v18;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    _Block_object_dispose(v19, 8);

    v8 = v12;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __84__WFNSItemProviderContentItem_generateFileRepresentationWithNewAPI_options_forType___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR(".")))
  {
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", 0, *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(*(id *)(a1 + 40), "itemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedName");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  if (*(_BYTE *)(a1 + 56))
    v9 = 8;
  else
    v9 = 3;
  +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v13, v9, *(_QWORD *)(a1 + 32), v3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

+ (id)itemProviderTypeIdentifierOverrides
{
  return (id)objc_msgSend(a1, "itemProviderTypeIdentifierOverridesWithFileURLType:", 0);
}

+ (id)itemProviderTypeIdentifierOverridesWithFileURLType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF85F0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8620]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v5;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v7;
  v8 = *MEMORY[0x24BDF83A8];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83A8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v10;
  v11 = *MEMORY[0x24BEC1CB8];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1CB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v12;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v14;
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
  return (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Item provider"), CFSTR("Item provider"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Item providers"), CFSTR("Item providers"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Item providers"));
}

@end
