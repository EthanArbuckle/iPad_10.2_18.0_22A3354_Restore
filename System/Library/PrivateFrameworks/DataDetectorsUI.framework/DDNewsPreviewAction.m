@implementation DDNewsPreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  void *v4;
  double v5;
  double Helper_x8__OBJC_CLASS___NSSNewsViewController;
  uint64_t v7;
  int v8;

  objc_msgSend(a1, "urlForURL:result:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v5),
        objc_msgSend(*(id *)(v7 + 1200), "canOpenURL:", v4, Helper_x8__OBJC_CLASS___NSSNewsViewController)))
  {
    v8 = applicationWithBundleIdentifierIsRestricted(CFSTR("com.apple.news")) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)createViewController
{
  uint64_t v2;
  void *v3;
  double v4;
  void *v5;

  +[DDNewsPreviewAction urlForURL:result:](DDNewsPreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gotLoadHelper_x20__OBJC_CLASS___NSSNewsViewController(v4);
  if (objc_msgSend(*(id *)(v2 + 1200), "canOpenURL:", v3))
  {
    v5 = (void *)objc_msgSend(objc_alloc(*(Class *)(v2 + 1200)), "initWithURL:", v3);
    objc_msgSend(v5, "setLinkPreviewing:", 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (id)commitURL
{
  void *v2;
  double v3;
  double Helper_x8__OBJC_CLASS___NSSNewsViewController;
  uint64_t v5;
  id v6;

  +[DDNewsPreviewAction urlForURL:result:](DDNewsPreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v3);
  if (objc_msgSend(*(id *)(v5 + 1200), "canOpenURL:", v2, Helper_x8__OBJC_CLASS___NSSNewsViewController))
    v6 = v2;
  else
    v6 = 0;

  return v6;
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

- (id)menuActions
{
  void *v3;
  double v4;
  double Helper_x8__OBJC_CLASS___NSSNewsViewController;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  DDAddToReadingListAction *v14;
  void *v15;
  DDCopyAction *v16;
  void *v17;
  DDShareAction *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  DDShareAction *v25;
  DDCopyAction *v26;
  DDAddToReadingListAction *v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[DDNewsPreviewAction urlForURL:result:](DDNewsPreviewAction, "urlForURL:result:", self->super.super._url, self->super.super._result);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v4);
  if (objc_msgSend(*(id *)(v6 + 1200), "canOpenURL:", v3, Helper_x8__OBJC_CLASS___NSSNewsViewController))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v28 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v10);
    }

    if (+[DDAddToReadingListAction isAvailable](DDAddToReadingListAction, "isAvailable"))
    {
      v14 = -[DDAction initWithURL:result:context:]([DDAddToReadingListAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
      v27 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

    }
    v16 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", self->super.super._url, self->super.super._result, self->super.super._context);
    v26 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

    v18 = -[DDShareAction initWithURL:result:context:]([DDShareAction alloc], "initWithURL:result:context:", v3, self->super.super._result, self->super.super._context);
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
