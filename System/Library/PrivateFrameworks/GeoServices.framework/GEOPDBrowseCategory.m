@implementation GEOPDBrowseCategory

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
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
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x40u;
    *(_WORD *)(a1 + 100) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDBrowseCategory readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 56);
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
            -[GEOPDBrowseCategory clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (GEOPDBrowseCategory)init
{
  GEOPDBrowseCategory *v2;
  GEOPDBrowseCategory *v3;
  GEOPDBrowseCategory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBrowseCategory;
  v2 = -[GEOPDBrowseCategory init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBrowseCategory)initWithData:(id)a3
{
  GEOPDBrowseCategory *v3;
  GEOPDBrowseCategory *v4;
  GEOPDBrowseCategory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBrowseCategory;
  v3 = -[GEOPDBrowseCategory initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSuggestionEntryMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)suggestionEntryMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readSuggestionEntryMetadata]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x1000u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)_readDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)displayString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readDisplayString]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x80u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)styleAttributes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setStyleAttributes:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x400u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readSubCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)subCategorys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addSubCategory:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDBrowseCategory _readSubCategorys](a1);
    -[GEOPDBrowseCategory _addNoFlagsSubCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 100) |= 0x2000u;
  }
}

- (void)_addNoFlagsSubCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readShortDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShortDisplayString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)shortDisplayString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readShortDisplayString]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setShortDisplayString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x200u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readPopularDisplayToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPopularDisplayToken_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)popularDisplayToken
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBrowseCategory _readPopularDisplayToken]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setPopularDisplayToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x100u;
  *(_WORD *)(a1 + 100) |= 0x2000u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (uint64_t)sortOrder
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 88);
    else
      return 0;
  }
  return result;
}

- (uint64_t)displayMode
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 84);
    else
      return 0;
  }
  return result;
}

- (uint64_t)subCategoryType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 4) != 0)
      return *(unsigned int *)(v1 + 92);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDBrowseCategory;
  -[GEOPDBrowseCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBrowseCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBrowseCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDBrowseCategory readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBrowseCategory suggestionEntryMetadata]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("suggestion_entry_metadata"));
    }
  }

  -[GEOPDBrowseCategory displayString]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("displayString");
    else
      v9 = CFSTR("display_string");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  -[GEOPDBrowseCategory styleAttributes]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("subCategory");
    else
      v22 = CFSTR("sub_category");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  -[GEOPDBrowseCategory shortDisplayString]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("shortDisplayString");
    else
      v24 = CFSTR("short_display_string");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  -[GEOPDBrowseCategory popularDisplayToken]((id *)a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (a2)
      v26 = CFSTR("popularDisplayToken");
    else
      v26 = CFSTR("popular_display_token");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);
  }

  v27 = *(_WORD *)(a1 + 100);
  if ((v27 & 2) != 0)
  {
    v28 = *(int *)(a1 + 88);
    if (v28 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C0DC60[v28];
    }
    if (a2)
      v30 = CFSTR("sortOrder");
    else
      v30 = CFSTR("sort_order");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    v27 = *(_WORD *)(a1 + 100);
    if ((v27 & 1) == 0)
    {
LABEL_43:
      if ((v27 & 4) == 0)
        goto LABEL_66;
      goto LABEL_59;
    }
  }
  else if ((v27 & 1) == 0)
  {
    goto LABEL_43;
  }
  v31 = *(int *)(a1 + 84);
  if (v31 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = off_1E1C0DC78[v31];
  }
  if (a2)
    v33 = CFSTR("displayMode");
  else
    v33 = CFSTR("display_mode");
  objc_msgSend(v4, "setObject:forKey:", v32, v33);

  v27 = *(_WORD *)(a1 + 100);
  if ((v27 & 4) != 0)
  {
LABEL_59:
    v34 = *(int *)(a1 + 92);
    if (v34 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E1C0DC90[v34];
    }
    if (a2)
      v36 = CFSTR("subCategoryType");
    else
      v36 = CFSTR("sub_category_type");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

    v27 = *(_WORD *)(a1 + 100);
  }
LABEL_66:
  if ((v27 & 0x20) == 0)
  {
    if ((v27 & 8) == 0)
      goto LABEL_68;
LABEL_82:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v49 = CFSTR("includeEvChargingParametersOnSearch");
    else
      v49 = CFSTR("include_ev_charging_parameters_on_search");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
      goto LABEL_73;
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 98));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v47 = CFSTR("isSubCategorySameAsTopLevel");
  else
    v47 = CFSTR("is_sub_category_same_as_top_level");
  objc_msgSend(v4, "setObject:forKey:", v46, v47);

  v27 = *(_WORD *)(a1 + 100);
  if ((v27 & 8) != 0)
    goto LABEL_82;
LABEL_68:
  if ((v27 & 0x10) != 0)
  {
LABEL_69:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 97));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v38 = CFSTR("isAllCategoryForVenue");
    else
      v38 = CFSTR("is_all_category_for_venue");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
LABEL_73:
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __49__GEOPDBrowseCategory__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E1C00600;
      v43 = v42;
      v51 = v43;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v50);
      v44 = v43;

      v41 = v44;
    }
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBrowseCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_129;
      else
        v6 = (int *)&readAll__nonRecursiveTag_130;
      GEOPDBrowseCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDBrowseCategoryCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDBrowseCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOStyleAttributes *v14;
  GEOStyleAttributes *v15;
  GEOStyleAttributes *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  GEOPDBrowseCategory *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  int v37;
  const __CFString *v38;
  void *v39;
  id v40;
  int v41;
  const __CFString *v42;
  void *v43;
  id v44;
  int v45;
  const __CFString *v46;
  void *v47;
  char v48;
  const __CFString *v49;
  void *v50;
  char v51;
  const __CFString *v52;
  void *v53;
  char v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_110;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_110;
  if ((_DWORD)a3)
    v6 = CFSTR("suggestionEntryMetadata");
  else
    v6 = CFSTR("suggestion_entry_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
    -[GEOPDBrowseCategory setSuggestionEntryMetadata:](a1, v8);

  }
  if ((_DWORD)a3)
    v9 = CFSTR("displayString");
  else
    v9 = CFSTR("display_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    -[GEOPDBrowseCategory setDisplayString:](a1, v11);

  }
  if ((_DWORD)a3)
    v12 = CFSTR("styleAttributes");
  else
    v12 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOStyleAttributes initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOStyleAttributes initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = v15;
    -[GEOPDBrowseCategory setStyleAttributes:](a1, v15);

  }
  if ((_DWORD)a3)
    v17 = CFSTR("subCategory");
  else
    v17 = CFSTR("sub_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v5;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v58;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v58 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = [GEOPDBrowseCategory alloc];
            if (v25)
              v26 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:](v25, v24, a3);
            else
              v26 = 0;
            -[GEOPDBrowseCategory addSubCategory:](a1, v26);

          }
          ++v23;
        }
        while (v21 != v23);
        v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        v21 = v27;
      }
      while (v27);
    }

    v5 = v56;
  }

  if ((_DWORD)a3)
    v28 = CFSTR("shortDisplayString");
  else
    v28 = CFSTR("short_display_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = (void *)objc_msgSend(v29, "copy");
    -[GEOPDBrowseCategory setShortDisplayString:](a1, v30);

  }
  if ((_DWORD)a3)
    v31 = CFSTR("popularDisplayToken");
  else
    v31 = CFSTR("popular_display_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = (void *)objc_msgSend(v32, "copy");
    -[GEOPDBrowseCategory setPopularDisplayToken:](a1, v33);

  }
  if ((_DWORD)a3)
    v34 = CFSTR("sortOrder");
  else
    v34 = CFSTR("sort_order");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v35;
    if ((objc_msgSend(v36, "isEqualToString:", CFSTR("BROWSE_RESULT_SORT_ORDER_UNKNOWN")) & 1) != 0)
    {
      v37 = 0;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("BROWSE_RESULT_SORT_ORDER_SEARCH_RETURNED")) & 1) != 0)
    {
      v37 = 1;
    }
    else if (objc_msgSend(v36, "isEqualToString:", CFSTR("BROWSE_RESULT_SORT_ORDER_CLIENT_ALPHABETIC")))
    {
      v37 = 2;
    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_64;
    v37 = objc_msgSend(v35, "intValue");
  }
  *(_WORD *)(a1 + 100) |= 0x2000u;
  *(_WORD *)(a1 + 100) |= 2u;
  *(_DWORD *)(a1 + 88) = v37;
LABEL_64:

  if ((_DWORD)a3)
    v38 = CFSTR("displayMode");
  else
    v38 = CFSTR("display_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v39;
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("BROWSE_RESULT_DISPLAY_MODE_UNKNOWN")) & 1) != 0)
    {
      v41 = 0;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("BROWSE_RESULT_DISPLAY_MODE_LIST_AND_PINS")) & 1) != 0)
    {
      v41 = 1;
    }
    else if (objc_msgSend(v40, "isEqualToString:", CFSTR("BROWSE_RESULT_DISPLAY_MODE_LIST_ONLY")))
    {
      v41 = 2;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_79;
    v41 = objc_msgSend(v39, "intValue");
  }
  *(_WORD *)(a1 + 100) |= 0x2000u;
  *(_WORD *)(a1 + 100) |= 1u;
  *(_DWORD *)(a1 + 84) = v41;
LABEL_79:

  if ((_DWORD)a3)
    v42 = CFSTR("subCategoryType");
  else
    v42 = CFSTR("sub_category_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v43;
    if ((objc_msgSend(v44, "isEqualToString:", CFSTR("BROWSE_SUBCATEGORY_TYPE_UNKNOWN")) & 1) != 0)
    {
      v45 = 0;
    }
    else if ((objc_msgSend(v44, "isEqualToString:", CFSTR("BROWSE_SUBCATEGORY_TYPE_SUBCATEGORIES")) & 1) != 0)
    {
      v45 = 1;
    }
    else if (objc_msgSend(v44, "isEqualToString:", CFSTR("BROWSE_SUBCATEGORY_TYPE_BUILDINGS")))
    {
      v45 = 2;
    }
    else
    {
      v45 = 0;
    }

    goto LABEL_93;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = objc_msgSend(v43, "intValue");
LABEL_93:
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 4u;
    *(_DWORD *)(a1 + 92) = v45;
  }

  if ((_DWORD)a3)
    v46 = CFSTR("isSubCategorySameAsTopLevel");
  else
    v46 = CFSTR("is_sub_category_same_as_top_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = objc_msgSend(v47, "BOOLValue");
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 0x20u;
    *(_BYTE *)(a1 + 98) = v48;
  }

  if ((_DWORD)a3)
    v49 = CFSTR("includeEvChargingParametersOnSearch");
  else
    v49 = CFSTR("include_ev_charging_parameters_on_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = objc_msgSend(v50, "BOOLValue");
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 8u;
    *(_BYTE *)(a1 + 96) = v51;
  }

  if ((_DWORD)a3)
    v52 = CFSTR("isAllCategoryForVenue");
  else
    v52 = CFSTR("is_all_category_for_venue");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = objc_msgSend(v53, "BOOLValue");
    *(_WORD *)(a1 + 100) |= 0x2000u;
    *(_WORD *)(a1 + 100) |= 0x10u;
    *(_BYTE *)(a1 + 97) = v54;
  }

LABEL_110:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBrowseCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F80) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBrowseCategory readAll:]((uint64_t)self, 0);
    if (self->_suggestionEntryMetadata)
      PBDataWriterWriteDataField();
    if (self->_displayString)
      PBDataWriterWriteStringField();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_subCategorys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_shortDisplayString)
      PBDataWriterWriteStringField();
    if (self->_popularDisplayToken)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
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
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int16 flags;
  PBUnknownFields *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBrowseCategory readAll:]((uint64_t)self, 0);
    v9 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v9;

    v11 = -[NSString copyWithZone:](self->_displayString, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v11;

    v13 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v13;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = self->_subCategorys;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v15);
          v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
          -[GEOPDBrowseCategory addSubCategory:](v5, v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    v20 = -[NSString copyWithZone:](self->_shortDisplayString, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v20;

    v22 = -[NSString copyWithZone:](self->_popularDisplayToken, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v22;

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_sortOrder;
      *(_WORD *)(v5 + 100) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0)
          goto LABEL_15;
        goto LABEL_23;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 84) = self->_displayMode;
    *(_WORD *)(v5 + 100) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_15:
      if ((flags & 0x20) == 0)
        goto LABEL_16;
      goto LABEL_24;
    }
LABEL_23:
    *(_DWORD *)(v5 + 92) = self->_subCategoryType;
    *(_WORD *)(v5 + 100) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_16:
      if ((flags & 8) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
LABEL_24:
    *(_BYTE *)(v5 + 98) = self->_isSubCategorySameAsTopLevel;
    *(_WORD *)(v5 + 100) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_17:
      if ((flags & 0x10) == 0)
      {
LABEL_19:
        v25 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v25;
        goto LABEL_20;
      }
LABEL_18:
      *(_BYTE *)(v5 + 97) = self->_isAllCategoryForVenue;
      *(_WORD *)(v5 + 100) |= 0x10u;
      goto LABEL_19;
    }
LABEL_25:
    *(_BYTE *)(v5 + 96) = self->_includeEvChargingParametersOnSearch;
    *(_WORD *)(v5 + 100) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDBrowseCategoryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_20:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *suggestionEntryMetadata;
  NSString *displayString;
  GEOStyleAttributes *styleAttributes;
  NSMutableArray *subCategorys;
  NSString *shortDisplayString;
  NSString *popularDisplayToken;
  __int16 flags;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOPDBrowseCategory readAll:]((uint64_t)self, 1);
  -[GEOPDBrowseCategory readAll:]((uint64_t)v4, 1);
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
      goto LABEL_47;
  }
  displayString = self->_displayString;
  if ((unint64_t)displayString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayString, "isEqual:"))
      goto LABEL_47;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_47;
  }
  subCategorys = self->_subCategorys;
  if ((unint64_t)subCategorys | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](subCategorys, "isEqual:"))
      goto LABEL_47;
  }
  shortDisplayString = self->_shortDisplayString;
  if ((unint64_t)shortDisplayString | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](shortDisplayString, "isEqual:"))
      goto LABEL_47;
  }
  popularDisplayToken = self->_popularDisplayToken;
  if ((unint64_t)popularDisplayToken | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](popularDisplayToken, "isEqual:"))
      goto LABEL_47;
  }
  flags = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 50);
  if ((flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_sortOrder != *((_DWORD *)v4 + 22))
      goto LABEL_47;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_displayMode != *((_DWORD *)v4 + 21))
      goto LABEL_47;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_subCategoryType != *((_DWORD *)v4 + 23))
      goto LABEL_47;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0)
      goto LABEL_47;
    if (self->_isSubCategorySameAsTopLevel)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_47;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 8) != 0)
  {
    if ((v12 & 8) == 0)
      goto LABEL_47;
    if (self->_includeEvChargingParametersOnSearch)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_47;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_47;
  }
  v13 = (v12 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v12 & 0x10) != 0)
    {
      if (self->_isAllCategoryForVenue)
      {
        if (!*((_BYTE *)v4 + 97))
          goto LABEL_47;
      }
      else if (*((_BYTE *)v4 + 97))
      {
        goto LABEL_47;
      }
      v13 = 1;
      goto LABEL_48;
    }
LABEL_47:
    v13 = 0;
  }
LABEL_48:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  __int16 flags;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[GEOPDBrowseCategory readAll:]((uint64_t)self, 1);
  v3 = -[NSData hash](self->_suggestionEntryMetadata, "hash");
  v4 = -[NSString hash](self->_displayString, "hash");
  v5 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v6 = -[NSMutableArray hash](self->_subCategorys, "hash");
  v7 = -[NSString hash](self->_shortDisplayString, "hash");
  v8 = -[NSString hash](self->_popularDisplayToken, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v10 = 2654435761 * self->_sortOrder;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v11 = 2654435761 * self->_displayMode;
      if ((flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  v11 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    v12 = 2654435761 * self->_subCategoryType;
    if ((flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v12 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    v13 = 2654435761 * self->_isSubCategorySameAsTopLevel;
    if ((flags & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v14 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_11:
  v13 = 0;
  if ((flags & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v14 = 2654435761 * self->_includeEvChargingParametersOnSearch;
  if ((flags & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v15 = 2654435761 * self->_isAllCategoryForVenue;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int16 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_29;
  -[GEOPDBrowseCategory readAll:]((uint64_t)v3, 0);
  v5 = (void *)*((_QWORD *)v4 + 8);
  if (v5)
    -[GEOPDBrowseCategory setSuggestionEntryMetadata:](a1, v5);
  v6 = (void *)*((_QWORD *)v4 + 3);
  if (v6)
    -[GEOPDBrowseCategory setDisplayString:](a1, v6);
  v7 = *(void **)(a1 + 48);
  v8 = *((_QWORD *)v4 + 6);
  if (v7)
  {
    if (v8)
      objc_msgSend(v7, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOPDBrowseCategory setStyleAttributes:](a1, *((void **)v4 + 6));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = *((id *)v4 + 7);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[GEOPDBrowseCategory addSubCategory:](a1, *(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v14 = (void *)*((_QWORD *)v4 + 5);
  if (v14)
    -[GEOPDBrowseCategory setShortDisplayString:](a1, v14);
  v15 = (void *)*((_QWORD *)v4 + 4);
  if (v15)
    -[GEOPDBrowseCategory setPopularDisplayToken:](a1, v15);
  v16 = *((_WORD *)v4 + 50);
  if ((v16 & 2) != 0)
  {
    *(_DWORD *)(a1 + 88) = *((_DWORD *)v4 + 22);
    *(_WORD *)(a1 + 100) |= 2u;
    v16 = *((_WORD *)v4 + 50);
    if ((v16 & 1) == 0)
    {
LABEL_24:
      if ((v16 & 4) == 0)
        goto LABEL_25;
      goto LABEL_32;
    }
  }
  else if ((v16 & 1) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(a1 + 84) = *((_DWORD *)v4 + 21);
  *(_WORD *)(a1 + 100) |= 1u;
  v16 = *((_WORD *)v4 + 50);
  if ((v16 & 4) == 0)
  {
LABEL_25:
    if ((v16 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(a1 + 92) = *((_DWORD *)v4 + 23);
  *(_WORD *)(a1 + 100) |= 4u;
  v16 = *((_WORD *)v4 + 50);
  if ((v16 & 0x20) == 0)
  {
LABEL_26:
    if ((v16 & 8) == 0)
      goto LABEL_27;
LABEL_34:
    *(_BYTE *)(a1 + 96) = *((_BYTE *)v4 + 96);
    *(_WORD *)(a1 + 100) |= 8u;
    if ((*((_WORD *)v4 + 50) & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_33:
  *(_BYTE *)(a1 + 98) = *((_BYTE *)v4 + 98);
  *(_WORD *)(a1 + 100) |= 0x20u;
  v16 = *((_WORD *)v4 + 50);
  if ((v16 & 8) != 0)
    goto LABEL_34;
LABEL_27:
  if ((v16 & 0x10) != 0)
  {
LABEL_28:
    *(_BYTE *)(a1 + 97) = *((_BYTE *)v4 + 97);
    *(_WORD *)(a1 + 100) |= 0x10u;
  }
LABEL_29:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_subCategorys, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_shortDisplayString, 0);
  objc_storeStrong((id *)&self->_popularDisplayToken, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
