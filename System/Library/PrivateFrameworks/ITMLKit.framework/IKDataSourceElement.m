@implementation IKDataSourceElement

+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("indexTitles")) & 1) != 0)
  {
    v11 = 3;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___IKDataSourceElement;
    v11 = (unint64_t)objc_msgSendSuper2(&v13, sel_updateTypeForChangeInAttribute_fromValue_toValue_, v8, v9, v10);
  }

  return v11;
}

- (IKDataSourceElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  IKDataSourceElement *v9;
  IKDataSourceElement *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __objc2_class **v15;
  void *v16;
  uint64_t v17;
  NSDictionary *indexTitles;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  objc_super v31;

  v8 = a5;
  v31.receiver = self;
  v31.super_class = (Class)IKDataSourceElement;
  v9 = -[IKViewElement initWithDOMElement:parent:elementFactory:](&v31, sel_initWithDOMElement_parent_elementFactory_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[IKViewElement bindingController](v9, "bindingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "binding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("items"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_areItemsBound = v14 != 0;

    if (v10->_areItemsBound)
      v15 = off_1E9F4AA18;
    else
      v15 = off_1E9F4AA20;
    v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithDataSourceElement:", v10);
    objc_storeStrong((id *)&v10->_impl, v16);

    v10->_implFlags.hasMasterPrototypes = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasProxiedItemElements = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasMasterPrototypeForItemAtIndex = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasResetImplicitUpdates = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasProxyElementForLoadedChildElement = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasCanProxyUnloadedChildElement = objc_opt_respondsToSelector() & 1;
    -[IKDataSourceElementImplementing initializeWithElementFactory:](v10->_impl, "initializeWithElementFactory:", v8);
    -[IKDataSourceElementImplementing indexTitles](v10->_impl, "indexTitles");
    v17 = objc_claimAutoreleasedReturnValue();
    indexTitles = v10->_indexTitles;
    v10->_indexTitles = (NSDictionary *)v17;

    if ((!-[IKViewElement updateType](v10, "updateType") || -[IKViewElement updateType](v10, "updateType") == 4)
      && !v10->_indexTitles)
    {
      -[IKViewElement attributes](v10, "attributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("indexTitles"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDataSourceElement _parsedIndexTitlesFromString:](v10, "_parsedIndexTitlesFromString:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v10->_indexTitles;
      v10->_indexTitles = (NSDictionary *)v21;

    }
    v10->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (-[IKViewElement updateType](v10, "updateType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKViewElement unfilteredChildren](v10, "unfilteredChildren");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __64__IKDataSourceElement_initWithDOMElement_parent_elementFactory___block_invoke;
      v29[3] = &unk_1E9F4D1A0;
      v25 = v23;
      v30 = v25;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v29);

      v26 = objc_msgSend(v25, "count");
      if (v26)
        v27 = (void *)objc_msgSend(v25, "copy");
      else
        v27 = 0;
      objc_storeStrong((id *)&v10->_autoHighlightedChildElements, v27);
      if (v26)

    }
  }

  return v10;
}

void __64__IKDataSourceElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "autoHighlightIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)dealloc
{
  objc_super v3;

  -[IKDataSourceElementImplementing teardown](self->_impl, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  -[IKViewElement dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDataSourceElement impl](self, "impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, impl = %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configureUpdatesWithElement:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IKDataSourceElement;
  -[IKViewElement configureUpdatesWithElement:](&v18, sel_configureUpdatesWithElement_, v4);
  v5 = -[IKViewElement updateType](self, "updateType");
  v6 = v4;
  if (-[IKDataSourceElement areItemsBound](self, "areItemsBound") && (objc_msgSend(v6, "areItemsBound") & 1) != 0
    || !-[IKDataSourceElement areItemsBound](self, "areItemsBound") && (objc_msgSend(v6, "areItemsBound") & 1) == 0)
  {
    -[IKDataSourceElement impl](self, "impl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "impl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureUpdatesWithImplementation:", v8);

  }
  if (v5 == 3)
  {
    -[IKDataSourceElement indexTitles](self, "indexTitles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v6, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("indexTitles"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKViewElement attributes](self, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("indexTitles"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v6, "indexTitles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDataSourceElement setIndexTitles:](self, "setIndexTitles:", v15);
      }
      else
      {
        -[IKViewElement attributes](self, "attributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("indexTitles"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDataSourceElement _parsedIndexTitlesFromString:](self, "_parsedIndexTitlesFromString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDataSourceElement setIndexTitles:](self, "setIndexTitles:", v17);

      }
    }
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  IKDataSourceElement *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v5 = objc_msgSend(v4, "updateType");
  v6 = v4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13;
  v35 = __Block_byref_object_dispose__13;
  v36 = 0;
  if (-[IKDataSourceElement areItemsBound](self, "areItemsBound") && (objc_msgSend(v6, "areItemsBound") & 1) != 0
    || !-[IKDataSourceElement areItemsBound](self, "areItemsBound") && (objc_msgSend(v6, "areItemsBound") & 1) == 0)
  {
    -[IKDataSourceElement impl](self, "impl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "impl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke;
    v27[3] = &unk_1E9F4D1C8;
    v30 = &v31;
    v28 = v6;
    v29 = self;
    objc_msgSend(v9, "applyUpdatesWithImplementation:usingUpdater:", v10, v27);

    v8 = v28;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)IKDataSourceElement;
    -[IKViewElement applyUpdatesWithElement:](&v26, sel_applyUpdatesWithElement_, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v32[5];
    v32[5] = v7;
  }

  if (v5 == 3)
  {
    objc_msgSend(v6, "indexTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDataSourceElement setIndexTitles:](self, "setIndexTitles:", v11);

    self->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  self->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 4)
  {
    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKViewElement unfilteredChildren](self, "unfilteredChildren");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke_2;
      v24 = &unk_1E9F4D1A0;
      v14 = v12;
      v25 = v14;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v21);

      v15 = objc_msgSend(v14, "count", v21, v22, v23, v24);
      if (v15)
        v16 = (void *)objc_msgSend(v14, "copy");
      else
        v16 = 0;
      objc_storeStrong((id *)&self->_autoHighlightedChildElements, v16);
      if (v15)

      goto LABEL_21;
    }
LABEL_13:
    objc_msgSend(v6, "autoHighlightedChildElements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "autoHighlightedChildElements");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[IKDataSourceElement setAutoHighlightedChildElements:](self, "setAutoHighlightedChildElements:", v14);
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  objc_msgSend(v6, "autoHighlightedChildElements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[IKDataSourceElement autoHighlightedChildElements](self, "autoHighlightedChildElements");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoHighlightedChildElements:", v14);
    goto LABEL_21;
  }
LABEL_22:
  v19 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v19;
}

id __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)IKDataSourceElement;
  objc_msgSendSuper2(&v7, sel_applyUpdatesWithElement_, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return v3;
}

void __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "autoHighlightIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)resetProperty:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    -[IKDataSourceElement setAutoHighlightIndex:](self, "setAutoHighlightIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[IKDataSourceElement autoHighlightedChildElements](self, "autoHighlightedChildElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "resetProperty:", 2);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[IKDataSourceElement setAutoHighlightedChildElements:](self, "setAutoHighlightedChildElements:", 0);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IKDataSourceElement;
    -[IKViewElement resetProperty:](&v9, sel_resetProperty_);
  }
}

- (NSArray)prototypes
{
  void *v2;
  void *v3;

  -[IKDataSourceElement impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prototypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (IKChangeSet)itemsChangeSet
{
  void *v2;
  void *v3;

  -[IKDataSourceElement impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemsChangeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKChangeSet *)v3;
}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[IKDataSourceElement impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems");

  return v3;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[IKDataSourceElement impl](self, "impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prototypeForItemAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[IKDataSourceElement impl](self, "impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementForItemAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfItemForElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[IKDataSourceElement impl](self, "impl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfItemForElement:", v4);

  return v6;
}

- (void)loadIndex:(int64_t)a3
{
  id v4;

  -[IKDataSourceElement impl](self, "impl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadIndex:", a3);

}

- (void)unloadIndex:(int64_t)a3
{
  id v4;

  -[IKDataSourceElement impl](self, "impl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unloadIndex:", a3);

}

- (int64_t)autoHighlightIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_autoHighlightIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[IKDataSourceElement autoHighlightedChildElements](self, "autoHighlightedChildElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[IKDataSourceElement autoHighlightedChildElements](self, "autoHighlightedChildElements", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            -[IKDataSourceElement impl](self, "impl");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "indexOfItemForElement:", v9);

            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              self->_autoHighlightIndex = v11;
              goto LABEL_13;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_13:

      if (self->_autoHighlightIndex == 0x7FFFFFFFFFFFFFFFLL)
        -[IKDataSourceElement setAutoHighlightedChildElements:](self, "setAutoHighlightedChildElements:", 0);
    }
  }
  return self->_autoHighlightIndex;
}

- (NSArray)masterPrototypes
{
  void *v2;

  if (self->_implFlags.hasMasterPrototypes)
  {
    -[IKDataSourceElementImplementing masterPrototypes](self->_impl, "masterPrototypes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)proxiedItemElements
{
  void *v2;

  if (self->_implFlags.hasProxiedItemElements)
  {
    -[IKDataSourceElementImplementing proxiedItemElements](self->_impl, "proxiedItemElements");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (id)masterPrototypeForItemAtIndex:(unint64_t)a3
{
  void *v3;

  if (self->_implFlags.hasMasterPrototypeForItemAtIndex)
  {
    -[IKDataSourceElementImplementing masterPrototypeForItemAtIndex:](self->_impl, "masterPrototypeForItemAtIndex:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)resetUpdates
{
  objc_super v3;

  -[IKDataSourceElementImplementing resetUpdates](self->_impl, "resetUpdates");
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  -[IKViewElement resetUpdates](&v3, sel_resetUpdates);
}

- (void)resetImplicitUpdates
{
  objc_super v3;

  if (self->_implFlags.hasResetImplicitUpdates)
    -[IKDataSourceElementImplementing resetImplicitUpdates](self->_impl, "resetImplicitUpdates");
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  -[IKViewElement resetImplicitUpdates](&v3, sel_resetImplicitUpdates);
}

- (void)appDocumentDidMarkStylesDirty
{
  void *v3;
  _QWORD v4[5];

  -[IKDataSourceElement impl](self, "impl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__IKDataSourceElement_appDocumentDidMarkStylesDirty__block_invoke;
  v4[3] = &unk_1E9F4BD18;
  v4[4] = self;
  objc_msgSend(v3, "updateStylesUsingUpdater:", v4);

}

id __52__IKDataSourceElement_appDocumentDidMarkStylesDirty__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)IKDataSourceElement;
  return objc_msgSendSuper2(&v2, sel_appDocumentDidMarkStylesDirty);
}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  void *v3;

  if (self->_implFlags.hasProxyElementForLoadedChildElement)
  {
    -[IKDataSourceElementImplementing proxyElementForLoadedChildElement:](self->_impl, "proxyElementForLoadedChildElement:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  if (self->_implFlags.hasCanProxyUnloadedChildElement)
    return -[IKDataSourceElementImplementing canProxyUnloadedChildElement:](self->_impl, "canProxyUnloadedChildElement:", a3);
  else
    return 0;
}

- (BOOL)areItemsBound
{
  return self->_areItemsBound;
}

- (id)_parsedIndexTitlesFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  id v24;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v11 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v7);

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v8);

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isAtEnd") & 1) == 0)
  {
    v12 = 0;
    v10 = 0;
    while (1)
    {
      if (v12 <= 1)
        v12 = 1;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v9, "scanCharactersFromSet:intoString:", v13, &v24);
      v14 = v24;

      if (v14)
        goto LABEL_19;
      if (v12 == 2)
      {
        v22 = 0;
        objc_msgSend(v9, "scanCharactersFromSet:intoString:", v5, &v22);
        v17 = v22;
        v14 = v17;
        if (v17)
        {
          v18 = objc_msgSend(v17, "integerValue");
          if ((objc_msgSend(v4, "containsIndex:", v18) & 1) == 0)
          {
            objc_msgSend(v4, "addIndex:", v18);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, v19);

          }
          v16 = 0;
          v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        v23 = 0;
        objc_msgSend(v9, "scanCharactersFromSet:intoString:", v6, &v23);
        v15 = v23;
        if (v15)
        {
          v16 = v15;
          v12 = 2;
          v14 = v16;
LABEL_16:

          v10 = v16;
          goto LABEL_19;
        }
        v14 = 0;
      }
      v12 = 3;
LABEL_19:

      if ((objc_msgSend(v9, "isAtEnd") & 1) != 0 || v12 == 3)
        goto LABEL_21;
    }
  }
  v10 = 0;
LABEL_21:
  if (objc_msgSend(v21, "count"))
    v11 = (void *)objc_msgSend(v21, "copy");
  else
    v11 = 0;

LABEL_25:
  return v11;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void)setIndexTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setAutoHighlightIndex:(int64_t)a3
{
  self->_autoHighlightIndex = a3;
}

- (NSArray)autoHighlightedChildElements
{
  return self->_autoHighlightedChildElements;
}

- (void)setAutoHighlightedChildElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (IKDataSourceElementImplementing)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_autoHighlightedChildElements, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
}

- (id)firstItemElement
{
  void *v3;

  if (-[IKDataSourceElement numberOfItems](self, "numberOfItems") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[IKDataSourceElement elementForItemAtIndex:](self, "elementForItemAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)lastItemElement
{
  uint64_t v3;
  void *v4;

  v3 = -[IKDataSourceElement numberOfItems](self, "numberOfItems");
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    -[IKDataSourceElement elementForItemAtIndex:](self, "elementForItemAtIndex:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)enumerateItemElementsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  v9 = 0;
  v5 = -[IKDataSourceElement numberOfItems](self, "numberOfItems");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 1;
    do
    {
      -[IKDataSourceElement elementForItemAtIndex:](self, "elementForItemAtIndex:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v7 - 1, &v9);

      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v9);
  }

}

@end
