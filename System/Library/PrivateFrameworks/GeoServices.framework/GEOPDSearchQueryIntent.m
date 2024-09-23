@implementation GEOPDSearchQueryIntent

- (GEOPDSearchQueryIntent)init
{
  GEOPDSearchQueryIntent *v2;
  GEOPDSearchQueryIntent *v3;
  GEOPDSearchQueryIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryIntent;
  v2 = -[GEOPDSearchQueryIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryIntent)initWithData:(id)a3
{
  GEOPDSearchQueryIntent *v3;
  GEOPDSearchQueryIntent *v4;
  GEOPDSearchQueryIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryIntent;
  v3 = -[GEOPDSearchQueryIntent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWhatIntents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWhatIntents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addWhatIntent:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQueryIntent _readWhatIntents](a1);
    -[GEOPDSearchQueryIntent _addNoFlagsWhatIntent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsWhatIntent:(uint64_t)a1
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

- (void)_readWhereIntents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWhereIntents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addWhereIntent:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQueryIntent _readWhereIntents](a1);
    -[GEOPDSearchQueryIntent _addNoFlagsWhereIntent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsWhereIntent:(uint64_t)a1
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

- (void)_readQueryIntentMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryIntentMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)queryIntentMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchQueryIntent _readQueryIntentMetadata]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setQueryIntentMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 76) |= 4u;
    *(_BYTE *)(a1 + 76) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)addGlobalFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGlobalFeatureMaps_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQueryIntent _addNoFlagsGlobalFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsGlobalFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addGlobalStringFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGlobalStringFeatureMaps_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQueryIntent _addNoFlagsGlobalStringFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsGlobalStringFeatureMap:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQueryIntent;
  -[GEOPDSearchQueryIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryIntent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
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
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  const __CFString *v46;
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQueryIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v61 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v10, "jsonRepresentation");
          else
            objc_msgSend(v10, "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      }
      while (v7);
    }

    if (a2)
      v12 = CFSTR("whatIntent");
    else
      v12 = CFSTR("what_intent");
    objc_msgSend(v4, "setObject:forKey:", v5, v12);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v14 = *(id *)(a1 + 56);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("whereIntent");
    else
      v20 = CFSTR("where_intent");
    objc_msgSend(v4, "setObject:forKey:", v13, v20);

  }
  -[GEOPDSearchQueryIntent queryIntentMetadata]((id *)a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("queryIntentMetadata");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("query_intent_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 8) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      v26 = v25;
      objc_sync_enter(v26);
      GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRewrittenQueryNonPayloadField_tags);
      objc_sync_exit(v26);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v27 = *(id *)(a1 + 40);
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("rewrittenQueryNonPayloadField");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("rewritten_query_non_payload_field");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v32 = *(id *)(a1 + 16);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v53 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("globalFeatureMap");
    else
      v38 = CFSTR("global_feature_map");
    objc_msgSend(v4, "setObject:forKey:", v31, v38);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v40 = *(id *)(a1 + 24);
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v49;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v49 != v42)
            objc_enumerationMutation(v40);
          v44 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation", (_QWORD)v48);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45, (_QWORD)v48);

        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      }
      while (v41);
    }

    if (a2)
      v46 = CFSTR("globalStringFeatureMap");
    else
      v46 = CFSTR("global_string_feature_map");
    objc_msgSend(v4, "setObject:forKey:", v39, v46, (_QWORD)v48);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1122;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1123;
      GEOPDSearchQueryIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQueryIntentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  GEOPDSearchIntent *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  GEOPDSearchIntent *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  GEOPDSearchQueryIntentMetadata *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  GEOPDSearchRewrittenQueryNonPayloadField *v34;
  id v35;
  const __CFString *v36;
  void *v37;
  char v38;
  const __CFString *v39;
  void *v40;
  char v41;
  const __CFString *v42;
  void *v43;
  char v44;
  const __CFString *v45;
  void *v46;
  char v47;
  const __CFString *v48;
  void *v49;
  char v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  id v54;
  const __CFString *v55;
  void *v56;
  id v57;
  int v58;
  const __CFString *v59;
  void *v60;
  id v61;
  int v62;
  GEOPDSearchRewrittenQueryNonPayloadField *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  GEOPDSearchPair *v72;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  GEOPDSearchStringStringPair *v83;
  void *v84;
  uint64_t v85;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_196;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_196;
  if (a3)
    v6 = CFSTR("whatIntent");
  else
    v6 = CFSTR("what_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v88 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v102;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v102 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOPDSearchIntent alloc];
            if (v14)
              v15 = -[GEOPDSearchIntent _initWithDictionary:isJSON:](v14, v13, a3);
            else
              v15 = 0;
            -[GEOPDSearchQueryIntent addWhatIntent:](a1, v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
        v10 = v16;
      }
      while (v16);
    }

    v5 = v88;
  }

  if (a3)
    v17 = CFSTR("whereIntent");
  else
    v17 = CFSTR("where_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v98;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v98 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = [GEOPDSearchIntent alloc];
            if (v25)
              v26 = -[GEOPDSearchIntent _initWithDictionary:isJSON:](v25, v24, a3);
            else
              v26 = 0;
            -[GEOPDSearchQueryIntent addWhereIntent:](a1, v26);

          }
          ++v23;
        }
        while (v21 != v23);
        v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        v21 = v27;
      }
      while (v27);
    }

    v5 = v88;
  }

  if (a3)
    v28 = CFSTR("queryIntentMetadata");
  else
    v28 = CFSTR("query_intent_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDSearchQueryIntentMetadata alloc];
    if (v30)
      v31 = (void *)-[GEOPDSearchQueryIntentMetadata _initWithDictionary:isJSON:](v30, v29, a3);
    else
      v31 = 0;
    -[GEOPDSearchQueryIntent setQueryIntentMetadata:](a1, v31);

  }
  if (a3)
    v32 = CFSTR("rewrittenQueryNonPayloadField");
  else
    v32 = CFSTR("rewritten_query_non_payload_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = [GEOPDSearchRewrittenQueryNonPayloadField alloc];
    if (!v34)
    {
LABEL_158:
      v63 = v34;
      *(_BYTE *)(a1 + 76) |= 8u;
      *(_BYTE *)(a1 + 76) |= 0x40u;
      objc_storeStrong((id *)(a1 + 40), v34);

      goto LABEL_159;
    }
    v35 = v33;
    v34 = -[GEOPDSearchRewrittenQueryNonPayloadField init](v34, "init");
    if (!v34)
    {
LABEL_157:

      goto LABEL_158;
    }
    if (a3)
      v36 = CFSTR("hasNumericSplit");
    else
      v36 = CFSTR("has_numeric_split");
    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = objc_msgSend(v37, "BOOLValue");
      *(_BYTE *)&v34->_flags |= 0x20u;
      v34->_hasNumericSplit = v38;
    }

    if (a3)
      v39 = CFSTR("hasCamelCase");
    else
      v39 = CFSTR("has_camel_case");
    objc_msgSend(v35, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = objc_msgSend(v40, "BOOLValue");
      *(_BYTE *)&v34->_flags |= 4u;
      v34->_hasCamelCase = v41;
    }

    if (a3)
      v42 = CFSTR("hasDirectionsIntent");
    else
      v42 = CFSTR("has_directions_intent");
    objc_msgSend(v35, "objectForKeyedSubscript:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = objc_msgSend(v43, "BOOLValue");
      *(_BYTE *)&v34->_flags |= 8u;
      v34->_hasDirectionsIntent = v44;
    }

    if (a3)
      v45 = CFSTR("hasSynonymCounterpart");
    else
      v45 = CFSTR("has_synonym_counterPart");
    objc_msgSend(v35, "objectForKeyedSubscript:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = objc_msgSend(v46, "BOOLValue");
      *(_BYTE *)&v34->_flags |= 0x40u;
      v34->_hasSynonymCounterpart = v47;
    }

    if (a3)
      v48 = CFSTR("hasEmojiRewrite");
    else
      v48 = CFSTR("has_emoji_rewrite");
    objc_msgSend(v35, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = objc_msgSend(v49, "BOOLValue");
      *(_BYTE *)&v34->_flags |= 0x10u;
      v34->_hasEmojiRewrite = v50;
    }

    if (a3)
      v51 = CFSTR("rewrittenQuery");
    else
      v51 = CFSTR("rewritten_query");
    objc_msgSend(v35, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = (void *)objc_msgSend(v52, "copy");
      v54 = v53;
      objc_storeStrong((id *)&v34->_rewrittenQuery, v53);

    }
    if (a3)
      v55 = CFSTR("pipelineType");
    else
      v55 = CFSTR("pipeline_type");
    objc_msgSend(v35, "objectForKeyedSubscript:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = v56;
      v87 = v35;
      if ((objc_msgSend(v57, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
      {
        v58 = 0;
      }
      else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("POI_ONLY")) & 1) != 0)
      {
        v58 = 1;
      }
      else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("GEO_ONLY")) & 1) != 0)
      {
        v58 = 2;
      }
      else if (objc_msgSend(v57, "isEqualToString:", CFSTR("COMMON")))
      {
        v58 = 3;
      }
      else
      {
        v58 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_99;
      v87 = v35;
      v58 = objc_msgSend(v56, "intValue");
    }
    *(_BYTE *)&v34->_flags |= 1u;
    v34->_pipelineType = v58;
    v35 = v87;
LABEL_99:

    if (a3)
      v59 = CFSTR("rewrittenQueryType");
    else
      v59 = CFSTR("rewritten_query_type");
    objc_msgSend(v35, "objectForKeyedSubscript:", v59, v87);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = v60;
      if ((objc_msgSend(v61, "isEqualToString:", CFSTR("NONE_REWRITTEN_QUERY_TYPE")) & 1) != 0)
      {
        v62 = 0;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("NORMALIZATION")) & 1) != 0)
      {
        v62 = 1;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("SPELL_CORRECTION")) & 1) != 0)
      {
        v62 = 2;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("TOK_SYNONYM")) & 1) != 0)
      {
        v62 = 3;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("REWRITTEN_QUERY_TYPE_SYNONYM")) & 1) != 0)
      {
        v62 = 4;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("TOKENIZATION")) & 1) != 0)
      {
        v62 = 5;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("COMPLETION")) & 1) != 0)
      {
        v62 = 6;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("CLASSIFICATION")) & 1) != 0)
      {
        v62 = 7;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("QUERY_INTERPRETATION")) & 1) != 0)
      {
        v62 = 8;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("TAG")) & 1) != 0)
      {
        v62 = 9;
      }
      else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("DEFINITIVE_QU")) & 1) != 0)
      {
        v62 = 10;
      }
      else
      {
        if ((objc_msgSend(v61, "isEqualToString:", CFSTR("POI_SEARCH_SPELL_CORRECTION")) & 1) != 0)
        {
          v62 = 11;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("TRANSLITERATION")) & 1) != 0)
        {
          v62 = 12;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("FUZZY_MATCH_V2")) & 1) != 0)
        {
          v62 = 13;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("DISPLAY_NAME")) & 1) != 0)
        {
          v62 = 14;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("DIRECTION")) & 1) != 0)
        {
          v62 = 15;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("EMOJI")) & 1) != 0)
        {
          v62 = 16;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("ZIP_DOOR_INTERPREATION")) & 1) != 0)
        {
          v62 = 17;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("SIRI_ATTRIBUTES")) & 1) != 0)
        {
          v62 = 18;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("TOKEN_IMPORTANCE")) & 1) != 0)
        {
          v62 = 19;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("BRAND_DATA")) & 1) != 0)
        {
          v62 = 20;
        }
        else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("NEURAL_REWRITE")) & 1) != 0)
        {
          v62 = 21;
        }
        else if (objc_msgSend(v61, "isEqualToString:", CFSTR("EMBEDDING")))
        {
          v62 = 22;
        }
        else
        {
          v62 = 0;
        }
        v5 = v88;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_156:

        goto LABEL_157;
      }
      v62 = objc_msgSend(v60, "intValue");
    }
    *(_BYTE *)&v34->_flags |= 2u;
    v34->_rewrittenQueryType = v62;
    goto LABEL_156;
  }
LABEL_159:

  if (a3)
    v64 = CFSTR("globalFeatureMap");
  else
    v64 = CFSTR("global_feature_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v66 = v65;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v94;
      do
      {
        v70 = 0;
        do
        {
          if (*(_QWORD *)v94 != v69)
            objc_enumerationMutation(v66);
          v71 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v70);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v72 = [GEOPDSearchPair alloc];
            if (v72)
              v73 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v72, v71);
            else
              v73 = 0;
            -[GEOPDSearchQueryIntent addGlobalFeatureMap:](a1, v73);

          }
          ++v70;
        }
        while (v68 != v70);
        v74 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
        v68 = v74;
      }
      while (v74);
    }

    v5 = v88;
  }

  if (a3)
    v75 = CFSTR("globalStringFeatureMap");
  else
    v75 = CFSTR("global_string_feature_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v90;
      do
      {
        v81 = 0;
        do
        {
          if (*(_QWORD *)v90 != v80)
            objc_enumerationMutation(v77);
          v82 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v81);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = [GEOPDSearchStringStringPair alloc];
            if (v83)
              v84 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v83, v82);
            else
              v84 = 0;
            -[GEOPDSearchQueryIntent addGlobalStringFeatureMap:](a1, v84);

          }
          ++v81;
        }
        while (v79 != v81);
        v85 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
        v79 = v85;
      }
      while (v85);
    }

    v5 = v88;
  }

LABEL_196:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  GEOPDSearchQueryIntentMetadata *queryIntentMetadata;
  char IsDirty;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PBDataReader *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_40;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x70) != 0)
    goto LABEL_40;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    queryIntentMetadata = self->_queryIntentMetadata;
    if (queryIntentMetadata)
    {
      os_unfair_lock_lock_with_options();
      IsDirty = _GEOPDSearchQueryIntentMetadataIsDirty((uint64_t)queryIntentMetadata);
      os_unfair_lock_unlock(&queryIntentMetadata->_readerLock);
      if ((IsDirty & 1) != 0)
        goto LABEL_40;
      flags = (char)self->_flags;
    }
  }
  if ((flags & 0xB) == 0)
  {
    if ((flags & 0x10) != 0)
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v9 = self->_whatIntents;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v62;
LABEL_11:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v62 != v11)
            objc_enumerationMutation(v9);
          if ((GEOPDSearchIntentIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v61 + 1) + 8 * v12)) & 1) != 0)
            goto LABEL_39;
          if (v10 == ++v12)
          {
            v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
            if (v10)
              goto LABEL_11;
            break;
          }
        }
      }

      flags = (char)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v9 = self->_whereIntents;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v58;
LABEL_21:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(v9);
          if ((GEOPDSearchIntentIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v57 + 1) + 8 * v15)) & 1) != 0)
            goto LABEL_39;
          if (v13 == ++v15)
          {
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
            if (v13)
              goto LABEL_21;
            break;
          }
        }
      }

      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v9 = self->_globalStringFeatureMaps;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v54;
LABEL_31:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v9);
          if (GEOPDSearchStringStringPairIsDirty(*(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v18)))
            break;
          if (v16 == ++v18)
          {
            v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
            if (v16)
              goto LABEL_31;
            goto LABEL_37;
          }
        }
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:

    }
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
    goto LABEL_73;
  }
LABEL_40:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 0);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = self->_whatIntents;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v68, 16);
    }
    while (v22);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v25 = self->_whereIntents;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v67, 16);
    }
    while (v26);
  }

  if (self->_queryIntentMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_rewrittenQueryNonPayloadField)
    PBDataWriterWriteSubmessage();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v29 = self->_globalFeatureMaps;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v41, v66, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage();
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v41, v66, 16);
    }
    while (v30);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = self->_globalStringFeatureMaps;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v37, v65, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage();
      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v37, v65, 16);
    }
    while (v34);
  }

LABEL_73:
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v4;
  id v5;
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
  -[GEOPDSearchQueryIntent _readQueryIntentMetadata](a1);
  if ((-[GEOPDSearchQueryIntentMetadata hasGreenTeaWithValue:](*(_QWORD *)(a1 + 32), a2) & 1) == 0)
  {
    -[GEOPDSearchQueryIntent _readWhatIntents](a1);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        if ((-[GEOPDSearchIntent hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9), a2) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v7)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      -[GEOPDSearchQueryIntent _readWhereIntents](a1);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = *(id *)(a1 + 56);
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (!v10)
      {
LABEL_20:
        v4 = 0;
LABEL_22:

        return v4;
      }
      v11 = v10;
      v12 = *(_QWORD *)v16;
LABEL_14:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v5);
        if ((-[GEOPDSearchIntent hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), a2) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
            goto LABEL_14;
          goto LABEL_20;
        }
      }
    }
    v4 = 1;
    goto LABEL_22;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSearchQueryIntentReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 0);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_whatIntents;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v11), "copyWithZone:", a3);
        -[GEOPDSearchQueryIntent addWhatIntent:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = self->_whereIntents;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v16), "copyWithZone:", a3);
        -[GEOPDSearchQueryIntent addWhereIntent:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  v18 = -[GEOPDSearchQueryIntentMetadata copyWithZone:](self->_queryIntentMetadata, "copyWithZone:", a3);
  v19 = (void *)v5[4];
  v5[4] = v18;

  v20 = -[GEOPDSearchRewrittenQueryNonPayloadField copyWithZone:](self->_rewrittenQueryNonPayloadField, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = self->_globalFeatureMaps;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v38;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v25), "copyWithZone:", a3);
        -[GEOPDSearchQueryIntent addGlobalFeatureMap:]((uint64_t)v5, v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v23);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self->_globalStringFeatureMaps;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v34;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v30), "copyWithZone:", a3, (_QWORD)v33);
        -[GEOPDSearchQueryIntent addGlobalStringFeatureMap:]((uint64_t)v5, v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *whatIntents;
  NSMutableArray *whereIntents;
  GEOPDSearchQueryIntentMetadata *queryIntentMetadata;
  GEOPDSearchRewrittenQueryNonPayloadField *rewrittenQueryNonPayloadField;
  NSMutableArray *globalFeatureMaps;
  NSMutableArray *globalStringFeatureMaps;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryIntent readAll:]((uint64_t)v4, 1),
         whatIntents = self->_whatIntents,
         !((unint64_t)whatIntents | v4[6]))
     || -[NSMutableArray isEqual:](whatIntents, "isEqual:"))
    && ((whereIntents = self->_whereIntents, !((unint64_t)whereIntents | v4[7]))
     || -[NSMutableArray isEqual:](whereIntents, "isEqual:"))
    && ((queryIntentMetadata = self->_queryIntentMetadata, !((unint64_t)queryIntentMetadata | v4[4]))
     || -[GEOPDSearchQueryIntentMetadata isEqual:](queryIntentMetadata, "isEqual:"))
    && ((rewrittenQueryNonPayloadField = self->_rewrittenQueryNonPayloadField,
         !((unint64_t)rewrittenQueryNonPayloadField | v4[5]))
     || -[GEOPDSearchRewrittenQueryNonPayloadField isEqual:](rewrittenQueryNonPayloadField, "isEqual:"))
    && ((globalFeatureMaps = self->_globalFeatureMaps, !((unint64_t)globalFeatureMaps | v4[2]))
     || -[NSMutableArray isEqual:](globalFeatureMaps, "isEqual:")))
  {
    globalStringFeatureMaps = self->_globalStringFeatureMaps;
    if ((unint64_t)globalStringFeatureMaps | v4[3])
      v11 = -[NSMutableArray isEqual:](globalStringFeatureMaps, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOPDSearchQueryIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_whatIntents, "hash");
  v4 = -[NSMutableArray hash](self->_whereIntents, "hash") ^ v3;
  v5 = v4 ^ -[GEOPDSearchQueryIntentMetadata hash](self->_queryIntentMetadata, "hash");
  v6 = -[GEOPDSearchRewrittenQueryNonPayloadField hash](self->_rewrittenQueryNonPayloadField, "hash");
  v7 = v5 ^ v6 ^ -[NSMutableArray hash](self->_globalFeatureMaps, "hash");
  return v7 ^ -[NSMutableArray hash](self->_globalStringFeatureMaps, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whereIntents, 0);
  objc_storeStrong((id *)&self->_whatIntents, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryNonPayloadField, 0);
  objc_storeStrong((id *)&self->_queryIntentMetadata, 0);
  objc_storeStrong((id *)&self->_globalStringFeatureMaps, 0);
  objc_storeStrong((id *)&self->_globalFeatureMaps, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
