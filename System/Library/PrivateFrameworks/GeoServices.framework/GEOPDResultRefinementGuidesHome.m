@implementation GEOPDResultRefinementGuidesHome

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    -[GEOPDResultRefinementGuidesHome _readCenter](result);
    if ((objc_msgSend(v3[3], "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDResultRefinementGuidesHome _readMapRegion]((uint64_t)v3);
    if ((objc_msgSend(v3[6], "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDResultRefinementGuidesHome _readPlaceId]((uint64_t)v3);
      return objc_msgSend(v3[8], "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  void **v3;
  void **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_36;
  v16 = v3;
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)v3, 0);
  v4 = v16;
  if (((_WORD)v16[11] & 1) != 0)
  {
    *(_DWORD *)(a1 + 84) = *((_DWORD *)v16 + 21);
    *(_WORD *)(a1 + 88) |= 1u;
  }
  v5 = *(void **)(a1 + 64);
  v6 = v16[8];
  if (v5)
  {
    if (!v6)
      goto LABEL_10;
    objc_msgSend(v5, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    -[GEOPDResultRefinementGuidesHome setPlaceId:](a1, v16[8]);
  }
  v4 = v16;
LABEL_10:
  v7 = *(void **)(a1 + 48);
  v8 = v4[6];
  if (v7)
  {
    if (!v8)
      goto LABEL_16;
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_16;
    -[GEOPDResultRefinementGuidesHome setMapRegion:](a1, v4[6]);
  }
  v4 = v16;
LABEL_16:
  v9 = *(void **)(a1 + 24);
  v10 = v4[3];
  if (v9)
  {
    if (!v10)
      goto LABEL_22;
    objc_msgSend(v9, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_22;
    -[GEOPDResultRefinementGuidesHome setCenter:](a1, v4[3]);
  }
  v4 = v16;
LABEL_22:
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v4[5];
  if (v11)
  {
    if (!v12)
      goto LABEL_28;
    -[GEOPDRelatedSearchSuggestion mergeFrom:](v11, v12);
  }
  else
  {
    if (!v12)
      goto LABEL_28;
    -[GEOPDResultRefinementGuidesHome setHint:](a1, v12);
  }
  v4 = v16;
LABEL_28:
  v13 = v4[4];
  if (v13)
  {
    -[GEOPDResultRefinementGuidesHome setDisplayName:](a1, v13);
    v4 = v16;
  }
  v14 = *(void **)(a1 + 56);
  v15 = v4[7];
  if (v14)
  {
    if (v15)
    {
      objc_msgSend(v14, "mergeFrom:");
LABEL_35:
      v4 = v16;
    }
  }
  else if (v15)
  {
    -[GEOPDResultRefinementGuidesHome setMetadata:](a1, v4[7]);
    goto LABEL_35;
  }
LABEL_36:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 2u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementGuidesHome readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 64), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 24), "clearUnknownFields:", 1);
      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(a1 + 40), 1);
      objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDResultRefinementGuidesHome)init
{
  GEOPDResultRefinementGuidesHome *v2;
  GEOPDResultRefinementGuidesHome *v3;
  GEOPDResultRefinementGuidesHome *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementGuidesHome;
  v2 = -[GEOPDResultRefinementGuidesHome init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementGuidesHome)initWithData:(id)a3
{
  GEOPDResultRefinementGuidesHome *v3;
  GEOPDResultRefinementGuidesHome *v4;
  GEOPDResultRefinementGuidesHome *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementGuidesHome;
  v3 = -[GEOPDResultRefinementGuidesHome initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceId_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setPlaceId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x80u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x20u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 4u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x10u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 8u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x40u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);

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
  v8.super_class = (Class)GEOPDResultRefinementGuidesHome;
  -[GEOPDResultRefinementGuidesHome description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementGuidesHome dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementGuidesHome _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementGuidesHome readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    v5 = *(int *)(a1 + 84);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0DD58[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  -[GEOPDResultRefinementGuidesHome _readPlaceId](a1);
  v7 = *(id *)(a1 + 64);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("placeId");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("place_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDResultRefinementGuidesHome _readMapRegion](a1);
  v11 = *(id *)(a1 + 48);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  -[GEOPDResultRefinementGuidesHome _readCenter](a1);
  v15 = *(id *)(a1 + 24);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("center"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHint_tags);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v20 = *(id *)(a1 + 40);
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("hint"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 8) == 0)
  {
    v23 = *(void **)(a1 + 8);
    if (v23)
    {
      v24 = v23;
      objc_sync_enter(v24);
      GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_3);
      objc_sync_exit(v24);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v25 = *(id *)(a1 + 32);
  if (v25)
  {
    if (a2)
      v26 = CFSTR("displayName");
    else
      v26 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_2);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v29 = *(id *)(a1 + 56);
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v29, "jsonRepresentation");
    else
      objc_msgSend(v29, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("metadata"));

  }
  v32 = *(void **)(a1 + 16);
  if (v32)
  {
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __61__GEOPDResultRefinementGuidesHome__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v36 = v35;
      v40 = v36;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v39);
      v37 = v36;

      v34 = v37;
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementGuidesHome _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_422;
      else
        v6 = (int *)&readAll__nonRecursiveTag_423;
      GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDResultRefinementGuidesHomeCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __61__GEOPDResultRefinementGuidesHome__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  GEOPDMapsIdentifier *v11;
  GEOPDMapsIdentifier *v12;
  GEOPDMapsIdentifier *v13;
  const __CFString *v14;
  void *v15;
  GEOMapRegion *v16;
  GEOMapRegion *v17;
  GEOMapRegion *v18;
  void *v19;
  GEOLatLng *v20;
  GEOLatLng *v21;
  GEOLatLng *v22;
  void *v23;
  GEOPDRelatedSearchSuggestion *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  GEOPDResultRefinementMetadata *v30;
  GEOPDResultRefinementMetadata *v31;
  GEOPDResultRefinementMetadata *v32;

  v5 = a2;
  if (!a1)
    goto LABEL_51;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_51;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME_TYPE_PLACE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME_TYPE_LOCATION")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    *(_WORD *)(a1 + 88) |= 0x100u;
    *(_WORD *)(a1 + 88) |= 1u;
    *(_DWORD *)(a1 + 84) = v8;
  }

  if (a3)
    v9 = CFSTR("placeId");
  else
    v9 = CFSTR("place_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOPDMapsIdentifier initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOPDMapsIdentifier initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = v12;
    -[GEOPDResultRefinementGuidesHome setPlaceId:](a1, v12);

  }
  if (a3)
    v14 = CFSTR("mapRegion");
  else
    v14 = CFSTR("map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOMapRegion initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOMapRegion initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = v17;
    -[GEOPDResultRefinementGuidesHome setMapRegion:](a1, v17);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOLatLng initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOLatLng initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = v21;
    -[GEOPDResultRefinementGuidesHome setCenter:](a1, v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hint"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOPDRelatedSearchSuggestion alloc];
    if (v24)
      v25 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v24, v23, a3);
    else
      v25 = 0;
    -[GEOPDResultRefinementGuidesHome setHint:](a1, v25);

  }
  if (a3)
    v26 = CFSTR("displayName");
  else
    v26 = CFSTR("display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    -[GEOPDResultRefinementGuidesHome setDisplayName:](a1, v28);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDResultRefinementMetadata alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOPDResultRefinementMetadata initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOPDResultRefinementMetadata initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = v31;
    -[GEOPDResultRefinementGuidesHome setMetadata:](a1, v31);

  }
LABEL_51:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementGuidesHomeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementGuidesHomeIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_placeId)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_hint)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_displayName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

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
  uint64_t v17;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDResultRefinementGuidesHomeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_type;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_placeId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDRelatedSearchSuggestion copyWithZone:](self->_hint, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDMapsIdentifier *placeId;
  GEOMapRegion *mapRegion;
  GEOLatLng *center;
  GEOPDRelatedSearchSuggestion *hint;
  NSString *displayName;
  GEOPDResultRefinementMetadata *metadata;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_type != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((_QWORD *)v4 + 8) && !-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    goto LABEL_19;
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_19;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_19;
  }
  hint = self->_hint;
  if ((unint64_t)hint | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](hint, "isEqual:"))
      goto LABEL_19;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_19;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 7))
    v12 = -[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;

  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEOPDMapsIdentifier hash](self->_placeId, "hash") ^ v3;
  v5 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v6 = v4 ^ v5 ^ -[GEOLatLng hash](self->_center, "hash");
  v7 = -[GEOPDRelatedSearchSuggestion hash](self->_hint, "hash");
  v8 = v7 ^ -[NSString hash](self->_displayName, "hash");
  return v6 ^ v8 ^ -[GEOPDResultRefinementMetadata hash](self->_metadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
