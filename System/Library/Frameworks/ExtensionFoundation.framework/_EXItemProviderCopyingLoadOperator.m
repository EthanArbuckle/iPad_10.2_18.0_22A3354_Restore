@implementation _EXItemProviderCopyingLoadOperator

- (_EXItemProviderCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4
{
  id v6;
  _EXItemProviderCopyingLoadOperator *v7;
  _EXItemProviderCopyingLoadOperator *v8;
  __int128 v9;
  _EXItemProviderCopyingLoadOperator *v10;
  _OWORD v12[2];

  v6 = a3;
  v7 = -[_EXItemProviderCopyingLoadOperator init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[_EXItemProviderCopyingLoadOperator setItemProvider:](v7, "setItemProvider:", v6);
    v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    -[_EXItemProviderCopyingLoadOperator setDestinationProcessAuditToken:](v8, "setDestinationProcessAuditToken:", v12);
    v10 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_EXItemProviderCopyingLoadOperator setItemProvider:](self, "setItemProvider:", 0);
  -[_EXItemProviderCopyingLoadOperator setLoadedItems:](self, "setLoadedItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderCopyingLoadOperator;
  -[_EXItemProviderCopyingLoadOperator dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderCopyingLoadOperator)initWithCoder:(id)a3
{
  id v4;
  _EXItemProviderCopyingLoadOperator *v5;
  void *v6;
  void *v7;
  _EXItemProviderCopyingLoadOperator *v8;

  v4 = a3;
  v5 = -[_EXItemProviderCopyingLoadOperator init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "allowedClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("loadedItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXItemProviderCopyingLoadOperator setLoadedItems:](v5, "setLoadedItems:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v9[2];

  v4 = a3;
  -[_EXItemProviderCopyingLoadOperator itemProvider](self, "itemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registeredTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&self->_destinationProcessAuditToken.val[4];
  v9[0] = *(_OWORD *)self->_destinationProcessAuditToken.val;
  v9[1] = v7;
  -[_EXItemProviderCopyingLoadOperator _loadItemsForTypeIdentifiers:auditToken:itemProvider:](self, "_loadItemsForTypeIdentifiers:auditToken:itemProvider:", v6, v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("loadedItems"));

}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, void *, void *);

  v14 = (void (**)(id, void *, void *))a4;
  v8 = a3;
  -[_EXItemProviderCopyingLoadOperator loadedItems](self, "loadedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("error"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "resourceURL");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
  }
  v14[2](v14, v11, v12);

}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (id)_loadItemsForTypeIdentifiers:(id)a3 auditToken:(id *)a4 itemProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _EXItemProviderCopyingLoadOperator *v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke;
  v14[3] = &unk_1E2CFD600;
  v10 = v9;
  v15 = v10;
  v16 = self;
  v11 = *(_OWORD *)&a4->var0[4];
  v18 = *(_OWORD *)a4->var0;
  v19 = v11;
  v17 = &v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)_sandboxedResourceForItemIfNeeded:(id)a3 auditToken:(id *)a4 error:(id *)a5
{
  id v7;
  _EXItemProviderSandboxedResource *v8;
  __int128 v9;
  _EXItemProviderSandboxedResource *v10;
  _OWORD v12[2];

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isFileURL"))
  {
    v8 = [_EXItemProviderSandboxedResource alloc];
    v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    v10 = -[_EXItemProviderSandboxedResource initWithContentsOfURL:auditToken:error:](v8, "initWithContentsOfURL:auditToken:error:", v7, v12, a5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  self->_itemProvider = (NSItemProvider *)a3;
}

- (NSDictionary)loadedItems
{
  return self->_loadedItems;
}

- (void)setLoadedItems:(id)a3
{
  objc_storeStrong((id *)&self->_loadedItems, a3);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)destinationProcessAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setDestinationProcessAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_destinationProcessAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_destinationProcessAuditToken.val = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedItems, 0);
}

@end
