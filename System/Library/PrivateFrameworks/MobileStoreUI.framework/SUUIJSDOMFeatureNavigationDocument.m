@implementation SUUIJSDOMFeatureNavigationDocument

- (SUUIJSDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v7;
  id v8;
  SUUIJSDOMFeatureNavigationDocument *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *featureName;
  NSMutableArray *v14;
  NSMutableArray *stackItems;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUUIJSDOMFeatureNavigationDocument;
  v9 = -[SUUIJSDOMFeatureNavigationDocument init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SUUIJSDOMFeatureNavigationDocument.m"), 30, CFSTR("Unexpectedly tried to initialize SUUIJSDOMFeatureNavigationDocument without an appContext."));

    }
    objc_msgSend(v7, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_appContext, v11);

    v12 = objc_msgSend(v8, "copy");
    featureName = v9->_featureName;
    v9->_featureName = (NSString *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    stackItems = v9->_stackItems;
    v9->_stackItems = v14;

  }
  return v9;
}

- (void)setNavigationDocumentController:(id)a3
{
  SUUINavigationDocumentController *v5;

  v5 = (SUUINavigationDocumentController *)a3;
  if (self->_navigationDocumentController != v5)
  {
    objc_storeStrong((id *)&self->_navigationDocumentController, a3);
    if (-[NSMutableArray count](self->_stackItems, "count"))
    {
      -[SUUINavigationDocumentController setStackItems:animated:](self->_navigationDocumentController, "setStackItems:animated:", self->_stackItems, 0);
      -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
    }
  }

}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE519C0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAppContext:navigationController:", v6, v4);

  return v7;
}

+ (id)possibleFeatureNames
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("leftNavigationDocument"), CFSTR("rightNavigationDocument"), 0);
}

- (void)clear
{
  SUUINavigationDocumentController *navigationDocumentController;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
    -[SUUINavigationDocumentController clear](navigationDocumentController, "clear");
  else
    -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
}

- (id)documents
{
  SUUINavigationDocumentController *navigationDocumentController;
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

  v17 = *MEMORY[0x24BDAC8D0];
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    -[SUUINavigationDocumentController documents](navigationDocumentController, "documents");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8;
  SUUINavigationDocumentController *navigationDocumentController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  SUUIDocumentStackItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a4;
  navigationDocumentController = self->_navigationDocumentController;
  v18 = v8;
  if (navigationDocumentController)
  {
    v10 = a5;
    v11 = a3;
    -[SUUINavigationDocumentController insertDocument:beforeDocument:options:](navigationDocumentController, "insertDocument:beforeDocument:options:", v11, v18, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __76__SUUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke;
    v19[3] = &unk_2511F4DB8;
    v20 = v8;
    v13 = a5;
    v14 = a3;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[SUUIDocumentStackItem initWithDocument:presentationOptions:]([SUUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v16, v15);

    v11 = v20;
  }

}

BOOL __76__SUUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  SUUINavigationDocumentController *navigationDocumentController;
  id v6;
  id v8;
  id v9;
  SUUIDocumentStackItem *v10;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    v6 = a4;
    v10 = (SUUIDocumentStackItem *)a3;
    -[SUUINavigationDocumentController pushDocument:options:](navigationDocumentController, "pushDocument:options:");

  }
  else
  {
    v8 = a4;
    v9 = a3;
    v10 = -[SUUIDocumentStackItem initWithDocument:presentationOptions:]([SUUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v9, v8);

    -[NSMutableArray addObject:](self->_stackItems, "addObject:", v10);
  }

}

- (void)popDocument
{
  SUUINavigationDocumentController *navigationDocumentController;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
    -[SUUINavigationDocumentController popDocument](navigationDocumentController, "popDocument");
  else
    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
}

- (void)popToDocument:(id)a3
{
  id v4;
  SUUINavigationDocumentController *navigationDocumentController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v8 = v4;
  if (navigationDocumentController)
  {
    -[SUUINavigationDocumentController popToDocument:](navigationDocumentController, "popToDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__SUUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke;
    v9[3] = &unk_2511F4DB8;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", v7, -[NSMutableArray count](self->_stackItems, "count") - v7);

  }
}

BOOL __52__SUUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke(uint64_t a1, void *a2)
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
  SUUINavigationDocumentController *navigationDocumentController;
  uint64_t v4;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    -[SUUINavigationDocumentController popToRootDocument](navigationDocumentController, "popToRootDocument");
  }
  else
  {
    v4 = -[NSMutableArray count](self->_stackItems, "count");
    if (v4 >= 2)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", 1, v4 - 1);
  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  SUUINavigationDocumentController *navigationDocumentController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  SUUIDocumentStackItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v18 = v8;
  if (navigationDocumentController)
  {
    v10 = a5;
    v11 = a4;
    -[SUUINavigationDocumentController replaceDocument:withDocument:options:](navigationDocumentController, "replaceDocument:withDocument:options:", v18, v11, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __75__SUUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke;
    v19[3] = &unk_2511F4DB8;
    v20 = v8;
    v13 = a5;
    v14 = a4;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[SUUIDocumentStackItem initWithDocument:presentationOptions:]([SUUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](v17, "replaceObjectAtIndex:withObject:", v15, v16);

    v11 = v20;
  }

}

BOOL __75__SUUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)removeDocument:(id)a3
{
  id v4;
  SUUINavigationDocumentController *navigationDocumentController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v8 = v4;
  if (navigationDocumentController)
  {
    -[SUUINavigationDocumentController removeDocument:](navigationDocumentController, "removeDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__SUUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke;
    v9[3] = &unk_2511F4DB8;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);

  }
}

BOOL __53__SUUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SUUINavigationDocumentController)navigationDocumentController
{
  return self->_navigationDocumentController;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_navigationDocumentController, 0);
  objc_destroyWeak((id *)&self->_jsNavigationDocument);
}

@end
