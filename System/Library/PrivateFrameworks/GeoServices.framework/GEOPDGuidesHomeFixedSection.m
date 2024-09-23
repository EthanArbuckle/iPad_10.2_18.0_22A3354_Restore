@implementation GEOPDGuidesHomeFixedSection

- (GEOPDGuidesHomeFixedSection)init
{
  GEOPDGuidesHomeFixedSection *v2;
  GEOPDGuidesHomeFixedSection *v3;
  GEOPDGuidesHomeFixedSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeFixedSection;
  v2 = -[GEOPDGuidesHomeFixedSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeFixedSection)initWithData:(id)a3
{
  GEOPDGuidesHomeFixedSection *v3;
  GEOPDGuidesHomeFixedSection *v4;
  GEOPDGuidesHomeFixedSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeFixedSection;
  v3 = -[GEOPDGuidesHomeFixedSection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2386);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeFixedSection _readName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 72) |= 0x20u;
  *(_BYTE *)(a1 + 72) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readFeaturedGuideIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeaturedGuideIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)featuredGuideIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addFeaturedGuideId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsFeaturedGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsFeaturedGuideId:(uint64_t)a1
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

- (void)_readBrowseByInterestFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrowseByInterestFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)browseByInterestFilters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeFixedSection _readBrowseByInterestFilters]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addBrowseByInterestFilter:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readBrowseByInterestFilters](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsBrowseByInterestFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsBrowseByInterestFilter:(uint64_t)a1
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

- (void)_readFilteredGuideIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilteredGuideIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filteredGuideIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addFilteredGuideId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds](a1);
    -[GEOPDGuidesHomeFixedSection _addNoFlagsFilteredGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsFilteredGuideId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDGuidesHomeFixedSection;
  -[GEOPDGuidesHomeFixedSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeFixedSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeFixedSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeFixedSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04AA0[v5];
    }
    if (a2)
      v7 = CFSTR("sectionType");
    else
      v7 = CFSTR("section_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDGuidesHomeFixedSection name]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("name"));

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("featuredGuideId");
    else
      v17 = CFSTR("featured_guide_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = *(id *)(a1 + 24);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("browseByInterestFilter");
    else
      v26 = CFSTR("browse_by_interest_filter");
    objc_msgSend(v4, "setObject:forKey:", v18, v26);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = *(id *)(a1 + 40);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v33, "jsonRepresentation");
          else
            objc_msgSend(v33, "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v30);
    }

    if (a2)
      v35 = CFSTR("filteredGuideId");
    else
      v35 = CFSTR("filtered_guide_id");
    objc_msgSend(v4, "setObject:forKey:", v27, v35);

  }
  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __57__GEOPDGuidesHomeFixedSection__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeFixedSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2404;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2405;
      GEOPDGuidesHomeFixedSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesHomeFixedSectionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __57__GEOPDGuidesHomeFixedSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOPDMapsIdentifier *v21;
  GEOPDMapsIdentifier *v22;
  GEOPDMapsIdentifier *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  GEOPDGuidesHomeResultFilter *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  GEOPDMapsIdentifier *v43;
  GEOPDMapsIdentifier *v44;
  GEOPDMapsIdentifier *v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_74;
  if ((_DWORD)a3)
    v7 = CFSTR("sectionType");
  else
    v7 = CFSTR("section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS")) & 1) != 0)
    {
      v10 = 2;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES")))
    {
      v10 = 3;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_18:
    *(_BYTE *)(v6 + 72) |= 0x40u;
    *(_BYTE *)(v6 + 72) |= 1u;
    *(_DWORD *)(v6 + 68) = v10;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    -[GEOPDGuidesHomeFixedSection setName:](v6, v12);

  }
  if ((_DWORD)a3)
    v13 = CFSTR("featuredGuideId");
  else
    v13 = CFSTR("featured_guide_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v47 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v57 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOPDMapsIdentifier alloc];
            if ((a3 & 1) != 0)
              v22 = -[GEOPDMapsIdentifier initWithJSON:](v21, "initWithJSON:", v20);
            else
              v22 = -[GEOPDMapsIdentifier initWithDictionary:](v21, "initWithDictionary:", v20);
            v23 = v22;
            -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](v6, v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v17);
    }

    v5 = v47;
  }

  if ((_DWORD)a3)
    v24 = CFSTR("browseByInterestFilter");
  else
    v24 = CFSTR("browse_by_interest_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v53;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v53 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v30);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = [GEOPDGuidesHomeResultFilter alloc];
            if (v32)
              v33 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v32, v31, a3);
            else
              v33 = 0;
            -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](v6, v33);

          }
          ++v30;
        }
        while (v28 != v30);
        v34 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        v28 = v34;
      }
      while (v34);
    }

    v5 = v47;
  }

  if ((_DWORD)a3)
    v35 = CFSTR("filteredGuideId");
  else
    v35 = CFSTR("filtered_guide_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v49 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v43 = [GEOPDMapsIdentifier alloc];
            if ((a3 & 1) != 0)
              v44 = -[GEOPDMapsIdentifier initWithJSON:](v43, "initWithJSON:", v42);
            else
              v44 = -[GEOPDMapsIdentifier initWithDictionary:](v43, "initWithDictionary:", v42);
            v45 = v44;
            -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](v6, v44);

          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v39);
    }

    v5 = v47;
  }

LABEL_74:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesHomeFixedSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteStringField();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_featuredGuideIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_browseByInterestFilters;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_filteredGuideIds;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeFixedSection _readFeaturedGuideIds](a1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2) & 1) != 0)
        goto LABEL_19;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

  -[GEOPDGuidesHomeFixedSection _readFilteredGuideIds](a1);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_12:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2, (_QWORD)v15) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
LABEL_19:
    v13 = 1;
    goto LABEL_20;
  }
LABEL_18:
  v13 = 0;
LABEL_20:

  return v13;
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGuidesHomeFixedSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_sectionType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = self->_featuredGuideIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v12);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = self->_browseByInterestFilters;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v17);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_filteredGuideIds;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v28);
        -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](v5, v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v22);
  }

  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSMutableArray *featuredGuideIds;
  NSMutableArray *browseByInterestFilters;
  NSMutableArray *filteredGuideIds;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_15;
  featuredGuideIds = self->_featuredGuideIds;
  if ((unint64_t)featuredGuideIds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](featuredGuideIds, "isEqual:"))
      goto LABEL_15;
  }
  browseByInterestFilters = self->_browseByInterestFilters;
  if ((unint64_t)browseByInterestFilters | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](browseByInterestFilters, "isEqual:"))
      goto LABEL_15;
  }
  filteredGuideIds = self->_filteredGuideIds;
  if ((unint64_t)filteredGuideIds | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](filteredGuideIds, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_sectionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_featuredGuideIds, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_browseByInterestFilters, "hash");
  return v6 ^ -[NSMutableArray hash](self->_filteredGuideIds, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[GEOPDGuidesHomeFixedSection readAll:]((uint64_t)v3, 0);
  if ((*((_BYTE *)v3 + 72) & 1) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v3 + 17);
    *(_BYTE *)(a1 + 72) |= 1u;
  }
  v4 = (void *)*((_QWORD *)v3 + 6);
  if (v4)
    -[GEOPDGuidesHomeFixedSection setName:](a1, v4);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *((id *)v3 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDGuidesHomeFixedSection addFeaturedGuideId:](a1, *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v3 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[GEOPDGuidesHomeFixedSection addBrowseByInterestFilter:](a1, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v3 + 5);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[GEOPDGuidesHomeFixedSection addFilteredGuideId:](a1, *(void **)(*((_QWORD *)&v20 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 2u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDGuidesHomeFixedSection readAll:](a1, 0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v5);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v10);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "clearUnknownFields:", 1, (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v15);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_filteredGuideIds, 0);
  objc_storeStrong((id *)&self->_featuredGuideIds, 0);
  objc_storeStrong((id *)&self->_browseByInterestFilters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
