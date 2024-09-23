@implementation GEOPlaceSearchCategoryTicket

void __78___GEOPlaceSearchCategoryTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  GEOSearchCategory *v18;
  GEOSearchCategory *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "requestType") == 11)
  {
    objc_msgSend(v5, "globalResult");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult browseCategorySuggestionResult](v6);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDSearchBrowseCategorySuggestionResult categorys](v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "requestType") != 14)
    {
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "globalResult");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult searchZeroKeywordCategorySuggestionResult](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDSearchZeroKeywordCategorySuggestionResult categorys](v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        v18 = [GEOSearchCategory alloc];
        v19 = -[GEOSearchCategory initWithBrowseCategory:](v18, "initWithBrowseCategory:", v17, (_QWORD)v20);
        if (v19)
          objc_msgSend(v11, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

}

@end
