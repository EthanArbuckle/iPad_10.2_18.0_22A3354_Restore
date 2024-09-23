@implementation _GEOPlaceSearchCompletionGroup

- (_GEOPlaceSearchCompletionGroup)initWithSection:(id)a3 traits:(id)a4 entryListIndex:(int)a5 mapItems:(id)a6 collections:(id)a7 publishers:(id)a8
{
  uint64_t v11;
  id *v14;
  _GEOPlaceSearchCompletionGroup *v15;
  _GEOPlaceSearchCompletionGroup *v16;
  _GEOPlaceSearchCompletionGroup *v17;
  void *v18;
  uint64_t v19;
  NSString *localizedSectionHeader;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  _GEOPlaceSearchCompletionItem *v28;
  id v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *includedClientResultTypes;
  id v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *excludedClientResultTypes;
  _GEOPlaceSearchCompletionGroup *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v11 = *(_QWORD *)&a5;
  v54 = *MEMORY[0x1E0C80C00];
  v14 = (id *)a3;
  v47 = a4;
  v46 = a6;
  v45 = a7;
  v44 = a8;
  v52.receiver = self;
  v52.super_class = (Class)_GEOPlaceSearchCompletionGroup;
  v15 = -[_GEOPlaceSearchCompletionGroup init](&v52, sel_init);
  v16 = v15;
  v17 = 0;
  if (v14 && v15)
  {
    -[GEOPDAutocompleteResultSection name](v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    localizedSectionHeader = v16->_localizedSectionHeader;
    v42 = v16;
    v16->_localizedSectionHeader = (NSString *)v19;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v43 = (uint64_t)v14;
    -[GEOPDAutocompleteResultSection entries](v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = 0;
      v26 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v21);
          v28 = -[_GEOPlaceSearchCompletionItem initWithEntry:traits:entryListIndex:entryIndex:mapItems:collections:publishers:]([_GEOPlaceSearchCompletionItem alloc], "initWithEntry:traits:entryListIndex:entryIndex:mapItems:collections:publishers:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v47, v11, v24 + i, v46, v45, v44);
          if (v28)
          {
            if (!v25)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v25, "addObject:", v28);
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        v24 = (v24 + i);
      }
      while (v23);
    }
    else
    {
      v25 = 0;
    }

    v16 = v42;
    if (objc_msgSend(v25, "count"))
      objc_storeStrong((id *)&v42->_items, v25);
    v14 = (id *)v43;
    v42->_shouldInterleaveClientResults = *(_BYTE *)(v43 + 143);
    v42->_enforceServerResultsOrder = *(_BYTE *)(v43 + 141);
    v42->_enableMapsSuggestServerReranking = *(_BYTE *)(v43 + 140);
    v42->_isSectionForClientOnlyResults = *(_BYTE *)(v43 + 142);
    v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
    v30 = (void *)objc_msgSend(v29, "initWithCapacity:", *(_QWORD *)(v43 + 80));
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
    if (*(_QWORD *)(v43 + 80))
    {
      v31 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEOPDAutocompleteResultSection includedClientResultTypeAtIndex:](v43, v31));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v32);

        ++v31;
        -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](v43);
      }
      while (v31 < *(_QWORD *)(v43 + 80));
    }
    if (objc_msgSend(v30, "count"))
    {
      v33 = objc_msgSend(v30, "copy");
      includedClientResultTypes = v42->_includedClientResultTypes;
      v42->_includedClientResultTypes = (NSArray *)v33;

    }
    v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
    v36 = (void *)objc_msgSend(v35, "initWithCapacity:", *(_QWORD *)(v43 + 56));
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
    if (*(_QWORD *)(v43 + 56))
    {
      v37 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEOPDAutocompleteResultSection excludedClientResultTypeAtIndex:](v43, v37));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v38);

        ++v37;
        -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](v43);
      }
      while (v37 < *(_QWORD *)(v43 + 56));
    }
    if (objc_msgSend(v36, "count"))
    {
      v39 = objc_msgSend(v36, "copy");
      excludedClientResultTypes = v42->_excludedClientResultTypes;
      v42->_excludedClientResultTypes = (NSArray *)v39;

    }
    v17 = v42;

  }
  return v17;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)localizedSectionHeader
{
  return self->_localizedSectionHeader;
}

- (BOOL)shouldInterleaveClientResults
{
  return self->_shouldInterleaveClientResults;
}

- (BOOL)enforceServerResultsOrder
{
  return self->_enforceServerResultsOrder;
}

- (BOOL)enableMapsSuggestServerReranking
{
  return self->_enableMapsSuggestServerReranking;
}

- (BOOL)isSectionForClientOnlyResults
{
  return self->_isSectionForClientOnlyResults;
}

- (NSArray)includedClientResultTypes
{
  return self->_includedClientResultTypes;
}

- (NSArray)excludedClientResultTypes
{
  return self->_excludedClientResultTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_includedClientResultTypes, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_localizedSectionHeader, 0);
}

@end
