@implementation IKJSNavigationDocument

- (IKJSNavigationDocument)initWithAppContext:(id)a3 navigationController:(id)a4
{
  id v6;
  IKJSNavigationDocument *v7;
  IKJSNavigationDocument *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IKJSNavigationDocument;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_navigationControllerDelegate, v6);
    v8->_delegateSelectors.hasClear = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasSetDocuments = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasPresentModal = objc_opt_respondsToSelector() & 1;
    v8->_delegateSelectors.hasDismissModal = objc_opt_respondsToSelector() & 1;
  }

  return v8;
}

- (NSArray)documents
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__IKJSNavigationDocument_documents__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  objc_msgSend((id)v8[5], "valueForKey:", CFSTR("jsDocument"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__IKJSNavigationDocument_documents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documents");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDocuments:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_delegateSelectors.hasSetDocuments)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          -[IKJSNavigationDocument _makeAppDocumentWithDocument:](self, "_makeAppDocumentWithDocument:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    -[IKJSObject appContext](self, "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__IKJSNavigationDocument_setDocuments::__block_invoke;
    v17[3] = &unk_1E9F4C430;
    v17[4] = self;
    v18 = v8;
    v19 = v7;
    v16 = v8;
    objc_msgSend(v15, "evaluateDelegateBlockSync:", v17);

  }
}

void __40__IKJSNavigationDocument_setDocuments::__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDocuments:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)pushDocument:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  objc_msgSend(v7, "objectForKey:", CFSTR("TransitionOptionRetainContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    -[IKJSNavigationDocument documents](self, "documents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:](self, "_migrateMediaControllerFromDocument:toDocument:", v11, v6);

  }
  -[IKJSNavigationDocument _makeAppDocumentWithDocument:](self, "_makeAppDocumentWithDocument:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__IKJSNavigationDocument_pushDocument::__block_invoke;
  v16[3] = &unk_1E9F4C430;
  v16[4] = self;
  v17 = v12;
  v18 = v7;
  v14 = v7;
  v15 = v12;
  objc_msgSend(v13, "evaluateDelegateBlockSync:", v16);

}

void __40__IKJSNavigationDocument_pushDocument::__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushDocument:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)presentModal:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_delegateSelectors.hasPresentModal)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("TransitionOptionRetainContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      -[IKJSNavigationDocument documents](self, "documents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:](self, "_migrateMediaControllerFromDocument:toDocument:", v12, v6);

    }
    -[IKJSNavigationDocument _makeAppDocumentWithDocument:](self, "_makeAppDocumentWithDocument:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__IKJSNavigationDocument_presentModal::__block_invoke;
    v16[3] = &unk_1E9F4C430;
    v16[4] = self;
    v17 = v13;
    v18 = v8;
    v15 = v13;
    objc_msgSend(v14, "evaluateDelegateBlockSync:", v16);

  }
}

void __40__IKJSNavigationDocument_presentModal::__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentModal:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)dismissModal
{
  void *v3;
  _QWORD v4[5];

  if (self->_delegateSelectors.hasDismissModal)
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__IKJSNavigationDocument_dismissModal__block_invoke;
    v4[3] = &unk_1E9F4C390;
    v4[4] = self;
    objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

  }
}

void __38__IKJSNavigationDocument_dismissModal__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissModal");

}

- (void)insertBeforeDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("TransitionOptionRetainContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:](self, "_migrateMediaControllerFromDocument:toDocument:", v9, v8);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__25;
    v27 = __Block_byref_object_dispose__25;
    v28 = 0;
    -[IKJSNavigationDocument _makeAppDocumentWithDocument:](self, "_makeAppDocumentWithDocument:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__IKJSNavigationDocument_insertBeforeDocument_::__block_invoke;
    v18[3] = &unk_1E9F4F180;
    v18[4] = self;
    v19 = v9;
    v16 = v14;
    v20 = v16;
    v21 = v11;
    v22 = &v23;
    objc_msgSend(v15, "evaluateDelegateBlockSync:", v18);

    if (objc_msgSend((id)v24[5], "length"))
    {
      -[IKJSObject appContext](self, "appContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setException:withErrorMessage:", 0, v24[5]);

    }
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    -[IKJSNavigationDocument pushDocument::](self, "pushDocument::", v8, v10);
  }

}

void __49__IKJSNavigationDocument_insertBeforeDocument_::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "jsDocument", (_QWORD)v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertDocument:beforeDocument:options:", *(_QWORD *)(a1 + 48), v12, *(_QWORD *)(a1 + 56));

  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(id *)(v14 + 40);
    *(_QWORD *)(v14 + 40) = CFSTR("Before document not found on stack");
  }

}

- (void)replaceDocument:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  __CFString *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__25;
  v26 = __Block_byref_object_dispose__25;
  v27 = 0;
  if (v8 && v9)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("TransitionOptionRetainContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:](self, "_migrateMediaControllerFromDocument:toDocument:", v9, v8);
    -[IKJSNavigationDocument _makeAppDocumentWithDocument:](self, "_makeAppDocumentWithDocument:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__IKJSNavigationDocument_replaceDocument_::__block_invoke;
    v17[3] = &unk_1E9F4F180;
    v17[4] = self;
    v18 = v9;
    v15 = v13;
    v19 = v15;
    v20 = v10;
    v21 = &v22;
    objc_msgSend(v14, "evaluateDelegateBlockSync:", v17);

  }
  else
  {
    v15 = 0;
    v27 = CFSTR("Invalid arguments");
  }

  if (objc_msgSend((id)v23[5], "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setException:withErrorMessage:", 0, v23[5]);

  }
  _Block_object_dispose(&v22, 8);

}

void __44__IKJSNavigationDocument_replaceDocument_::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "jsDocument", (_QWORD)v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceDocument:withDocument:options:", v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(id *)(v14 + 40);
    *(_QWORD *)(v14 + 40) = CFSTR("Document not found on stack");
  }

}

- (void)popDocument
{
  void *v3;
  _QWORD v4[5];

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__IKJSNavigationDocument_popDocument__block_invoke;
  v4[3] = &unk_1E9F4C390;
  v4[4] = self;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

}

void __37__IKJSNavigationDocument_popDocument__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "popDocument");

}

- (void)popToDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__IKJSNavigationDocument_popToDocument___block_invoke;
  v7[3] = &unk_1E9F4BA30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

}

void __40__IKJSNavigationDocument_popToDocument___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "jsDocument", (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        v6 = v4;
        goto LABEL_12;
      }
    }
    v6 = v10;

    if (!v6)
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "popToDocument:", v6);

  }
LABEL_12:

LABEL_13:
}

- (void)popToRootDocument
{
  void *v3;
  _QWORD v4[5];

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__IKJSNavigationDocument_popToRootDocument__block_invoke;
  v4[3] = &unk_1E9F4C390;
  v4[4] = self;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

}

void __43__IKJSNavigationDocument_popToRootDocument__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "popToRootDocument");

}

- (void)removeDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__25;
  v15 = __Block_byref_object_dispose__25;
  v16 = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__IKJSNavigationDocument_removeDocument___block_invoke;
  v8[3] = &unk_1E9F4DFC0;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v8);

  if (objc_msgSend((id)v12[5], "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setException:withErrorMessage:", 0, v12[5]);

  }
  _Block_object_dispose(&v11, 8);

}

void __41__IKJSNavigationDocument_removeDocument___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "jsDocument", (_QWORD)v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeDocument:", v12);

  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(id *)(v14 + 40);
    *(_QWORD *)(v14 + 40) = CFSTR("Document not found on stack");
  }

}

- (void)clear
{
  void *v3;
  _QWORD v4[5];

  if (self->_delegateSelectors.hasClear)
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __31__IKJSNavigationDocument_clear__block_invoke;
    v4[3] = &unk_1E9F4C390;
    v4[4] = self;
    objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

  }
}

void __31__IKJSNavigationDocument_clear__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationControllerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clear");

}

- (id)_makeAppDocumentWithDocument:(id)a3
{
  id v4;
  IKAppDocument *v5;
  void *v6;
  IKAppDocument *v7;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setNavigationDocument:", self);
    v5 = [IKAppDocument alloc];
    -[IKJSObject appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IKAppDocument initWithAppContext:document:owner:](v5, "initWithAppContext:document:owner:", v6, v4, self);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_migrateMediaControllerFromDocument:(id)a3 toDocument:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("//*[substring(name(), string-length(name()) - string-length('%@') +1) = '%@']/background/mediaContent"), CFSTR("Template"), CFSTR("Template"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "nodesForXPath:error:", v7, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  if (v8)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = v5;
  }
  else
  {
    ITMLKitGetLogObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:].cold.2((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    v10 = 0;
  }
  v30 = v9;
  objc_msgSend(v6, "nodesForXPath:error:", v7, &v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v30;

  if (v18)
  {
    objc_msgSend(v18, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v20 != 0;
    if (v10 && v20)
      goto LABEL_17;
  }
  else
  {
    ITMLKitGetLogObject(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[IKJSNavigationDocument _migrateMediaControllerFromDocument:toDocument:].cold.1((uint64_t)v19, v23, v24, v25, v26, v27, v28, v29);

    v22 = 0;
    v21 = 0;
  }
  if (v10 && !v22)
  {
    v20 = v6;
LABEL_17:
    objc_msgSend(v20, "adoptFeatureWithName:fromDOMNode:", CFSTR("Player"), v10);
  }

}

- (NSString)OPTION_RETAIN_CONTEXT
{
  return (NSString *)CFSTR("TransitionOptionRetainContext");
}

- (IKAppNavigationController)navigationControllerDelegate
{
  return (IKAppNavigationController *)objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
}

- (void)_migrateMediaControllerFromDocument:(uint64_t)a3 toDocument:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, a2, a3, "Unable to get targetNodes: %@", a5, a6, a7, a8, 2u);
}

- (void)_migrateMediaControllerFromDocument:(uint64_t)a3 toDocument:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_1D95F2000, a2, a3, "Unable to get sourceNodes: %@", a5, a6, a7, a8, 2u);
}

@end
