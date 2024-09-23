@implementation GEOPDSearchTriggerFeature

- (GEOPDSearchTriggerFeature)init
{
  GEOPDSearchTriggerFeature *v2;
  GEOPDSearchTriggerFeature *v3;
  GEOPDSearchTriggerFeature *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTriggerFeature;
  v2 = -[GEOPDSearchTriggerFeature init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTriggerFeature)initWithData:(id)a3
{
  GEOPDSearchTriggerFeature *v3;
  GEOPDSearchTriggerFeature *v4;
  GEOPDSearchTriggerFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTriggerFeature;
  v3 = -[GEOPDSearchTriggerFeature initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchTriggerFeature;
  -[GEOPDSearchTriggerFeature dealloc](&v3, sel_dealloc);
}

- (void)_readPrefCategorys
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(_BYTE *)(a1 + 198) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefCategorys_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
}

- (void)addPrefCategory:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchTriggerFeature _readPrefCategorys]((uint64_t)a1);
    -[GEOPDSearchTriggerFeature _addNoFlagsPrefCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[49]._os_unfair_lock_opaque |= 0x40000u;
    os_unfair_lock_unlock(a1 + 44);
    a1[49]._os_unfair_lock_opaque |= 0x200000u;
  }
}

- (void)_addNoFlagsPrefCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addModernToLegacyIdMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 198) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernToLegacyIdMappings_tags_1819);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    -[GEOPDSearchTriggerFeature _addNoFlagsModernToLegacyIdMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 196) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    *(_DWORD *)(a1 + 196) |= 0x200000u;
  }
}

- (void)_addNoFlagsModernToLegacyIdMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addRelatedCategories:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 198) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedCategories_tags_1820);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    -[GEOPDSearchTriggerFeature _addNoFlagsRelatedCategories:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 196) |= 0x80000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
    *(_DWORD *)(a1 + 196) |= 0x200000u;
  }
}

- (void)_addNoFlagsRelatedCategories:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
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
  v8.super_class = (Class)GEOPDSearchTriggerFeature;
  -[GEOPDSearchTriggerFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchTriggerFeature dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTriggerFeature _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  double v17;
  int v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  int v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchTriggerFeature readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(_BYTE *)(a1 + 198) & 0x10) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrigger_tags_1816);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  v7 = *(id *)(a1 + 152);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("trigger"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(_BYTE *)(a1 + 197) & 0x40) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCanonicalName_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  v10 = *(id *)(a1 + 40);
  if (v10)
  {
    if (a2)
      v11 = CFSTR("canonicalName");
    else
      v11 = CFSTR("canonical_name");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 197) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 188));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("tag"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(_BYTE *)(a1 + 198) & 1) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntityId_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  v15 = *(id *)(a1 + 64);
  if (v15)
  {
    if (a2)
      v16 = CFSTR("entityId");
    else
      v16 = CFSTR("entity_id");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  v18 = *(_DWORD *)(a1 + 196);
  if ((v18 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("globalPopularity");
    else
      v20 = CFSTR("global_popularity");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v18 = *(_DWORD *)(a1 + 196);
  }
  if ((v18 & 0x400) != 0)
  {
    LODWORD(v17) = *(_DWORD *)(a1 + 184);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("localPmiScore");
    else
      v22 = CFSTR("local_pmi_score");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    v18 = *(_DWORD *)(a1 + 196);
  }
  if ((v18 & 0x200) != 0)
  {
    LODWORD(v17) = *(_DWORD *)(a1 + 180);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("globalPmiScore");
    else
      v24 = CFSTR("global_pmi_Score");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v18 = *(_DWORD *)(a1 + 196);
  }
  if ((v18 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("lat"));

    v18 = *(_DWORD *)(a1 + 196);
  }
  if ((v18 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("lng"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
  if ((*(_BYTE *)(a1 + 197) & 0x80) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_1817);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  v29 = *(id *)(a1 + 56);
  if (v29)
  {
    if (a2)
      v30 = CFSTR("displayName");
    else
      v30 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  if ((*(_BYTE *)(a1 + 196) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 104));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("localPopularity"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v34 = 0;
      do
      {
        v35 = *(int *)(*v33 + 4 * v34);
        if (v35 >= 0xF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E1C0AB10[v35];
        }
        objc_msgSend(v32, "addObject:", v36);

        ++v34;
        v33 = (_QWORD *)(a1 + 16);
      }
      while (v34 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v37 = CFSTR("completionSourceTypes");
    else
      v37 = CFSTR("completion_source_types");
    objc_msgSend(v4, "setObject:forKey:", v32, v37);

  }
  v38 = *(_DWORD *)(a1 + 196);
  if ((v38 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 192));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("isUseShowOnMapHighlightExtra");
    else
      v40 = CFSTR("is_use_show_on_map_highlight_extra");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v38 = *(_DWORD *)(a1 + 196);
  }
  if ((v38 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 144));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v42 = CFSTR("similarityScore");
    else
      v42 = CFSTR("similarity_score");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

    v38 = *(_DWORD *)(a1 + 196);
  }
  if ((v38 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 160));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("w2vSimilarityScore");
    else
      v44 = CFSTR("w2v_similarity_score");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    v38 = *(_DWORD *)(a1 + 196);
  }
  if ((v38 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 72));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("globalEntityPopularity");
    else
      v46 = CFSTR("global_entity_popularity");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v38 = *(_DWORD *)(a1 + 196);
  }
  if ((v38 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 112));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("localEntityPopularity");
    else
      v48 = CFSTR("local_entity_popularity");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  if (*(_QWORD *)(a1 + 128))
  {
    -[GEOPDSearchTriggerFeature _readPrefCategorys](a1);
    v49 = *(id *)(a1 + 128);
    if (a2)
      v50 = CFSTR("prefCategory");
    else
      v50 = CFSTR("pref_category");
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v52 = *(id *)(a1 + 120);
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v75 != v54)
            objc_enumerationMutation(v52);
          v56 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v56, "jsonRepresentation");
          else
            objc_msgSend(v56, "dictionaryRepresentation");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v57);

        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v53);
    }

    if (a2)
      v58 = CFSTR("modernToLegacyIdMapping");
    else
      v58 = CFSTR("modern_to_legacy_id_mapping");
    objc_msgSend(v4, "setObject:forKey:", v51, v58);

  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v60 = *(id *)(a1 + 136);
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v71 != v62)
            objc_enumerationMutation(v60);
          v64 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v64, "jsonRepresentation");
          else
            objc_msgSend(v64, "dictionaryRepresentation");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v65);

        }
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      }
      while (v61);
    }

    if (a2)
      v66 = CFSTR("relatedCategories");
    else
      v66 = CFSTR("related_categories");
    objc_msgSend(v4, "setObject:forKey:", v59, v66);

  }
  if ((*(_BYTE *)(a1 + 196) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v68 = CFSTR("densityScore");
    else
      v68 = CFSTR("density_score");
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchTriggerFeature _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1865;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1866;
      GEOPDSearchTriggerFeatureReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchTriggerFeatureCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTriggerFeatureReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $6A6745F6389B2197FDCF6C2BED3202A6 flags;
  unint64_t v7;
  $6A6745F6389B2197FDCF6C2BED3202A6 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  PBDataReader *v21;
  void *v22;
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
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3FE000) == 0)
    {
      v21 = self->_reader;
      objc_sync_enter(v21);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v22);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v21);
      goto LABEL_64;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 0);
  if (self->_trigger)
    PBDataWriterWriteStringField();
  if (self->_canonicalName)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_entityId)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteFloatField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteFloatField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
LABEL_16:
    PBDataWriterWriteDoubleField();
LABEL_17:
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_completionSourceTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_completionSourceTypes.count);
  }
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_flags;
    if ((*(_BYTE *)&v8 & 0x80) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v8 & 0x100) == 0)
        goto LABEL_27;
      goto LABEL_60;
    }
  }
  else if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteDoubleField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_28;
LABEL_61:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 2) != 0)
    goto LABEL_61;
LABEL_28:
  if ((*(_BYTE *)&v8 & 0x40) != 0)
LABEL_29:
    PBDataWriterWriteInt64Field();
LABEL_30:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = self->_prefCategorys;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = self->_modernToLegacyIdMappings;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_relatedCategories;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt64Field();
LABEL_64:

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
  uint64_t v13;
  void *v14;
  $6A6745F6389B2197FDCF6C2BED3202A6 flags;
  uint64_t v16;
  void *v17;
  $6A6745F6389B2197FDCF6C2BED3202A6 v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
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
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchTriggerFeatureReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_trigger, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v9;

  v11 = -[NSString copyWithZone:](self->_canonicalName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_tag;
    *(_DWORD *)(v5 + 196) |= 0x800u;
  }
  v13 = -[NSString copyWithZone:](self->_entityId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_globalPopularity;
    *(_DWORD *)(v5 + 196) |= 4u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_9;
  }
  *(float *)(v5 + 184) = self->_localPmiScore;
  *(_DWORD *)(v5 + 196) |= 0x400u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v5 + 180) = self->_globalPmiScore;
  *(_DWORD *)(v5 + 196) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_48:
  *(double *)(v5 + 88) = self->_lat;
  *(_DWORD *)(v5 + 196) |= 8u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    *(double *)(v5 + 96) = self->_lng;
    *(_DWORD *)(v5 + 196) |= 0x10u;
  }
LABEL_13:
  v16 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_localPopularity;
    *(_DWORD *)(v5 + 196) |= 0x20u;
  }
  PBRepeatedInt32Copy();
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 192) = self->_isUseShowOnMapHighlightExtra;
    *(_DWORD *)(v5 + 196) |= 0x1000u;
    v18 = self->_flags;
    if ((*(_BYTE *)&v18 & 0x80) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v18 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_52;
    }
  }
  else if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *(double *)(v5 + 144) = self->_similarityScore;
  *(_DWORD *)(v5 + 196) |= 0x80u;
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v18 & 2) == 0)
      goto LABEL_19;
LABEL_53:
    *(_QWORD *)(v5 + 72) = self->_globalEntityPopularity;
    *(_DWORD *)(v5 + 196) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_52:
  *(double *)(v5 + 160) = self->_w2vSimilarityScore;
  *(_DWORD *)(v5 + 196) |= 0x100u;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 2) != 0)
    goto LABEL_53;
LABEL_19:
  if ((*(_BYTE *)&v18 & 0x40) != 0)
  {
LABEL_20:
    *(_QWORD *)(v5 + 112) = self->_localEntityPopularity;
    *(_DWORD *)(v5 + 196) |= 0x40u;
  }
LABEL_21:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = self->_prefCategorys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchTriggerFeature addPrefCategory:]((os_unfair_lock_s *)v5, v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v20);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = self->_modernToLegacyIdMappings;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDSearchTriggerFeature addModernToLegacyIdMapping:](v5, v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v25);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = self->_relatedCategories;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v35);
        -[GEOPDSearchTriggerFeature addRelatedCategories:](v5, v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v30);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_densityScore;
    *(_DWORD *)(v5 + 196) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *trigger;
  NSString *canonicalName;
  $6A6745F6389B2197FDCF6C2BED3202A6 flags;
  int v8;
  NSString *entityId;
  NSString *displayName;
  $6A6745F6389B2197FDCF6C2BED3202A6 v11;
  int v12;
  NSMutableArray *prefCategorys;
  NSMutableArray *modernToLegacyIdMappings;
  NSMutableArray *relatedCategories;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_87;
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 1);
  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](trigger, "isEqual:"))
      goto LABEL_87;
  }
  canonicalName = self->_canonicalName;
  if ((unint64_t)canonicalName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](canonicalName, "isEqual:"))
      goto LABEL_87;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 49);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_tag != *((_DWORD *)v4 + 47))
      goto LABEL_87;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  entityId = self->_entityId;
  if ((unint64_t)entityId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](entityId, "isEqual:"))
      goto LABEL_87;
    flags = self->_flags;
    v8 = *((_DWORD *)v4 + 49);
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_globalPopularity != *((_QWORD *)v4 + 10))
      goto LABEL_87;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_localPmiScore != *((float *)v4 + 46))
      goto LABEL_87;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_globalPmiScore != *((float *)v4 + 45))
      goto LABEL_87;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_lat != *((double *)v4 + 11))
      goto LABEL_87;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_lng != *((double *)v4 + 12))
      goto LABEL_87;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_87;
    flags = self->_flags;
    v8 = *((_DWORD *)v4 + 49);
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_localPopularity != *((_QWORD *)v4 + 13))
      goto LABEL_87;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_87:
    v16 = 0;
    goto LABEL_88;
  }
  v11 = self->_flags;
  v12 = *((_DWORD *)v4 + 49);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) != 0)
    {
      if (self->_isUseShowOnMapHighlightExtra)
      {
        if (!*((_BYTE *)v4 + 192))
          goto LABEL_87;
        goto LABEL_56;
      }
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_56;
    }
    goto LABEL_87;
  }
  if ((v12 & 0x1000) != 0)
    goto LABEL_87;
LABEL_56:
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_similarityScore != *((double *)v4 + 18))
      goto LABEL_87;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_w2vSimilarityScore != *((double *)v4 + 20))
      goto LABEL_87;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_globalEntityPopularity != *((_QWORD *)v4 + 9))
      goto LABEL_87;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_localEntityPopularity != *((_QWORD *)v4 + 14))
      goto LABEL_87;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  prefCategorys = self->_prefCategorys;
  if ((unint64_t)prefCategorys | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](prefCategorys, "isEqual:"))
  {
    goto LABEL_87;
  }
  modernToLegacyIdMappings = self->_modernToLegacyIdMappings;
  if ((unint64_t)modernToLegacyIdMappings | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](modernToLegacyIdMappings, "isEqual:"))
      goto LABEL_87;
  }
  relatedCategories = self->_relatedCategories;
  if ((unint64_t)relatedCategories | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](relatedCategories, "isEqual:"))
      goto LABEL_87;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_DWORD *)v4 + 49) & 1) == 0 || self->_densityScore != *((_QWORD *)v4 + 6))
      goto LABEL_87;
    v16 = 1;
  }
  else
  {
    v16 = (*((_DWORD *)v4 + 49) & 1) == 0;
  }
LABEL_88:

  return v16;
}

- (unint64_t)hash
{
  $6A6745F6389B2197FDCF6C2BED3202A6 flags;
  float localPmiScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float globalPmiScore;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double lat;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double lng;
  double v21;
  long double v22;
  double v23;
  $6A6745F6389B2197FDCF6C2BED3202A6 v24;
  unint64_t v25;
  double similarityScore;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  double w2vSimilarityScore;
  double v33;
  long double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  NSUInteger v51;
  uint64_t v52;
  NSUInteger v53;
  NSUInteger v54;

  -[GEOPDSearchTriggerFeature readAll:]((uint64_t)self, 1);
  v54 = -[NSString hash](self->_trigger, "hash");
  v53 = -[NSString hash](self->_canonicalName, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    v52 = 2654435761 * self->_tag;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_entityId, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    v50 = 2654435761 * self->_globalPopularity;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_14;
  }
  v50 = 0;
  if ((*(_WORD *)&flags & 0x400) == 0)
    goto LABEL_11;
LABEL_6:
  localPmiScore = self->_localPmiScore;
  v5 = localPmiScore;
  if (localPmiScore < 0.0)
    v5 = -localPmiScore;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    globalPmiScore = self->_globalPmiScore;
    v11 = globalPmiScore;
    if (globalPmiScore < 0.0)
      v11 = -globalPmiScore;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    lat = self->_lat;
    v16 = -lat;
    if (lat >= 0.0)
      v16 = self->_lat;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v48 = v14;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    lng = self->_lng;
    v21 = -lng;
    if (lng >= 0.0)
      v21 = self->_lng;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v47 = v19;
  v46 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v45 = 2654435761 * self->_localPopularity;
  else
    v45 = 0;
  v44 = PBRepeatedInt32Hash();
  v24 = self->_flags;
  if ((*(_WORD *)&v24 & 0x1000) != 0)
    v43 = 2654435761 * self->_isUseShowOnMapHighlightExtra;
  else
    v43 = 0;
  v49 = v9;
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    similarityScore = self->_similarityScore;
    v27 = -similarityScore;
    if (similarityScore >= 0.0)
      v27 = self->_similarityScore;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  v30 = v8;
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    w2vSimilarityScore = self->_w2vSimilarityScore;
    v33 = -w2vSimilarityScore;
    if (w2vSimilarityScore >= 0.0)
      v33 = self->_w2vSimilarityScore;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  if ((*(_BYTE *)&v24 & 2) != 0)
  {
    v36 = 2654435761 * self->_globalEntityPopularity;
    if ((*(_BYTE *)&v24 & 0x40) != 0)
      goto LABEL_62;
  }
  else
  {
    v36 = 0;
    if ((*(_BYTE *)&v24 & 0x40) != 0)
    {
LABEL_62:
      v37 = 2654435761 * self->_localEntityPopularity;
      goto LABEL_65;
    }
  }
  v37 = 0;
LABEL_65:
  v38 = -[NSMutableArray hash](self->_prefCategorys, "hash");
  v39 = -[NSMutableArray hash](self->_modernToLegacyIdMappings, "hash");
  v40 = -[NSMutableArray hash](self->_relatedCategories, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v41 = 2654435761 * self->_densityScore;
  else
    v41 = 0;
  return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v30 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v25 ^ v31 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_relatedCategories, 0);
  objc_storeStrong((id *)&self->_prefCategorys, 0);
  objc_storeStrong((id *)&self->_modernToLegacyIdMappings, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_canonicalName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
