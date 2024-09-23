@implementation IKSectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  NSArray *items;
  id v5;
  void *v6;
  objc_super v8;

  items = self->_items;
  self->_items = 0;
  v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKSectionElement;
  -[IKDataSourceElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKHeaderElement)header
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKViewElement children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "elementName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("header"));

        if (v9)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return (IKHeaderElement *)v10;
}

- (NSArray)items
{
  NSArray *items;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  items = self->_items;
  if (!items)
  {
    -[IKSectionElement unboundItemElements](self, "unboundItemElements");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_items;
    self->_items = v4;

    items = self->_items;
  }
  v6 = -[NSArray count](items, "count");
  if (v6)
    v6 = self->_items;
  return v6;
}

- (IKViewElement)footer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKViewElement children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "elementName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("footer"));

        if (v9)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return (IKViewElement *)v10;
}

- (void)appDocumentDidMarkStylesDirty
{
  NSArray *items;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKSectionElement;
  -[IKDataSourceElement appDocumentDidMarkStylesDirty](&v4, sel_appDocumentDidMarkStylesDirty);
  if (-[IKViewElement updateType](self, "updateType") >= 3)
  {
    items = self->_items;
    self->_items = 0;

  }
}

- (id)unboundItemElements
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__IKSectionElement_unboundItemElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "elementName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("header")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "elementName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("footer")) ^ 1;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
