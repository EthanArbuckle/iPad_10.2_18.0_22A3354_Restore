@implementation DDAppleStorePreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a1, "urlForURL:result:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dd_isAppleStore"))
  {
    objc_msgSend(v4, "dd_productIdentifierFromAppleStoreScheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createViewController
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double Helper_x8__SKStoreProductParameterITunesItemIdentifier;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[DDAppleStorePreviewAction urlForURL:result:](DDAppleStorePreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dd_productIdentifierFromAppleStoreScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  gotLoadHelper_x8__OBJC_CLASS___SKStoreProductViewController(v4);
  v6 = objc_alloc_init(*(Class *)(v5 + 112));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1 << objc_msgSend(v7, "statusBarOrientation");

  if ((objc_msgSend(v6, "supportedInterfaceOrientations") & v8) == 0)
  {

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  Helper_x8__SKStoreProductParameterITunesItemIdentifier = gotLoadHelper_x8__SKStoreProductParameterITunesItemIdentifier(v9);
  v14 = **(_QWORD **)(v11 + 272);
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, Helper_x8__SKStoreProductParameterITunesItemIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadProductWithParameters:completionBlock:", v12, &__block_literal_global_3);

LABEL_6:
  return v6;
}

void __49__DDAppleStorePreviewAction_createViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __49__DDAppleStorePreviewAction_createViewController__block_invoke_cold_1();

}

- (id)commitURL
{
  return +[DDAppleStorePreviewAction urlForURL:result:](DDAppleStorePreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
}

- (BOOL)showMenuTitle
{
  return 0;
}

+ (id)urlForURL:(id)a3 result:(__DDResult *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (void *)DDResultCopyExtractedURL();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)previewActionsWithValidatedURL:(id)a3
{
  __DDResult *v4;
  NSDictionary *context;
  id v6;
  void *v7;
  DDCopyAction *v8;
  DDShareAction *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = self->super.super._result;
  context = self->super.super._context;
  v6 = a3;
  +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v6, v4, context);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", self->super.super._url, self->super.super._result, self->super.super._context);
  v13[0] = v8;
  v9 = -[DDShareAction initWithURL:result:context:]([DDShareAction alloc], "initWithURL:result:context:", v6, self->super.super._result, self->super.super._context);

  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)menuActions
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  DDCopyAction *v11;
  void *v12;
  DDShareAction *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  DDShareAction *v21;
  DDCopyAction *v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[DDAppleStorePreviewAction urlForURL:result:](DDAppleStorePreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = (void *)v3;
  +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v23 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v7);
  }

  v11 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", self->super.super._url, self->super.super._result, self->super.super._context);
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  v13 = -[DDShareAction initWithURL:result:context:]([DDShareAction alloc], "initWithURL:result:context:", v16, self->super.super._result, self->super.super._context);
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  return v4;
}

void __49__DDAppleStorePreviewAction_createViewController__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error loading Apple Store content", v0, 2u);
}

@end
