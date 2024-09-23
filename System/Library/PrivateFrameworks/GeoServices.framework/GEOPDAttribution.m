@implementation GEOPDAttribution

+ (id)attributionForPlaceDataReview:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", v3, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", v3, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)componentLevelAttributionForPlaceDataPhotos:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", v3, 26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", v3, 8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)attributionForPlaceDataEntity:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", a3, 1);
}

+ (id)attributionForPlaceDataEncyclopedia:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", a3, 22);
}

+ (id)attributionForPlaceDataRestaurantReservationLink:(id)a3
{
  return +[GEOPDPlace attributionForPlaceData:type:](GEOPDPlace, "attributionForPlaceData:type:", a3, 33);
}

+ (id)attributionForAnnotatedItemList:(id)a3 placeData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36;
  v17 = __Block_byref_object_dispose__36;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__GEOPDAttribution_PlaceDataExtras__attributionForAnnotatedItemList_placeData___block_invoke;
  v10[3] = &unk_1E1C098D0;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateComponentOfType:enumerationOptions:usingBlock:", 57, 1, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __79__GEOPDAttribution_PlaceDataExtras__attributionForAnnotatedItemList_placeData___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOPDComponent values](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDComponentValue annotatedItemList](*(id **)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32), (_QWORD)v16);

        if (v12)
        {
          -[GEOPDComponent attribution](v5);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

          *a3 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (BOOL)_isYelp
{
  void *v2;
  BOOL v3;

  -[GEOPDAttribution vendorId]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("yelp")) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (GEOPDAttribution)init
{
  GEOPDAttribution *v2;
  GEOPDAttribution *v3;
  GEOPDAttribution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAttribution;
  v2 = -[GEOPDAttribution init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAttribution)initWithData:(id)a3
{
  GEOPDAttribution *v3;
  GEOPDAttribution *v4;
  GEOPDAttribution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAttribution;
  v3 = -[GEOPDAttribution initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVendorId
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
        GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorId_tags_453);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)vendorId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAttribution _readVendorId]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setVendorId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x20u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readExternalItemId
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
        GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalItemId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)externalItemId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAttribution _readExternalItemId]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setExternalItemId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x10u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setExternalComponentId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 8u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readAttributionUrls
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
        GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributionUrls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)attributionUrls
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAttribution _readAttributionUrls]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addAttributionUrl:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAttribution _readAttributionUrls](a1);
    -[GEOPDAttribution _addNoFlagsAttributionUrl:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsAttributionUrl:(uint64_t)a1
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

- (void)setActionUrlComponent:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 2u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDAttribution;
  -[GEOPDAttribution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPDAttribution readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAttribution vendorId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("vendorId");
    else
      v6 = CFSTR("vendor_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDAttribution externalItemId]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("externalItemId");
    else
      v8 = CFSTR("external_item_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 8) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalComponentId_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v11 = *(id *)(a1 + 40);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("externalComponentId");
    else
      v12 = CFSTR("external_component_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    -[GEOPDAttribution attributionUrls]((id *)a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("attributionUrl");
    else
      v14 = CFSTR("attribution_url");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 2) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionUrlComponent_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v17 = *(id *)(a1 + 24);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("actionUrlComponent");
    else
      v18 = CFSTR("action_url_component");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46__GEOPDAttribution__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_470;
      else
        v6 = (int *)&readAll__nonRecursiveTag_471;
      GEOPDAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __46__GEOPDAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("vendorId");
    else
      v7 = CFSTR("vendor_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[GEOPDAttribution setVendorId:](v6, v9);

    }
    if (a3)
      v10 = CFSTR("externalItemId");
    else
      v10 = CFSTR("external_item_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[GEOPDAttribution setExternalItemId:](v6, v12);

    }
    if (a3)
      v13 = CFSTR("externalComponentId");
    else
      v13 = CFSTR("external_component_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[GEOPDAttribution setExternalComponentId:](v6, v15);

    }
    if (a3)
      v16 = CFSTR("attributionUrl");
    else
      v16 = CFSTR("attribution_url");
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v23, "copy", (_QWORD)v29);
              -[GEOPDAttribution addAttributionUrl:](v6, v24);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v20);
      }

    }
    if (a3)
      v25 = CFSTR("actionUrlComponent");
    else
      v25 = CFSTR("action_url_component");
    objc_msgSend(v5, "objectForKeyedSubscript:", v25, (_QWORD)v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[GEOPDAttribution setActionUrlComponent:](v6, v27);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAttribution readAll:]((uint64_t)self, 0);
    if (self->_vendorId)
      PBDataWriterWriteStringField();
    if (self->_externalItemId)
      PBDataWriterWriteStringField();
    if (self->_externalComponentId)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_attributionUrls;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_actionUrlComponent)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      GEOPDAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAttribution readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_vendorId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_externalItemId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_externalComponentId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_attributionUrls;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDAttribution addAttributionUrl:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_actionUrlComponent, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *vendorId;
  NSString *externalItemId;
  NSString *externalComponentId;
  NSMutableArray *attributionUrls;
  NSString *actionUrlComponent;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDAttribution readAll:]((uint64_t)self, 1),
         -[GEOPDAttribution readAll:]((uint64_t)v4, 1),
         vendorId = self->_vendorId,
         !((unint64_t)vendorId | v4[7]))
     || -[NSString isEqual:](vendorId, "isEqual:"))
    && ((externalItemId = self->_externalItemId, !((unint64_t)externalItemId | v4[6]))
     || -[NSString isEqual:](externalItemId, "isEqual:"))
    && ((externalComponentId = self->_externalComponentId, !((unint64_t)externalComponentId | v4[5]))
     || -[NSString isEqual:](externalComponentId, "isEqual:"))
    && ((attributionUrls = self->_attributionUrls, !((unint64_t)attributionUrls | v4[4]))
     || -[NSMutableArray isEqual:](attributionUrls, "isEqual:")))
  {
    actionUrlComponent = self->_actionUrlComponent;
    if ((unint64_t)actionUrlComponent | v4[3])
      v10 = -[NSString isEqual:](actionUrlComponent, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOPDAttribution readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_vendorId, "hash");
  v4 = -[NSString hash](self->_externalItemId, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_externalComponentId, "hash");
  v6 = -[NSMutableArray hash](self->_attributionUrls, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_actionUrlComponent, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOPDAttribution readAll:]((uint64_t)v3, 0);
    v5 = (void *)*((_QWORD *)v4 + 7);
    if (v5)
      -[GEOPDAttribution setVendorId:](a1, v5);
    v6 = (void *)*((_QWORD *)v4 + 6);
    if (v6)
      -[GEOPDAttribution setExternalItemId:](a1, v6);
    v7 = (void *)*((_QWORD *)v4 + 5);
    if (v7)
      -[GEOPDAttribution setExternalComponentId:](a1, v7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *((id *)v4 + 4);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[GEOPDAttribution addAttributionUrl:](a1, *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    v13 = (void *)*((_QWORD *)v4 + 3);
    if (v13)
      -[GEOPDAttribution setActionUrlComponent:](a1, v13);
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 1u;
    *(_BYTE *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDAttribution readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_externalComponentId, 0);
  objc_storeStrong((id *)&self->_attributionUrls, 0);
  objc_storeStrong((id *)&self->_actionUrlComponent, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
