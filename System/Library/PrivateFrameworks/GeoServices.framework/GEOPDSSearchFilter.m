@implementation GEOPDSSearchFilter

- (GEOPDSSearchFilter)init
{
  GEOPDSSearchFilter *v2;
  GEOPDSSearchFilter *v3;
  GEOPDSSearchFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSSearchFilter;
  v2 = -[GEOPDSSearchFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSSearchFilter)initWithData:(id)a3
{
  GEOPDSSearchFilter *v3;
  GEOPDSSearchFilter *v4;
  GEOPDSSearchFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSSearchFilter;
  v3 = -[GEOPDSSearchFilter initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSSearchFilter;
  -[GEOPDSSearchFilter dealloc](&v3, sel_dealloc);
}

- (void)setVenueFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x200u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }

}

- (void)setCategoryFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x40u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)setBrandFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x20u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (uint64_t)searchIntentFilter
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 116);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 108);
    else
      return 0;
  }
  return result;
}

- (void)setPoiIconCategoryFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x100u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }

}

- (void)_readImplictQueryCategoryFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImplictQueryCategoryFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)implictQueryCategoryFilter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSSearchFilter _readImplictQueryCategoryFilter]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)setImplictQueryCategoryFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x80u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)_readResultTypeFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultTypeFilters_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)addResultTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSSearchFilter _readResultTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 116) |= 0x400u;
  }
}

- (void)_readAddressResultSubTypeFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)addressResultSubTypeFilter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSSearchFilter _readAddressResultSubTypeFilter]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setAddressResultSubTypeFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x10u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
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
  v8.super_class = (Class)GEOPDSSearchFilter;
  -[GEOPDSSearchFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  __CFString *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v55[4];
  id v56;

  if (!a1)
    return 0;
  -[GEOPDSSearchFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueFilter_tags_0);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v7 = *(id *)(a1 + 88);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("venueFilter");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("venue_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryFilter_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v13 = *(id *)(a1 + 64);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("categoryFilter");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("category_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandFilter_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v19 = *(id *)(a1 + 56);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("brandFilter");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("brand_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  if ((*(_WORD *)(a1 + 116) & 1) != 0)
  {
    v23 = *(int *)(a1 + 108);
    if (v23 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 108));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E1C05A50[v23];
    }
    if (a2)
      v25 = CFSTR("searchIntentFilter");
    else
      v25 = CFSTR("search_intent_filter");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
  {
    v26 = *(void **)(a1 + 8);
    if (v26)
    {
      v27 = v26;
      objc_sync_enter(v27);
      GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags_0);
      objc_sync_exit(v27);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v28 = *(id *)(a1 + 80);
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("poiIconCategoryFilter");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("poi_icon_category_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  -[GEOPDSSearchFilter implictQueryCategoryFilter]((id *)a1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("implictQueryCategoryFilter");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("implict_query_category_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("isStrictMapRegion");
    else
      v37 = CFSTR("is_strict_map_region");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v40 = 0;
      do
      {
        v41 = *(int *)(*v39 + 4 * v40);
        if (v41 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v41);
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = off_1E1C059F0[v41];
        }
        objc_msgSend(v38, "addObject:", v42);

        ++v40;
        v39 = (_QWORD *)(a1 + 24);
      }
      while (v40 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v43 = CFSTR("resultTypeFilter");
    else
      v43 = CFSTR("result_type_filter");
    objc_msgSend(v4, "setObject:forKey:", v38, v43);

  }
  -[GEOPDSSearchFilter addressResultSubTypeFilter]((id *)a1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("addressResultSubTypeFilter");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("address_result_sub_type_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  v48 = *(void **)(a1 + 16);
  if (v48)
  {
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __48__GEOPDSSearchFilter__dictionaryRepresentation___block_invoke;
      v55[3] = &unk_1E1C00600;
      v52 = v51;
      v56 = v52;
      objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v55);
      v53 = v52;

      v50 = v53;
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_417;
      else
        v6 = (int *)&readAll__nonRecursiveTag_418;
      GEOPDSSearchFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSSearchFilterCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __48__GEOPDSSearchFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  GEOPDSSearchVenueFilter *v9;
  GEOPDSSearchVenueFilter *v10;
  id v11;
  uint64_t v12;
  void *v13;
  GEOPDVenueIdentifier *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  int v19;
  const __CFString *v20;
  void *v21;
  GEOPDSCategoryFilter *v22;
  GEOPDSCategoryFilter *v23;
  id v24;
  GEOPDSCategoryFilter *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOPDSBrandFilter *v31;
  GEOPDSBrandFilter *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  id v40;
  int v41;
  const __CFString *v42;
  void *v43;
  GEOPDPoiIconCategoryFilter *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEOPDSImplicitQueryCategoryFilter *v48;
  GEOPDSImplicitQueryCategoryFilter *v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  id v54;
  int v55;
  const __CFString *v56;
  void *v57;
  GEOPDSImplicitQuerySearchForEVCharger *v58;
  GEOPDSImplicitQuerySearchForEVCharger *v59;
  id v60;
  uint64_t v61;
  const __CFString *v62;
  void *v63;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  GEOPDSImplicitQuerySearchAroundPOI *v67;
  GEOPDSImplicitQuerySearchAroundPOI *v68;
  id v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  int v75;
  void *v76;
  GEOLatLng *v77;
  GEOLatLng *v78;
  GEOLatLng *v79;
  const __CFString *v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  void *v84;
  GEOPDSImplicitQueryIntroTipForHiking *v85;
  GEOPDSImplicitQueryIntroTipForHiking *v86;
  id v87;
  uint64_t v88;
  const __CFString *v89;
  int v90;
  void *v91;
  GEOLatLng *v92;
  GEOLatLng *v93;
  GEOLatLng *v94;
  const __CFString *v95;
  void *v96;
  uint64_t v97;
  const __CFString *v98;
  void *v99;
  char v100;
  const __CFString *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  void *v108;
  id v109;
  const __CFString *v110;
  void *v111;
  GEOPDAddressResultSubTypeFilter *v112;
  void *v113;
  void *v115;
  id v116;
  id v117;
  id v118;
  int v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_209;
  }
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("venueFilter");
    else
      v7 = CFSTR("venue_filter");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_31:

      if (a3)
        v20 = CFSTR("categoryFilter");
      else
        v20 = CFSTR("category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOPDSCategoryFilter alloc];
        if (v22)
        {
          v23 = v22;
          v24 = v21;
          v25 = -[GEOPDSCategoryFilter init](v23, "init");
          if (v25)
          {
            if (a3)
              v26 = CFSTR("categoryMetadata");
            else
              v26 = CFSTR("category_metadata");
            objc_msgSend(v24, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v27, 0);
              -[GEOPDSCategoryFilter setCategoryMetadata:]((uint64_t)v25, v28);

            }
          }

        }
        else
        {
          v25 = 0;
        }
        -[GEOPDSSearchFilter setCategoryFilter:](v6, v25);

      }
      if (a3)
        v29 = CFSTR("brandFilter");
      else
        v29 = CFSTR("brand_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEOPDSBrandFilter alloc];
        if (v31)
        {
          v32 = v31;
          v33 = v30;
          v34 = -[GEOPDSBrandFilter init](v32, "init");
          if (v34)
          {
            if (a3)
              v35 = CFSTR("brandMuid");
            else
              v35 = CFSTR("brand_muid");
            objc_msgSend(v33, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = objc_msgSend(v36, "unsignedLongLongValue");
              *(_BYTE *)(v34 + 24) |= 1u;
              *(_QWORD *)(v34 + 16) = v37;
            }

          }
        }
        else
        {
          v34 = 0;
        }
        -[GEOPDSSearchFilter setBrandFilter:](v6, (void *)v34);

      }
      if (a3)
        v38 = CFSTR("searchIntentFilter");
      else
        v38 = CFSTR("search_intent_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v39;
        if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v41 = 0;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_POI_ONLY")) & 1) != 0)
        {
          v41 = 1;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_GEO_CODING_ONLY")) & 1) != 0)
        {
          v41 = 2;
        }
        else if (objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_INTENT_TYPE_ANY")))
        {
          v41 = 3;
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
          goto LABEL_76;
        v41 = objc_msgSend(v39, "intValue");
      }
      *(_WORD *)(v6 + 116) |= 0x400u;
      *(_WORD *)(v6 + 116) |= 1u;
      *(_DWORD *)(v6 + 108) = v41;
LABEL_76:

      if (a3)
        v42 = CFSTR("poiIconCategoryFilter");
      else
        v42 = CFSTR("poi_icon_category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = [GEOPDPoiIconCategoryFilter alloc];
        if (v44)
          v45 = -[GEOPDPoiIconCategoryFilter _initWithDictionary:isJSON:](v44, v43, a3);
        else
          v45 = 0;
        -[GEOPDSSearchFilter setPoiIconCategoryFilter:](v6, v45);

      }
      if (a3)
        v46 = CFSTR("implictQueryCategoryFilter");
      else
        v46 = CFSTR("implict_query_category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_174;
      v48 = [GEOPDSImplicitQueryCategoryFilter alloc];
      if (!v48)
      {
        v51 = 0;
        goto LABEL_173;
      }
      v49 = v48;
      v50 = v47;
      v51 = -[GEOPDSImplicitQueryCategoryFilter init](v49, "init");
      if (!v51)
      {
LABEL_172:

LABEL_173:
        -[GEOPDSSearchFilter setImplictQueryCategoryFilter:](v6, (void *)v51);

LABEL_174:
        if (a3)
          v98 = CFSTR("isStrictMapRegion");
        else
          v98 = CFSTR("is_strict_map_region");
        objc_msgSend(v5, "objectForKeyedSubscript:", v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v100 = objc_msgSend(v99, "BOOLValue");
          *(_WORD *)(v6 + 116) |= 0x400u;
          *(_WORD *)(v6 + 116) |= 2u;
          *(_BYTE *)(v6 + 112) = v100;
        }

        if (a3)
          v101 = CFSTR("resultTypeFilter");
        else
          v101 = CFSTR("result_type_filter");
        objc_msgSend(v5, "objectForKeyedSubscript:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v119 = a3;
          v115 = v102;
          v118 = v5;
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v103 = v102;
          v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
          if (!v104)
            goto LABEL_200;
          v105 = v104;
          v106 = *(_QWORD *)v121;
          while (1)
          {
            for (i = 0; i != v105; ++i)
            {
              if (*(_QWORD *)v121 != v106)
                objc_enumerationMutation(v103);
              v108 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v109 = v108;
                if ((objc_msgSend(v109, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_FILTER_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v109, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_FILTER_POI")) & 1) == 0
                  && (objc_msgSend(v109, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_FILTER_PHYSICAL_FEATURE")) & 1) == 0)
                {
                  objc_msgSend(v109, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_FILTER_ADDRESS"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v108, "intValue");
              }
              -[GEOPDSSearchFilter addResultTypeFilter:](v6);
            }
            v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
            if (!v105)
            {
LABEL_200:

              v102 = v115;
              v5 = v118;
              a3 = v119;
              break;
            }
          }
        }

        if (a3)
          v110 = CFSTR("addressResultSubTypeFilter");
        else
          v110 = CFSTR("address_result_sub_type_filter");
        objc_msgSend(v5, "objectForKeyedSubscript:", v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v112 = [GEOPDAddressResultSubTypeFilter alloc];
          if (v112)
            v113 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v112, v111, a3);
          else
            v113 = 0;
          -[GEOPDSSearchFilter setAddressResultSubTypeFilter:](v6, v113);

        }
        goto LABEL_209;
      }
      if (a3)
        v52 = CFSTR("implicitQueryType");
      else
        v52 = CFSTR("implicit_query_type");
      objc_msgSend(v50, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = v53;
        if ((objc_msgSend(v54, "isEqualToString:", CFSTR("IMPLICIT_QUERY_TYPE_UNKNOWN")) & 1) != 0)
        {
          v55 = 0;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("IMPLICIT_QUERY_TYPE_SEARCH_FOR_EVCHARGER")) & 1) != 0)
        {
          v55 = 1;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("IMPLICIT_QUERY_TYPE_SEARCH_AROUND_POI")) & 1) != 0)
        {
          v55 = 2;
        }
        else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("IMPLICIT_QUERY_TYPE_SEARCH_AROUND_HIKING")) & 1) != 0)
        {
          v55 = 3;
        }
        else if (objc_msgSend(v54, "isEqualToString:", CFSTR("IMPLICIT_QUERY_TYPE_SEARCH_FOR_BEACH_AND_RELATED_CONCEPT")))
        {
          v55 = 4;
        }
        else
        {
          v55 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          if (a3)
            v56 = CFSTR("implicitQuerySearchForEvcharger");
          else
            v56 = CFSTR("implicit_query_search_for_evcharger");
          objc_msgSend(v50, "objectForKeyedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v58 = [GEOPDSImplicitQuerySearchForEVCharger alloc];
            if (v58)
            {
              v59 = v58;
              v60 = v57;
              v61 = -[GEOPDSImplicitQuerySearchForEVCharger init](v59, "init");
              if (v61)
              {
                if (a3)
                  v62 = CFSTR("encryptedCurrentEvchargerStopMuid");
                else
                  v62 = CFSTR("encrypted_current_evcharger_stop_muid");
                objc_msgSend(v60, "objectForKeyedSubscript:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v64 = objc_msgSend(v63, "unsignedLongLongValue");
                  *(_BYTE *)(v61 + 24) |= 1u;
                  *(_QWORD *)(v61 + 16) = v64;
                }

              }
            }
            else
            {
              v61 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:](v51, (void *)v61);

          }
          if (a3)
            v65 = CFSTR("implicitQuerySearchAroundPoi");
          else
            v65 = CFSTR("implicit_query_search_around_poi");
          objc_msgSend(v50, "objectForKeyedSubscript:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = [GEOPDSImplicitQuerySearchAroundPOI alloc];
            if (v67)
            {
              v68 = v67;
              v69 = v66;
              v70 = -[GEOPDSImplicitQuerySearchAroundPOI init](v68, "init");
              if (v70)
              {
                v116 = v50;
                if (a3)
                  v71 = CFSTR("categoryIdOfPoi");
                else
                  v71 = CFSTR("category_id_of_poi");
                objc_msgSend(v69, "objectForKeyedSubscript:", v71);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v73 = (void *)objc_msgSend(v72, "copy");
                  -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:](v70, v73);

                }
                if (a3)
                  v74 = CFSTR("referenceLocation");
                else
                  v74 = CFSTR("reference_location");
                objc_msgSend(v69, "objectForKeyedSubscript:", v74);
                v75 = a3;
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v77 = [GEOLatLng alloc];
                  if ((v75 & 1) != 0)
                    v78 = -[GEOLatLng initWithJSON:](v77, "initWithJSON:", v76);
                  else
                    v78 = -[GEOLatLng initWithDictionary:](v77, "initWithDictionary:", v76);
                  v79 = v78;
                  -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:](v70, v78);

                }
                if (v75)
                  v80 = CFSTR("encryptedMuidOfPoi");
                else
                  v80 = CFSTR("encrypted_muid_of_poi");
                objc_msgSend(v69, "objectForKeyedSubscript:", v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                a3 = v75;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v82 = objc_msgSend(v81, "unsignedLongLongValue");
                  *(_BYTE *)(v70 + 60) |= 0x10u;
                  *(_BYTE *)(v70 + 60) |= 1u;
                  *(_QWORD *)(v70 + 32) = v82;
                }

                v50 = v116;
              }

            }
            else
            {
              v70 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:](v51, (void *)v70);

          }
          if (a3)
            v83 = CFSTR("implicitQueryIntroTipForHiking");
          else
            v83 = CFSTR("implicit_query_intro_tip_for_hiking");
          objc_msgSend(v50, "objectForKeyedSubscript:", v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v85 = [GEOPDSImplicitQueryIntroTipForHiking alloc];
            if (v85)
            {
              v86 = v85;
              v87 = v84;
              v88 = -[GEOPDSImplicitQueryIntroTipForHiking init](v86, "init");
              if (v88)
              {
                v117 = v50;
                if (a3)
                  v89 = CFSTR("referenceLocation");
                else
                  v89 = CFSTR("reference_location");
                objc_msgSend(v87, "objectForKeyedSubscript:", v89);
                v90 = a3;
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v92 = [GEOLatLng alloc];
                  if ((v90 & 1) != 0)
                    v93 = -[GEOLatLng initWithJSON:](v92, "initWithJSON:", v91);
                  else
                    v93 = -[GEOLatLng initWithDictionary:](v92, "initWithDictionary:", v91);
                  v94 = v93;
                  -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:](v88, v93);

                }
                if (v90)
                  v95 = CFSTR("encryptedMuidOfPoi");
                else
                  v95 = CFSTR("encrypted_muid_of_poi");
                objc_msgSend(v87, "objectForKeyedSubscript:", v95);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                a3 = v90;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v97 = objc_msgSend(v96, "unsignedLongLongValue");
                  *(_BYTE *)(v88 + 32) |= 1u;
                  *(_QWORD *)(v88 + 16) = v97;
                }

                v50 = v117;
              }

            }
            else
            {
              v88 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:](v51, (void *)v88);

          }
          goto LABEL_172;
        }
        v55 = objc_msgSend(v53, "intValue");
      }
      *(_BYTE *)(v51 + 64) |= 0x20u;
      *(_BYTE *)(v51 + 64) |= 1u;
      *(_DWORD *)(v51 + 60) = v55;
      goto LABEL_108;
    }
    v9 = [GEOPDSSearchVenueFilter alloc];
    if (!v9)
    {
      v12 = 0;
      goto LABEL_30;
    }
    v10 = v9;
    v11 = v8;
    v12 = -[GEOPDSSearchVenueFilter init](v10, "init");
    if (!v12)
    {
LABEL_29:

LABEL_30:
      -[GEOPDSSearchFilter setVenueFilter:](v6, (void *)v12);

      goto LABEL_31;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = [GEOPDVenueIdentifier alloc];
      if (v14)
        v15 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
      else
        v15 = 0;
      -[GEOPDSSearchVenueFilter setVenueFilter:](v12, v15);

    }
    if (a3)
      v16 = CFSTR("venueSearchType");
    else
      v16 = CFSTR("venue_search_type");
    objc_msgSend(v11, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("SEARCH_TYPE_UNKNOWN")) & 1) != 0)
      {
        v19 = 0;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("SEARCH_TYPE_INSIDE")) & 1) != 0)
      {
        v19 = 1;
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("SEARCH_TYPE_BUILDING_ONLY")))
      {
        v19 = 2;
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      v19 = objc_msgSend(v17, "intValue");
    }
    *(_BYTE *)(v12 + 28) |= 1u;
    *(_DWORD *)(v12 + 24) = v19;
    goto LABEL_28;
  }
LABEL_209:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSSearchFilterIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSSearchFilter readAll:]((uint64_t)self, 0);
    if (self->_venueFilter)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_categoryFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_brandFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_implictQueryCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_resultTypeFilters.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_resultTypeFilters.count);
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDSSearchFilter _readImplictQueryCategoryFilter](result);
    return -[GEOPDSImplicitQueryCategoryFilter hasGreenTeaWithValue:](*(_QWORD *)(v3 + 72), a2);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSSearchFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDSSearchVenueFilter copyWithZone:](self->_venueFilter, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v11 = -[GEOPDSCategoryFilter copyWithZone:](self->_categoryFilter, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[GEOPDSBrandFilter copyWithZone:](self->_brandFilter, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_searchIntentFilter;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  v15 = -[GEOPDPoiIconCategoryFilter copyWithZone:](self->_poiIconCategoryFilter, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v15;

  v17 = -[GEOPDSImplicitQueryCategoryFilter copyWithZone:](self->_implictQueryCategoryFilter, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 112) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  PBRepeatedInt32Copy();
  v19 = -[GEOPDAddressResultSubTypeFilter copyWithZone:](self->_addressResultSubTypeFilter, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSSearchVenueFilter *venueFilter;
  GEOPDSCategoryFilter *categoryFilter;
  GEOPDSBrandFilter *brandFilter;
  __int16 v8;
  GEOPDPoiIconCategoryFilter *poiIconCategoryFilter;
  GEOPDSImplicitQueryCategoryFilter *implictQueryCategoryFilter;
  __int16 v11;
  GEOPDAddressResultSubTypeFilter *addressResultSubTypeFilter;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 1);
  -[GEOPDSSearchFilter readAll:]((uint64_t)v4, 1);
  venueFilter = self->_venueFilter;
  if ((unint64_t)venueFilter | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDSSearchVenueFilter isEqual:](venueFilter, "isEqual:"))
      goto LABEL_28;
  }
  categoryFilter = self->_categoryFilter;
  if ((unint64_t)categoryFilter | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDSCategoryFilter isEqual:](categoryFilter, "isEqual:"))
      goto LABEL_28;
  }
  brandFilter = self->_brandFilter;
  if ((unint64_t)brandFilter | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDSBrandFilter isEqual:](brandFilter, "isEqual:"))
      goto LABEL_28;
  }
  v8 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_searchIntentFilter != *((_DWORD *)v4 + 27))
      goto LABEL_28;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_28;
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((_QWORD *)v4 + 10)
    && !-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:"))
  {
    goto LABEL_28;
  }
  implictQueryCategoryFilter = self->_implictQueryCategoryFilter;
  if ((unint64_t)implictQueryCategoryFilter | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDSImplicitQueryCategoryFilter isEqual:](implictQueryCategoryFilter, "isEqual:"))
      goto LABEL_28;
  }
  v11 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v11 & 2) != 0)
    {
      if (self->_isStrictMapRegion)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_28;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_25;
    }
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
  if ((v11 & 2) != 0)
    goto LABEL_28;
LABEL_25:
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_28;
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((_QWORD *)v4 + 6))
    v13 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  else
    v13 = 1;
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSSearchVenueFilter hash](self->_venueFilter, "hash");
  v4 = -[GEOPDSCategoryFilter hash](self->_categoryFilter, "hash");
  v5 = -[GEOPDSBrandFilter hash](self->_brandFilter, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_searchIntentFilter;
  else
    v6 = 0;
  v7 = -[GEOPDPoiIconCategoryFilter hash](self->_poiIconCategoryFilter, "hash");
  v8 = -[GEOPDSImplicitQueryCategoryFilter hash](self->_implictQueryCategoryFilter, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v9 = 2654435761 * self->_isStrictMapRegion;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = PBRepeatedInt32Hash();
  return v10 ^ v11 ^ -[GEOPDAddressResultSubTypeFilter hash](self->_addressResultSubTypeFilter, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _DWORD *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_92;
  v45 = v3;
  -[GEOPDSSearchFilter readAll:]((uint64_t)v3, 0);
  v5 = (uint64_t)v45;
  v6 = *(_QWORD *)(a1 + 88);
  v7 = (void *)v45[11];
  if (v6)
  {
    if (!v7)
      goto LABEL_15;
    v8 = v7;
    v9 = *(_QWORD *)(v6 + 16);
    v10 = (void *)v8[2];
    if (v9)
    {
      if (v10)
        -[GEOPDVenueIdentifier mergeFrom:](v9, v10);
    }
    else if (v10)
    {
      -[GEOPDSSearchVenueFilter setVenueFilter:](v6, v10);
    }
    if ((*((_BYTE *)v8 + 28) & 1) != 0)
    {
      *(_DWORD *)(v6 + 24) = *((_DWORD *)v8 + 6);
      *(_BYTE *)(v6 + 28) |= 1u;
    }

  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[GEOPDSSearchFilter setVenueFilter:](a1, v7);
  }
  v5 = (uint64_t)v45;
LABEL_15:
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD **)(v5 + 64);
  if (!v11)
  {
    if (!v12)
      goto LABEL_22;
    -[GEOPDSSearchFilter setCategoryFilter:](a1, v12);
    goto LABEL_21;
  }
  if (v12)
  {
    v13 = (void *)v12[2];
    if (v13)
    {
      -[GEOPDSCategoryFilter setCategoryMetadata:](v11, v13);
LABEL_21:
      v5 = (uint64_t)v45;
    }
  }
LABEL_22:
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(void **)(v5 + 56);
  if (v14)
  {
    if (!v15)
      goto LABEL_30;
    v16 = v15;
    if ((v16[3] & 1) != 0)
    {
      *(_QWORD *)(v14 + 16) = v16[2];
      *(_BYTE *)(v14 + 24) |= 1u;
    }

  }
  else
  {
    if (!v15)
      goto LABEL_30;
    -[GEOPDSSearchFilter setBrandFilter:](a1, v15);
  }
  v5 = (uint64_t)v45;
LABEL_30:
  if ((*(_WORD *)(v5 + 116) & 1) != 0)
  {
    *(_DWORD *)(a1 + 108) = *(_DWORD *)(v5 + 108);
    *(_WORD *)(a1 + 116) |= 1u;
  }
  v17 = *(_QWORD *)(a1 + 80);
  v18 = *(void **)(v5 + 80);
  if (v17)
  {
    if (!v18)
      goto LABEL_38;
    -[GEOPDPoiIconCategoryFilter mergeFrom:](v17, v18);
  }
  else
  {
    if (!v18)
      goto LABEL_38;
    -[GEOPDSSearchFilter setPoiIconCategoryFilter:](a1, v18);
  }
  v5 = (uint64_t)v45;
LABEL_38:
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(void **)(v5 + 72);
  if (v19)
  {
    if (!v20)
      goto LABEL_79;
    v21 = v20;
    -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)v21, 0);
    if ((v21[16] & 1) != 0)
    {
      *(_DWORD *)(v19 + 60) = v21[15];
      *(_BYTE *)(v19 + 64) |= 1u;
    }
    v22 = *(_QWORD *)(v19 + 40);
    v23 = (void *)*((_QWORD *)v21 + 5);
    if (v22)
    {
      if (v23)
      {
        v24 = v23;
        if ((v24[3] & 1) != 0)
        {
          *(_QWORD *)(v22 + 16) = v24[2];
          *(_BYTE *)(v22 + 24) |= 1u;
        }

      }
    }
    else if (v23)
    {
      -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:](v19, v23);
    }
    v25 = *(_QWORD *)(v19 + 32);
    v26 = (void *)*((_QWORD *)v21 + 4);
    if (v25)
    {
      if (v26)
      {
        v27 = v26;
        -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)v27, 0);
        v28 = (void *)*((_QWORD *)v27 + 3);
        if (v28)
          -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:](v25, v28);
        v29 = *(void **)(v25 + 40);
        v30 = *((_QWORD *)v27 + 5);
        if (v29)
        {
          if (v30)
            objc_msgSend(v29, "mergeFrom:");
        }
        else if (v30)
        {
          -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:](v25, *((void **)v27 + 5));
        }
        if ((*((_BYTE *)v27 + 60) & 1) != 0)
        {
          *(_QWORD *)(v25 + 32) = *((_QWORD *)v27 + 4);
          *(_BYTE *)(v25 + 60) |= 1u;
        }

      }
    }
    else if (v26)
    {
      -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:](v19, v26);
    }
    v31 = *(_QWORD *)(v19 + 24);
    v32 = (void *)*((_QWORD *)v21 + 3);
    if (v31)
    {
      if (v32)
      {
        v33 = v32;
        v34 = *(void **)(v31 + 24);
        v35 = *((_QWORD *)v33 + 3);
        if (v34)
        {
          if (v35)
            objc_msgSend(v34, "mergeFrom:");
        }
        else if (v35)
        {
          -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:](v31, *((void **)v33 + 3));
        }
        if ((*((_BYTE *)v33 + 32) & 1) != 0)
        {
          *(_QWORD *)(v31 + 16) = *((_QWORD *)v33 + 2);
          *(_BYTE *)(v31 + 32) |= 1u;
        }

      }
    }
    else if (v32)
    {
      -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:](v19, v32);
    }

  }
  else
  {
    if (!v20)
      goto LABEL_79;
    -[GEOPDSSearchFilter setImplictQueryCategoryFilter:](a1, v20);
  }
  v5 = (uint64_t)v45;
LABEL_79:
  if ((*(_WORD *)(v5 + 116) & 2) != 0)
  {
    *(_BYTE *)(a1 + 112) = *(_BYTE *)(v5 + 112);
    *(_WORD *)(a1 + 116) |= 2u;
  }
  -[GEOPDSSearchFilter _readResultTypeFilters](v5);
  v4 = v45;
  v36 = v45[4];
  if (v36)
  {
    v37 = 0;
    v38 = *MEMORY[0x1E0C99858];
    do
    {
      -[GEOPDSSearchFilter _readResultTypeFilters]((uint64_t)v4);
      v39 = v45[4];
      if (v39 <= v37)
      {
        v40 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v37, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "exceptionWithName:reason:userInfo:", v38, v41, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "raise");

      }
      -[GEOPDSSearchFilter addResultTypeFilter:](a1);
      ++v37;
      v4 = v45;
    }
    while (v36 != v37);
  }
  v43 = *(_QWORD *)(a1 + 48);
  v44 = (void *)v4[6];
  if (v43)
  {
    if (v44)
    {
      -[GEOPDAddressResultSubTypeFilter mergeFrom:](v43, v44);
LABEL_91:
      v4 = v45;
    }
  }
  else if (v44)
  {
    -[GEOPDSSearchFilter setAddressResultSubTypeFilter:](a1, v44);
    goto LABEL_91;
  }
LABEL_92:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 4u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSSearchFilter readAll:](a1, 0);
      -[GEOPDSSearchVenueFilter clearUnknownFields:](*(_QWORD *)(a1 + 88), 1);
      v5 = *(_QWORD *)(a1 + 64);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      v7 = *(_QWORD *)(a1 + 56);
      if (v7)
      {
        v8 = *(void **)(v7 + 8);
        *(_QWORD *)(v7 + 8) = 0;

      }
      -[GEOPDPoiIconCategoryFilter clearUnknownFields:](*(_QWORD *)(a1 + 80), 1);
      -[GEOPDSImplicitQueryCategoryFilter clearUnknownFields:](*(_QWORD *)(a1 + 72), 1);
      -[GEOPDAddressResultSubTypeFilter clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueFilter, 0);
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_implictQueryCategoryFilter, 0);
  objc_storeStrong((id *)&self->_categoryFilter, 0);
  objc_storeStrong((id *)&self->_brandFilter, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
