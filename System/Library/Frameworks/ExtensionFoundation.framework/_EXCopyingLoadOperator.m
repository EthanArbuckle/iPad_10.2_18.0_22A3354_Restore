@implementation _EXCopyingLoadOperator

- (_EXCopyingLoadOperator)initWithItemProvider:(id)a3 destinationProcessAuditToken:(id *)a4
{
  id v6;
  _EXCopyingLoadOperator *v7;
  _EXCopyingLoadOperator *v8;
  __int128 v9;
  _EXCopyingLoadOperator *v10;
  _OWORD v12[2];

  v6 = a3;
  v7 = -[_EXLoadOperator _init](self, "_init");
  v8 = v7;
  if (v7)
  {
    -[_EXCopyingLoadOperator setItemProvider:](v7, "setItemProvider:", v6);
    v9 = *(_OWORD *)&a4->var0[4];
    v12[0] = *(_OWORD *)a4->var0;
    v12[1] = v9;
    -[_EXCopyingLoadOperator setDestinationProcessAuditToken:](v8, "setDestinationProcessAuditToken:", v12);
    v10 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXCopyingLoadOperator)initWithCoder:(id)a3
{
  id v4;
  _EXCopyingLoadOperator *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _EXCopyingLoadOperator *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  objc_super v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_EXCopyingLoadOperator;
  v5 = -[_EXLoadOperator _init](&v28, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codedData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v27 = 0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v27);
      v8 = v27;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v21, v22, (_QWORD)v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v18, "setEncodedPayload:", v7);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v15);
      }

      -[_EXCopyingLoadOperator setItems:](v5, "setItems:", v13);
      v8 = v21;
      v6 = v22;
    }
    v19 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  id v39;
  dispatch_semaphore_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v33 = (void *)objc_opt_new();
  -[_EXCopyingLoadOperator itemProvider](self, "itemProvider");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registeredTypeIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    v7 = *MEMORY[0x1E0CB2CA8];
    v8 = *MEMORY[0x1E0CB2CA0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v11 = dispatch_semaphore_create(0);
        v46 = v7;
        v47 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __42___EXCopyingLoadOperator_encodeWithCoder___block_invoke;
        v38[3] = &unk_1E2CFD2E0;
        v38[4] = self;
        v38[5] = v10;
        v39 = v33;
        v40 = v11;
        v13 = v11;
        objc_msgSend(v32, "loadItemForTypeIdentifier:options:completionHandler:", v10, v12, v38);
        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v5);
  }

  v14 = v33;
  v15 = v30;
  if (objc_msgSend(v33, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v33;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "payload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "payloadIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v23)
            v26 = v24 == 0;
          else
            v26 = 1;
          if (!v26)
          {
            objc_msgSend(v24, "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "encodeObject:forKey:", v23, v27);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v19);
    }

    objc_msgSend(v16, "encodedData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v15, "encodeObject:forKey:", v29, CFSTR("items"));

      objc_msgSend(v15, "encodeObject:forKey:", v28, CFSTR("codedData"));
    }

    v14 = v33;
  }

}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (**v20)(id, void *, void *);

  v20 = (void (**)(id, void *, void *))a4;
  v9 = a3;
  -[_EXCopyingLoadOperator items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plistTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v13, "containsObject:", a5);

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a5)
    objc_msgSend(v14, "plistAndValueTypes");
  else
    objc_msgSend(v14, "itemProviderTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payloadOfClasses:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "resourceURL");
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
  }
  v20[2](v20, v17, v18);

}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
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

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
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

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_destinationProcessAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_destinationProcessAuditToken.val[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
