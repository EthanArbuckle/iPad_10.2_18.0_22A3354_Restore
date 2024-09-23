@implementation IKAppMenuBarDocument

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  IKJSMenuBarDocument *v4;
  void *v5;
  IKJSMenuBarDocument *v6;

  v3 = a3;
  v4 = [IKJSMenuBarDocument alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  -[IKJSMenuBarDocument setAppBridge:](v6, "setAppBridge:", v3);
  return v6;
}

- (IKAppMenuBarDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  IKAppMenuBarDocument *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *jsDocumentsByEntityUniqueIdentifier;
  NSMutableDictionary *v12;
  NSMutableDictionary *documentsByEntityUniqueIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *documentOptionsByEntityUniqueIdentifier;
  uint64_t v16;
  NSString *featureName;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IKAppMenuBarDocument;
  v8 = -[IKAppMenuBarDocument init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    objc_storeWeak((id *)&v8->_parentDOMNode, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    jsDocumentsByEntityUniqueIdentifier = v8->_jsDocumentsByEntityUniqueIdentifier;
    v8->_jsDocumentsByEntityUniqueIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    documentsByEntityUniqueIdentifier = v8->_documentsByEntityUniqueIdentifier;
    v8->_documentsByEntityUniqueIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    documentOptionsByEntityUniqueIdentifier = v8->_documentOptionsByEntityUniqueIdentifier;
    v8->_documentOptionsByEntityUniqueIdentifier = v14;

    v16 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v16;

  }
  return v8;
}

- (void)migrateToViewElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSMutableDictionary *jsDocumentsByEntityUniqueIdentifier;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("menuBar")))
    v6 = v4;
  else
    v6 = 0;
  objc_storeWeak((id *)&self->_menuBarElement, v6);

  if (-[NSMutableDictionary count](self->_jsDocumentsByEntityUniqueIdentifier, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
    objc_msgSend(WeakRetained, "ownerDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    jsDocumentsByEntityUniqueIdentifier = self->_jsDocumentsByEntityUniqueIdentifier;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__IKAppMenuBarDocument_migrateToViewElement___block_invoke;
    v15[3] = &unk_1E9F4F310;
    v16 = v9;
    v11 = v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](jsDocumentsByEntityUniqueIdentifier, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  if (self->_selectedEntityUniqueIdentifier)
  {
    -[IKAppMenuBarDocument _menuItemElementForEntityUniqueIdentifier:](self, "_menuItemElementForEntityUniqueIdentifier:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14 = v12;
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v13, "menuBarDocument:didSelectMenuItem:animated:", self, v14, 0);

      v12 = v14;
    }

  }
}

uint64_t __45__IKAppMenuBarDocument_migrateToViewElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setNavigationDocument:", *(_QWORD *)(a1 + 32));
}

- (id)jsMenuBarDocument:(id)a3 documentForEntityUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__26;
  v18 = __Block_byref_object_dispose__26;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__IKAppMenuBarDocument_jsMenuBarDocument_documentForEntityUniqueIdentifier___block_invoke;
  v11[3] = &unk_1E9F4F338;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  -[IKAppMenuBarDocument _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __76__IKAppMenuBarDocument_jsMenuBarDocument_documentForEntityUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a3 + 24), "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)jsMenuBarDocument:(id)a3 setDocument:(id)a4 forEntityUniqueIdentifier:(id)a5 withOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v10)
  {
    objc_msgSend(v9, "jsDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
      objc_msgSend(WeakRetained, "ownerDocument");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationDocument");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNavigationDocument:", v15);

      -[NSMutableDictionary setObject:forKey:](self->_jsDocumentsByEntityUniqueIdentifier, "setObject:forKey:", v12, v10);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](self->_jsDocumentsByEntityUniqueIdentifier, "removeObjectForKey:", v10);
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__IKAppMenuBarDocument_jsMenuBarDocument_setDocument_forEntityUniqueIdentifier_withOptions___block_invoke;
    v16[3] = &unk_1E9F4F360;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    -[IKAppMenuBarDocument _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v16);

  }
}

void __92__IKAppMenuBarDocument_jsMenuBarDocument_setDocument_forEntityUniqueIdentifier_withOptions___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (void *)*((_QWORD *)v5 + 3);
  v7 = a1[4];
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKey:", v7, a1[5]);
    v8 = (void *)*((_QWORD *)v5 + 4);
    v9 = a1[6];
    if (v9)
    {
      objc_msgSend(v8, "setObject:forKey:", v9, a1[5]);
      goto LABEL_7;
    }
    v10 = a1[5];
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", a1[5]);
    v8 = (void *)*((_QWORD *)v5 + 4);
    v10 = a1[5];
  }
  objc_msgSend(v8, "removeObjectForKey:", v10);
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)v5 + 9);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)v5 + 8);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v5, "_menuItemElementForEntityUniqueIdentifier:", a1[5]),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "menuBarDocument:didReplaceDocumentForMenuItem:", v5, v13),
          !v13))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "menuBarDocument:didReplaceDocumentForEntityWithUniqueIdentifier:", v5, a1[5]);
      v13 = 0;
    }

  }
}

- (id)selectedItemForJsMenuBarDocument:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__26;
  v23 = __Block_byref_object_dispose__26;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__IKAppMenuBarDocument_selectedItemForJsMenuBarDocument___block_invoke;
  v18[3] = &unk_1E9F4F388;
  v18[4] = &v19;
  -[IKAppMenuBarDocument _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(WeakRetained, "childNodesAsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "getAttribute:", CFSTR("itmlID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v20[5]);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v6;
}

void __57__IKAppMenuBarDocument_selectedItemForJsMenuBarDocument___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a3 + 40));
}

- (void)jsMenuBarDocument:(id)a3 setSelectedEntityUniqueIdentifier:(id)a4 withOptions:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  IKAppMenuBarDocument *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__IKAppMenuBarDocument_jsMenuBarDocument_setSelectedEntityUniqueIdentifier_withOptions___block_invoke;
    v9[3] = &unk_1E9F4F360;
    v10 = v7;
    v11 = self;
    v12 = v8;
    -[IKAppMenuBarDocument _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v9);

  }
}

void __88__IKAppMenuBarDocument_jsMenuBarDocument_setSelectedEntityUniqueIdentifier_withOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  id *v11;

  v4 = a3;
  v5 = v4 + 5;
  v6 = *(id *)(a1 + 32);
  if (v4[5] != v6)
  {
    v11 = v4;
    objc_storeStrong(v4 + 5, v6);
    objc_msgSend(*(id *)(a1 + 40), "_menuItemElementForEntityUniqueIdentifier:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained(v11 + 8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("animated"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "menuBarDocument:didSelectMenuItem:animated:", v9, v7, objc_msgSend(v10, "BOOLValue"));

      }
    }

    v4 = v11;
  }

}

- (id)documentForMenuItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "itmlID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_documentsByEntityUniqueIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)documentOptionsForMenuItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "itmlID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_documentOptionsByEntityUniqueIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)documentForEntityUniqueIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_documentsByEntityUniqueIdentifier, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)documentOptionsForEntityUniqueIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_documentOptionsByEntityUniqueIdentifier, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_menuItemElementForEntityUniqueIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarElement);
  if (!WeakRetained)
  {
    v19 = 0;
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v39 = v6;
  if (!v39)
  {
    v19 = 0;
    goto LABEL_41;
  }
  v34 = WeakRetained;
  v35 = v4;
  objc_msgSend(WeakRetained, "children");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v8)
    goto LABEL_37;
  v9 = v8;
  v10 = *(_QWORD *)v45;
  v36 = *(_QWORD *)v45;
  v37 = v7;
LABEL_8:
  v11 = 0;
  v38 = v9;
  while (2)
  {
    if (*(_QWORD *)v45 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
    objc_msgSend(v12, "elementName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("menuItem")))
    {

LABEL_14:
      v16 = v12;
      objc_msgSend(v16, "itmlID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v39);

      if (v18)
      {
        v16 = v16;
        v19 = v16;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_34;
    }
    objc_msgSend(v12, "elementName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("searchMenuItem"));

    if (v15)
      goto LABEL_14;
    objc_msgSend(v12, "elementName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("section"));

    if (!v21)
      goto LABEL_35;
    objc_msgSend(v12, "children");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = v22;
    v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (!v23)
    {
      v19 = 0;
      goto LABEL_33;
    }
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v16);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v27, "elementName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("menuItem")))
        {

        }
        else
        {
          objc_msgSend(v27, "elementName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("searchMenuItem"));

          if (!v30)
            continue;
        }
        v19 = v27;
        objc_msgSend(v19, "itmlID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v39);

        if ((v32 & 1) != 0)
          goto LABEL_31;

      }
      v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v24);
    v19 = 0;
LABEL_31:
    v10 = v36;
    v7 = v37;
    v9 = v38;
LABEL_33:

LABEL_34:
    if (!v19)
    {
LABEL_35:
      if (++v11 != v9)
        continue;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (!v9)
      {
LABEL_37:
        v19 = 0;
        break;
      }
      goto LABEL_8;
    }
    break;
  }

  WeakRetained = v34;
  v4 = v35;
LABEL_41:

LABEL_42:
  return v19;
}

- (IKViewElement)selectedMenuItem
{
  void *v2;

  if (self->_selectedEntityUniqueIdentifier)
  {
    -[IKAppMenuBarDocument _menuItemElementForEntityUniqueIdentifier:](self, "_menuItemElementForEntityUniqueIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (IKViewElement *)v2;
}

- (void)setSelectedMenuItem:(id)a3
{
  NSCopying *v4;
  NSCopying **p_selectedEntityUniqueIdentifier;
  NSCopying *selectedEntityUniqueIdentifier;
  NSCopying *v7;

  objc_msgSend(a3, "itmlID");
  v4 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  selectedEntityUniqueIdentifier = self->_selectedEntityUniqueIdentifier;
  p_selectedEntityUniqueIdentifier = &self->_selectedEntityUniqueIdentifier;
  if (selectedEntityUniqueIdentifier != v4)
  {
    v7 = v4;
    objc_storeStrong((id *)p_selectedEntityUniqueIdentifier, v4);
    v4 = v7;
  }

}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IKAppMenuBarDocument appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__IKAppMenuBarDocument__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E9F4CA00;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__IKAppMenuBarDocument__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppMenuBarDocumentDelegate)delegate
{
  return (IKAppMenuBarDocumentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IKViewElement)menuBarElement
{
  return (IKViewElement *)objc_loadWeakRetained((id *)&self->_menuBarElement);
}

- (void)setMenuBarElement:(id)a3
{
  objc_storeWeak((id *)&self->_menuBarElement, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuBarElement);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_selectedEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_documentOptionsByEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_documentsByEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_jsDocumentsByEntityUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parentDOMNode);
}

@end
