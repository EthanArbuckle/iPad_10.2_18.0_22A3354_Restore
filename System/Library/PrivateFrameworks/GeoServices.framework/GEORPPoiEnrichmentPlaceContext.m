@implementation GEORPPoiEnrichmentPlaceContext

- (GEORPPoiEnrichmentPlaceContext)init
{
  GEORPPoiEnrichmentPlaceContext *v2;
  GEORPPoiEnrichmentPlaceContext *v3;
  GEORPPoiEnrichmentPlaceContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  v2 = -[GEORPPoiEnrichmentPlaceContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiEnrichmentPlaceContext)initWithData:(id)a3
{
  GEORPPoiEnrichmentPlaceContext *v3;
  GEORPPoiEnrichmentPlaceContext *v4;
  GEORPPoiEnrichmentPlaceContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  v3 = -[GEORPPoiEnrichmentPlaceContext initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceId
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceId]((uint64_t)self);
  return self->_placeId != 0;
}

- (GEOPDMapsIdentifier)placeId
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceId]((uint64_t)self);
  return self->_placeId;
}

- (void)setPlaceId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_placeId, a3);
}

- (void)_readEntityNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntityNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)entityNames
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  return self->_entityNames;
}

- (void)setEntityNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entityNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  entityNames = self->_entityNames;
  self->_entityNames = v4;

}

- (void)clearEntityNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_entityNames, "removeAllObjects");
}

- (void)addEntityName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  -[GEORPPoiEnrichmentPlaceContext _addNoFlagsEntityName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsEntityName:(uint64_t)a1
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

- (unint64_t)entityNamesCount
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  return -[NSMutableArray count](self->_entityNames, "count");
}

- (id)entityNameAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentPlaceContext _readEntityNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entityNames, "objectAtIndex:", a3);
}

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

- (void)_readMapsCategoryId
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
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsCategoryId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapsCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId != 0;
}

- (NSString)mapsCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId;
}

- (void)setMapsCategoryId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (void)_readWalletCategoryId
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
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalletCategoryId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWalletCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId != 0;
}

- (NSString)walletCategoryId
{
  -[GEORPPoiEnrichmentPlaceContext _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId;
}

- (void)setWalletCategoryId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (void)_readLocalizedAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)localizedAddress
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  return self->_localizedAddress;
}

- (void)setLocalizedAddress:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedAddress;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  localizedAddress = self->_localizedAddress;
  self->_localizedAddress = v4;

}

- (void)clearLocalizedAddress
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_localizedAddress, "removeAllObjects");
}

- (void)addLocalizedAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  -[GEORPPoiEnrichmentPlaceContext _addNoFlagsLocalizedAddress:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1
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

- (unint64_t)localizedAddressCount
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedAddress, "count");
}

- (id)localizedAddressAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentPlaceContext _readLocalizedAddress]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedAddress, "objectAtIndex:", a3);
}

+ (Class)localizedAddressType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentPlaceContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCenter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceCenter
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceCenter]((uint64_t)self);
  return self->_placeCenter != 0;
}

- (GEOLatLng)placeCenter
{
  -[GEORPPoiEnrichmentPlaceContext _readPlaceCenter]((uint64_t)self);
  return self->_placeCenter;
}

- (void)setPlaceCenter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_placeCenter, a3);
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
  v8.super_class = (Class)GEORPPoiEnrichmentPlaceContext;
  -[GEORPPoiEnrichmentPlaceContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiEnrichmentPlaceContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiEnrichmentPlaceContext _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
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
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
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
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "placeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("placeId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("place_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(a1[2], "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = a1[2];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("entityName");
    else
      v17 = CFSTR("entity_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  objc_msgSend(a1, "mapsCategoryId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("mapsCategoryId");
    else
      v19 = CFSTR("maps_category_id");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  objc_msgSend(a1, "walletCategoryId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("walletCategoryId");
    else
      v21 = CFSTR("wallet_category_id");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  if (objc_msgSend(a1[3], "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v23 = a1[3];
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation", (_QWORD)v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29, (_QWORD)v36);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("localizedAddress");
    else
      v30 = CFSTR("localized_address");
    objc_msgSend(v4, "setObject:forKey:", v22, v30, (_QWORD)v36);

  }
  objc_msgSend(a1, "placeCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("placeCenter");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("place_center");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiEnrichmentPlaceContext _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPPoiEnrichmentPlaceContext)initWithDictionary:(id)a3
{
  return (GEORPPoiEnrichmentPlaceContext *)-[GEORPPoiEnrichmentPlaceContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDMapsIdentifier *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOLocalizedString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  GEOPDLocalizedAddress *v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  GEOLatLng *v41;
  uint64_t v42;
  void *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("placeId");
      else
        v6 = CFSTR("place_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDMapsIdentifier initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDMapsIdentifier initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPlaceId:", v9);

      }
      if (a3)
        v11 = CFSTR("entityName");
      else
        v11 = CFSTR("entity_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v45 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v51 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v20 = -[GEOLocalizedString initWithJSON:](v19, "initWithJSON:", v18);
                else
                  v20 = -[GEOLocalizedString initWithDictionary:](v19, "initWithDictionary:", v18);
                v21 = (void *)v20;
                objc_msgSend(a1, "addEntityName:", v20);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v15);
        }

        v5 = v45;
      }

      if (a3)
        v22 = CFSTR("mapsCategoryId");
      else
        v22 = CFSTR("maps_category_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(a1, "setMapsCategoryId:", v24);

      }
      if (a3)
        v25 = CFSTR("walletCategoryId");
      else
        v25 = CFSTR("wallet_category_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(a1, "setWalletCategoryId:", v27);

      }
      if (a3)
        v28 = CFSTR("localizedAddress");
      else
        v28 = CFSTR("localized_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v47;
          do
          {
            v34 = 0;
            do
            {
              if (*(_QWORD *)v47 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v34);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEOPDLocalizedAddress alloc];
                if (v36)
                  v37 = -[GEOPDLocalizedAddress _initWithDictionary:isJSON:](v36, v35, a3);
                else
                  v37 = 0;
                objc_msgSend(a1, "addLocalizedAddress:", v37);

              }
              ++v34;
            }
            while (v32 != v34);
            v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            v32 = v38;
          }
          while (v38);
        }

        v5 = v45;
      }

      if (a3)
        v39 = CFSTR("placeCenter");
      else
        v39 = CFSTR("place_center");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v42 = -[GEOLatLng initWithJSON:](v41, "initWithJSON:", v40);
        else
          v42 = -[GEOLatLng initWithDictionary:](v41, "initWithDictionary:", v40);
        v43 = (void *)v42;
        objc_msgSend(a1, "setPlaceCenter:", v42);

      }
    }
  }

  return a1;
}

- (GEORPPoiEnrichmentPlaceContext)initWithJSON:(id)a3
{
  return (GEORPPoiEnrichmentPlaceContext *)-[GEORPPoiEnrichmentPlaceContext _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_214;
    else
      v8 = (int *)&readAll__nonRecursiveTag_215;
    GEORPPoiEnrichmentPlaceContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPPoiEnrichmentPlaceContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiEnrichmentPlaceContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiEnrichmentPlaceContextReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPoiEnrichmentPlaceContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPoiEnrichmentPlaceContext readAll:](self, "readAll:", 0);
    if (self->_placeId)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_entityNames;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_mapsCategoryId)
      PBDataWriterWriteStringField();
    if (self->_walletCategoryId)
      PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_localizedAddress;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_placeCenter)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPoiEnrichmentPlaceContext _readPlaceCenter]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_placeCenter, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPPoiEnrichmentPlaceContext _readPlaceId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_placeId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEORPPoiEnrichmentPlaceContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeId)
    objc_msgSend(v12, "setPlaceId:");
  if (-[GEORPPoiEnrichmentPlaceContext entityNamesCount](self, "entityNamesCount"))
  {
    objc_msgSend(v12, "clearEntityNames");
    v4 = -[GEORPPoiEnrichmentPlaceContext entityNamesCount](self, "entityNamesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPPoiEnrichmentPlaceContext entityNameAtIndex:](self, "entityNameAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEntityName:", v7);

      }
    }
  }
  if (self->_mapsCategoryId)
    objc_msgSend(v12, "setMapsCategoryId:");
  if (self->_walletCategoryId)
    objc_msgSend(v12, "setWalletCategoryId:");
  if (-[GEORPPoiEnrichmentPlaceContext localizedAddressCount](self, "localizedAddressCount"))
  {
    objc_msgSend(v12, "clearLocalizedAddress");
    v8 = -[GEORPPoiEnrichmentPlaceContext localizedAddressCount](self, "localizedAddressCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPPoiEnrichmentPlaceContext localizedAddressAtIndex:](self, "localizedAddressAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addLocalizedAddress:", v11);

      }
    }
  }
  if (self->_placeCenter)
    objc_msgSend(v12, "setPlaceCenter:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
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
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      GEORPPoiEnrichmentPlaceContextReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPoiEnrichmentPlaceContext readAll:](self, "readAll:", 0);
  v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_placeId, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_entityNames;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addEntityName:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_mapsCategoryId, "copyWithZone:", a3);
  v16 = (void *)v5[4];
  v5[4] = v15;

  v17 = -[NSString copyWithZone:](self->_walletCategoryId, "copyWithZone:", a3);
  v18 = (void *)v5[7];
  v5[7] = v17;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self->_localizedAddress;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addLocalizedAddress:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v24 = -[GEOLatLng copyWithZone:](self->_placeCenter, "copyWithZone:", a3);
  v25 = (void *)v5[5];
  v5[5] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDMapsIdentifier *placeId;
  NSMutableArray *entityNames;
  NSString *mapsCategoryId;
  NSString *walletCategoryId;
  NSMutableArray *localizedAddress;
  GEOLatLng *placeCenter;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPPoiEnrichmentPlaceContext readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         placeId = self->_placeId,
         !((unint64_t)placeId | v4[6]))
     || -[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    && ((entityNames = self->_entityNames, !((unint64_t)entityNames | v4[2]))
     || -[NSMutableArray isEqual:](entityNames, "isEqual:"))
    && ((mapsCategoryId = self->_mapsCategoryId, !((unint64_t)mapsCategoryId | v4[4]))
     || -[NSString isEqual:](mapsCategoryId, "isEqual:"))
    && ((walletCategoryId = self->_walletCategoryId, !((unint64_t)walletCategoryId | v4[7]))
     || -[NSString isEqual:](walletCategoryId, "isEqual:"))
    && ((localizedAddress = self->_localizedAddress, !((unint64_t)localizedAddress | v4[3]))
     || -[NSMutableArray isEqual:](localizedAddress, "isEqual:")))
  {
    placeCenter = self->_placeCenter;
    if ((unint64_t)placeCenter | v4[5])
      v11 = -[GEOLatLng isEqual:](placeCenter, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEORPPoiEnrichmentPlaceContext readAll:](self, "readAll:", 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_placeId, "hash");
  v4 = -[NSMutableArray hash](self->_entityNames, "hash") ^ v3;
  v5 = -[NSString hash](self->_mapsCategoryId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_walletCategoryId, "hash");
  v7 = -[NSMutableArray hash](self->_localizedAddress, "hash");
  return v6 ^ v7 ^ -[GEOLatLng hash](self->_placeCenter, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOPDMapsIdentifier *placeId;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  GEOLatLng *placeCenter;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  placeId = self->_placeId;
  v6 = v4[6];
  if (placeId)
  {
    if (v6)
      -[GEOPDMapsIdentifier mergeFrom:](placeId, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPPoiEnrichmentPlaceContext setPlaceId:](self, "setPlaceId:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4[2];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[GEORPPoiEnrichmentPlaceContext addEntityName:](self, "addEntityName:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  if (v4[4])
    -[GEORPPoiEnrichmentPlaceContext setMapsCategoryId:](self, "setMapsCategoryId:");
  if (v4[7])
    -[GEORPPoiEnrichmentPlaceContext setWalletCategoryId:](self, "setWalletCategoryId:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v4[3];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[GEORPPoiEnrichmentPlaceContext addLocalizedAddress:](self, "addLocalizedAddress:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  placeCenter = self->_placeCenter;
  v18 = v4[5];
  if (placeCenter)
  {
    if (v18)
      -[GEOLatLng mergeFrom:](placeCenter, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEORPPoiEnrichmentPlaceContext setPlaceCenter:](self, "setPlaceCenter:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_placeCenter, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)buildPlaceContextWithPlaceData:(id)a3
{
  id v3;
  GEORPPoiEnrichmentPlaceContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  GEOPDLocalizedAddress *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  GEORPPoiEnrichmentPlaceContext *v18;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(GEORPPoiEnrichmentPlaceContext);
    +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapsId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPPoiEnrichmentPlaceContext setPlaceId:](v4, "setPlaceId:", v6);

    objc_msgSend(v5, "names");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPPoiEnrichmentPlaceContext setEntityNames:](v4, "setEntityNames:", v7);

    objc_msgSend(v5, "mapsCategoryId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPPoiEnrichmentPlaceContext setMapsCategoryId:](v4, "setMapsCategoryId:", v8);

    objc_msgSend(v5, "walletCategoryId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPPoiEnrichmentPlaceContext setWalletCategoryId:](v4, "setWalletCategoryId:", v9);

    +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", v3);
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceInfo center](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPPoiEnrichmentPlaceContext setPlaceCenter:](v4, "setPlaceCenter:", v11);

    +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(GEOPDLocalizedAddress);
      objc_msgSend(v12, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDLocalizedAddress setAddress:]((uint64_t)v13, v14);

      objc_msgSend(v12, "displayLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDLocalizedAddress setLanguage:]((uint64_t)v13, v15);

      -[GEORPPoiEnrichmentPlaceContext addLocalizedAddress:](v4, "addLocalizedAddress:", v13);
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __83__GEORPPoiEnrichmentPlaceContext_GEORPProtoExtras__buildPlaceContextWithPlaceData___block_invoke;
      v17[3] = &unk_1E1C098A8;
      v18 = v4;
      objc_msgSend(v3, "enumerateValidComponentWithValuesOfType:usingBlock:", 5, v17);
      v13 = (GEOPDLocalizedAddress *)v18;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: placeData != ((void *)0)", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

void __83__GEORPPoiEnrichmentPlaceContext_GEORPProtoExtras__buildPlaceContextWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  id *v6;
  id *v7;
  id *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOPDComponent values](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (id *)v6[7];
    if (v7)
    {
      v8 = v7;
      -[GEOPDAddress _readLocalizedAddress]((uint64_t)v7);
      v9 = objc_msgSend(v8[3], "count");

      if (v9)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = (id *)v6[7];
        -[GEOPDAddress localizedAddress](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(a1 + 32), "addLocalizedAddress:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v13);
        }

        *a3 = 1;
      }
    }
  }

}

- (unint64_t)muid
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GEORPPoiEnrichmentPlaceContext placeId](self, "placeId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");

  return v4;
}

@end
