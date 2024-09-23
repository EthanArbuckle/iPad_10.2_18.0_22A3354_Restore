@implementation GEOPDVenueInfo

- (GEOPDVenueInfo)init
{
  GEOPDVenueInfo *v2;
  GEOPDVenueInfo *v3;
  GEOPDVenueInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueInfo;
  v2 = -[GEOPDVenueInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueInfo)initWithData:(id)a3
{
  GEOPDVenueInfo *v3;
  GEOPDVenueInfo *v4;
  GEOPDVenueInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueInfo;
  v3 = -[GEOPDVenueInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVenueFeatureIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueFeatureIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)venueFeatureIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDVenueInfo _readVenueFeatureIds]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addVenueFeatureId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDVenueInfo _readVenueFeatureIds](a1);
    -[GEOPDVenueInfo _addNoFlagsVenueFeatureId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsVenueFeatureId:(uint64_t)a1
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

- (uint64_t)featureType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readItemList
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemList_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itemList
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDVenueInfo _readItemList]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setItemList:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x10u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readLocatedInside
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocatedInside_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)locatedInside
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDVenueInfo _readLocatedInside]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setLocatedInside:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x20u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readFilterElements
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilterElements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filterElements
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDVenueInfo _readFilterElements]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addFilterElement:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDVenueInfo _readFilterElements](a1);
    -[GEOPDVenueInfo _addNoFlagsFilterElement:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsFilterElement:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDVenueInfo;
  -[GEOPDVenueInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVenueInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const __CFString *v33;
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
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDVenueInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("venueFeatureId");
    else
      v13 = CFSTR("venue_feature_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v14 = *(int *)(a1 + 68);
    if (v14 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C037D8[v14];
    }
    if (a2)
      v16 = CFSTR("featureType");
    else
      v16 = CFSTR("feature_type");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  -[GEOPDVenueInfo itemList]((id *)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("itemList");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("item_list");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDVenueInfo locatedInside]((id *)a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("locatedInside");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("located_inside");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v26 = *(id *)(a1 + 24);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v28);
    }

    if (a2)
      v33 = CFSTR("filterElement");
    else
      v33 = CFSTR("filter_element");
    objc_msgSend(v4, "setObject:forKey:", v25, v33);

  }
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("goInsideLevel");
    else
      v35 = CFSTR("go_inside_level");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

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
      v43[2] = __44__GEOPDVenueInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDVenueInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_236;
      else
        v6 = (int *)&readAll__nonRecursiveTag_237;
      GEOPDVenueInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDVenueInfoCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDVenueInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  GEOPDVenueIdentifier *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  int v20;
  const __CFString *v21;
  void *v22;
  GEOPDVenueItemList *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOPDLocatedInsideInfo *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  int v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  GEOPDFilterElementInfo *v53;
  GEOPDFilterElementInfo *v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  GEOPDVenueIdentifier *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  GEOPDVenueLabel *v68;
  GEOPDVenueLabel *v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  const __CFString *v86;
  void *v87;
  int v88;
  void *v90;
  id v91;
  id v92;
  const __CFString *v93;
  uint64_t v94;
  void *v95;
  id v96;
  const __CFString *v97;
  uint64_t v98;
  id obj;
  id obja;
  const __CFString *v101;
  id v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1 || (v103 = objc_msgSend(a1, "init")) == 0)
  {
    v103 = 0;
    goto LABEL_148;
  }
  if (a3)
    v6 = CFSTR("venueFeatureId");
  else
    v6 = CFSTR("venue_feature_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v109;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v109 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOPDVenueIdentifier alloc];
            if (v14)
              v15 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
            else
              v15 = 0;
            -[GEOPDVenueInfo addVenueFeatureId:](v103, v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
        v10 = v16;
      }
      while (v16);
    }

  }
  if (a3)
    v17 = CFSTR("featureType");
  else
    v17 = CFSTR("feature_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_VENUE")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_BUILDING")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_LEVEL")) & 1) != 0)
    {
      v20 = 3;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_POI")))
    {
      v20 = 4;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_41;
    v20 = objc_msgSend(v18, "intValue");
  }
  *(_BYTE *)(v103 + 76) |= 0x80u;
  *(_BYTE *)(v103 + 76) |= 1u;
  *(_DWORD *)(v103 + 68) = v20;
LABEL_41:

  if (a3)
    v21 = CFSTR("itemList");
  else
    v21 = CFSTR("item_list");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEOPDVenueItemList alloc];
    if (v23)
    {
      v24 = v22;
      v23 = -[GEOPDVenueItemList init](v23, "init");
      if (v23)
      {
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("title"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = (void *)objc_msgSend(v25, "copy");
          -[GEOPDVenueItemList setTitle:]((uint64_t)v23, v26);

        }
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("item"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          obj = v27;
          v101 = v17;
          v91 = v5;
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v28 = v27;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v113;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v113 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v34 = (void *)objc_msgSend(v33, "copy");
                  -[GEOPDVenueItemList addItem:]((uint64_t)v23, v34);

                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
            }
            while (v30);
          }

          v5 = v91;
          v27 = obj;
          v17 = v101;
        }

      }
    }
    -[GEOPDVenueInfo setItemList:](v103, v23);

  }
  if (a3)
    v35 = CFSTR("locatedInside");
  else
    v35 = CFSTR("located_inside");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_90;
  v37 = [GEOPDLocatedInsideInfo alloc];
  if (v37)
  {
    v38 = v36;
    v37 = -[GEOPDLocatedInsideInfo init](v37, "init");
    if (!v37)
    {
LABEL_88:

      goto LABEL_89;
    }
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("muid"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = objc_msgSend(v39, "unsignedLongLongValue");
      *(_BYTE *)&v37->_flags |= 1u;
      v37->_muid = v40;
    }

    objc_msgSend(v38, "objectForKeyedSubscript:", v17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v41;
      if ((objc_msgSend(v42, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_UNKNOWN")) & 1) != 0)
      {
        v43 = 0;
      }
      else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_VENUE")) & 1) != 0)
      {
        v43 = 1;
      }
      else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_BUILDING")) & 1) != 0)
      {
        v43 = 2;
      }
      else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_LEVEL")) & 1) != 0)
      {
        v43 = 3;
      }
      else if (objc_msgSend(v42, "isEqualToString:", CFSTR("VENUE_FEATURE_TYPE_POI")))
      {
        v43 = 4;
      }
      else
      {
        v43 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_87:

        goto LABEL_88;
      }
      v43 = objc_msgSend(v41, "intValue");
    }
    *(_BYTE *)&v37->_flags |= 2u;
    v37->_featureType = v43;
    goto LABEL_87;
  }
LABEL_89:
  -[GEOPDVenueInfo setLocatedInside:](v103, v37);

LABEL_90:
  if (a3)
    v44 = CFSTR("filterElement");
  else
    v44 = CFSTR("filter_element");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = v45;
    v92 = v5;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    obja = v45;
    v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
    if (v46)
    {
      v47 = v46;
      v48 = CFSTR("filter_id");
      v49 = *(_QWORD *)v105;
      if (a3)
        v48 = CFSTR("filterId");
      v97 = v48;
      v50 = CFSTR("name_short");
      if (a3)
        v50 = CFSTR("nameShort");
      v93 = v50;
      v94 = *(_QWORD *)v105;
      do
      {
        v51 = 0;
        v98 = v47;
        do
        {
          if (*(_QWORD *)v105 != v49)
            objc_enumerationMutation(obja);
          v52 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v51);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v53 = [GEOPDFilterElementInfo alloc];
            if (v53)
            {
              v54 = v53;
              v55 = v52;
              v56 = -[GEOPDFilterElementInfo init](v54, "init");
              if (v56)
              {
                objc_msgSend(v55, "objectForKeyedSubscript:", v97);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v102 = v55;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v114 = 0u;
                  v115 = 0u;
                  v112 = 0u;
                  v113 = 0u;
                  v95 = v57;
                  v58 = v57;
                  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
                  if (v59)
                  {
                    v60 = v59;
                    v61 = *(_QWORD *)v113;
                    do
                    {
                      v62 = 0;
                      do
                      {
                        if (*(_QWORD *)v113 != v61)
                          objc_enumerationMutation(v58);
                        v63 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v62);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v64 = [GEOPDVenueIdentifier alloc];
                          if (v64)
                            v65 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v64, v63, a3);
                          else
                            v65 = 0;
                          -[GEOPDFilterElementInfo addFilterId:](v56, v65);

                        }
                        ++v62;
                      }
                      while (v60 != v62);
                      v66 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
                      v60 = v66;
                    }
                    while (v66);
                  }

                  v49 = v94;
                  v57 = v95;
                  v47 = v98;
                  v55 = v102;
                }

                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("label"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v68 = [GEOPDVenueLabel alloc];
                  if (v68)
                  {
                    v69 = v68;
                    v70 = v67;
                    v71 = -[GEOPDVenueLabel init](v69, "init");
                    if (v71)
                    {
                      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("name"));
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v96 = v70;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v73 = (void *)objc_msgSend(v72, "copy");
                        v74 = v73;
                        *(_BYTE *)(v71 + 60) |= 8u;
                        *(_BYTE *)(v71 + 60) |= 0x10u;
                        v75 = v73;
                        v70 = v96;
                        objc_storeStrong((id *)(v71 + 40), v75);

                        v49 = v94;
                      }

                      objc_msgSend(v70, "objectForKeyedSubscript:", v93);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v77 = (void *)objc_msgSend(v76, "copy");
                        v78 = v77;
                        *(_BYTE *)(v71 + 60) |= 4u;
                        *(_BYTE *)(v71 + 60) |= 0x10u;
                        v79 = v77;
                        v70 = v96;
                        objc_storeStrong((id *)(v71 + 32), v79);

                        v49 = v94;
                      }

                      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("detail"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v81 = (void *)objc_msgSend(v80, "copy");
                        v82 = v81;
                        *(_BYTE *)(v71 + 60) |= 2u;
                        *(_BYTE *)(v71 + 60) |= 0x10u;
                        v83 = v81;
                        v70 = v96;
                        objc_storeStrong((id *)(v71 + 24), v83);

                        v49 = v94;
                      }

                    }
                  }
                  else
                  {
                    v71 = 0;
                  }
                  v84 = (id)v71;
                  *(_BYTE *)(v56 + 52) |= 4u;
                  *(_BYTE *)(v56 + 52) |= 8u;
                  objc_storeStrong((id *)(v56 + 32), (id)v71);

                  v47 = v98;
                  v55 = v102;
                }

              }
            }
            else
            {
              v56 = 0;
            }
            -[GEOPDVenueInfo addFilterElement:](v103, (void *)v56);

          }
          ++v51;
        }
        while (v51 != v47);
        v85 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
        v47 = v85;
      }
      while (v85);
    }

    v45 = v90;
    v5 = v92;
  }

  if (a3)
    v86 = CFSTR("goInsideLevel");
  else
    v86 = CFSTR("go_inside_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86, v90);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = objc_msgSend(v87, "intValue");
    *(_BYTE *)(v103 + 76) |= 0x80u;
    *(_BYTE *)(v103 + 76) |= 2u;
    *(_DWORD *)(v103 + 72) = v88;
  }

LABEL_148:
  return v103;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVenueInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $828191250CE4E31CB4ADEBFBD46947E8 flags;
  GEOPDVenueItemList *itemList;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  char IsDirty;
  PBDataReader *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  NSMutableArray *obj;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_31;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = self->_flags;
  if (*(unsigned int *)&flags > 0x3F)
    goto LABEL_31;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    itemList = self->_itemList;
    if (itemList)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&itemList->_readerLock);
      v8 = *(_BYTE *)&itemList->_flags & 0xE;
      os_unfair_lock_unlock(&itemList->_readerLock);
      if (v8)
        goto LABEL_31;
      *(_BYTE *)&flags = self->_flags;
    }
  }
  if ((*(_BYTE *)&flags & 0x28) == 0)
  {
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = self->_venueFeatureIds;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v41;
LABEL_11:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(obj);
          if (GEOPDVenueIdentifierIsDirty(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v11)))
            goto LABEL_30;
          if (v9 == ++v11)
          {
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
            if (v9)
              goto LABEL_11;
            break;
          }
        }
      }

      *(_BYTE *)&flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = self->_filterElements;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v37;
LABEL_21:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(obj);
          v15 = *(os_unfair_lock_s **)(*((_QWORD *)&v36 + 1) + 8 * v14);
          if (v15)
          {
            os_unfair_lock_lock_with_options();
            IsDirty = _GEOPDFilterElementInfoIsDirty((uint64_t)v15);
            os_unfair_lock_unlock(v15 + 12);
            if ((IsDirty & 1) != 0)
              break;
          }
          if (v12 == ++v14)
          {
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
            if (v12)
              goto LABEL_21;
            goto LABEL_28;
          }
        }
LABEL_30:

        goto LABEL_31;
      }
LABEL_28:

    }
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_54;
  }
LABEL_31:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = self->_venueFeatureIds;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v20);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_itemList)
    PBDataWriterWriteSubmessage();
  if (self->_locatedInside)
    PBDataWriterWriteSubmessage();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_filterElements;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_54:

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
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  PBUnknownFields *v23;
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
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDVenueInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_venueFeatureIds;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDVenueInfo addVenueFeatureId:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_featureType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v14 = -[GEOPDVenueItemList copyWithZone:](self->_itemList, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[GEOPDLocatedInsideInfo copyWithZone:](self->_locatedInside, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_filterElements;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        -[GEOPDVenueInfo addFilterElement:](v5, v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_goInsideLevel;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *venueFeatureIds;
  GEOPDVenueItemList *itemList;
  GEOPDLocatedInsideInfo *locatedInside;
  NSMutableArray *filterElements;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 1);
  -[GEOPDVenueInfo readAll:]((uint64_t)v4, 1);
  venueFeatureIds = self->_venueFeatureIds;
  if ((unint64_t)venueFeatureIds | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](venueFeatureIds, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 17))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  itemList = self->_itemList;
  if ((unint64_t)itemList | *((_QWORD *)v4 + 4) && !-[GEOPDVenueItemList isEqual:](itemList, "isEqual:"))
    goto LABEL_19;
  locatedInside = self->_locatedInside;
  if ((unint64_t)locatedInside | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDLocatedInsideInfo isEqual:](locatedInside, "isEqual:"))
      goto LABEL_19;
  }
  filterElements = self->_filterElements;
  if ((unint64_t)filterElements | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](filterElements, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 76) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_goInsideLevel != *((_DWORD *)v4 + 18))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDVenueInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_venueFeatureIds, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_featureType;
  else
    v4 = 0;
  v5 = -[GEOPDVenueItemList hash](self->_itemList, "hash");
  v6 = -[GEOPDLocatedInsideInfo hash](self->_locatedInside, "hash");
  v7 = -[NSMutableArray hash](self->_filterElements, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_goInsideLevel;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  id obj;
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
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 4u;
    *(_BYTE *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDVenueInfo readAll:](a1, 0);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v33 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDVenueIdentifier clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), 1);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v7);
      }

      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v10 + 52) |= 1u;
        *(_BYTE *)(v10 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 48));
        v11 = *(void **)(v10 + 16);
        *(_QWORD *)(v10 + 16) = 0;

        -[GEOPDVenueItemList readAll:](v10, 0);
      }
      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
      {
        v13 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = *(id *)(a1 + 24);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
            if (v18)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v18 + 52) |= 1u;
              *(_BYTE *)(v18 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 48));
              v19 = *(void **)(v18 + 16);
              *(_QWORD *)(v18 + 16) = 0;

              -[GEOPDFilterElementInfo readAll:](v18, 0);
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v20 = *(id *)(v18 + 24);
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v37;
                do
                {
                  for (k = 0; k != v22; ++k)
                  {
                    if (*(_QWORD *)v37 != v23)
                      objc_enumerationMutation(v20);
                    -[GEOPDVenueIdentifier clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), 1);
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
                }
                while (v22);
              }

              v25 = *(_QWORD *)(v18 + 32);
              if (v25)
              {
                os_unfair_lock_lock_with_options();
                *(_BYTE *)(v25 + 60) |= 1u;
                *(_BYTE *)(v25 + 60) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 56));
                v26 = *(void **)(v25 + 16);
                *(_QWORD *)(v25 + 16) = 0;

                -[GEOPDVenueLabel readAll:](v25, 0);
              }
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v15);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueFeatureIds, 0);
  objc_storeStrong((id *)&self->_locatedInside, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_storeStrong((id *)&self->_filterElements, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)venueInfoForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__GEOPDVenueInfo_PlaceDataExtras__venueInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 48, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__GEOPDVenueInfo_PlaceDataExtras__venueInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue venueInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

@end
