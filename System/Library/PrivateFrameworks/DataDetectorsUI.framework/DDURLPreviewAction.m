@implementation DDURLPreviewAction

- (BOOL)showMenuTitle
{
  return 0;
}

- (id)menuActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  DDAddToReadingListAction *v12;
  void *v13;
  DDCopyAction *v14;
  void *v15;
  DDShareAction *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  DDShareAction *v24;
  DDCopyAction *v25;
  DDAddToReadingListAction *v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[DDAction result](self, "result")
    && (_DDURLFromResult((uint64_t)-[DDAction result](self, "result")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[DDURLPreviewAction validatedURLWithURL:result:](DDURLPreviewAction, "validatedURLWithURL:result:", v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = (void *)v4;
    +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v4, 0, self->super.super._context);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v27 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }

    if (+[DDAddToReadingListAction isAvailable](DDAddToReadingListAction, "isAvailable"))
    {
      v12 = -[DDAction initWithURL:result:context:]([DDAddToReadingListAction alloc], "initWithURL:result:context:", v19, 0, self->super.super._context);
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
    v14 = -[DDCopyAction initWithURL:result:context:]([DDCopyAction alloc], "initWithURL:result:context:", v3, 0, self->super.super._context);
    v25 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    v16 = -[DDShareAction initWithURL:result:context:]([DDShareAction alloc], "initWithURL:result:context:", v19, 0, self->super.super._context);
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)validatedURLWithURL:(id)a3 result:(__DDResult *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (a4)
  {
    DDShipmentTrackingUrlForResult();
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)v6;
LABEL_16:

      return v7;
    }
    v8 = (void *)DDResultCopyExtractedURL();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    v5 = (id)v9;
  }
  if (v5)
  {
    objc_msgSend(v5, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (((objc_msgSend(v11, "isEqualToString:", CFSTR("http")) & 1) != 0
       || objc_msgSend(v11, "isEqualToString:", CFSTR("https")))
      && (objc_msgSend(v5, "dd_isMaps:", 1) & 1) == 0)
    {
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }

    goto LABEL_16;
  }
  v7 = 0;
  return v7;
}

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  void *v4;
  int v5;

  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    v4 = 0;
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "validatedURLWithURL:result:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (applicationWithBundleIdentifierIsRestricted(CFSTR("com.apple.mobilesafari")) & 1) != 0)
    goto LABEL_6;
  v5 = objc_msgSend(v4, "dd_isCloudLink") ^ 1;
LABEL_7:

  return v5;
}

- (id)createViewController
{
  void *v3;
  UIViewController *viewController;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;

  +[DDURLPreviewAction validatedURLWithURL:result:](DDURLPreviewAction, "validatedURLWithURL:result:", self->super.super._url, self->super.super._result);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  viewController = self->super.super._viewController;
  if (!viewController)
  {
    v5 = (UIViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v3);
    v6 = self->super.super._viewController;
    self->super.super._viewController = v5;

    viewController = self->super.super._viewController;
  }
  v7 = viewController;

  return v7;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (void)setPreviewMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DDPreviewAction viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShowingLinkPreview:", v3);

}

- (id)commitURL
{
  return +[DDURLPreviewAction validatedURLWithURL:result:](DDURLPreviewAction, "validatedURLWithURL:result:", self->super.super._url, self->super.super._result);
}

@end
