@implementation SFUnifiedBarItemArrangement

- (SFUnifiedBarItemArrangement)init
{
  return -[SFUnifiedBarItemArrangement initWithLeadingItems:trailingItems:](self, "initWithLeadingItems:trailingItems:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (SFUnifiedBarItemArrangement)initWithLeadingItems:(id)a3 trailingItems:(id)a4
{
  id v6;
  id v7;
  SFUnifiedBarItemArrangement *v8;
  uint64_t v9;
  NSArray *leadingItems;
  uint64_t v11;
  NSArray *trailingItems;
  SFUnifiedBarItemArrangement *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarItemArrangement;
  v8 = -[SFUnifiedBarItemArrangement init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    leadingItems = v8->_leadingItems;
    v8->_leadingItems = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    trailingItems = v8->_trailingItems;
    v8->_trailingItems = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SFUnifiedBarItemArrangement *v4;
  SFUnifiedBarItemArrangement *v5;
  BOOL v6;

  v4 = (SFUnifiedBarItemArrangement *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSArray isEqualToArray:](self->_leadingItems, "isEqualToArray:", v5->_leadingItems))
        v6 = -[NSArray isEqualToArray:](self->_trailingItems, "isEqualToArray:", v5->_trailingItems);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)enumerateAllItemsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_leadingItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_trailingItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (BOOL)allowsCenteringInlineContentView
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SFUnifiedBarItemArrangement_allowsCenteringInlineContentView__block_invoke;
  v4[3] = &unk_1E21E6328;
  v4[4] = &v5;
  -[SFUnifiedBarItemArrangement enumerateAllItemsUsingBlock:](self, "enumerateAllItemsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __63__SFUnifiedBarItemArrangement_allowsCenteringInlineContentView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "spacingOptions");
  if ((result & 8) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

- (NSArray)leadingItems
{
  return self->_leadingItems;
}

- (NSArray)trailingItems
{
  return self->_trailingItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingItems, 0);
  objc_storeStrong((id *)&self->_leadingItems, 0);
}

@end
