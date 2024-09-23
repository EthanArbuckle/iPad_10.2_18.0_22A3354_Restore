@implementation GEOPDSearchQuerySynonymMetadata

- (GEOPDSearchQuerySynonymMetadata)init
{
  GEOPDSearchQuerySynonymMetadata *v2;
  GEOPDSearchQuerySynonymMetadata *v3;
  GEOPDSearchQuerySynonymMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  v2 = -[GEOPDSearchQuerySynonymMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQuerySynonymMetadata)initWithData:(id)a3
{
  GEOPDSearchQuerySynonymMetadata *v3;
  GEOPDSearchQuerySynonymMetadata *v4;
  GEOPDSearchQuerySynonymMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  v3 = -[GEOPDSearchQuerySynonymMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRefinementQueries
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementQueries_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addRefinementQueries:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQuerySynonymMetadata _readRefinementQueries]((uint64_t)a1);
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsRefinementQueries:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[29]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 24);
    a1[29]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsRefinementQueries:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readGeoHashes
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoHashes_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addGeoHashes:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQuerySynonymMetadata _readGeoHashes]((uint64_t)a1);
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsGeoHashes:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[29]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 24);
    a1[29]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsGeoHashes:(uint64_t)a1
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

- (void)addFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 117) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureMaps_tags_1505);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDSearchQuerySynonymMetadata _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 116) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_DWORD *)(a1 + 116) |= 0x10000u;
  }
}

- (void)_addNoFlagsFeatureMap:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQuerySynonymMetadata;
  -[GEOPDSearchQuerySynonymMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQuerySynonymMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQuerySynonymMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  double v18;
  id v19;
  const __CFString *v20;
  int v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  id v39;
  const __CFString *v40;
  void *v41;
  id v42;
  id v43;
  const __CFString *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  const __CFString *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQuerySynonymMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 116) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("id"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 8) == 0)
  {
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = v6;
      objc_sync_enter(v7);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKey_tags_1);
      objc_sync_exit(v7);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v8 = *(id *)(a1 + 48);
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("key"));

  if (*(_QWORD *)(a1 + 72))
  {
    -[GEOPDSearchQuerySynonymMetadata _readRefinementQueries](a1);
    v9 = *(id *)(a1 + 72);
    if (a2)
      v10 = CFSTR("refinementQueries");
    else
      v10 = CFSTR("refinement_queries");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 0x10) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguage_tags_0);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v13 = *(id *)(a1 + 56);
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("language"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 1) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_1504);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v16 = *(id *)(a1 + 16);
  if (v16)
  {
    if (a2)
      v17 = CFSTR("countryCode");
    else
      v17 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    -[GEOPDSearchQuerySynonymMetadata _readGeoHashes](a1);
    v19 = *(id *)(a1 + 32);
    if (a2)
      v20 = CFSTR("geoHashes");
    else
      v20 = CFSTR("geo_hashes");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(_DWORD *)(a1 + 116);
  if ((v21 & 2) != 0)
  {
    LODWORD(v18) = *(_DWORD *)(a1 + 100);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("confidence"));

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 8) != 0)
  {
    v23 = *(int *)(a1 + 108);
    if (v23 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 108));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E1C0AAD8[v23];
    }
    if (a2)
      v25 = CFSTR("rewriteProvider");
    else
      v25 = CFSTR("rewrite_provider");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 115));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("useGeoHashes");
    else
      v27 = CFSTR("use_geo_hashes");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("hardRewrite");
    else
      v29 = CFSTR("hard_rewrite");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 4) != 0)
  {
    v30 = *(int *)(a1 + 104);
    if (v30 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 104));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E1C0AAD8[v30];
    }
    if (a2)
      v32 = CFSTR("originalProvider");
    else
      v32 = CFSTR("original_provider");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 114));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("isWeakLexicalMatch");
    else
      v34 = CFSTR("is_weak_lexical_match");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v21 = *(_DWORD *)(a1 + 116);
  }
  if ((v21 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 113));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("isOrgQueryPrefixOfRefinement");
    else
      v36 = CFSTR("is_org_query_prefix_of_refinement");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 0x20) == 0)
  {
    v37 = *(void **)(a1 + 8);
    if (v37)
    {
      v38 = v37;
      objc_sync_enter(v38);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalQueryDisplayString_tags);
      objc_sync_exit(v38);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v39 = *(id *)(a1 + 64);
  if (v39)
  {
    if (a2)
      v40 = CFSTR("originalQueryDisplayString");
    else
      v40 = CFSTR("original_query_display_string");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_BYTE *)(a1 + 117) & 0x80) == 0)
  {
    v41 = *(void **)(a1 + 8);
    if (v41)
    {
      v42 = v41;
      objc_sync_enter(v42);
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSynonymQueryDisplayString_tags);
      objc_sync_exit(v42);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v43 = *(id *)(a1 + 80);
  if (v43)
  {
    if (a2)
      v44 = CFSTR("synonymQueryDisplayString");
    else
      v44 = CFSTR("synonym_query_display_string");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = *(id *)(a1 + 24);
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v55 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v50, "jsonRepresentation");
          else
            objc_msgSend(v50, "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v51);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v47);
    }

    if (a2)
      v52 = CFSTR("featureMap");
    else
      v52 = CFSTR("feature_map");
    objc_msgSend(v4, "setObject:forKey:", v45, v52);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQuerySynonymMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1552;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1553;
      GEOPDSearchQuerySynonymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQuerySynonymMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  const __CFString *v39;
  void *v40;
  id v41;
  int v42;
  const __CFString *v43;
  void *v44;
  char v45;
  const __CFString *v46;
  void *v47;
  char v48;
  const __CFString *v49;
  void *v50;
  id v51;
  int v52;
  const __CFString *v53;
  void *v54;
  char v55;
  const __CFString *v56;
  void *v57;
  char v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  id v66;
  const __CFString *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  GEOPDSearchPair *v75;
  void *v76;
  uint64_t v77;
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
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_126;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 1u;
    *(_QWORD *)(v6 + 40) = v8;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    v11 = v10;
    *(_DWORD *)(v6 + 116) |= 0x800u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 48), v10);

  }
  if (a3)
    v12 = CFSTR("refinementQueries");
  else
    v12 = CFSTR("refinement_queries");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v88;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v88 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = (void *)objc_msgSend(v19, "copy");
            -[GEOPDSearchQuerySynonymMetadata addRefinementQueries:]((os_unfair_lock_s *)v6, v20);

          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      }
      while (v16);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("language"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    v23 = v22;
    *(_DWORD *)(v6 + 116) |= 0x1000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 56), v22);

  }
  if (a3)
    v24 = CFSTR("countryCode");
  else
    v24 = CFSTR("country_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    v27 = v26;
    *(_DWORD *)(v6 + 116) |= 0x100u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 16), v26);

  }
  if (a3)
    v28 = CFSTR("geoHashes");
  else
    v28 = CFSTR("geo_hashes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v84;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v84 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v34);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = (void *)objc_msgSend(v35, "copy");
            -[GEOPDSearchQuerySynonymMetadata addGeoHashes:]((os_unfair_lock_s *)v6, v36);

          }
          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
      }
      while (v32);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v37, "floatValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 2u;
    *(_DWORD *)(v6 + 100) = v38;
  }

  if (a3)
    v39 = CFSTR("rewriteProvider");
  else
    v39 = CFSTR("rewrite_provider");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v40;
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("NONE_TYPE")) & 1) != 0)
    {
      v42 = 0;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("FWDGEO")) & 1) != 0)
    {
      v42 = 1;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("LOCALSEARCH")) & 1) != 0)
    {
      v42 = 2;
    }
    else if (objc_msgSend(v41, "isEqualToString:", CFSTR("POIGEOMIXED")))
    {
      v42 = 3;
    }
    else
    {
      v42 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_60;
    v42 = objc_msgSend(v40, "intValue");
  }
  *(_DWORD *)(v6 + 116) |= 0x10000u;
  *(_DWORD *)(v6 + 116) |= 8u;
  *(_DWORD *)(v6 + 108) = v42;
LABEL_60:

  if (a3)
    v43 = CFSTR("useGeoHashes");
  else
    v43 = CFSTR("use_geo_hashes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = objc_msgSend(v44, "BOOLValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x80u;
    *(_BYTE *)(v6 + 115) = v45;
  }

  if (a3)
    v46 = CFSTR("hardRewrite");
  else
    v46 = CFSTR("hard_rewrite");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = objc_msgSend(v47, "BOOLValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x10u;
    *(_BYTE *)(v6 + 112) = v48;
  }

  if (a3)
    v49 = CFSTR("originalProvider");
  else
    v49 = CFSTR("original_provider");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = v50;
    if ((objc_msgSend(v51, "isEqualToString:", CFSTR("NONE_TYPE")) & 1) != 0)
    {
      v52 = 0;
    }
    else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("FWDGEO")) & 1) != 0)
    {
      v52 = 1;
    }
    else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("LOCALSEARCH")) & 1) != 0)
    {
      v52 = 2;
    }
    else if (objc_msgSend(v51, "isEqualToString:", CFSTR("POIGEOMIXED")))
    {
      v52 = 3;
    }
    else
    {
      v52 = 0;
    }

    goto LABEL_86;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = objc_msgSend(v50, "intValue");
LABEL_86:
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 4u;
    *(_DWORD *)(v6 + 104) = v52;
  }

  if (a3)
    v53 = CFSTR("isWeakLexicalMatch");
  else
    v53 = CFSTR("is_weak_lexical_match");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = objc_msgSend(v54, "BOOLValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x40u;
    *(_BYTE *)(v6 + 114) = v55;
  }

  if (a3)
    v56 = CFSTR("isOrgQueryPrefixOfRefinement");
  else
    v56 = CFSTR("is_org_query_prefix_of_refinement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = objc_msgSend(v57, "BOOLValue");
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    *(_DWORD *)(v6 + 116) |= 0x20u;
    *(_BYTE *)(v6 + 113) = v58;
  }

  if (a3)
    v59 = CFSTR("originalQueryDisplayString");
  else
    v59 = CFSTR("original_query_display_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = (void *)objc_msgSend(v60, "copy");
    v62 = v61;
    *(_DWORD *)(v6 + 116) |= 0x2000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 64), v61);

  }
  if (a3)
    v63 = CFSTR("synonymQueryDisplayString");
  else
    v63 = CFSTR("synonym_query_display_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = (void *)objc_msgSend(v64, "copy");
    v66 = v65;
    *(_DWORD *)(v6 + 116) |= 0x8000u;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    objc_storeStrong((id *)(v6 + 80), v65);

  }
  if (a3)
    v67 = CFSTR("featureMap");
  else
    v67 = CFSTR("feature_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v69 = v68;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v80;
      do
      {
        v73 = 0;
        do
        {
          if (*(_QWORD *)v80 != v72)
            objc_enumerationMutation(v69);
          v74 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v73);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v75 = [GEOPDSearchPair alloc];
            if (v75)
              v76 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v75, v74);
            else
              v76 = 0;
            -[GEOPDSearchQuerySynonymMetadata addFeatureMap:](v6, v76);

          }
          ++v73;
        }
        while (v71 != v73);
        v77 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
        v71 = v77;
      }
      while (v77);
    }

  }
LABEL_126:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQuerySynonymMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x1FF00) == 0))
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_key)
      PBDataWriterWriteStringField();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_refinementQueries;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    if (self->_language)
      PBDataWriterWriteStringField();
    if (self->_countryCode)
      PBDataWriterWriteStringField();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_geoHashes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_originalQueryDisplayString)
      PBDataWriterWriteStringField();
    if (self->_synonymQueryDisplayString)
      PBDataWriterWriteStringField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_featureMaps;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
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
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQuerySynonymMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_identifier;
    *(_DWORD *)(v5 + 116) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = self->_refinementQueries;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchQuerySynonymMetadata addRefinementQueries:]((os_unfair_lock_s *)v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = self->_geoHashes;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDSearchQuerySynonymMetadata addGeoHashes:]((os_unfair_lock_s *)v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v21);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(float *)(v5 + 100) = self->_confidence;
    *(_DWORD *)(v5 + 116) |= 2u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_24;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 108) = self->_rewriteProvider;
  *(_DWORD *)(v5 + 116) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_40;
  }
LABEL_39:
  *(_BYTE *)(v5 + 115) = self->_useGeoHashes;
  *(_DWORD *)(v5 + 116) |= 0x80u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_26;
    goto LABEL_41;
  }
LABEL_40:
  *(_BYTE *)(v5 + 112) = self->_hardRewrite;
  *(_DWORD *)(v5 + 116) |= 0x10u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 104) = self->_originalProvider;
  *(_DWORD *)(v5 + 116) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_42:
  *(_BYTE *)(v5 + 114) = self->_isWeakLexicalMatch;
  *(_DWORD *)(v5 + 116) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_28:
    *(_BYTE *)(v5 + 113) = self->_isOrgQueryPrefixOfRefinement;
    *(_DWORD *)(v5 + 116) |= 0x20u;
  }
LABEL_29:
  v26 = -[NSString copyWithZone:](self->_originalQueryDisplayString, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v26;

  v28 = -[NSString copyWithZone:](self->_synonymQueryDisplayString, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v28;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = self->_featureMaps;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v8);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v35);
        -[GEOPDSearchQuerySynonymMetadata addFeatureMap:](v5, v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v30);
  }
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *key;
  NSMutableArray *refinementQueries;
  NSString *language;
  NSString *countryCode;
  NSMutableArray *geoHashes;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags;
  int v12;
  NSString *originalQueryDisplayString;
  NSString *synonymQueryDisplayString;
  NSMutableArray *featureMaps;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_70;
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_identifier != *((_QWORD *)v4 + 5))
      goto LABEL_70;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_70;
  }
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](key, "isEqual:"))
    goto LABEL_70;
  refinementQueries = self->_refinementQueries;
  if ((unint64_t)refinementQueries | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](refinementQueries, "isEqual:"))
      goto LABEL_70;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_70;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_70;
  }
  geoHashes = self->_geoHashes;
  if ((unint64_t)geoHashes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](geoHashes, "isEqual:"))
      goto LABEL_70;
  }
  flags = self->_flags;
  v12 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_confidence != *((float *)v4 + 25))
      goto LABEL_70;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_rewriteProvider != *((_DWORD *)v4 + 27))
      goto LABEL_70;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_70;
    if (self->_useGeoHashes)
    {
      if (!*((_BYTE *)v4 + 115))
        goto LABEL_70;
    }
    else if (*((_BYTE *)v4 + 115))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0)
      goto LABEL_70;
    if (self->_hardRewrite)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_70;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_originalProvider != *((_DWORD *)v4 + 26))
      goto LABEL_70;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0)
      goto LABEL_70;
    if (self->_isWeakLexicalMatch)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_70;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_70;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) != 0)
    {
      if (self->_isOrgQueryPrefixOfRefinement)
      {
        if (!*((_BYTE *)v4 + 113))
          goto LABEL_70;
        goto LABEL_64;
      }
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_64;
    }
LABEL_70:
    v16 = 0;
    goto LABEL_71;
  }
  if ((v12 & 0x20) != 0)
    goto LABEL_70;
LABEL_64:
  originalQueryDisplayString = self->_originalQueryDisplayString;
  if ((unint64_t)originalQueryDisplayString | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](originalQueryDisplayString, "isEqual:"))
  {
    goto LABEL_70;
  }
  synonymQueryDisplayString = self->_synonymQueryDisplayString;
  if ((unint64_t)synonymQueryDisplayString | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](synonymQueryDisplayString, "isEqual:"))
      goto LABEL_70;
  }
  featureMaps = self->_featureMaps;
  if ((unint64_t)featureMaps | *((_QWORD *)v4 + 3))
    v16 = -[NSMutableArray isEqual:](featureMaps, "isEqual:");
  else
    v16 = 1;
LABEL_71:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  $B96048FCA3CE9983CCDE492874E6FFA2 flags;
  unint64_t v10;
  float confidence;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;

  -[GEOPDSearchQuerySynonymMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_identifier;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_key, "hash");
  v5 = -[NSMutableArray hash](self->_refinementQueries, "hash");
  v6 = -[NSString hash](self->_language, "hash");
  v7 = -[NSString hash](self->_countryCode, "hash");
  v8 = -[NSMutableArray hash](self->_geoHashes, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    confidence = self->_confidence;
    v12 = confidence;
    if (confidence < 0.0)
      v12 = -confidence;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v15 = 2654435761 * self->_rewriteProvider;
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
LABEL_14:
      v16 = 2654435761 * self->_useGeoHashes;
      if ((*(_BYTE *)&flags & 0x10) != 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_14;
  }
  v16 = 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_15:
    v17 = 2654435761 * self->_hardRewrite;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_16;
    goto LABEL_22;
  }
LABEL_21:
  v17 = 0;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_originalProvider;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_17;
LABEL_23:
    v19 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_18;
LABEL_24:
    v20 = 0;
    goto LABEL_25;
  }
LABEL_22:
  v18 = 0;
  if ((*(_BYTE *)&flags & 0x40) == 0)
    goto LABEL_23;
LABEL_17:
  v19 = 2654435761 * self->_isWeakLexicalMatch;
  if ((*(_BYTE *)&flags & 0x20) == 0)
    goto LABEL_24;
LABEL_18:
  v20 = 2654435761 * self->_isOrgQueryPrefixOfRefinement;
LABEL_25:
  v21 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10;
  v22 = v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NSString hash](self->_originalQueryDisplayString, "hash");
  v23 = v22 ^ -[NSString hash](self->_synonymQueryDisplayString, "hash");
  return v21 ^ v23 ^ -[NSMutableArray hash](self->_featureMaps, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_refinementQueries, 0);
  objc_storeStrong((id *)&self->_originalQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geoHashes, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
