@implementation GEOPDSearchChainIntent

- (GEOPDSearchChainIntent)init
{
  GEOPDSearchChainIntent *v2;
  GEOPDSearchChainIntent *v3;
  GEOPDSearchChainIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchChainIntent;
  v2 = -[GEOPDSearchChainIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchChainIntent)initWithData:(id)a3
{
  GEOPDSearchChainIntent *v3;
  GEOPDSearchChainIntent *v4;
  GEOPDSearchChainIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchChainIntent;
  v3 = -[GEOPDSearchChainIntent initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchChainIntent;
  -[GEOPDSearchChainIntent dealloc](&v3, sel_dealloc);
}

- (void)_readCategoryIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryIds_tags_400);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
}

- (void)addCategoryId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchChainIntent _readCategoryIds](a1);
    -[GEOPDSearchChainIntent _addNoFlagsCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsCategoryId:(uint64_t)a1
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

- (void)addFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureMaps_tags_401);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
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

- (void)addRelatedBrand:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x800) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedBrands_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsRelatedBrand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsRelatedBrand:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addBrandRelationshipInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandRelationshipInfos_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOPDSearchChainIntent _addNoFlagsBrandRelationshipInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readPrefCategoryIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefCategoryIds_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
}

- (void)addPrefCategoryId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchChainIntent _readPrefCategoryIds](a1);
    -[GEOPDSearchChainIntent _addNoFlagsPrefCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 136) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 136) |= 0x4000u;
  }
}

- (void)_addNoFlagsPrefCategoryId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
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
  v8.super_class = (Class)GEOPDSearchChainIntent;
  -[GEOPDSearchChainIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchChainIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchChainIntent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  const __CFString *v56;
  id v57;
  const __CFString *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchChainIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x2000) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrigger_tags_398);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v7 = *(id *)(a1 + 112);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("trigger"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChainId_tags_0);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v10 = *(id *)(a1 + 64);
  if (v10)
  {
    if (a2)
      v11 = CFSTR("chainId");
    else
      v11 = CFSTR("chain_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeminiBrand_tags);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v14 = *(id *)(a1 + 80);
  if (v14)
  {
    if (a2)
      v15 = CFSTR("geminiBrand");
    else
      v15 = CFSTR("gemini_brand");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 136) & 0x1000) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_399);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v18 = *(id *)(a1 + 104);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("tokenSet");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("token_set");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(_WORD *)(a1 + 136);
  if ((v22 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 133));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("isLocalChain"));

    v22 = *(_WORD *)(a1 + 136);
  }
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("isChainInSameCountry"));

    v22 = *(_WORD *)(a1 + 136);
  }
  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("brandMuid");
    else
      v26 = CFSTR("brand_muid");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    v22 = *(_WORD *)(a1 + 136);
  }
  if ((v22 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 134));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("isFromBrandProfile");
    else
      v28 = CFSTR("is_from_brand_profile");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    -[GEOPDSearchChainIntent _readCategoryIds](a1);
    v29 = *(id *)(a1 + 56);
    if (a2)
      v30 = CFSTR("categoryId");
    else
      v30 = CFSTR("category_id");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v32 = *(id *)(a1 + 72);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v69 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("featureMap");
    else
      v38 = CFSTR("feature_map");
    objc_msgSend(v4, "setObject:forKey:", v31, v38);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt64NSArray();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("brandMuids");
    else
      v40 = CFSTR("brand_muids");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v42 = *(id *)(a1 + 96);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v65 != v44)
            objc_enumerationMutation(v42);
          v46 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v46, "jsonRepresentation");
          else
            objc_msgSend(v46, "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v43);
    }

    if (a2)
      v48 = CFSTR("relatedBrand");
    else
      v48 = CFSTR("related_brand");
    objc_msgSend(v4, "setObject:forKey:", v41, v48);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v50 = *(id *)(a1 + 48);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v61 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v54, "jsonRepresentation");
          else
            objc_msgSend(v54, "dictionaryRepresentation", (_QWORD)v60);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55, (_QWORD)v60);

        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v51);
    }

    if (a2)
      v56 = CFSTR("brandRelationshipInfo");
    else
      v56 = CFSTR("brand_relationship_info");
    objc_msgSend(v4, "setObject:forKey:", v49, v56, (_QWORD)v60);

  }
  if (*(_QWORD *)(a1 + 88))
  {
    -[GEOPDSearchChainIntent _readPrefCategoryIds](a1);
    v57 = *(id *)(a1 + 88);
    if (a2)
      v58 = CFSTR("prefCategoryId");
    else
      v58 = CFSTR("pref_category_id");
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchChainIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_440;
      else
        v6 = (int *)&readAll__nonRecursiveTag_441;
      GEOPDSearchChainIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchChainIntentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchChainIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  unint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  PBDataReader *v28;
  void *v29;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchChainIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    v28 = self->_reader;
    objc_sync_enter(v28);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v29);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v28);
    goto LABEL_60;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 0);
  if (self->_trigger)
    PBDataWriterWriteStringField();
  if (self->_chainId)
    PBDataWriterWriteStringField();
  if (self->_geminiBrand)
    PBDataWriterWriteStringField();
  if (self->_tokenSet)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0)
        goto LABEL_14;
LABEL_57:
      PBDataWriterWriteUint64Field();
      if ((*(_WORD *)&self->_flags & 8) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_57;
LABEL_14:
  if ((flags & 8) != 0)
LABEL_15:
    PBDataWriterWriteBOOLField();
LABEL_16:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = self->_categoryIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = self->_featureMaps;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  if (self->_brandMuids.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v15;
    }
    while (v15 < self->_brandMuids.count);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = self->_relatedBrands;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_brandRelationshipInfos;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v21);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_prefCategoryIds;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      for (n = 0; n != v25; ++n)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteStringField();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v25);
  }

LABEL_60:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int16 flags;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  __int128 v43;
  __int128 v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchChainIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_trigger, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v9;

  v11 = -[NSString copyWithZone:](self->_chainId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_geminiBrand, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v15;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 133) = self->_isLocalChain;
    *(_WORD *)(v5 + 136) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0)
        goto LABEL_8;
LABEL_48:
      *(_QWORD *)(v5 + 40) = self->_brandMuid;
      *(_WORD *)(v5 + 136) |= 1u;
      if ((*(_WORD *)&self->_flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 132) = self->_isChainInSameCountry;
  *(_WORD *)(v5 + 136) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_48;
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    *(_BYTE *)(v5 + 134) = self->_isFromBrandProfile;
    *(_WORD *)(v5 + 136) |= 8u;
  }
LABEL_10:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v18 = self->_categoryIds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchChainIntent addCategoryId:](v5, v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v19);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = self->_featureMaps;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v56 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDSearchChainIntent addFeatureMap:](v5, v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v24);
  }

  PBRepeatedUInt64Copy();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = self->_relatedBrands;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDSearchChainIntent addRelatedBrand:](v5, v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v29);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = self->_brandRelationshipInfos;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v48 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDSearchChainIntent addBrandRelationshipInfo:](v5, v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v34);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = self->_prefCategoryIds;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v44;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v8);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v43);
        -[GEOPDSearchChainIntent addPrefCategoryId:](v5, v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v38);
  }
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *trigger;
  NSString *chainId;
  NSString *geminiBrand;
  GEOPDSearchTokenSet *tokenSet;
  __int16 flags;
  __int16 v10;
  NSMutableArray *categoryIds;
  NSMutableArray *featureMaps;
  NSMutableArray *relatedBrands;
  NSMutableArray *brandRelationshipInfos;
  NSMutableArray *prefCategoryIds;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchChainIntent readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](trigger, "isEqual:"))
      goto LABEL_50;
  }
  chainId = self->_chainId;
  if ((unint64_t)chainId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](chainId, "isEqual:"))
      goto LABEL_50;
  }
  geminiBrand = self->_geminiBrand;
  if ((unint64_t)geminiBrand | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](geminiBrand, "isEqual:"))
      goto LABEL_50;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_50;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 68);
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0)
      goto LABEL_50;
    if (self->_isLocalChain)
    {
      if (!*((_BYTE *)v4 + 133))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 133))
    {
      goto LABEL_50;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_50;
    if (self->_isChainInSameCountry)
    {
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 132))
    {
      goto LABEL_50;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_brandMuid != *((_QWORD *)v4 + 5))
      goto LABEL_50;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) != 0)
    {
      if (self->_isFromBrandProfile)
      {
        if (!*((_BYTE *)v4 + 134))
          goto LABEL_50;
        goto LABEL_39;
      }
      if (!*((_BYTE *)v4 + 134))
        goto LABEL_39;
    }
LABEL_50:
    v16 = 0;
    goto LABEL_51;
  }
  if ((v10 & 8) != 0)
    goto LABEL_50;
LABEL_39:
  categoryIds = self->_categoryIds;
  if ((unint64_t)categoryIds | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](categoryIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  featureMaps = self->_featureMaps;
  if ((unint64_t)featureMaps | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](featureMaps, "isEqual:"))
      goto LABEL_50;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_50;
  relatedBrands = self->_relatedBrands;
  if ((unint64_t)relatedBrands | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](relatedBrands, "isEqual:"))
      goto LABEL_50;
  }
  brandRelationshipInfos = self->_brandRelationshipInfos;
  if ((unint64_t)brandRelationshipInfos | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](brandRelationshipInfos, "isEqual:"))
      goto LABEL_50;
  }
  prefCategoryIds = self->_prefCategoryIds;
  if ((unint64_t)prefCategoryIds | *((_QWORD *)v4 + 11))
    v16 = -[NSMutableArray isEqual:](prefCategoryIds, "isEqual:");
  else
    v16 = 1;
LABEL_51:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  __int16 flags;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[GEOPDSearchChainIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_trigger, "hash");
  v4 = -[NSString hash](self->_chainId, "hash");
  v5 = -[NSString hash](self->_geminiBrand, "hash");
  v6 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v8 = 2654435761 * self->_isLocalChain;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v9 = 2654435761 * self->_isChainInSameCountry;
      if ((flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v10 = 0;
      if ((flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v11 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  v9 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v10 = 2654435761u * self->_brandMuid;
  if ((flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v11 = 2654435761 * self->_isFromBrandProfile;
LABEL_10:
  v12 = v4 ^ v3 ^ v5 ^ v6;
  v13 = v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_categoryIds, "hash");
  v14 = v12 ^ v13 ^ -[NSMutableArray hash](self->_featureMaps, "hash");
  v15 = PBRepeatedUInt64Hash();
  v16 = v15 ^ -[NSMutableArray hash](self->_relatedBrands, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_brandRelationshipInfos, "hash");
  return v14 ^ v17 ^ -[NSMutableArray hash](self->_prefCategoryIds, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_relatedBrands, 0);
  objc_storeStrong((id *)&self->_prefCategoryIds, 0);
  objc_storeStrong((id *)&self->_geminiBrand, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_chainId, 0);
  objc_storeStrong((id *)&self->_categoryIds, 0);
  objc_storeStrong((id *)&self->_brandRelationshipInfos, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
