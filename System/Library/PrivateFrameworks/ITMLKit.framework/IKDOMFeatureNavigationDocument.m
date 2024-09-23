@implementation IKDOMFeatureNavigationDocument

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  IKJSNavigationDocument *v4;
  void *v5;
  IKJSNavigationDocument *v6;

  v3 = a3;
  v4 = [IKJSNavigationDocument alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSNavigationDocument initWithAppContext:navigationController:](v4, "initWithAppContext:navigationController:", v5, v3);

  return v6;
}

- (IKDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  IKDOMFeatureNavigationDocument *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  NSMutableArray *v12;
  NSMutableArray *stackItems;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKDOMFeatureNavigationDocument;
  v8 = -[IKDOMFeatureNavigationDocument init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackItems = v8->_stackItems;
    v8->_stackItems = v12;

  }
  return v8;
}

- (void)setNavigationController:(id)a3
{
  IKAppNavigationController *v5;
  IKAppNavigationController **p_appNavigationController;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  IKAppNavigationController *v15;
  void *v16;
  void *v17;
  IKDOMFeatureNavigationDocument *v18;
  IKAppNavigationController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (IKAppNavigationController *)a3;
  p_appNavigationController = &self->_appNavigationController;
  if (self->_appNavigationController != v5)
  {
    objc_storeStrong((id *)&self->_appNavigationController, a3);
    if (-[NSMutableArray count](self->_stackItems, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[NSMutableArray reverseObjectEnumerator](self->_stackItems, "reverseObjectEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v18 = self;
        v19 = v5;
        v10 = 0;
        v11 = *(_QWORD *)v21;
        do
        {
          v12 = 0;
          v13 = v10;
          do
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
            v15 = *p_appNavigationController;
            objc_msgSend(v14, "document", v18, v19);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "options");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              -[IKAppNavigationController insertDocument:beforeDocument:options:](v15, "insertDocument:beforeDocument:options:", v16, v13, v17);
            else
              -[IKAppNavigationController pushDocument:options:](v15, "pushDocument:options:", v16, v17);

            objc_msgSend(v14, "document");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            ++v12;
            v13 = v10;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);

        self = v18;
        v5 = v19;
      }

      -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
    }
  }

}

- (void)pushDocument:(id)a3 options:(id)a4
{
  IKAppNavigationController *appNavigationController;
  id v6;
  id v8;
  id v9;
  IKNavigationItem *v10;

  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    v6 = a4;
    v10 = (IKNavigationItem *)a3;
    -[IKAppNavigationController pushDocument:options:](appNavigationController, "pushDocument:options:");

  }
  else
  {
    v8 = a4;
    v9 = a3;
    v10 = -[IKNavigationItem initWithDocument:presentationOptions:]([IKNavigationItem alloc], "initWithDocument:presentationOptions:", v9, v8);

    -[NSMutableArray addObject:](self->_stackItems, "addObject:", v10);
  }

}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8;
  IKAppNavigationController *appNavigationController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  IKNavigationItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a4;
  appNavigationController = self->_appNavigationController;
  v18 = v8;
  if (appNavigationController)
  {
    v10 = a5;
    v11 = a3;
    -[IKAppNavigationController insertDocument:beforeDocument:options:](appNavigationController, "insertDocument:beforeDocument:options:", v11, v18, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__IKDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke;
    v19[3] = &unk_1E9F4BBF0;
    v20 = v8;
    v13 = a5;
    v14 = a3;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[IKNavigationItem initWithDocument:presentationOptions:]([IKNavigationItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v16, v15);

    v11 = v20;
  }

}

BOOL __72__IKDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  IKAppNavigationController *appNavigationController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  IKNavigationItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  appNavigationController = self->_appNavigationController;
  v18 = v8;
  if (appNavigationController)
  {
    v10 = a5;
    v11 = a4;
    -[IKAppNavigationController replaceDocument:withDocument:options:](appNavigationController, "replaceDocument:withDocument:options:", v18, v11, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__IKDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke;
    v19[3] = &unk_1E9F4BBF0;
    v20 = v8;
    v13 = a5;
    v14 = a4;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[IKNavigationItem initWithDocument:presentationOptions:]([IKNavigationItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](v17, "replaceObjectAtIndex:withObject:", v15, v16);

    v11 = v20;
  }

}

BOOL __71__IKDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popDocument
{
  IKAppNavigationController *appNavigationController;

  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
    -[IKAppNavigationController popDocument](appNavigationController, "popDocument");
  else
    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
}

- (void)popToDocument:(id)a3
{
  id v4;
  IKAppNavigationController *appNavigationController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  appNavigationController = self->_appNavigationController;
  v8 = v4;
  if (appNavigationController)
  {
    -[IKAppNavigationController popToDocument:](appNavigationController, "popToDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__IKDOMFeatureNavigationDocument_popToDocument___block_invoke;
    v9[3] = &unk_1E9F4BBF0;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", v7, -[NSMutableArray count](self->_stackItems, "count") - v7);

  }
}

BOOL __48__IKDOMFeatureNavigationDocument_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popToRootDocument
{
  IKAppNavigationController *appNavigationController;
  uint64_t v4;

  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    -[IKAppNavigationController popToRootDocument](appNavigationController, "popToRootDocument");
  }
  else
  {
    v4 = -[NSMutableArray count](self->_stackItems, "count");
    if (v4 >= 2)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", 1, v4 - 1);
  }
}

- (void)removeDocument:(id)a3
{
  id v4;
  IKAppNavigationController *appNavigationController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  appNavigationController = self->_appNavigationController;
  v8 = v4;
  if (appNavigationController)
  {
    -[IKAppNavigationController removeDocument:](appNavigationController, "removeDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__IKDOMFeatureNavigationDocument_removeDocument___block_invoke;
    v9[3] = &unk_1E9F4BBF0;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);

  }
}

BOOL __49__IKDOMFeatureNavigationDocument_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)documents
{
  IKAppNavigationController *appNavigationController;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    -[IKAppNavigationController documents](appNavigationController, "documents");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_stackItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "document", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    return v5;
  }
}

- (void)clear
{
  IKAppNavigationController *appNavigationController;

  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
    -[IKAppNavigationController clear](appNavigationController, "clear");
  else
    -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKAppNavigationController)navigationController
{
  return self->_navigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_appNavigationController, 0);
}

@end
