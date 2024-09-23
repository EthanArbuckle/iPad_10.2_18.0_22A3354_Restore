@implementation MFComposeRecipientGroup

- (MFComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  MFComposeRecipientGroup *v9;
  MFComposeRecipientGroup *v10;
  MFComposeRecipientGroup *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFComposeRecipientGroup;
  v9 = -[MFComposeRecipient initWithContact:address:kind:](&v13, sel_initWithContact_address_kind_, 0, 0, 5);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_children, a3);
    objc_storeStrong((id *)&v10->super._displayString, a4);
    v11 = v10;
  }

  return v10;
}

- (id)displayString
{
  return self->super._displayString;
}

- (id)label
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_RECIPIENT"), &stru_1E5A6A588, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)compositeName
{
  return self->super._displayString;
}

- (id)placeholderName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_RECIPIENT_PLACEHOLDER"), &stru_1E5A6A588, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)children
{
  CNAutocompleteResult *autocompleteResult;
  void *v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *children;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t v21[128];
  uint8_t buf[16];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_children, "count"))
  {
    autocompleteResult = self->super._autocompleteResult;
    if (autocompleteResult)
    {
      v20 = 0;
      -[CNAutocompleteResult members:](autocompleteResult, "members:", &v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      if (v15)
      {
        MFLogGeneral();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v15, "ef_publicDescription");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFComposeRecipientGroup children].cold.1(v6, buf, v5);
        }

      }
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v4;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v17;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v17 != v10)
                objc_enumerationMutation(v8);
              +[MFComposeRecipient composeRecipientWithAutocompleteResult:](MFComposeRecipient, "composeRecipientWithAutocompleteResult:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                -[NSArray addObject:](v7, "addObject:", v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          }
          while (v9);
        }

        children = self->_children;
        self->_children = v7;

      }
    }
  }
  return self->_children;
}

- (void)_populateSortedChildren
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *cachedSortedMembers;
  NSArray *v9;
  NSArray *cachedMatchedStrings;
  NSArray *v11;
  NSArray *cachedCompleteMatches;
  id v13;
  id v14;
  id v15;

  if (!self->super._cachedSortedMembers)
  {
    -[MFComposeRecipient originContext](self, "originContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchTerm");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[MFComposeRecipientGroup children](self, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0;
    _sortedArrayByRelevancy(v13, v4, &v15, &v14);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)v15;
    v7 = (NSArray *)v14;

    cachedSortedMembers = self->super._cachedSortedMembers;
    self->super._cachedSortedMembers = v5;
    v9 = v5;

    cachedMatchedStrings = self->super._cachedMatchedStrings;
    self->super._cachedMatchedStrings = v7;
    v11 = v7;

    cachedCompleteMatches = self->super._cachedCompleteMatches;
    self->super._cachedCompleteMatches = v6;

  }
}

- (id)sortedChildren
{
  NSArray *cachedSortedMembers;

  cachedSortedMembers = self->super._cachedSortedMembers;
  if (!cachedSortedMembers)
  {
    -[MFComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
    cachedSortedMembers = self->super._cachedSortedMembers;
  }
  return cachedSortedMembers;
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)isRemovableFromSearchResults
{
  return 1;
}

- (int)property
{
  return -1;
}

- (void)record
{
  return 0;
}

- (int)recordID
{
  return -1;
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
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MFComposeRecipientGroup children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MFComposeRecipientGroup children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  MFLocalizedAddressSeparator();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)commentedAddress
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientGroup children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)wasCompleteMatch
{
  NSArray *cachedCompleteMatches;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  cachedCompleteMatches = self->super._cachedCompleteMatches;
  if (cachedCompleteMatches)
  {
    v4 = -[NSArray count](cachedCompleteMatches, "count");
  }
  else
  {
    -[MFComposeRecipient originContext](self, "originContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchTerm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientGroup children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v4 = _fastCountOfCompleteMatches(v6, v7, &v9);

  }
  return v4 != 0;
}

- (id)completelyMatchedAttributedStrings
{
  NSArray *cachedMatchedStrings;

  cachedMatchedStrings = self->super._cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    -[MFComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
    cachedMatchedStrings = self->super._cachedMatchedStrings;
  }
  return cachedMatchedStrings;
}

- (id)childrenWithCompleteMatches
{
  NSArray *cachedCompleteMatches;

  cachedCompleteMatches = self->super._cachedCompleteMatches;
  if (!cachedCompleteMatches)
  {
    -[MFComposeRecipientGroup _populateSortedChildren](self, "_populateSortedChildren");
    cachedCompleteMatches = self->super._cachedCompleteMatches;
  }
  return cachedCompleteMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

- (void)children
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Error fetching members for contact of type CNAutocompleteResultTypeGroup: %{public}@", buf, 0xCu);

}

@end
