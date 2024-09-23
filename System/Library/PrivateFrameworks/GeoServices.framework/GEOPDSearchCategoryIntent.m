@implementation GEOPDSearchCategoryIntent

- (GEOPDSearchCategoryIntent)init
{
  GEOPDSearchCategoryIntent *v2;
  GEOPDSearchCategoryIntent *v3;
  GEOPDSearchCategoryIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchCategoryIntent;
  v2 = -[GEOPDSearchCategoryIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchCategoryIntent)initWithData:(id)a3
{
  GEOPDSearchCategoryIntent *v3;
  GEOPDSearchCategoryIntent *v4;
  GEOPDSearchCategoryIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchCategoryIntent;
  v3 = -[GEOPDSearchCategoryIntent initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSearchCategoryIntent;
  -[GEOPDSearchCategoryIntent dealloc](&v3, sel_dealloc);
}

- (void)_readCategoryIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryIds_tags_0);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addCategoryId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchCategoryIntent _readCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
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

- (void)_readCanonicalNames
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCanonicalNames_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addCanonicalName:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchCategoryIntent _readCanonicalNames](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsCanonicalName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsCanonicalName:(uint64_t)a1
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

- (void)addFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureMaps_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
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

- (void)_readExpandedCategoryIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExpandedCategoryIds_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addExpandedCategoryId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchCategoryIntent _readExpandedCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsExpandedCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsExpandedCategoryId:(uint64_t)a1
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

- (void)_readNegativeCategorys
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNegativeCategorys_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addNegativeCategory:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchCategoryIntent _readNegativeCategorys](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsNegativeCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsNegativeCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernToLegacyIdMappings_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsModernToLegacyIdMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
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

- (void)_readLegacyCategoryIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLegacyCategoryIds_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addLegacyCategoryId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchCategoryIntent _readLegacyCategoryIds](a1);
    -[GEOPDSearchCategoryIntent _addNoFlagsLegacyCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsLegacyCategoryId:(uint64_t)a1
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

- (void)addCategoryMappings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryMappings_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsCategoryMappings:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsCategoryMappings:(uint64_t)a1
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

- (void)addKeywordMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKeywordMappings_tags_296);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    -[GEOPDSearchCategoryIntent _addNoFlagsKeywordMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 140) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    *(_WORD *)(a1 + 140) |= 0x1000u;
  }
}

- (void)_addNoFlagsKeywordMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
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
  v8.super_class = (Class)GEOPDSearchCategoryIntent;
  -[GEOPDSearchCategoryIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchCategoryIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCategoryIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  const __CFString *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  const __CFString *v57;
  __int128 v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchCategoryIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrigger_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  v7 = *(id *)(a1 + 120);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("trigger"));

  if (*(_QWORD *)(a1 + 48))
  {
    -[GEOPDSearchCategoryIntent _readCategoryIds](a1);
    v8 = *(id *)(a1 + 48);
    if (a2)
      v9 = CFSTR("categoryId");
    else
      v9 = CFSTR("category_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_291);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  v12 = *(id *)(a1 + 112);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("tokenSet");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("token_set");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    -[GEOPDSearchCategoryIntent _readCanonicalNames](a1);
    v16 = *(id *)(a1 + 40);
    if (a2)
      v17 = CFSTR("canonicalName");
    else
      v17 = CFSTR("canonical_name");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v19 = *(id *)(a1 + 72);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v72 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("featureMap");
    else
      v25 = CFSTR("feature_map");
    objc_msgSend(v4, "setObject:forKey:", v18, v25);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    -[GEOPDSearchCategoryIntent _readExpandedCategoryIds](a1);
    v26 = *(id *)(a1 + 64);
    if (a2)
      v27 = CFSTR("expandedCategoryId");
    else
      v27 = CFSTR("expanded_category_id");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    -[GEOPDSearchCategoryIntent _readNegativeCategorys](a1);
    v28 = *(id *)(a1 + 104);
    if (a2)
      v29 = CFSTR("negativeCategory");
    else
      v29 = CFSTR("negative_category");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v31 = *(id *)(a1 + 96);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v68 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      }
      while (v32);
    }

    if (a2)
      v37 = CFSTR("modernToLegacyIdMapping");
    else
      v37 = CFSTR("modern_to_legacy_id_mapping");
    objc_msgSend(v4, "setObject:forKey:", v30, v37);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt64NSArray();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("keywordMuid");
    else
      v39 = CFSTR("keyword_muid");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if (*(_QWORD *)(a1 + 88))
  {
    -[GEOPDSearchCategoryIntent _readLegacyCategoryIds](a1);
    v40 = *(id *)(a1 + 88);
    if (a2)
      v41 = CFSTR("legacyCategoryId");
    else
      v41 = CFSTR("legacy_category_id");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v43 = *(id *)(a1 + 56);
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v64 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v47, "jsonRepresentation");
          else
            objc_msgSend(v47, "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      }
      while (v44);
    }

    if (a2)
      v49 = CFSTR("categoryMappings");
    else
      v49 = CFSTR("category_mappings");
    objc_msgSend(v4, "setObject:forKey:", v42, v49);

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v51 = *(id *)(a1 + 80);
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v60;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v60 != v53)
            objc_enumerationMutation(v51);
          v55 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v55, "jsonRepresentation");
          else
            objc_msgSend(v55, "dictionaryRepresentation", (_QWORD)v59);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56, (_QWORD)v59);

        }
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
      }
      while (v52);
    }

    if (a2)
      v57 = CFSTR("keywordMapping");
    else
      v57 = CFSTR("keyword_mapping");
    objc_msgSend(v4, "setObject:forKey:", v50, v57, (_QWORD)v59);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchCategoryIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_331;
      else
        v6 = (int *)&readAll__nonRecursiveTag_332;
      GEOPDSearchCategoryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchCategoryIntentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCategoryIntentReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ii;
  unint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t jj;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t kk;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t mm;
  PBDataReader *v43;
  void *v44;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchCategoryIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    v43 = self->_reader;
    objc_sync_enter(v43);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v44);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v43);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 0);
    if (self->_trigger)
      PBDataWriterWriteStringField();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v6 = self->_categoryIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v78 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v7);
    }

    if (self->_tokenSet)
      PBDataWriterWriteSubmessage();
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v10 = self->_canonicalNames;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v74 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
      }
      while (v11);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v14 = self->_featureMaps;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v70;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v70 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
      }
      while (v15);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v18 = self->_expandedCategoryIds;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v66;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v66 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteStringField();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
      }
      while (v19);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v22 = self->_negativeCategorys;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v62;
      do
      {
        for (n = 0; n != v23; ++n)
        {
          if (*(_QWORD *)v62 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteStringField();
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
      }
      while (v23);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = self->_modernToLegacyIdMappings;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v84, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v58;
      do
      {
        for (ii = 0; ii != v27; ++ii)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteSubmessage();
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v84, 16);
      }
      while (v27);
    }

    if (self->_keywordMuids.count)
    {
      v30 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v30;
      }
      while (v30 < self->_keywordMuids.count);
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = self->_legacyCategoryIds;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v54;
      do
      {
        for (jj = 0; jj != v32; ++jj)
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteStringField();
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
      }
      while (v32);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = self->_categoryMappings;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v82, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v50;
      do
      {
        for (kk = 0; kk != v36; ++kk)
        {
          if (*(_QWORD *)v50 != v37)
            objc_enumerationMutation(v35);
          PBDataWriterWriteSubmessage();
        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v82, 16);
      }
      while (v36);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v39 = self->_keywordMappings;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v45, v81, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v46;
      do
      {
        for (mm = 0; mm != v40; ++mm)
        {
          if (*(_QWORD *)v46 != v41)
            objc_enumerationMutation(v39);
          PBDataWriterWriteSubmessage();
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v45, v81, 16);
      }
      while (v40);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t jj;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t kk;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t mm;
  void *v56;
  __int128 v58;
  __int128 v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
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
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchCategoryIntentReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_trigger, "copyWithZone:", a3);
  v9 = (void *)v5[15];
  v5[15] = v8;

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v10 = self->_categoryIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v91 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addCategoryId:]((uint64_t)v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    }
    while (v11);
  }

  v15 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v16 = (void *)v5[14];
  v5[14] = v15;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v17 = self->_canonicalNames;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v87 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addCanonicalName:]((uint64_t)v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    }
    while (v18);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v22 = self->_featureMaps;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v83;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v83 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addFeatureMap:]((uint64_t)v5, v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    }
    while (v23);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v27 = self->_expandedCategoryIds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v79;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v79 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addExpandedCategoryId:]((uint64_t)v5, v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
    }
    while (v28);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v32 = self->_negativeCategorys;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v75;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v75 != v34)
          objc_enumerationMutation(v32);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * n), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addNegativeCategory:]((uint64_t)v5, v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
    }
    while (v33);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v37 = self->_modernToLegacyIdMappings;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v70, v97, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v71;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v71 != v39)
          objc_enumerationMutation(v37);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * ii), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addModernToLegacyIdMapping:]((uint64_t)v5, v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v70, v97, 16);
    }
    while (v38);
  }

  PBRepeatedUInt64Copy();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v42 = self->_legacyCategoryIds;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v96, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v67;
    do
    {
      for (jj = 0; jj != v43; ++jj)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(v42);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * jj), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addLegacyCategoryId:]((uint64_t)v5, v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v96, 16);
    }
    while (v43);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v47 = self->_categoryMappings;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v62, v95, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v63;
    do
    {
      for (kk = 0; kk != v48; ++kk)
      {
        if (*(_QWORD *)v63 != v49)
          objc_enumerationMutation(v47);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * kk), "copyWithZone:", a3);
        -[GEOPDSearchCategoryIntent addCategoryMappings:]((uint64_t)v5, v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v62, v95, 16);
    }
    while (v48);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v52 = self->_keywordMappings;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v58, v94, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v59;
    do
    {
      for (mm = 0; mm != v53; ++mm)
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * mm), "copyWithZone:", a3, (_QWORD)v58);
        -[GEOPDSearchCategoryIntent addKeywordMapping:]((uint64_t)v5, v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v58, v94, 16);
    }
    while (v53);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *trigger;
  NSMutableArray *categoryIds;
  GEOPDSearchTokenSet *tokenSet;
  NSMutableArray *canonicalNames;
  NSMutableArray *featureMaps;
  NSMutableArray *expandedCategoryIds;
  NSMutableArray *negativeCategorys;
  NSMutableArray *modernToLegacyIdMappings;
  NSMutableArray *legacyCategoryIds;
  NSMutableArray *categoryMappings;
  NSMutableArray *keywordMappings;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)v4, 1);
  trigger = self->_trigger;
  if ((unint64_t)trigger | v4[15])
  {
    if (!-[NSString isEqual:](trigger, "isEqual:"))
      goto LABEL_25;
  }
  categoryIds = self->_categoryIds;
  if ((unint64_t)categoryIds | v4[6] && !-[NSMutableArray isEqual:](categoryIds, "isEqual:"))
    goto LABEL_25;
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | v4[14] && !-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
    goto LABEL_25;
  if (((canonicalNames = self->_canonicalNames, !((unint64_t)canonicalNames | v4[5]))
     || -[NSMutableArray isEqual:](canonicalNames, "isEqual:"))
    && ((featureMaps = self->_featureMaps, !((unint64_t)featureMaps | v4[9]))
     || -[NSMutableArray isEqual:](featureMaps, "isEqual:"))
    && ((expandedCategoryIds = self->_expandedCategoryIds, !((unint64_t)expandedCategoryIds | v4[8]))
     || -[NSMutableArray isEqual:](expandedCategoryIds, "isEqual:"))
    && ((negativeCategorys = self->_negativeCategorys, !((unint64_t)negativeCategorys | v4[13]))
     || -[NSMutableArray isEqual:](negativeCategorys, "isEqual:"))
    && ((modernToLegacyIdMappings = self->_modernToLegacyIdMappings,
         !((unint64_t)modernToLegacyIdMappings | v4[12]))
     || -[NSMutableArray isEqual:](modernToLegacyIdMappings, "isEqual:"))
    && PBRepeatedUInt64IsEqual()
    && ((legacyCategoryIds = self->_legacyCategoryIds, !((unint64_t)legacyCategoryIds | v4[11]))
     || -[NSMutableArray isEqual:](legacyCategoryIds, "isEqual:"))
    && ((categoryMappings = self->_categoryMappings, !((unint64_t)categoryMappings | v4[7]))
     || -[NSMutableArray isEqual:](categoryMappings, "isEqual:")))
  {
    keywordMappings = self->_keywordMappings;
    if ((unint64_t)keywordMappings | v4[10])
      v16 = -[NSMutableArray isEqual:](keywordMappings, "isEqual:");
    else
      v16 = 1;
  }
  else
  {
LABEL_25:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[GEOPDSearchCategoryIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_trigger, "hash");
  v4 = -[NSMutableArray hash](self->_categoryIds, "hash") ^ v3;
  v5 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_canonicalNames, "hash");
  v7 = -[NSMutableArray hash](self->_featureMaps, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_expandedCategoryIds, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_negativeCategorys, "hash");
  v10 = -[NSMutableArray hash](self->_modernToLegacyIdMappings, "hash");
  v11 = v10 ^ PBRepeatedUInt64Hash();
  v12 = v11 ^ -[NSMutableArray hash](self->_legacyCategoryIds, "hash");
  v13 = v9 ^ v12 ^ -[NSMutableArray hash](self->_categoryMappings, "hash");
  return v13 ^ -[NSMutableArray hash](self->_keywordMappings, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_negativeCategorys, 0);
  objc_storeStrong((id *)&self->_modernToLegacyIdMappings, 0);
  objc_storeStrong((id *)&self->_legacyCategoryIds, 0);
  objc_storeStrong((id *)&self->_keywordMappings, 0);
  objc_storeStrong((id *)&self->_featureMaps, 0);
  objc_storeStrong((id *)&self->_expandedCategoryIds, 0);
  objc_storeStrong((id *)&self->_categoryMappings, 0);
  objc_storeStrong((id *)&self->_categoryIds, 0);
  objc_storeStrong((id *)&self->_canonicalNames, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
