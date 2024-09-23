@implementation CNComposeRecipientGroup

- (CNComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4
{
  id v7;
  CNComposeRecipientGroup *v8;
  CNComposeRecipientGroup *v9;
  CNComposeRecipientGroup *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNComposeRecipientGroup;
  v8 = -[CNComposeRecipient initWithContact:address:displayString:kind:](&v12, sel_initWithContact_address_displayString_kind_, 0, 0, a4, 5);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_children, a3);
    v10 = v9;
  }

  return v9;
}

- (id)children
{
  return self->_children;
}

- (id)label
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_RECIPIENT"), &stru_1E62C0368, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)placeholderName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_RECIPIENT_PLACEHOLDER"), &stru_1E62C0368, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_populateSortedChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[CNComposeRecipient cachedSortedMembers](self, "cachedSortedMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNComposeRecipient originContext](self, "originContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTerm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNComposeRecipientGroup children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = 0;
    _sortedArrayByRelevancy(v5, v6, &v37, &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;
    v9 = v36;

    -[CNComposeRecipient setCachedSortedMembers:](self, "setCachedSortedMembers:", v7);
    -[CNComposeRecipient setCachedMatchedStrings:](self, "setCachedMatchedStrings:", v9);
    -[CNComposeRecipient setCachedCompleteMatches:](self, "setCachedCompleteMatches:", v8);
    -[CNComposeRecipient compositeName](self, "compositeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v25 = v9;
      v26 = v8;
      v27 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CA6AB8];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__CNComposeRecipientGroup__populateSortedChildren__block_invoke;
      v34[3] = &unk_1E62BF900;
      v14 = v12;
      v35 = v14;
      objc_msgSend(v13, "enumerateTokensForString:locale:options:withHandler:", v5, 0, 0, v34);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
            v29 = 0;
            -[CNComposeRecipient cachedMatchedStrings](self, "cachedMatchedStrings");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNComposeRecipient compositeName](self, "compositeName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            _getDisplayNameMatches(v22, v20, &v28, &v29);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNComposeRecipient setCachedMatchedStrings:](self, "setCachedMatchedStrings:", v24);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v17);
      }

      v8 = v26;
      v7 = v27;
      v9 = v25;
    }

  }
}

uint64_t __50__CNComposeRecipientGroup__populateSortedChildren__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)sortedChildren
{
  void *v3;

  -[CNComposeRecipient cachedSortedMembers](self, "cachedSortedMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
  return -[CNComposeRecipient cachedSortedMembers](self, "cachedSortedMembers");
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)showsChevronButton
{
  void *v2;
  BOOL v3;

  -[CNComposeRecipientGroup children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)address
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNComposeRecipientGroup children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNComposeRecipientGroup children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  CNAUILocalizedAddressSeparator();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)commentedAddress
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNComposeRecipientGroup address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipientGroup children](self, "children");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)wasCompleteMatch
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;

  -[CNComposeRecipient cachedCompleteMatches](self, "cachedCompleteMatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNComposeRecipient cachedCompleteMatches](self, "cachedCompleteMatches");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }
  else
  {
    -[CNComposeRecipient originContext](self, "originContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTerm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientGroup children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = _fastCountOfCompleteMatches(v6, v7, &v9);

  }
  return v5 != 0;
}

- (id)completelyMatchedAttributedStrings
{
  void *v3;

  -[CNComposeRecipient cachedMatchedStrings](self, "cachedMatchedStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
  return -[CNComposeRecipient cachedMatchedStrings](self, "cachedMatchedStrings");
}

- (id)childrenWithCompleteMatches
{
  void *v3;

  -[CNComposeRecipient cachedCompleteMatches](self, "cachedCompleteMatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
  return -[CNComposeRecipient cachedCompleteMatches](self, "cachedCompleteMatches");
}

- (void)addRecipientToPasteboard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNComposeRecipientGroup children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addRecipientToPasteboard:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
