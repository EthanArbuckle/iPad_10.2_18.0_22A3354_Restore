@implementation GEOPDSSearchResultSection

- (GEOPDSSearchResultSection)init
{
  GEOPDSSearchResultSection *v2;
  GEOPDSSearchResultSection *v3;
  GEOPDSSearchResultSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSSearchResultSection;
  v2 = -[GEOPDSSearchResultSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSSearchResultSection)initWithData:(id)a3
{
  GEOPDSSearchResultSection *v3;
  GEOPDSSearchResultSection *v4;
  GEOPDSSearchResultSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSSearchResultSection;
  v3 = -[GEOPDSSearchResultSection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSectionHeaderDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionHeaderDisplayName_tags_461);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)sectionHeaderDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSSearchResultSection _readSectionHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addResolvedItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResolvedItems_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSSearchResultSection _addNoFlagsResolvedItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsResolvedItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readSectionSubHeaderDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayName_tags_463);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)sectionSubHeaderDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSSearchResultSection _readSectionSubHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (uint64_t)searchResultSectionCellType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
    else
      return 0;
  }
  return result;
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_464);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)styleAttributes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSSearchResultSection _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchResultSection;
  -[GEOPDSSearchResultSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchResultSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSSearchResultSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchResultSection sectionHeaderDisplayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("sectionHeaderDisplayName");
    else
      v6 = CFSTR("section_header_display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("resolvedItem");
    else
      v14 = CFSTR("resolved_item");
    objc_msgSend(v4, "setObject:forKey:", v7, v14);

  }
  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
    v15 = *(int *)(a1 + 80);
    if (v15 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C05A10[v15];
    }
    if (a2)
      v17 = CFSTR("searchResultSectionType");
    else
      v17 = CFSTR("search_result_section_type");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  -[GEOPDSSearchResultSection sectionSubHeaderDisplayName]((id *)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("sectionSubHeaderDisplayName");
    else
      v19 = CFSTR("section_sub_header_display_name");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  if ((*(_WORD *)(a1 + 84) & 1) != 0)
  {
    v20 = *(_DWORD *)(a1 + 76);
    if (v20)
    {
      if (v20 == 1)
      {
        v21 = CFSTR("SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NO_NAME");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = CFSTR("SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT");
    }
    if (a2)
      v22 = CFSTR("searchResultSectionCellType");
    else
      v22 = CFSTR("search_result_section_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDSSearchResultSection styleAttributes]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayNameWithEnrichment_tags_465);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v29 = *(id *)(a1 + 40);
  if (v29)
  {
    if (a2)
      v30 = CFSTR("sectionSubHeaderDisplayNameWithEnrichment");
    else
      v30 = CFSTR("section_sub_header_display_name_with_enrichment");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __55__GEOPDSSearchResultSection__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

    }
    else
    {
      v36 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_478_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_479_0;
      GEOPDSSearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSSearchResultSectionCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __55__GEOPDSSearchResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  GEOPDResolvedItem *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  id v31;
  int v32;
  const __CFString *v33;
  void *v34;
  GEOStyleAttributes *v35;
  GEOStyleAttributes *v36;
  GEOStyleAttributes *v37;
  GEOStyleAttributes *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_81;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_81;
  if (a3)
    v6 = CFSTR("sectionHeaderDisplayName");
  else
    v6 = CFSTR("section_header_display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = v8;
    *(_WORD *)(a1 + 84) |= 0x10u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), v8);

  }
  if (a3)
    v10 = CFSTR("resolvedItem");
  else
    v10 = CFSTR("resolved_item");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v5;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEOPDResolvedItem alloc];
            if (v18)
              v19 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v18, v17, a3);
            else
              v19 = 0;
            -[GEOPDSSearchResultSection addResolvedItem:](a1, v19);

          }
          ++v16;
        }
        while (v14 != v16);
        v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v14 = v20;
      }
      while (v20);
    }

    v5 = v44;
  }

  if (a3)
    v21 = CFSTR("searchResultSectionType");
  else
    v21 = CFSTR("search_result_section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_BUSINESS")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_ADDRESS")) & 1) != 0)
    {
      v24 = 2;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_CATEGORY")) & 1) != 0)
    {
      v24 = 3;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_BRAND")) & 1) != 0)
    {
      v24 = 4;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_CLIENT_RESOLVED")) & 1) != 0)
    {
      v24 = 5;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_DIRECTION_INTENT")) & 1) != 0)
    {
      v24 = 6;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_TYPE_INTERLEAVED")))
    {
      v24 = 7;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_51;
    v24 = objc_msgSend(v22, "intValue");
  }
  *(_WORD *)(a1 + 84) |= 0x100u;
  *(_WORD *)(a1 + 84) |= 2u;
  *(_DWORD *)(a1 + 80) = v24;
LABEL_51:

  if (a3)
    v25 = CFSTR("sectionSubHeaderDisplayName");
  else
    v25 = CFSTR("section_sub_header_display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    v28 = v27;
    *(_WORD *)(a1 + 84) |= 0x40u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), v27);

  }
  if (a3)
    v29 = CFSTR("searchResultSectionCellType");
  else
    v29 = CFSTR("search_result_section_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v30;
    if ((objc_msgSend(v31, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT")) & 1) != 0)
      v32 = 0;
    else
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NO_NAME"));

    goto LABEL_66;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = objc_msgSend(v30, "intValue");
LABEL_66:
    *(_WORD *)(a1 + 84) |= 0x100u;
    *(_WORD *)(a1 + 84) |= 1u;
    *(_DWORD *)(a1 + 76) = v32;
  }

  if (a3)
    v33 = CFSTR("styleAttributes");
  else
    v33 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v36 = -[GEOStyleAttributes initWithJSON:](v35, "initWithJSON:", v34);
    else
      v36 = -[GEOStyleAttributes initWithDictionary:](v35, "initWithDictionary:", v34);
    v37 = v36;
    v38 = v36;
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), v37);

  }
  if (a3)
    v39 = CFSTR("sectionSubHeaderDisplayNameWithEnrichment");
  else
    v39 = CFSTR("section_sub_header_display_name_with_enrichment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(v40, "copy");
    v42 = v41;
    *(_WORD *)(a1 + 84) |= 0x20u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), v41);

  }
LABEL_81:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchResultSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 0);
    if (self->_sectionHeaderDisplayName)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_resolvedItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_sectionSubHeaderDisplayName)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_sectionSubHeaderDisplayNameWithEnrichment)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PBUnknownFields *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSSearchResultSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_sectionHeaderDisplayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_resolvedItems;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        -[GEOPDSSearchResultSection addResolvedItem:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_searchResultSectionType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v16 = -[NSString copyWithZone:](self->_sectionSubHeaderDisplayName, "copyWithZone:", a3, (_QWORD)v24);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_searchResultSectionCellType;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v18 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[NSString copyWithZone:](self->_sectionSubHeaderDisplayNameWithEnrichment, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionHeaderDisplayName;
  NSMutableArray *resolvedItems;
  __int16 flags;
  __int16 v8;
  NSString *sectionSubHeaderDisplayName;
  GEOStyleAttributes *styleAttributes;
  NSString *sectionSubHeaderDisplayNameWithEnrichment;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDSSearchResultSection readAll:]((uint64_t)v4, 1);
  sectionHeaderDisplayName = self->_sectionHeaderDisplayName;
  if ((unint64_t)sectionHeaderDisplayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionHeaderDisplayName, "isEqual:"))
      goto LABEL_23;
  }
  resolvedItems = self->_resolvedItems;
  if ((unint64_t)resolvedItems | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](resolvedItems, "isEqual:"))
      goto LABEL_23;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_searchResultSectionType != *((_DWORD *)v4 + 20))
      goto LABEL_23;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_23;
  }
  sectionSubHeaderDisplayName = self->_sectionSubHeaderDisplayName;
  if ((unint64_t)sectionSubHeaderDisplayName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sectionSubHeaderDisplayName, "isEqual:"))
    {
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    flags = (__int16)self->_flags;
    v8 = *((_WORD *)v4 + 42);
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_searchResultSectionCellType != *((_DWORD *)v4 + 19))
      goto LABEL_23;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_23;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 7)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_23;
  }
  sectionSubHeaderDisplayNameWithEnrichment = self->_sectionSubHeaderDisplayNameWithEnrichment;
  if ((unint64_t)sectionSubHeaderDisplayNameWithEnrichment | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](sectionSubHeaderDisplayNameWithEnrichment, "isEqual:");
  else
    v12 = 1;
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;

  -[GEOPDSSearchResultSection readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_sectionHeaderDisplayName, "hash");
  v4 = -[NSMutableArray hash](self->_resolvedItems, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_searchResultSectionType;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_sectionSubHeaderDisplayName, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_searchResultSectionCellType;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_sectionSubHeaderDisplayNameWithEnrichment, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
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

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSSearchResultSection readAll:](a1, 0);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = *(id *)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
            if (v10)
            {
              v11 = *(void **)(v10 + 8);
              *(_QWORD *)(v10 + 8) = 0;

            }
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1, (_QWORD)v12);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayNameWithEnrichment, 0);
  objc_storeStrong((id *)&self->_sectionHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_resolvedItems, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
