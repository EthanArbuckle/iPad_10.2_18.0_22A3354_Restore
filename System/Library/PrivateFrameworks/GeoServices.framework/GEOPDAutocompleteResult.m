@implementation GEOPDAutocompleteResult

- (GEOPDAutocompleteResult)init
{
  GEOPDAutocompleteResult *v2;
  GEOPDAutocompleteResult *v3;
  GEOPDAutocompleteResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteResult;
  v2 = -[GEOPDAutocompleteResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteResult)initWithData:(id)a3
{
  GEOPDAutocompleteResult *v3;
  GEOPDAutocompleteResult *v4;
  GEOPDAutocompleteResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteResult;
  v3 = -[GEOPDAutocompleteResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 106) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSections_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResult _readSections]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addSections:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAutocompleteResult _readSections]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsSections:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsSections:(uint64_t)a1
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

- (void)_readSortPriorityMappings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 106) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSortPriorityMappings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sortPriorityMappings
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResult _readSortPriorityMappings]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addSortPriorityMapping:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAutocompleteResult _readSortPriorityMappings]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsSortPriorityMapping:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x20000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsSortPriorityMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readClientRankingFeatureMetadatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 105) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientRankingFeatureMetadatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)clientRankingFeatureMetadatas
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResult _readClientRankingFeatureMetadatas]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addClientRankingFeatureMetadata:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAutocompleteResult _readClientRankingFeatureMetadatas]((uint64_t)a1);
    -[GEOPDAutocompleteResult _addNoFlagsClientRankingFeatureMetadata:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[26]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 20);
    a1[26]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsClientRankingFeatureMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readAutocompleteSessionData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 105) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteSessionData_tags_1245);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)autocompleteSessionData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResult _readAutocompleteSessionData]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAutocompleteSessionData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x1000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setParsecQueryRankingFeatures:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x4000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readPlaceSummaryLayoutMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 105) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)placeSummaryLayoutMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 104) |= 0x8000u;
  *(_DWORD *)(a1 + 104) |= 0x40000u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (os_unfair_lock_s)highlightType
{
  os_unfair_lock_s *v1;
  uint32_t os_unfair_lock_opaque;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v1[26]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 20);
    if ((os_unfair_lock_opaque & 2) != 0)
      return (os_unfair_lock_s *)v1[22]._os_unfair_lock_opaque;
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
  v8.super_class = (Class)GEOPDAutocompleteResult;
  -[GEOPDAutocompleteResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  int v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  __CFString *v61;
  const __CFString *v62;
  uint64_t v63;
  __CFString *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  _QWORD v75[4];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDAutocompleteResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v6 = *(id *)(a1 + 56);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v86 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v10, "jsonRepresentation");
          else
            objc_msgSend(v10, "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("sections"));
  }
  v12 = *(_DWORD *)(a1 + 104);
  if ((v12 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("enableRap");
    else
      v14 = CFSTR("enable_rap");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_DWORD *)(a1 + 104);
  }
  if ((v12 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("shouldDisplayNoResults");
    else
      v16 = CFSTR("should_display_no_results");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v12 = *(_DWORD *)(a1 + 104);
  }
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("retainSearchTime");
    else
      v18 = CFSTR("retain_search_time");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v12 = *(_DWORD *)(a1 + 104);
  }
  if ((v12 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 98));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("isNoResultFromNegativeCache");
    else
      v20 = CFSTR("is_no_result_from_negative_cache");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v22 = *(id *)(a1 + 64);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v82 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("sortPriorityMapping");
    else
      v28 = CFSTR("sort_priority_mapping");
    objc_msgSend(v4, "setObject:forKey:", v21, v28);

  }
  if ((*(_BYTE *)(a1 + 104) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 99));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("isTopSectionTypeQuery");
    else
      v30 = CFSTR("is_top_section_type_query");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v32 = *(id *)(a1 + 32);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v78 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("clientRankingFeatureMetadata");
    else
      v38 = CFSTR("client_ranking_feature_metadata");
    objc_msgSend(v4, "setObject:forKey:", v31, v38);

  }
  if ((*(_BYTE *)(a1 + 104) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("shouldDifferentiateClientAndServerResults");
    else
      v40 = CFSTR("should_differentiate_client_and_server_results");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  -[GEOPDAutocompleteResult autocompleteSessionData]((id *)a1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("autocompleteSessionData");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("autocomplete_session_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 105) & 0x40) == 0)
  {
    v45 = *(void **)(a1 + 8);
    if (v45)
    {
      v46 = v45;
      objc_sync_enter(v46);
      GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParsecQueryRankingFeatures_tags);
      objc_sync_exit(v46);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v47 = *(id *)(a1 + 40);
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("parsecQueryRankingFeatures");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("parsec_query_ranking_features");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  if ((*(_BYTE *)(a1 + 105) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 102));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("shouldEnableGrayscaleHighlighting");
    else
      v52 = CFSTR("should_enable_grayscale_highlighting");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
  -[GEOPDAutocompleteResult placeSummaryLayoutMetadata]((id *)a1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v53, "jsonRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("placeSummaryLayoutMetadata");
    }
    else
    {
      objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("place_summary_layout_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

  }
  v57 = *(_DWORD *)(a1 + 104);
  if ((v57 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 103));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v59 = CFSTR("shouldUseDistanceFeatureServerResults");
    else
      v59 = CFSTR("should_use_distance_feature_server_results");
    objc_msgSend(v4, "setObject:forKey:", v58, v59);

    v57 = *(_DWORD *)(a1 + 104);
  }
  if ((v57 & 1) != 0)
  {
    v60 = *(int *)(a1 + 84);
    if (v60 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E1C046D0[v60];
    }
    if (a2)
      v62 = CFSTR("clientResolvedTypeSetupPrompt");
    else
      v62 = CFSTR("client_resolved_type_setup_prompt");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

    v57 = *(_DWORD *)(a1 + 104);
  }
  if ((v57 & 2) != 0)
  {
    v63 = *(int *)(a1 + 88);
    if (v63 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E1C04708[v63];
    }
    if (a2)
      v65 = CFSTR("highlightType");
    else
      v65 = CFSTR("highlight_type");
    objc_msgSend(v4, "setObject:forKey:", v64, v65);

    v57 = *(_DWORD *)(a1 + 104);
  }
  if ((v57 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 97));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v67 = CFSTR("enableStructuredRapAffordance");
    else
      v67 = CFSTR("enable_structured_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
  v68 = *(void **)(a1 + 16);
  if (v68)
  {
    objc_msgSend(v68, "dictionaryRepresentation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v69, "count"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __53__GEOPDAutocompleteResult__dictionaryRepresentation___block_invoke;
      v75[3] = &unk_1E1C00600;
      v72 = v71;
      v76 = v72;
      objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", v75);
      v73 = v72;

    }
    else
    {
      v73 = v69;
    }
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1310;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1311;
      GEOPDAutocompleteResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDAutocompleteResultCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __53__GEOPDAutocompleteResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  GEOPDAutocompleteResultSection *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  GEOPDAutocompleteEntry *v32;
  GEOPDAutocompleteEntry *v33;
  GEOPDAutocompleteEntry *v34;
  void *v35;
  id v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  int v48;
  void *v49;
  char v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  id v56;
  PBDataReader *reader;
  PBDataReader *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  const __CFString *v71;
  void *v72;
  char v73;
  const __CFString *v74;
  void *v75;
  char v76;
  const __CFString *v77;
  void *v78;
  int v79;
  const __CFString *v80;
  void *v81;
  char v82;
  const __CFString *v83;
  id v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  const __CFString *v88;
  const __CFString *v89;
  uint64_t m;
  void *v91;
  GEOPDAutocompleteResultSortPriorityMapping *v92;
  id v93;
  uint64_t v94;
  void *v95;
  int v96;
  void *v97;
  id v98;
  int v99;
  void *v100;
  id v101;
  int v102;
  const __CFString *v103;
  void *v104;
  char v105;
  const __CFString *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  GEOPDClientRankingFeatureMetadata *v113;
  void *v114;
  uint64_t v115;
  const __CFString *v116;
  void *v117;
  char v118;
  const __CFString *v119;
  void *v120;
  GEOPDAutocompleteSessionData *v121;
  GEOPDAutocompleteSessionData *v122;
  GEOPDAutocompleteSessionData *v123;
  const __CFString *v124;
  void *v125;
  GEOPDParsecQueryRankingFeatures *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  char v130;
  const __CFString *v131;
  void *v132;
  GEOPDPlaceSummaryLayoutMetadata *v133;
  GEOPDPlaceSummaryLayoutMetadata *v134;
  GEOPDPlaceSummaryLayoutMetadata *v135;
  const __CFString *v136;
  void *v137;
  char v138;
  const __CFString *v139;
  void *v140;
  id v141;
  int v142;
  const __CFString *v143;
  void *v144;
  id v145;
  int v146;
  const __CFString *v147;
  void *v148;
  char v149;
  void *v151;
  void *v152;
  const __CFString *v153;
  const __CFString *v154;
  const __CFString *v155;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  const __CFString *v162;
  id obj;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  const __CFString *v170;
  uint64_t v171;
  const __CFString *v172;
  uint64_t v173;
  id v174;
  const __CFString *v175;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v173 = objc_msgSend(a1, "init");
  if (!v173)
    goto LABEL_473;
  v152 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v151;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_226;
  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  obj = v151;
  v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v207, 16);
  if (!v165)
    goto LABEL_225;
  v6 = CFSTR("suggestion_type");
  v164 = *(_QWORD *)v186;
  if (a3)
    v6 = CFSTR("suggestionType");
  v162 = v6;
  v7 = CFSTR("num_visible_results");
  if (a3)
    v7 = CFSTR("numVisibleResults");
  v161 = v7;
  if (a3)
    v8 = CFSTR("shouldInterleaveClientResults");
  else
    v8 = CFSTR("should_interleave_client_results");
  v160 = v8;
  if (a3)
    v9 = CFSTR("enforceServerResultsOrder");
  else
    v9 = CFSTR("enforce_server_results_order");
  v10 = CFSTR("enable_maps_suggest_server_reranking");
  if (a3)
    v10 = CFSTR("enableMapsSuggestServerReranking");
  v158 = v10;
  v159 = v9;
  if (a3)
    v11 = CFSTR("contentType");
  else
    v11 = CFSTR("content_type");
  v12 = CFSTR("isSectionForClientOnlyResults");
  if (!a3)
    v12 = CFSTR("is_section_for_client_only_results");
  v156 = v12;
  v157 = v11;
  v13 = CFSTR("allowed_type_client_only_section");
  if (a3)
    v13 = CFSTR("allowedTypeClientOnlySection");
  v155 = v13;
  if (a3)
    v14 = CFSTR("includedClientResultType");
  else
    v14 = CFSTR("included_client_result_type");
  v154 = v14;
  v15 = CFSTR("excluded_client_result_type");
  if (a3)
    v15 = CFSTR("excludedClientResultType");
  v153 = v15;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v186 != v164)
      {
        v17 = v16;
        objc_enumerationMutation(obj);
        v16 = v17;
      }
      v171 = v16;
      v18 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_223;
      v19 = [GEOPDAutocompleteResultSection alloc];
      if (!v19)
        goto LABEL_222;
      v174 = v18;
      v19 = -[GEOPDAutocompleteResultSection init](v19, "init");

      if (!v19)
        goto LABEL_221;
      objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("type"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
        {
          v22 = 0;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
        {
          v22 = 1;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
        {
          v22 = 2;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
        {
          v22 = 3;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
        {
          v22 = 4;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
        {
          v22 = 5;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
        {
          v22 = 6;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
        {
          v22 = 7;
        }
        else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
        {
          v22 = 8;
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("PUBLISHER")))
        {
          v22 = 9;
        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_61;
        v22 = objc_msgSend(v20, "intValue");
      }
      *(_WORD *)&v19->_flags |= 0x4000u;
      *(_WORD *)&v19->_flags |= 8u;
      v19->_type = v22;
LABEL_61:

      objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("name"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v23, "copy");
        v25 = v24;
        *(_WORD *)&v19->_flags |= 0x2000u;
        *(_WORD *)&v19->_flags |= 0x4000u;
        objc_storeStrong((id *)&v19->_name, v24);

      }
      objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("entries"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v203 = 0u;
        v204 = 0u;
        v201 = 0u;
        v202 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v201, v211, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v202;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v202 != v29)
                objc_enumerationMutation(v27);
              v31 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = [GEOPDAutocompleteEntry alloc];
                if ((a3 & 1) != 0)
                  v33 = -[GEOPDAutocompleteEntry initWithJSON:](v32, "initWithJSON:", v31);
                else
                  v33 = -[GEOPDAutocompleteEntry initWithDictionary:](v32, "initWithDictionary:", v31);
                v34 = v33;
                -[GEOPDAutocompleteResultSection addEntries:]((uint64_t)v19, v33);

              }
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v201, v211, 16);
          }
          while (v28);
        }

      }
      objc_msgSend(v174, "objectForKeyedSubscript:", v162);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v35;
        if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_UNKNOWN")) & 1) != 0)
        {
          v37 = 0;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_CATEGORY")) & 1) != 0)
        {
          v37 = 1;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_TRANSIT")) & 1) != 0)
        {
          v37 = 2;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_CHAIN")) & 1) != 0)
        {
          v37 = 3;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_MIXED_INTENT")) & 1) != 0)
        {
          v37 = 4;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_MISC")) & 1) != 0)
        {
          v37 = 5;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_CLIENT_RESOLVED")) & 1) != 0)
        {
          v37 = 6;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_DIRECTION_INTENT")) & 1) != 0)
        {
          v37 = 7;
        }
        else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_COLLECTION")) & 1) != 0)
        {
          v37 = 8;
        }
        else if (objc_msgSend(v36, "isEqualToString:", CFSTR("SUGGESTION_PUBLISHER")))
        {
          v37 = 9;
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
          goto LABEL_103;
        v37 = objc_msgSend(v35, "intValue");
      }
      *(_WORD *)&v19->_flags |= 0x4000u;
      *(_WORD *)&v19->_flags |= 4u;
      v19->_suggestionType = v37;
LABEL_103:

      objc_msgSend(v174, "objectForKeyedSubscript:", v161);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = objc_msgSend(v38, "intValue");
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 2u;
        v19->_numVisibleResults = v39;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v160);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = objc_msgSend(v40, "BOOLValue");
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x80u;
        v19->_shouldInterleaveClientResults = v41;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v159);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = objc_msgSend(v42, "BOOLValue");
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x20u;
        v19->_enforceServerResultsOrder = v43;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v158);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = objc_msgSend(v44, "BOOLValue");
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x10u;
        v19->_enableMapsSuggestServerReranking = v45;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v157);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v46;
        if ((objc_msgSend(v47, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v48 = 0;
        }
        else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_PRIMARY")) & 1) != 0)
        {
          v48 = 1;
        }
        else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_RELATED_RESULTS")) & 1) != 0)
        {
          v48 = 2;
        }
        else if (objc_msgSend(v47, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_PARTIAL_MATCHES")))
        {
          v48 = 3;
        }
        else
        {
          v48 = 0;
        }

        goto LABEL_124;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = objc_msgSend(v46, "intValue");
LABEL_124:
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 1u;
        v19->_contentType = v48;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v156);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = objc_msgSend(v49, "BOOLValue");
        *(_WORD *)&v19->_flags |= 0x4000u;
        *(_WORD *)&v19->_flags |= 0x40u;
        v19->_isSectionForClientOnlyResults = v50;
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v155);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v199 = 0u;
        v200 = 0u;
        v197 = 0u;
        v198 = 0u;
        v51 = v167;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v197, v210, 16);
        if (!v52)
          goto LABEL_159;
        v53 = *(_QWORD *)v198;
        while (1)
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v198 != v53)
              objc_enumerationMutation(v51);
            v55 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = v55;
              if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) == 0
                && (objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) == 0)
              {
                objc_msgSend(v56, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v55, "intValue");
            }
            os_unfair_lock_lock(&v19->_readerLock);
            if ((*(_WORD *)&v19->_flags & 0x200) == 0)
            {
              reader = v19->_reader;
              if (reader)
              {
                v58 = reader;
                objc_sync_enter(v58);
                GEOPDAutocompleteResultSectionReadSpecified((uint64_t)v19, (unint64_t)v19->_reader, (int *)&_readAllowedTypeClientOnlySections_tags);
                objc_sync_exit(v58);

              }
            }
            os_unfair_lock_unlock(&v19->_readerLock);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(_WORD *)&v19->_flags |= 0x200u;
            os_unfair_lock_unlock(&v19->_readerLock);
            *(_WORD *)&v19->_flags |= 0x4000u;
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v197, v210, 16);
          if (!v52)
          {
LABEL_159:

            break;
          }
        }
      }

      objc_msgSend(v174, "objectForKeyedSubscript:", v154);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_190;
      v195 = 0u;
      v196 = 0u;
      v193 = 0u;
      v194 = 0u;
      v59 = v168;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v193, v209, 16);
      if (!v60)
        goto LABEL_189;
      v61 = *(_QWORD *)v194;
      do
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v194 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v64 = v63;
            if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) == 0
              && (objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) == 0)
            {
              objc_msgSend(v64, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v63, "intValue");
          }
          -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes]((uint64_t)v19);
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(_WORD *)&v19->_flags |= 0x800u;
          os_unfair_lock_unlock(&v19->_readerLock);
          *(_WORD *)&v19->_flags |= 0x4000u;
        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v193, v209, 16);
      }
      while (v60);
LABEL_189:

LABEL_190:
      objc_msgSend(v174, "objectForKeyedSubscript:", v153);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_220;
      v191 = 0u;
      v192 = 0u;
      v189 = 0u;
      v190 = 0u;
      v65 = v169;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v189, v208, 16);
      if (!v66)
        goto LABEL_219;
      v67 = *(_QWORD *)v190;
      while (2)
      {
        v68 = 0;
        while (2)
        {
          if (*(_QWORD *)v190 != v67)
            objc_enumerationMutation(v65);
          v69 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v68);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v70 = v69;
            if ((objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) == 0
              && (objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) == 0)
            {
              objc_msgSend(v70, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE"));
            }

LABEL_216:
            -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes]((uint64_t)v19);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(_WORD *)&v19->_flags |= 0x400u;
            os_unfair_lock_unlock(&v19->_readerLock);
            *(_WORD *)&v19->_flags |= 0x4000u;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v69, "intValue");
              goto LABEL_216;
            }
          }
          if (v66 != ++v68)
            continue;
          break;
        }
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v189, v208, 16);
        if (v66)
          continue;
        break;
      }
LABEL_219:

LABEL_220:
LABEL_221:

LABEL_222:
      -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v173, v19);

LABEL_223:
      v16 = v171 + 1;
    }
    while (v171 + 1 != v165);
    v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v207, 16);
  }
  while (v165);
LABEL_225:

  v5 = v151;
LABEL_226:

  if (a3)
    v71 = CFSTR("enableRap");
  else
    v71 = CFSTR("enable_rap");
  objc_msgSend(v4, "objectForKeyedSubscript:", v71, v151);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = objc_msgSend(v72, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 8u;
    *(_BYTE *)(v173 + 96) = v73;
  }

  if (a3)
    v74 = CFSTR("shouldDisplayNoResults");
  else
    v74 = CFSTR("should_display_no_results");
  objc_msgSend(v4, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = objc_msgSend(v75, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x100u;
    *(_BYTE *)(v173 + 101) = v76;
  }

  if (a3)
    v77 = CFSTR("retainSearchTime");
  else
    v77 = CFSTR("retain_search_time");
  objc_msgSend(v4, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = objc_msgSend(v78, "unsignedIntValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 4u;
    *(_DWORD *)(v173 + 92) = v79;
  }

  if (a3)
    v80 = CFSTR("isNoResultFromNegativeCache");
  else
    v80 = CFSTR("is_no_result_from_negative_cache");
  objc_msgSend(v4, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = objc_msgSend(v81, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x20u;
    *(_BYTE *)(v173 + 98) = v82;
  }

  if (a3)
    v83 = CFSTR("sortPriorityMapping");
  else
    v83 = CFSTR("sort_priority_mapping");
  objc_msgSend(v4, "objectForKeyedSubscript:", v83);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v84 = v166;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v181, v206, 16);
    if (!v85)
      goto LABEL_367;
    v86 = CFSTR("sort_priority");
    v87 = *(_QWORD *)v182;
    if (a3)
      v86 = CFSTR("sortPriority");
    v175 = v86;
    if (a3)
      v88 = CFSTR("resultType");
    else
      v88 = CFSTR("result_type");
    v89 = CFSTR("result_subtype");
    if (a3)
      v89 = CFSTR("resultSubtype");
    v170 = v89;
    v172 = v88;
    while (1)
    {
      for (m = 0; m != v85; ++m)
      {
        if (*(_QWORD *)v182 != v87)
          objc_enumerationMutation(v84);
        v91 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v92 = [GEOPDAutocompleteResultSortPriorityMapping alloc];
          if (v92)
          {
            v93 = v91;
            v94 = -[GEOPDAutocompleteResultSortPriorityMapping init](v92, "init");
            if (v94)
            {
              objc_msgSend(v93, "objectForKeyedSubscript:", v175);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v96 = objc_msgSend(v95, "intValue");
                *(_BYTE *)(v94 + 28) |= 4u;
                *(_DWORD *)(v94 + 24) = v96;
              }

              objc_msgSend(v93, "objectForKeyedSubscript:", v172);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v98 = v97;
                if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v99 = 0;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_ANY")) & 1) != 0)
                {
                  v99 = 1;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SERVER")) & 1) != 0)
                {
                  v99 = 2;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CALENDAR")) & 1) != 0)
                {
                  v99 = 3;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_COLLECTION")) & 1) != 0)
                {
                  v99 = 4;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CONTACTS")) & 1) != 0)
                {
                  v99 = 5;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CORE_RECENTS")) & 1) != 0)
                {
                  v99 = 6;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CORE_ROUTINE")) & 1) != 0)
                {
                  v99 = 7;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_HISTORY")) & 1) != 0)
                {
                  v99 = 8;
                }
                else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SIRI_SUGGESTIONS")) & 1) != 0)
                {
                  v99 = 9;
                }
                else if (objc_msgSend(v98, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SUGGESTIONS")))
                {
                  v99 = 10;
                }
                else
                {
                  v99 = 0;
                }

LABEL_294:
                *(_BYTE *)(v94 + 28) |= 2u;
                *(_DWORD *)(v94 + 20) = v99;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v99 = objc_msgSend(v97, "intValue");
                  goto LABEL_294;
                }
              }

              objc_msgSend(v93, "objectForKeyedSubscript:", v170);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v101 = v100;
                if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_UNKNOWN")) & 1) != 0)
                {
                  v102 = 0;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_ANY")) & 1) != 0)
                {
                  v102 = 1;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_FAVORITES")) & 1) != 0)
                {
                  v102 = 2;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_MARKED_LOCATION")) & 1) != 0)
                {
                  v102 = 3;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CONTACTS_ME_CARD")) & 1) != 0)
                {
                  v102 = 4;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MAIL")) & 1) != 0)
                {
                  v102 = 5;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MESSAGES")) & 1) != 0)
                {
                  v102 = 6;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_HOME")) & 1) != 0)
                {
                  v102 = 7;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_PARKED_CAR")) & 1) != 0)
                {
                  v102 = 8;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_WORK")) & 1) != 0)
                {
                  v102 = 9;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_DIRECTIONS")) & 1) != 0)
                {
                  v102 = 10;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_PLACE")) & 1) != 0)
                {
                  v102 = 11;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_QUERY")) & 1) != 0)
                {
                  v102 = 12;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_TRANSIT_LINE")) & 1) != 0)
                {
                  v102 = 13;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOME")) & 1) != 0)
                {
                  v102 = 14;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_WORK")) & 1) != 0)
                {
                  v102 = 15;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CALENDAR_EVENT")) & 1) != 0)
                {
                  v102 = 16;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FREQUENT_LOCATION")) & 1) != 0)
                {
                  v102 = 17;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RECENT_HISTORY")) & 1) != 0)
                {
                  v102 = 18;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FAVORITE_PLACE")) & 1) != 0)
                {
                  v102 = 19;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_PARKED_CAR")) & 1) != 0)
                {
                  v102 = 20;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESTAURANT_RESERVATION")) & 1) != 0)
                {
                  v102 = 21;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RIDESHARING")) & 1) != 0)
                {
                  v102 = 22;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CARPLAY_LOW_ENERGY")) & 1) != 0)
                {
                  v102 = 23;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESUME_ROUTE")) & 1) != 0)
                {
                  v102 = 24;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_APP_CONNECTION")) & 1) != 0)
                {
                  v102 = 25;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOTEL")) & 1) != 0)
                {
                  v102 = 26;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CAR_RENTAL")) & 1) != 0)
                {
                  v102 = 27;
                }
                else if ((objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TRAVEL_FLIGHT")) & 1) != 0)
                {
                  v102 = 28;
                }
                else if (objc_msgSend(v101, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TICKETED_EVENT")))
                {
                  v102 = 29;
                }
                else
                {
                  v102 = 0;
                }

LABEL_361:
                *(_BYTE *)(v94 + 28) |= 1u;
                *(_DWORD *)(v94 + 16) = v102;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v102 = objc_msgSend(v100, "intValue");
                  goto LABEL_361;
                }
              }

            }
          }
          else
          {
            v94 = 0;
          }
          -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v173, (void *)v94);

          continue;
        }
      }
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v181, v206, 16);
      if (!v85)
      {
LABEL_367:

        break;
      }
    }
  }

  if (a3)
    v103 = CFSTR("isTopSectionTypeQuery");
  else
    v103 = CFSTR("is_top_section_type_query");
  objc_msgSend(v152, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = objc_msgSend(v104, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x40u;
    *(_BYTE *)(v173 + 99) = v105;
  }

  if (a3)
    v106 = CFSTR("clientRankingFeatureMetadata");
  else
    v106 = CFSTR("client_ranking_feature_metadata");
  objc_msgSend(v152, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v108 = v107;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v177, v205, 16);
    if (v109)
    {
      v110 = *(_QWORD *)v178;
      do
      {
        v111 = 0;
        do
        {
          if (*(_QWORD *)v178 != v110)
            objc_enumerationMutation(v108);
          v112 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v111);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v113 = [GEOPDClientRankingFeatureMetadata alloc];
            if (v113)
              v114 = (void *)-[GEOPDClientRankingFeatureMetadata _initWithDictionary:isJSON:](v113, v112, a3);
            else
              v114 = 0;
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v173, v114);

          }
          ++v111;
        }
        while (v109 != v111);
        v115 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v177, v205, 16);
        v109 = v115;
      }
      while (v115);
    }

  }
  if (a3)
    v116 = CFSTR("shouldDifferentiateClientAndServerResults");
  else
    v116 = CFSTR("should_differentiate_client_and_server_results");
  objc_msgSend(v152, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v118 = objc_msgSend(v117, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x80u;
    *(_BYTE *)(v173 + 100) = v118;
  }

  if (a3)
    v119 = CFSTR("autocompleteSessionData");
  else
    v119 = CFSTR("autocomplete_session_data");
  objc_msgSend(v152, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v121 = [GEOPDAutocompleteSessionData alloc];
    if ((a3 & 1) != 0)
      v122 = -[GEOPDAutocompleteSessionData initWithJSON:](v121, "initWithJSON:", v120);
    else
      v122 = -[GEOPDAutocompleteSessionData initWithDictionary:](v121, "initWithDictionary:", v120);
    v123 = v122;
    -[GEOPDAutocompleteResult setAutocompleteSessionData:](v173, v122);

  }
  if (a3)
    v124 = CFSTR("parsecQueryRankingFeatures");
  else
    v124 = CFSTR("parsec_query_ranking_features");
  objc_msgSend(v152, "objectForKeyedSubscript:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v126 = [GEOPDParsecQueryRankingFeatures alloc];
    if (v126)
      v127 = (void *)-[GEOPDParsecQueryRankingFeatures _initWithDictionary:isJSON:]((uint64_t)v126, v125, a3);
    else
      v127 = 0;
    -[GEOPDAutocompleteResult setParsecQueryRankingFeatures:](v173, v127);

  }
  if (a3)
    v128 = CFSTR("shouldEnableGrayscaleHighlighting");
  else
    v128 = CFSTR("should_enable_grayscale_highlighting");
  objc_msgSend(v152, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = objc_msgSend(v129, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x200u;
    *(_BYTE *)(v173 + 102) = v130;
  }

  if (a3)
    v131 = CFSTR("placeSummaryLayoutMetadata");
  else
    v131 = CFSTR("place_summary_layout_metadata");
  objc_msgSend(v152, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = [GEOPDPlaceSummaryLayoutMetadata alloc];
    if ((a3 & 1) != 0)
      v134 = -[GEOPDPlaceSummaryLayoutMetadata initWithJSON:](v133, "initWithJSON:", v132);
    else
      v134 = -[GEOPDPlaceSummaryLayoutMetadata initWithDictionary:](v133, "initWithDictionary:", v132);
    v135 = v134;
    -[GEOPDAutocompleteResult setPlaceSummaryLayoutMetadata:](v173, v134);

  }
  if (a3)
    v136 = CFSTR("shouldUseDistanceFeatureServerResults");
  else
    v136 = CFSTR("should_use_distance_feature_server_results");
  objc_msgSend(v152, "objectForKeyedSubscript:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v138 = objc_msgSend(v137, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x400u;
    *(_BYTE *)(v173 + 103) = v138;
  }

  if (a3)
    v139 = CFSTR("clientResolvedTypeSetupPrompt");
  else
    v139 = CFSTR("client_resolved_type_setup_prompt");
  objc_msgSend(v152, "objectForKeyedSubscript:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v141 = v140;
    if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
    {
      v142 = 0;
    }
    else if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
    {
      v142 = 1;
    }
    else if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
    {
      v142 = 2;
    }
    else if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
    {
      v142 = 3;
    }
    else if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
    {
      v142 = 4;
    }
    else if ((objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
    {
      v142 = 5;
    }
    else if (objc_msgSend(v141, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
    {
      v142 = 6;
    }
    else
    {
      v142 = 0;
    }

LABEL_451:
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 1u;
    *(_DWORD *)(v173 + 84) = v142;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v142 = objc_msgSend(v140, "intValue");
      goto LABEL_451;
    }
  }

  if (a3)
    v143 = CFSTR("highlightType");
  else
    v143 = CFSTR("highlight_type");
  objc_msgSend(v152, "objectForKeyedSubscript:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = v144;
    if ((objc_msgSend(v145, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT")) & 1) != 0)
    {
      v146 = 0;
    }
    else if ((objc_msgSend(v145, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY")) & 1) != 0)
    {
      v146 = 1;
    }
    else if (objc_msgSend(v145, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE")))
    {
      v146 = 2;
    }
    else
    {
      v146 = 0;
    }

LABEL_466:
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 2u;
    *(_DWORD *)(v173 + 88) = v146;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v146 = objc_msgSend(v144, "intValue");
      goto LABEL_466;
    }
  }

  if (a3)
    v147 = CFSTR("enableStructuredRapAffordance");
  else
    v147 = CFSTR("enable_structured_rap_affordance");
  objc_msgSend(v152, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = objc_msgSend(v148, "BOOLValue");
    *(_DWORD *)(v173 + 104) |= 0x40000u;
    *(_DWORD *)(v173 + 104) |= 0x10u;
    *(_BYTE *)(v173 + 97) = v149;
  }

  v4 = v152;
LABEL_473:

  return v173;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $5646BE895E83280503A1F7E74119B9AF flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $5646BE895E83280503A1F7E74119B9AF v19;
  PBDataReader *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v21);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = self->_sections;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = self->_sortPriorityMappings;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v12);
    }

    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      PBDataWriterWriteBOOLField();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = self->_clientRankingFeatureMetadatas;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v16);
    }

    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_autocompleteSessionData)
      PBDataWriterWriteSubmessage();
    if (self->_parsecQueryRankingFeatures)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_placeSummaryLayoutMetadata)
      PBDataWriterWriteSubmessage();
    v19 = self->_flags;
    if ((*(_WORD *)&v19 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $5646BE895E83280503A1F7E74119B9AF flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  $5646BE895E83280503A1F7E74119B9AF v31;
  PBUnknownFields *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 0);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = self->_sections;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3);
          -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v5, v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v10);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      *(_BYTE *)(v5 + 96) = self->_enableRap;
      *(_DWORD *)(v5 + 104) |= 8u;
      flags = self->_flags;
      if ((*(_WORD *)&flags & 0x100) == 0)
      {
LABEL_14:
        if ((*(_BYTE *)&flags & 4) == 0)
          goto LABEL_15;
        goto LABEL_46;
      }
    }
    else if ((*(_WORD *)&flags & 0x100) == 0)
    {
      goto LABEL_14;
    }
    *(_BYTE *)(v5 + 101) = self->_shouldDisplayNoResults;
    *(_DWORD *)(v5 + 104) |= 0x100u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
LABEL_46:
    *(_DWORD *)(v5 + 92) = self->_retainSearchTime;
    *(_DWORD *)(v5 + 104) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
    {
LABEL_17:
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v15 = self->_sortPriorityMappings;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v15);
            v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "copyWithZone:", a3);
            -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v5, v19);

          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v16);
      }

      if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      {
        *(_BYTE *)(v5 + 99) = self->_isTopSectionTypeQuery;
        *(_DWORD *)(v5 + 104) |= 0x40u;
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = self->_clientRankingFeatureMetadatas;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v35;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v20);
            v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v34);
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v5, v24);

          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v21);
      }

      if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      {
        *(_BYTE *)(v5 + 100) = self->_shouldDifferentiateClientAndServerResults;
        *(_DWORD *)(v5 + 104) |= 0x80u;
      }
      v25 = -[GEOPDAutocompleteSessionData copyWithZone:](self->_autocompleteSessionData, "copyWithZone:", a3, (_QWORD)v34);
      v26 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v25;

      v27 = -[GEOPDParsecQueryRankingFeatures copyWithZone:](self->_parsecQueryRankingFeatures, "copyWithZone:", a3);
      v28 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v27;

      if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
      {
        *(_BYTE *)(v5 + 102) = self->_shouldEnableGrayscaleHighlighting;
        *(_DWORD *)(v5 + 104) |= 0x200u;
      }
      v29 = -[GEOPDPlaceSummaryLayoutMetadata copyWithZone:](self->_placeSummaryLayoutMetadata, "copyWithZone:", a3);
      v30 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v29;

      v31 = self->_flags;
      if ((*(_WORD *)&v31 & 0x400) != 0)
      {
        *(_BYTE *)(v5 + 103) = self->_shouldUseDistanceFeatureServerResults;
        *(_DWORD *)(v5 + 104) |= 0x400u;
        v31 = self->_flags;
        if ((*(_BYTE *)&v31 & 1) == 0)
        {
LABEL_39:
          if ((*(_BYTE *)&v31 & 2) == 0)
            goto LABEL_40;
          goto LABEL_50;
        }
      }
      else if ((*(_BYTE *)&v31 & 1) == 0)
      {
        goto LABEL_39;
      }
      *(_DWORD *)(v5 + 84) = self->_clientResolvedTypeSetupPrompt;
      *(_DWORD *)(v5 + 104) |= 1u;
      v31 = self->_flags;
      if ((*(_BYTE *)&v31 & 2) == 0)
      {
LABEL_40:
        if ((*(_BYTE *)&v31 & 0x10) == 0)
        {
LABEL_42:
          v32 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v32;
          goto LABEL_43;
        }
LABEL_41:
        *(_BYTE *)(v5 + 97) = self->_enableStructuredRapAffordance;
        *(_DWORD *)(v5 + 104) |= 0x10u;
        goto LABEL_42;
      }
LABEL_50:
      *(_DWORD *)(v5 + 88) = self->_highlightType;
      *(_DWORD *)(v5 + 104) |= 2u;
      if ((*(_DWORD *)&self->_flags & 0x10) == 0)
        goto LABEL_42;
      goto LABEL_41;
    }
LABEL_16:
    *(_BYTE *)(v5 + 98) = self->_isNoResultFromNegativeCache;
    *(_DWORD *)(v5 + 104) |= 0x20u;
    goto LABEL_17;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDAutocompleteResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_43:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *sections;
  $5646BE895E83280503A1F7E74119B9AF flags;
  int v7;
  NSMutableArray *sortPriorityMappings;
  NSMutableArray *clientRankingFeatureMetadatas;
  GEOPDAutocompleteSessionData *autocompleteSessionData;
  GEOPDParsecQueryRankingFeatures *parsecQueryRankingFeatures;
  $5646BE895E83280503A1F7E74119B9AF v12;
  int v13;
  GEOPDPlaceSummaryLayoutMetadata *placeSummaryLayoutMetadata;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompleteResult readAll:]((uint64_t)v4, 1);
  sections = self->_sections;
  if ((unint64_t)sections | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:"))
      goto LABEL_91;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_91;
    if (self->_enableRap)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_91;
    if (self->_shouldDisplayNoResults)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_retainSearchTime != *((_DWORD *)v4 + 23))
      goto LABEL_91;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_91;
    if (self->_isNoResultFromNegativeCache)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  sortPriorityMappings = self->_sortPriorityMappings;
  if ((unint64_t)sortPriorityMappings | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](sortPriorityMappings, "isEqual:"))
      goto LABEL_91;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 26);
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_91;
    if (self->_isTopSectionTypeQuery)
    {
      if (!*((_BYTE *)v4 + 99))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  clientRankingFeatureMetadatas = self->_clientRankingFeatureMetadatas;
  if ((unint64_t)clientRankingFeatureMetadatas | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](clientRankingFeatureMetadatas, "isEqual:"))
      goto LABEL_91;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 26);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_91;
    if (self->_shouldDifferentiateClientAndServerResults)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_91;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  autocompleteSessionData = self->_autocompleteSessionData;
  if ((unint64_t)autocompleteSessionData | *((_QWORD *)v4 + 3)
    && !-[GEOPDAutocompleteSessionData isEqual:](autocompleteSessionData, "isEqual:"))
  {
    goto LABEL_91;
  }
  parsecQueryRankingFeatures = self->_parsecQueryRankingFeatures;
  if ((unint64_t)parsecQueryRankingFeatures | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDParsecQueryRankingFeatures isEqual:](parsecQueryRankingFeatures, "isEqual:"))
      goto LABEL_91;
  }
  v12 = self->_flags;
  v13 = *((_DWORD *)v4 + 26);
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0)
      goto LABEL_91;
    if (self->_shouldEnableGrayscaleHighlighting)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_91;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:"))
      goto LABEL_91;
    v12 = self->_flags;
    v13 = *((_DWORD *)v4 + 26);
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0)
      goto LABEL_91;
    if (self->_shouldUseDistanceFeatureServerResults)
    {
      if (!*((_BYTE *)v4 + 103))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 103))
    {
      goto LABEL_91;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_clientResolvedTypeSetupPrompt != *((_DWORD *)v4 + 21))
      goto LABEL_91;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_highlightType != *((_DWORD *)v4 + 22))
      goto LABEL_91;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) != 0)
    {
      if (self->_enableStructuredRapAffordance)
      {
        if (!*((_BYTE *)v4 + 97))
          goto LABEL_91;
      }
      else if (*((_BYTE *)v4 + 97))
      {
        goto LABEL_91;
      }
      v15 = 1;
      goto LABEL_92;
    }
LABEL_91:
    v15 = 0;
    goto LABEL_92;
  }
  v15 = (v13 & 0x10) == 0;
LABEL_92:

  return v15;
}

- (unint64_t)hash
{
  $5646BE895E83280503A1F7E74119B9AF flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $5646BE895E83280503A1F7E74119B9AF v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  -[GEOPDAutocompleteResult readAll:]((uint64_t)self, 1);
  v22 = -[NSMutableArray hash](self->_sections, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v21 = 2654435761 * self->_enableRap;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_shouldDisplayNoResults;
      if ((*(_BYTE *)&flags & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v19 = 0;
      if ((*(_BYTE *)&flags & 0x20) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v21 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v19 = 2654435761 * self->_retainSearchTime;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_5:
    v18 = 2654435761 * self->_isNoResultFromNegativeCache;
    goto LABEL_10;
  }
LABEL_9:
  v18 = 0;
LABEL_10:
  v4 = -[NSMutableArray hash](self->_sortPriorityMappings, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v5 = 2654435761 * self->_isTopSectionTypeQuery;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_clientRankingFeatureMetadatas, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v7 = 2654435761 * self->_shouldDifferentiateClientAndServerResults;
  else
    v7 = 0;
  v8 = -[GEOPDAutocompleteSessionData hash](self->_autocompleteSessionData, "hash");
  v9 = -[GEOPDParsecQueryRankingFeatures hash](self->_parsecQueryRankingFeatures, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    v10 = 2654435761 * self->_shouldEnableGrayscaleHighlighting;
  else
    v10 = 0;
  v11 = -[GEOPDPlaceSummaryLayoutMetadata hash](self->_placeSummaryLayoutMetadata, "hash");
  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    v13 = 2654435761 * self->_shouldUseDistanceFeatureServerResults;
    if ((*(_BYTE *)&v12 & 1) != 0)
    {
LABEL_21:
      v14 = 2654435761 * self->_clientResolvedTypeSetupPrompt;
      if ((*(_BYTE *)&v12 & 2) != 0)
        goto LABEL_22;
LABEL_26:
      v15 = 0;
      if ((*(_BYTE *)&v12 & 0x10) != 0)
        goto LABEL_23;
LABEL_27:
      v16 = 0;
      return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 1) != 0)
      goto LABEL_21;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 2) == 0)
    goto LABEL_26;
LABEL_22:
  v15 = 2654435761 * self->_highlightType;
  if ((*(_BYTE *)&v12 & 0x10) == 0)
    goto LABEL_27;
LABEL_23:
  v16 = 2654435761 * self->_enableStructuredRapAffordance;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPriorityMappings, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_parsecQueryRankingFeatures, 0);
  objc_storeStrong((id *)&self->_clientRankingFeatureMetadatas, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
