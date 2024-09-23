@implementation GEOMapItemStorage

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
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
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOMapItemStorageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapItemStorage readAll:](self, "readAll:", 0);
  v8 = -[GEOPDPlace copyWithZone:](self->_placeData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  v10 = -[GEOPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v10;

  v12 = -[GEOMapItemClientAttributes copyWithZone:](self->_clientAttributes, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[GEOPlaceResult copyWithZone:](self->_placeResult, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_originatingCoordinate, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  v18 = -[GEOPDResultDetourInfo copyWithZone:](self->_internalDetourInfo, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[NSString copyWithZone:](self->_mapsURL, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[GEOMapItemStorageUserValues copyWithZone:](self->_userValues, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v22;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_additionalPlaceDatas;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addAdditionalPlaceDatas:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 40), self->_unknownFields);
  return (id)v5;
}

- (GEOMapItemStorage)initWithPlaceData:(id)a3 detourInfo:(id)a4 clientAttributes:(id)a5 userValues:(id)a6 additionalPlaceDatas:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  GEOMapItemStorage *v17;
  GEOMapItemStorage *v18;
  void *v19;
  _GEOPlaceDataItem *v20;
  GEOMapItem *geoMapItem;
  _GEOMapItemStorageNotificationTrampoline *v22;
  _GEOMapItemStorageNotificationTrampoline *trampoline;
  GEOMapItemStorage *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapItemStorage;
  v17 = -[GEOMapItemStorage init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    -[GEOMapItemStorage initAdditionalFields](v17, "initAdditionalFields");
    -[GEOMapItemStorage setPlaceData:](v18, "setPlaceData:", v12);
    -[GEOMapItemStorage setClientAttributes:](v18, "setClientAttributes:", v14);
    -[GEOMapItemStorage setInternalDetourInfo:](v18, "setInternalDetourInfo:", v13);
    -[GEOMapItemStorage setUserValues:](v18, "setUserValues:", v15);
    if (objc_msgSend(v16, "count"))
    {
      v19 = (void *)objc_msgSend(v16, "mutableCopy");
      -[GEOMapItemStorage setAdditionalPlaceDatas:](v18, "setAdditionalPlaceDatas:", v19);

    }
    v20 = -[_GEOPlaceDataItem initWithPlaceData:detourInfo:additionalPlaceDatas:]([_GEOPlaceDataItem alloc], "initWithPlaceData:detourInfo:additionalPlaceDatas:", v12, v13, v16);
    geoMapItem = v18->_geoMapItem;
    v18->_geoMapItem = (GEOMapItem *)v20;

    v22 = -[_GEOMapItemStorageNotificationTrampoline initWithMapItem:mapItemStorage:]([_GEOMapItemStorageNotificationTrampoline alloc], "initWithMapItem:mapItemStorage:", v18->_geoMapItem, v18);
    trampoline = v18->_trampoline;
    v18->_trampoline = v22;

    v24 = v18;
  }

  return v18;
}

- (GEOMapItemStorage)init
{
  GEOMapItemStorage *v2;
  GEOMapItemStorage *v3;
  GEOMapItemStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemStorage;
  v2 = -[GEOMapItemStorage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    -[GEOMapItemStorage initAdditionalFields](v2, "initAdditionalFields");
    v4 = v3;
  }

  return v3;
}

- (void)initAdditionalFields
{
  geo_isolater *v3;
  geo_isolater *geoMapItemIsolater;

  v3 = (geo_isolater *)geo_isolater_create();
  geoMapItemIsolater = self->_geoMapItemIsolater;
  self->_geoMapItemIsolater = v3;

}

- (void)setUserValues:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userValues, a3);
}

- (void)setPlaceData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_placeData, a3);
}

- (void)setInternalDetourInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_internalDetourInfo, a3);
}

- (void)setClientAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_clientAttributes, a3);
}

- (NSTimeZone)timezone
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[GEOMapItemStorage userValues](self, "userValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTimeZoneName");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E80];
    -[GEOMapItemStorage userValues](self, "userValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemStorage userValues](self, "userValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZoneData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZoneWithName:data:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timezone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSTimeZone *)v10;
}

- (GEOMapItemStorageUserValues)userValues
{
  -[GEOMapItemStorage _readUserValues]((uint64_t)self);
  return self->_userValues;
}

- (void)_readUserValues
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readUserValues_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOMapRegion)geoFenceMapRegion
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoFenceMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (NSDictionary)addressDictionary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasCorrectedLocationAttributes") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedLocationAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedAddress");

  if (!v6)
  {
LABEL_5:
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addressDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return (NSDictionary *)v10;
}

- (id)_geoMapItemCreatingAndAssociatingIfNeeded
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__56;
  v8 = __Block_byref_object_dispose__56;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasCorrectedLocationAttributes") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedLocationAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedCoordinate");

  if (!v6)
  {
LABEL_5:
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinate");
    v11 = v14;
    v13 = v15;
    goto LABEL_6;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedCoordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v11 = v10;
  v13 = v12;

LABEL_6:
  v16 = v11;
  v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  -[GEOMapItemStorage _readClientAttributes]((uint64_t)self);
  return self->_clientAttributes;
}

- (void)_readClientAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 4) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readClientAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

void __74__GEOMapItemStorage_GEOMapItem___geoMapItemCreatingAndAssociatingIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _GEOPlaceDataItem *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  GEOURLBackedMapItem *v16;
  uint64_t v17;
  _GEOMapItemStorageNotificationTrampoline *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    if (objc_msgSend(v2, "hasPlaceData"))
    {
      v4 = [_GEOPlaceDataItem alloc];
      objc_msgSend(*(id *)(a1 + 32), "placeData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "internalDetourInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "additionalPlaceDatas");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_GEOPlaceDataItem initWithPlaceData:detourInfo:additionalPlaceDatas:](v4, "initWithPlaceData:detourInfo:additionalPlaceDatas:", v5, v6, v7);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 16);
      *(_QWORD *)(v9 + 16) = v8;

LABEL_10:
      goto LABEL_11;
    }
    v11 = objc_msgSend(*(id *)(a1 + 32), "hasPlaceResult");
    v12 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v12, "placeResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_msgSend(v12, "hasPlace");
      v15 = *(void **)(a1 + 32);
      if (!v14)
      {
        if (!objc_msgSend(v15, "hasMapsURL"))
        {
LABEL_11:
          if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
          {
            v18 = -[_GEOMapItemStorageNotificationTrampoline initWithMapItem:mapItemStorage:]([_GEOMapItemStorageNotificationTrampoline alloc], "initWithMapItem:mapItemStorage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
            v19 = *(_QWORD *)(a1 + 32);
            v20 = *(void **)(v19 + 8);
            *(_QWORD *)(v19 + 8) = v18;

            v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          }
          else
          {
            v3 = 0;
          }
          goto LABEL_14;
        }
        v21 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(*(id *)(a1 + 32), "mapsURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URLWithString:", v22);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = -[GEOURLBackedMapItem initWithURL:]([GEOURLBackedMapItem alloc], "initWithURL:", v5);
        goto LABEL_9;
      }
      objc_msgSend(v15, "place");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v13;
    objc_msgSend(v13, "geoMapItem");
    v16 = (GEOURLBackedMapItem *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = v16;
    goto LABEL_10;
  }
LABEL_14:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

+ (id)mapItemStorageForGEOMapItem:(id)a3
{
  id v3;
  GEOMapItemStorage *v4;
  GEOMapItemStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOMapItemStorage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOMapItemStorage *v15;
  void *v16;
  GEOMapItemStorage *v18;

  v3 = a3;
  if (objc_msgSend(v3, "isValid")
    && objc_msgSend(v3, "conformsToProtocol:", &unk_1EDF9CF08))
  {
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFEDFE8))
    {
      objc_msgSend(v3, "mapItemStorageForGEOMapItem");
      v4 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = v4;
      goto LABEL_15;
    }
    if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    {
      v4 = (GEOMapItemStorage *)v3;
      goto LABEL_8;
    }
    objc_msgSend(v3, "_placeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "_additionalPlaceInfos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_geo_compactMap:", &__block_literal_global_107);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [GEOMapItemStorage alloc];
      objc_msgSend(v3, "_placeData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "detourInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_detourInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_clientAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[GEOMapItemStorage initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:](v9, "initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:", v10, v12, v13, 0, v8);

    }
    else
    {
      objc_msgSend(v3, "_placeResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = [GEOMapItemStorage alloc];
        objc_msgSend(v3, "_placeResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[GEOMapItemStorage initWithPlaceResult:](v15, "initWithPlaceResult:", v16);

        objc_msgSend(v3, "_clientAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapItemStorage setClientAttributes:](v5, "setClientAttributes:", v8);
        goto LABEL_14;
      }
      objc_msgSend(v3, "_place");
      v5 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_15;
      v18 = [GEOMapItemStorage alloc];
      objc_msgSend(v3, "_place");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_clientAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[GEOMapItemStorage initWithPlace:clientAttributes:userValues:](v18, "initWithPlace:clientAttributes:userValues:", v8, v10, 0);
    }

LABEL_14:
    goto LABEL_15;
  }
  v5 = 0;
LABEL_15:

  return v5;
}

- (GEOPDPlace)placeData
{
  -[GEOMapItemStorage _readPlaceData]((uint64_t)self);
  return self->_placeData;
}

- (GEOPDResultDetourInfo)internalDetourInfo
{
  -[GEOMapItemStorage _readInternalDetourInfo]((uint64_t)self);
  return self->_internalDetourInfo;
}

- (BOOL)hasPlaceData
{
  -[GEOMapItemStorage _readPlaceData]((uint64_t)self);
  return self->_placeData != 0;
}

- (void)_readPlaceData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readPlaceData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)additionalPlaceDatas
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  return self->_additionalPlaceDatas;
}

- (void)_readInternalDetourInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 8) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readInternalDetourInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_readAdditionalPlaceDatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 2) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readAdditionalPlaceDatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSArray)areasOfInterest
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "areasOfInterest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userValues, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeResult, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_originatingCoordinate, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_internalDetourInfo, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_additionalPlaceDatas, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_geoMapItemIsolater, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_trampoline, 0);
}

id __61__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mapItemStorageForGEOMapItem:(id)a3 clientAttributes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v8 = objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(a1, "mapItemStorageForGEOMapItem:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  objc_msgSend(v9, "setClientAttributes:", v6);
  return v9;
}

+ (id)mapItemStorageForGEOMapItem:(id)a3 forUseType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  GEOMapItemStorage *v9;
  GEOMapItemStorage *v10;
  GEOPDPlace *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  GEOPDComponent *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  GEOPDComponentValue *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t mm;
  uint64_t v74;
  GEOPDComponentValue *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i4;
  uint64_t v87;
  GEOPDComponentValue *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t nn;
  uint64_t v98;
  GEOPDComponentValue *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i1;
  uint64_t v108;
  GEOPDComponentValue *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t i2;
  uint64_t v118;
  GEOPDComponentValue *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t jj;
  uint64_t v128;
  GEOPDComponentValue *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t kk;
  uint64_t v139;
  GEOPDComponentValue *v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t j;
  uint64_t v155;
  GEOPDComponentValue *v156;
  void *v157;
  void *v158;
  void *v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t k;
  uint64_t v165;
  GEOPDComponentValue *v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t m;
  uint64_t v178;
  GEOPDComponentValue *v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t n;
  uint64_t v188;
  GEOPDComponentValue *v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t ii;
  uint64_t v198;
  GEOPDComponentValue *v199;
  void *v200;
  void *v201;
  void *v202;
  int v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t i3;
  uint64_t v208;
  GEOPDComponentValue *v209;
  void *v210;
  void *v211;
  void *v212;
  int v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  int v218;
  void *v219;
  void *v220;
  __int16 v221;
  int v222;
  BOOL v223;
  unsigned int v224;
  int v225;
  unsigned int v226;
  void *v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  GEOMapItemClientAttributes *v235;
  void *v236;
  void *v237;
  int v238;
  unint64_t v239;
  void *v240;
  GEOMapItemStorage *v241;
  void *v242;
  void *v243;
  void *v244;
  int v245;
  GEOMapItemStorage *v246;
  GEOPlaceResult *v247;
  void *v248;
  int v249;
  void *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  int v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  unint64_t v266;
  void *v267;
  id v268;
  GEOMapItemStorage *v269;
  void *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _BYTE v337[128];
  _BYTE v338[128];
  _BYTE v339[128];
  _BYTE v340[128];
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  uint64_t v344;

  v344 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "isValid"))
  {
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "mapItemStorageForGEOMapItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 - 3 >= 4)
  {
    if (!a4)
    {
      v9 = v7;
      goto LABEL_4;
    }
    v10 = objc_alloc_init(GEOMapItemStorage);
    v269 = v10;
    if (objc_msgSend(v8, "hasPlaceData"))
    {
      v12 = objc_alloc_init(GEOPDPlace);
      -[GEOMapItemStorage setPlaceData:](v10, "setPlaceData:", v12);

      objc_msgSend(v8, "placeData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasMuid");

      if (v14)
      {
        objc_msgSend(v8, "placeData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "muid");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMuid:", v16);

      }
      objc_msgSend(v8, "placeData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasPreferredMuid");

      if (v19)
      {
        objc_msgSend(v8, "placeData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "preferredMuid");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPreferredMuid:", v21);

      }
      objc_msgSend(v8, "placeData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasMapsId");

      if (v24)
      {
        objc_msgSend(v8, "placeData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "mapsId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v28 = a4;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setMapsId:", v27);

        a4 = v28;
      }
      objc_msgSend(v8, "placeData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasReferenceFrame");

      if (v31)
      {
        objc_msgSend(v8, "placeData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "referenceFrame");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setReferenceFrame:", v33);

      }
      objc_msgSend(v8, "placeData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "hasResultProviderId");

      if (v36)
      {
        objc_msgSend(v8, "placeData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "resultProviderId");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setResultProviderId:", v38);

      }
      objc_msgSend(v8, "placeData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "hasStatus");

      if (v41)
      {
        objc_msgSend(v8, "placeData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "status");
        -[GEOMapItemStorage placeData](v269, "placeData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setStatus:", v43);

      }
      objc_msgSend(v8, "placeData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "components");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      v10 = v269;
      if (v47)
      {
        v266 = a4;
        v268 = v6;
        v48 = 0x1E0C99000uLL;
        v49 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v8, "placeData");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "components");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "arrayWithCapacity:", objc_msgSend(v51, "count"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapItemStorage placeData](v269, "placeData");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setComponents:", v52);

        v10 = v269;
        v328 = 0u;
        v329 = 0u;
        v326 = 0u;
        v327 = 0u;
        v267 = v8;
        objc_msgSend(v8, "placeData");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "components");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v272 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v326, v343, 16);
        if (!v272)
          goto LABEL_268;
        v270 = v55;
        v271 = *(_QWORD *)v327;
        while (1)
        {
          for (i = 0; i != v272; ++i)
          {
            if (*(_QWORD *)v327 != v271)
              objc_enumerationMutation(v55);
            v57 = *(_QWORD *)(*((_QWORD *)&v326 + 1) + 8 * i);
            -[GEOPDComponent values]((id *)v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "count");

            if (v59)
            {
              v273 = i;
              v60 = objc_alloc_init(GEOPDComponent);
              v61 = *(void **)(v48 + 3560);
              -[GEOPDComponent values]((id *)v57);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "arrayWithCapacity:", objc_msgSend(v62, "count"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPDComponent setValues:]((uint64_t)v60, v63);

              if (v57 && (*(_WORD *)(v57 + 100) & 0x80) != 0)
              {
                v64 = *(_DWORD *)(v57 + 88);
                if (v64 <= 30)
                {
                  switch(v64)
                  {
                    case 1:
                      -[GEOPDComponent values]((id *)v57);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 192))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue entity]((id *)v66);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      v69 = (void *)objc_msgSend(v68, "copy");
                      -[GEOPDComponentValue setEntity:]((uint64_t)v67, v69);

                      goto LABEL_186;
                    case 2:
                      -[GEOPDComponent values]((id *)v57);
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v145, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 400))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue placeInfo]((id *)v66);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      v147 = (void *)objc_msgSend(v146, "copy");
                      -[GEOPDComponentValue setPlaceInfo:]((uint64_t)v67, v147);
                      goto LABEL_155;
                    case 4:
                      -[GEOPDComponent values]((id *)v57);
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v148, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 88))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue bounds]((id *)v66);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      v147 = (void *)objc_msgSend(v146, "copy");
                      -[GEOPDComponentValue setBounds:]((uint64_t)v67, v147);
                      goto LABEL_155;
                    case 5:
                      -[GEOPDComponent values]((id *)v57);
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v149, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 56))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue address]((id *)v66);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      v147 = (void *)objc_msgSend(v146, "copy");
                      -[GEOPDComponentValue setAddress:]((uint64_t)v67, v147);
                      goto LABEL_155;
                    case 6:
                      -[GEOPDComponent values]((id *)v57);
                      v150 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v150, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 488))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue rating]((id *)v66);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      v147 = (void *)objc_msgSend(v146, "copy");
                      -[GEOPDComponentValue setRating:]((uint64_t)v67, v147);
LABEL_155:

                      goto LABEL_186;
                    case 9:
                      v324 = 0u;
                      v325 = 0u;
                      v322 = 0u;
                      v323 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v151 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v322, v342, 16);
                      if (!v151)
                        goto LABEL_241;
                      v152 = v151;
                      v153 = *(_QWORD *)v323;
                      do
                      {
                        for (j = 0; j != v152; ++j)
                        {
                          if (*(_QWORD *)v323 != v153)
                            objc_enumerationMutation((id)v66);
                          v155 = *(_QWORD *)(*((_QWORD *)&v322 + 1) + 8 * j);
                          if (v155 && *(_QWORD *)(v155 + 296))
                          {
                            v156 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue hours]((id *)v155);
                            v157 = (void *)objc_claimAutoreleasedReturnValue();
                            v158 = (void *)objc_msgSend(v157, "copy");
                            -[GEOPDComponentValue setHours:]((uint64_t)v156, v158);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v159 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v159, "addObject:", v156);

                          }
                          if (v60)
                          {
                            v160 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v160;
                          }
                        }
                        v152 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v322, v342, 16);
                      }
                      while (v152);
                      goto LABEL_240;
                    case 10:
                      v320 = 0u;
                      v321 = 0u;
                      v318 = 0u;
                      v319 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v161 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v318, v341, 16);
                      if (!v161)
                        goto LABEL_241;
                      v162 = v161;
                      v163 = *(_QWORD *)v319;
                      do
                      {
                        for (k = 0; k != v162; ++k)
                        {
                          if (*(_QWORD *)v319 != v163)
                            objc_enumerationMutation((id)v66);
                          v165 = *(_QWORD *)(*((_QWORD *)&v318 + 1) + 8 * k);
                          if (v165 && *(_QWORD *)(v165 + 680))
                          {
                            v166 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue transitInfo]((id *)v165);
                            v167 = (void *)objc_claimAutoreleasedReturnValue();
                            v168 = (void *)objc_msgSend(v167, "copy");
                            -[GEOPDComponentValue setTransitInfo:]((uint64_t)v166, v168);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v169 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v169, "addObject:", v166);

                          }
                          if (v60)
                          {
                            v170 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v170;
                          }
                        }
                        v162 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v318, v341, 16);
                      }
                      while (v162);
                      goto LABEL_240;
                    case 13:
                      -[GEOPDComponent values]((id *)v57);
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v171, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 240))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue flyover]((id *)v66);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (void *)objc_msgSend(v81, "copy");
                      -[GEOPDComponentValue setFlyover:]((uint64_t)v67, v82);
                      goto LABEL_185;
                    case 15:
                      v316 = 0u;
                      v317 = 0u;
                      v314 = 0u;
                      v315 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v174 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v314, v340, 16);
                      if (!v174)
                        goto LABEL_241;
                      v175 = v174;
                      v176 = *(_QWORD *)v315;
                      do
                      {
                        for (m = 0; m != v175; ++m)
                        {
                          if (*(_QWORD *)v315 != v176)
                            objc_enumerationMutation((id)v66);
                          v178 = *(_QWORD *)(*((_QWORD *)&v314 + 1) + 8 * m);
                          if (v178 && *(_QWORD *)(v178 + 64))
                          {
                            v179 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue amenities]((id *)v178);
                            v180 = (void *)objc_claimAutoreleasedReturnValue();
                            v181 = (void *)objc_msgSend(v180, "copy");
                            -[GEOPDComponentValue setAmenities:]((uint64_t)v179, v181);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v182 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v182, "addObject:", v179);

                          }
                          if (v60)
                          {
                            v183 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v183;
                          }
                        }
                        v175 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v314, v340, 16);
                      }
                      while (v175);
                      goto LABEL_240;
                    case 16:
                      v312 = 0u;
                      v313 = 0u;
                      v310 = 0u;
                      v311 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v184 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v310, v339, 16);
                      if (!v184)
                        goto LABEL_241;
                      v185 = v184;
                      v186 = *(_QWORD *)v311;
                      do
                      {
                        for (n = 0; n != v185; ++n)
                        {
                          if (*(_QWORD *)v311 != v186)
                            objc_enumerationMutation((id)v66);
                          v188 = *(_QWORD *)(*((_QWORD *)&v310 + 1) + 8 * n);
                          if (v188 && *(_QWORD *)(v188 + 592))
                          {
                            v189 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue styleAttributes]((id *)v188);
                            v190 = (void *)objc_claimAutoreleasedReturnValue();
                            v191 = (void *)objc_msgSend(v190, "copy");
                            -[GEOPDComponentValue setStyleAttributes:]((uint64_t)v189, v191);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v192 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v192, "addObject:", v189);

                          }
                          if (v60)
                          {
                            v193 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v193;
                          }
                        }
                        v185 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v310, v339, 16);
                      }
                      while (v185);
                      goto LABEL_240;
                    case 24:
                      v308 = 0u;
                      v309 = 0u;
                      v306 = 0u;
                      v307 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v194 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v306, v338, 16);
                      if (!v194)
                        goto LABEL_241;
                      v195 = v194;
                      v196 = *(_QWORD *)v307;
                      do
                      {
                        for (ii = 0; ii != v195; ++ii)
                        {
                          if (*(_QWORD *)v307 != v196)
                            objc_enumerationMutation((id)v66);
                          v198 = *(_QWORD *)(*((_QWORD *)&v306 + 1) + 8 * ii);
                          if (v198 && *(_QWORD *)(v198 + 656))
                          {
                            v199 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue transitAttribution]((id *)v198);
                            v200 = (void *)objc_claimAutoreleasedReturnValue();
                            v201 = (void *)objc_msgSend(v200, "copy");
                            -[GEOPDComponentValue setTransitAttribution:]((uint64_t)v199, v201);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v202 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v202, "addObject:", v199);

                          }
                          if (v60)
                          {
                            v203 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v203;
                          }
                        }
                        v195 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v306, v338, 16);
                      }
                      while (v195);
                      goto LABEL_240;
                    default:
                      goto LABEL_265;
                  }
                }
                if (v64 <= 49)
                {
                  switch(v64)
                  {
                    case 31:
                      -[GEOPDComponent values]((id *)v57);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 40))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue addressObject]((id *)v66);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (void *)objc_msgSend(v81, "copy");
                      -[GEOPDComponentValue setAddressObject:]((uint64_t)v67, v82);
                      goto LABEL_185;
                    case 32:
                    case 34:
                    case 35:
                    case 36:
                    case 38:
                      goto LABEL_265;
                    case 33:
                      v304 = 0u;
                      v305 = 0u;
                      v302 = 0u;
                      v303 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v124 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v302, v337, 16);
                      if (!v124)
                        break;
                      v125 = v124;
                      v126 = *(_QWORD *)v303;
                      do
                      {
                        for (jj = 0; jj != v125; ++jj)
                        {
                          if (*(_QWORD *)v303 != v126)
                            objc_enumerationMutation((id)v66);
                          v128 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * jj);
                          if (v128 && *(_QWORD *)(v128 + 520))
                          {
                            v129 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue restaurantReservationLink]((id *)v128);
                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                            v131 = (void *)objc_msgSend(v130, "copy");
                            -[GEOPDComponentValue setRestaurantReservationLink:]((uint64_t)v129, v131);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v132 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v132, "addObject:", v129);

                          }
                          if (v60)
                          {
                            v133 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v133;
                          }
                        }
                        v125 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v302, v337, 16);
                      }
                      while (v125);
                      goto LABEL_240;
                    case 37:
                      -[GEOPDComponent values]((id *)v57);
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v134, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 424))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue placecardUrl]((id *)v66);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (void *)objc_msgSend(v81, "copy");
                      -[GEOPDComponentValue setPlacecardUrl:]((uint64_t)v67, v82);
                      goto LABEL_185;
                    case 39:
                      v300 = 0u;
                      v301 = 0u;
                      v298 = 0u;
                      v299 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v135 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v298, v336, 16);
                      if (!v135)
                        break;
                      v136 = v135;
                      v137 = *(_QWORD *)v299;
                      do
                      {
                        for (kk = 0; kk != v136; ++kk)
                        {
                          if (*(_QWORD *)v299 != v137)
                            objc_enumerationMutation((id)v66);
                          v139 = *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * kk);
                          if (v139 && *(_QWORD *)(v139 + 344))
                          {
                            v140 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue messageLink]((id *)v139);
                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                            v142 = (void *)objc_msgSend(v141, "copy");
                            -[GEOPDComponentValue setMessageLink:]((uint64_t)v140, v142);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v143 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v143, "addObject:", v140);

                          }
                          if (v60)
                          {
                            v144 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v144;
                          }
                        }
                        v136 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v298, v336, 16);
                      }
                      while (v136);
LABEL_240:
                      v10 = v269;
                      v48 = 0x1E0C99000;
                      break;
                    default:
                      if (v64 != 48)
                        goto LABEL_265;
                      -[GEOPDComponent values]((id *)v57);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "firstObject");
                      v66 = objc_claimAutoreleasedReturnValue();

                      if (!v66 || !*(_QWORD *)(v66 + 752))
                        goto LABEL_242;
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue venueInfo]((id *)v66);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (void *)objc_msgSend(v81, "copy");
                      -[GEOPDComponentValue setVenueInfo:]((uint64_t)v67, v82);
LABEL_185:

LABEL_186:
                      -[GEOPDComponent values]((id *)&v60->super.super.isa);
                      v172 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v172, "addObject:", v67);

                      if (v60)
                      {
                        v173 = *(_DWORD *)(v57 + 92);
                        *(_WORD *)&v60->_flags |= 0x100u;
                        v60->_valuesAvailable = v173;
                      }

                      break;
                  }
                }
                else
                {
                  switch(v64)
                  {
                    case 'b':
                      v288 = 0u;
                      v289 = 0u;
                      v286 = 0u;
                      v287 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v70 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v286, v333, 16);
                      if (!v70)
                        break;
                      v71 = v70;
                      v72 = *(_QWORD *)v287;
                      do
                      {
                        for (mm = 0; mm != v71; ++mm)
                        {
                          if (*(_QWORD *)v287 != v72)
                            objc_enumerationMutation((id)v66);
                          v74 = *(_QWORD *)(*((_QWORD *)&v286 + 1) + 8 * mm);
                          if (v74 && *(_QWORD *)(v74 + 640))
                          {
                            v75 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue trailHead]((id *)v74);
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            v77 = (void *)objc_msgSend(v76, "copy");
                            -[GEOPDComponentValue setTrailHead:]((uint64_t)v75, v77);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v78 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v78, "addObject:", v75);

                          }
                          if (v60)
                          {
                            v79 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v79;
                          }
                        }
                        v71 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v286, v333, 16);
                      }
                      while (v71);
                      goto LABEL_240;
                    case 'c':
                    case 'd':
                    case 'e':
                    case 'f':
                    case 'g':
                      goto LABEL_265;
                    case 'h':
                      v276 = 0u;
                      v277 = 0u;
                      v274 = 0u;
                      v275 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v94 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v274, v330, 16);
                      if (!v94)
                        break;
                      v95 = v94;
                      v96 = *(_QWORD *)v275;
                      do
                      {
                        for (nn = 0; nn != v95; ++nn)
                        {
                          if (*(_QWORD *)v275 != v96)
                            objc_enumerationMutation((id)v66);
                          v98 = *(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * nn);
                          if (v98 && *(_QWORD *)(v98 + 272))
                          {
                            v99 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue hikeAssociatedInfo]((id *)v98);
                            v100 = (void *)objc_claimAutoreleasedReturnValue();
                            v101 = (void *)objc_msgSend(v100, "copy");
                            -[GEOPDComponentValue setHikeAssociatedInfo:]((uint64_t)v99, v101);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v102, "addObject:", v99);

                          }
                          if (v60)
                          {
                            v103 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v103;
                          }
                        }
                        v95 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v274, v330, 16);
                      }
                      while (v95);
                      goto LABEL_240;
                    case 'i':
                      v284 = 0u;
                      v285 = 0u;
                      v282 = 0u;
                      v283 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v104 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v282, v332, 16);
                      if (!v104)
                        break;
                      v105 = v104;
                      v106 = *(_QWORD *)v283;
                      do
                      {
                        for (i1 = 0; i1 != v105; ++i1)
                        {
                          if (*(_QWORD *)v283 != v106)
                            objc_enumerationMutation((id)v66);
                          v108 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * i1);
                          if (v108 && *(_QWORD *)(v108 + 288))
                          {
                            v109 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue hikeSummary]((id *)v108);
                            v110 = (void *)objc_claimAutoreleasedReturnValue();
                            v111 = (void *)objc_msgSend(v110, "copy");
                            -[GEOPDComponentValue setHikeSummary:]((uint64_t)v109, v111);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v112 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v112, "addObject:", v109);

                          }
                          if (v60)
                          {
                            v113 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v113;
                          }
                        }
                        v105 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v282, v332, 16);
                      }
                      while (v105);
                      goto LABEL_240;
                    case 'j':
                      v280 = 0u;
                      v281 = 0u;
                      v278 = 0u;
                      v279 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v114 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v278, v331, 16);
                      if (!v114)
                        break;
                      v115 = v114;
                      v116 = *(_QWORD *)v279;
                      do
                      {
                        for (i2 = 0; i2 != v115; ++i2)
                        {
                          if (*(_QWORD *)v279 != v116)
                            objc_enumerationMutation((id)v66);
                          v118 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i2);
                          if (v118 && *(_QWORD *)(v118 + 280))
                          {
                            v119 = objc_alloc_init(GEOPDComponentValue);
                            -[GEOPDComponentValue hikeGeometry]((id *)v118);
                            v120 = (void *)objc_claimAutoreleasedReturnValue();
                            v121 = (void *)objc_msgSend(v120, "copy");
                            -[GEOPDComponentValue setHikeGeometry:]((uint64_t)v119, v121);

                            -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            v122 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v122, "addObject:", v119);

                          }
                          if (v60)
                          {
                            v123 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v123;
                          }
                        }
                        v115 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v278, v331, 16);
                      }
                      while (v115);
                      goto LABEL_240;
                    default:
                      if (v64 == 50)
                      {
                        v296 = 0u;
                        v297 = 0u;
                        v294 = 0u;
                        v295 = 0u;
                        -[GEOPDComponent values]((id *)v57);
                        v66 = objc_claimAutoreleasedReturnValue();
                        v204 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v294, v335, 16);
                        if (!v204)
                          break;
                        v205 = v204;
                        v206 = *(_QWORD *)v295;
                        do
                        {
                          for (i3 = 0; i3 != v205; ++i3)
                          {
                            if (*(_QWORD *)v295 != v206)
                              objc_enumerationMutation((id)v66);
                            v208 = *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * i3);
                            if (v208 && *(_QWORD *)(v208 + 152))
                            {
                              v209 = objc_alloc_init(GEOPDComponentValue);
                              -[GEOPDComponentValue containedPlace]((id *)v208);
                              v210 = (void *)objc_claimAutoreleasedReturnValue();
                              v211 = (void *)objc_msgSend(v210, "copy");
                              -[GEOPDComponentValue setContainedPlace:]((uint64_t)v209, v211);

                              -[GEOPDComponent values]((id *)&v60->super.super.isa);
                              v212 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v212, "addObject:", v209);

                            }
                            if (v60)
                            {
                              v213 = *(_DWORD *)(v57 + 92);
                              *(_WORD *)&v60->_flags |= 0x100u;
                              v60->_valuesAvailable = v213;
                            }
                          }
                          v205 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v294, v335, 16);
                        }
                        while (v205);
                        goto LABEL_240;
                      }
                      if (v64 != 92)
                        goto LABEL_265;
                      v292 = 0u;
                      v293 = 0u;
                      v290 = 0u;
                      v291 = 0u;
                      -[GEOPDComponent values]((id *)v57);
                      v66 = objc_claimAutoreleasedReturnValue();
                      v83 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v290, v334, 16);
                      if (v83)
                      {
                        v84 = v83;
                        v85 = *(_QWORD *)v291;
                        do
                        {
                          for (i4 = 0; i4 != v84; ++i4)
                          {
                            if (*(_QWORD *)v291 != v85)
                              objc_enumerationMutation((id)v66);
                            v87 = *(_QWORD *)(*((_QWORD *)&v290 + 1) + 8 * i4);
                            if (v87 && *(_QWORD *)(v87 + 104))
                            {
                              v88 = objc_alloc_init(GEOPDComponentValue);
                              -[GEOPDComponentValue businessAssets]((id *)v87);
                              v89 = (void *)objc_claimAutoreleasedReturnValue();
                              v90 = (void *)objc_msgSend(v89, "copy");
                              -[GEOPDComponentValue setBusinessAssets:]((uint64_t)v88, v90);

                              -[GEOPDComponent values]((id *)&v60->super.super.isa);
                              v91 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v91, "addObject:", v88);

                            }
                            if (v60)
                            {
                              v92 = *(_DWORD *)(v57 + 92);
                              *(_WORD *)&v60->_flags |= 0x100u;
                              v60->_valuesAvailable = v92;
                            }
                          }
                          v84 = objc_msgSend((id)v66, "countByEnumeratingWithState:objects:count:", &v290, v334, 16);
                        }
                        while (v84);
                        goto LABEL_240;
                      }
                      break;
                  }
                }
LABEL_241:
                v55 = v270;
LABEL_242:

                -[GEOPDComponent values]((id *)&v60->super.super.isa);
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                v215 = objc_msgSend(v214, "count");

                if (v215)
                {
                  if (*(_QWORD *)(v57 + 16))
                  {
                    -[GEOPDComponent attribution]((id *)v57);
                    v216 = (void *)objc_claimAutoreleasedReturnValue();
                    v217 = (void *)objc_msgSend(v216, "copy");
                    -[GEOPDComponent setAttribution:]((uint64_t)v60, v217);

                  }
                  if ((*(_WORD *)(v57 + 100) & 2) != 0 && v60)
                  {
                    v218 = *(_DWORD *)(v57 + 64);
                    *(_WORD *)&v60->_flags |= 2u;
                    v60->_cacheControl = v218;
                  }
                  if (*(_QWORD *)(v57 + 32))
                  {
                    -[GEOPDComponent source]((id *)v57);
                    v219 = (void *)objc_claimAutoreleasedReturnValue();
                    v220 = (void *)objc_msgSend(v219, "copy");
                    -[GEOPDComponent setSource:]((uint64_t)v60, v220);

                  }
                  v221 = *(_WORD *)(v57 + 100);
                  if ((v221 & 0x20) != 0)
                  {
                    if (v60)
                    {
                      v222 = *(_DWORD *)(v57 + 80);
                      *(_WORD *)&v60->_flags |= 0x20u;
                      v60->_status = v222;
                      v221 = *(_WORD *)(v57 + 100);
                      goto LABEL_253;
                    }
                  }
                  else
                  {
LABEL_253:
                    v223 = v60 == 0;
                    if ((v221 & 0x40) != 0 && v60)
                    {
                      v224 = *(_DWORD *)(v57 + 84);
                      *(_WORD *)&v60->_flags |= 0x40u;
                      v60->_ttl = v224;
                      v221 = *(_WORD *)(v57 + 100);
                    }
                    if ((v221 & 0x80) != 0)
                    {
                      if (!v60)
                        goto LABEL_262;
                      v223 = 0;
                      v225 = *(_DWORD *)(v57 + 88);
                      *(_WORD *)&v60->_flags |= 0x80u;
                      v60->_type = v225;
                      v221 = *(_WORD *)(v57 + 100);
                    }
                    if ((v221 & 0x200) != 0 && !v223)
                    {
                      v226 = *(_DWORD *)(v57 + 96);
                      *(_WORD *)&v60->_flags |= 0x200u;
                      v60->_version = v226;
                    }
                  }
LABEL_262:
                  -[GEOPDComponent versionDomains]((id *)v57);
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  v228 = objc_msgSend(v227, "count");

                  if (v228)
                  {
                    -[GEOPDComponent versionDomains]((id *)v57);
                    v229 = (void *)objc_claimAutoreleasedReturnValue();
                    v230 = (void *)objc_msgSend(v229, "copy");
                    -[GEOPDComponent setVersionDomains:]((uint64_t)v60, v230);

                  }
                  -[GEOMapItemStorage placeData](v10, "placeData");
                  v231 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v231, "components");
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v232, "addObject:", v60);

                }
              }
LABEL_265:

              i = v273;
              continue;
            }
          }
          v272 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v326, v343, 16);
          if (!v272)
          {
LABEL_268:

            v8 = v267;
            v6 = v268;
            a4 = v266;
            break;
          }
        }
      }
    }
    if (objc_msgSend(v8, "hasPlace"))
    {
      objc_msgSend(v8, "place");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      __72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage setPlace:](v10, "setPlace:", v234);

    }
    if (objc_msgSend(v8, "hasClientAttributes"))
    {
      v235 = objc_alloc_init(GEOMapItemClientAttributes);
      -[GEOMapItemStorage setClientAttributes:](v10, "setClientAttributes:", v235);

      objc_msgSend(v8, "clientAttributes");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = v236;
      if (a4 == 2)
      {
        v238 = objc_msgSend(v236, "hasCorrectedLocationAttributes");

        if (v238)
        {
          v239 = 2;
          objc_msgSend(v8, "clientAttributes");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "correctedLocationAttributes");
          v241 = v10;
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = (void *)objc_msgSend(v242, "copy");
          -[GEOMapItemStorage clientAttributes](v241, "clientAttributes");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "setCorrectedLocationAttributes:", v243);
LABEL_277:

          v10 = v269;
          a4 = v239;
        }
      }
      else
      {
        v245 = objc_msgSend(v236, "hasAddressBookAttributes");

        if (v245)
        {
          v239 = a4;
          objc_msgSend(v8, "clientAttributes");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "addressBookAttributes");
          v246 = v10;
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = (void *)objc_msgSend(v242, "copy");
          -[GEOMapItemStorage clientAttributes](v246, "clientAttributes");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "setAddressBookAttributes:", v243);
          goto LABEL_277;
        }
      }
    }
    if (objc_msgSend(v8, "hasPlaceResult"))
    {
      v247 = objc_alloc_init(GEOPlaceResult);
      -[GEOMapItemStorage setPlaceResult:](v10, "setPlaceResult:", v247);

      objc_msgSend(v8, "placeResult");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = objc_msgSend(v248, "hasFlyoverTourMuid");

      if (v249)
      {
        objc_msgSend(v8, "placeResult");
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        v251 = objc_msgSend(v250, "flyoverTourMuid");
        -[GEOMapItemStorage placeResult](v10, "placeResult");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "setFlyoverTourMuid:", v251);

      }
      objc_msgSend(v8, "placeResult");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = objc_msgSend(v253, "hasCacheControl");

      if (v254)
      {
        objc_msgSend(v8, "placeResult");
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        v256 = objc_msgSend(v255, "cacheControl");
        -[GEOMapItemStorage placeResult](v10, "placeResult");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "setCacheControl:", v256);

      }
      objc_msgSend(v8, "placeResult");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "place");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      __72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(v259);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage placeResult](v10, "placeResult");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "setPlace:", v260);

      v10 = v269;
    }
    if (objc_msgSend(v8, "hasMapsURL"))
    {
      objc_msgSend(v8, "mapsURL");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v263 = (void *)objc_msgSend(v262, "copy");
      -[GEOMapItemStorage setMapsURL:](v10, "setMapsURL:", v263);

    }
    if (a4 != 2 && objc_msgSend(v8, "hasUserValues"))
    {
      objc_msgSend(v8, "userValues");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v265 = (void *)objc_msgSend(v264, "copy");
      -[GEOMapItemStorage setUserValues:](v10, "setUserValues:", v265);

    }
    goto LABEL_5;
  }
  +[GEOMapItemStorage mapItemStorageForMapsSync:forUseType:](GEOMapItemStorage, "mapItemStorageForMapsSync:forUseType:", v7, a4);
  v9 = (GEOMapItemStorage *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = v9;
LABEL_5:

LABEL_7:
  return v10;
}

GEOPlace *__72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(void *a1)
{
  id v1;
  GEOPlace *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  GEOBusiness *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(GEOPlace);
  if (objc_msgSend(v1, "hasArea"))
  {
    objc_msgSend(v1, "area");
    -[GEOPlace setArea:](v2, "setArea:");
  }
  if (objc_msgSend(v1, "hasAddress"))
  {
    objc_msgSend(v1, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    -[GEOPlace setAddress:](v2, "setAddress:", v4);

  }
  if (objc_msgSend(v1, "hasCenter"))
  {
    objc_msgSend(v1, "center");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[GEOPlace setCenter:](v2, "setCenter:", v6);

  }
  if (objc_msgSend(v1, "hasDisplayMapRegion"))
  {
    objc_msgSend(v1, "displayMapRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[GEOPlace setDisplayMapRegion:](v2, "setDisplayMapRegion:", v8);

  }
  if (objc_msgSend(v1, "hasMapRegion"))
  {
    objc_msgSend(v1, "mapRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[GEOPlace setMapRegion:](v2, "setMapRegion:", v10);

  }
  if (objc_msgSend(v1, "hasName"))
  {
    objc_msgSend(v1, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[GEOPlace setName:](v2, "setName:", v12);

  }
  if (objc_msgSend(v1, "hasTimezone"))
  {
    objc_msgSend(v1, "timezone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[GEOPlace setTimezone:](v2, "setTimezone:", v14);

  }
  if (objc_msgSend(v1, "hasType"))
    -[GEOPlace setType:](v2, "setType:", objc_msgSend(v1, "type"));
  if (objc_msgSend(v1, "hasIsDisputed"))
    -[GEOPlace setIsDisputed:](v2, "setIsDisputed:", objc_msgSend(v1, "isDisputed"));
  objc_msgSend(v1, "business");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v1, "business");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlace setBusiness:](v2, "setBusiness:", v19);

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = v1;
    objc_msgSend(v1, "business");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v24);
          v26 = objc_alloc_init(GEOBusiness);
          if (objc_msgSend(v25, "hasUID"))
            -[GEOBusiness setUID:](v26, "setUID:", objc_msgSend(v25, "uID"));
          objc_msgSend(v25, "categorys");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          if (v28)
          {
            objc_msgSend(v25, "categorys");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v29, "copy");
            -[GEOBusiness setCategorys:](v26, "setCategorys:", v30);

          }
          if (objc_msgSend(v25, "hasCenter"))
          {
            objc_msgSend(v25, "center");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v31, "copy");
            -[GEOBusiness setCenter:](v26, "setCenter:", v32);

          }
          if (objc_msgSend(v25, "hasMapsURL"))
          {
            objc_msgSend(v25, "mapsURL");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(v33, "copy");
            -[GEOBusiness setMapsURL:](v26, "setMapsURL:", v34);

          }
          if (objc_msgSend(v25, "hasName"))
          {
            objc_msgSend(v25, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v35, "copy");
            -[GEOBusiness setName:](v26, "setName:", v36);

          }
          objc_msgSend(v25, "openHours");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (v38)
          {
            objc_msgSend(v25, "openHours");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(v39, "copy");
            -[GEOBusiness setOpenHours:](v26, "setOpenHours:", v40);

          }
          if (objc_msgSend(v25, "hasTelephone"))
          {
            objc_msgSend(v25, "telephone");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "copy");
            -[GEOBusiness setTelephone:](v26, "setTelephone:", v42);

          }
          if (objc_msgSend(v25, "hasURL"))
          {
            objc_msgSend(v25, "uRL");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(v43, "copy");
            -[GEOBusiness setURL:](v26, "setURL:", v44);

          }
          if (objc_msgSend(v25, "hasIsClosed"))
            -[GEOBusiness setIsClosed:](v26, "setIsClosed:", objc_msgSend(v25, "isClosed"));
          -[GEOPlace business](v2, "business");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v26);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v22);
    }

    v1 = v47;
  }

  return v2;
}

+ (id)mapItemStorageForMapsSync:(id)a3 forUseType:(unint64_t)a4
{
  id v5;
  GEOMapItemStorage *v6;
  void *v7;
  GEOPDPlace *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  GEOPDComponent *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  GEOPDComponentValue *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  uint64_t v79;
  GEOPDComponentValue *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  __int16 v106;
  int v107;
  BOOL v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  GEOMapItemClientAttributes *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  GEOPlaceResult *v133;
  void *v134;
  int v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v153;
  id v154;
  GEOMapItemStorage *v156;
  id obj;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isValid"))
  {
    v6 = objc_alloc_init(GEOMapItemStorage);
    objc_msgSend(a1, "mapItemStorageForGEOMapItem:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v6;
    if (objc_msgSend(v7, "hasPlaceData"))
    {
      v8 = objc_alloc_init(GEOPDPlace);
      -[GEOMapItemStorage setPlaceData:](v6, "setPlaceData:", v8);

      objc_msgSend(v7, "placeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasMuid");

      if (v10)
      {
        objc_msgSend(v7, "placeData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "muid");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setMuid:", v12);

      }
      objc_msgSend(v7, "placeData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPreferredMuid");

      if (v15)
      {
        objc_msgSend(v7, "placeData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "preferredMuid");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setPreferredMuid:", v17);

      }
      objc_msgSend(v7, "placeData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasMapsId");

      if (v20)
      {
        objc_msgSend(v7, "placeData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "mapsId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMapsId:", v23);

      }
      objc_msgSend(v7, "placeData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasReferenceFrame");

      if (v26)
      {
        objc_msgSend(v7, "placeData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "referenceFrame");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setReferenceFrame:", v28);

      }
      objc_msgSend(v7, "placeData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasResultProviderId");

      if (v31)
      {
        objc_msgSend(v7, "placeData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "resultProviderId");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setResultProviderId:", v33);

      }
      objc_msgSend(v7, "placeData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "hasStatus");

      if (v36)
      {
        objc_msgSend(v7, "placeData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "status");
        -[GEOMapItemStorage placeData](v156, "placeData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setStatus:", v38);

      }
      objc_msgSend(v7, "placeData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "hasPlaceLayoutData");

      if (v41)
      {
        objc_msgSend(v7, "placeData");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "placeLayoutData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapItemStorage placeData](v156, "placeData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setPlaceLayoutData:", v43);

      }
      objc_msgSend(v7, "placeData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "components");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      v6 = v156;
      if (v47)
      {
        v154 = v5;
        v48 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v7, "placeData");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "components");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "arrayWithCapacity:", objc_msgSend(v50, "count"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapItemStorage placeData](v156, "placeData");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setComponents:", v51);

        v6 = v156;
        v167 = 0u;
        v168 = 0u;
        v165 = 0u;
        v166 = 0u;
        v153 = v7;
        objc_msgSend(v7, "placeData");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "components");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v54;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v165, v170, 16);
        v56 = a4;
        v159 = v55;
        if (!v55)
          goto LABEL_136;
        v158 = *(_QWORD *)v166;
        while (1)
        {
          v57 = 0;
          do
          {
            if (*(_QWORD *)v166 != v158)
              objc_enumerationMutation(obj);
            v58 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * v57);
            -[GEOPDComponent values]((id *)v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "count");

            if (v60)
            {
              v160 = v57;
              v61 = objc_alloc_init(GEOPDComponent);
              v62 = (void *)MEMORY[0x1E0C99DE8];
              -[GEOPDComponent values]((id *)v58);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "arrayWithCapacity:", objc_msgSend(v63, "count"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPDComponent setValues:]((uint64_t)v61, v64);

              if (!v58 || (*(_WORD *)(v58 + 100) & 0x80) == 0)
                goto LABEL_133;
              v65 = *(_DWORD *)(v58 + 88);
              if (v65 > 47)
              {
                if (v65 <= 82)
                {
                  switch(v65)
                  {
                    case '0':
                      if (v56 == 5)
                      {
                        -[GEOPDComponent values]((id *)v58);
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v94, "firstObject");
                        v67 = objc_claimAutoreleasedReturnValue();

                        if (v67 && *(_QWORD *)(v67 + 752))
                        {
                          v68 = objc_alloc_init(GEOPDComponentValue);
                          -[GEOPDComponentValue venueInfo]((id *)v67);
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          v70 = (void *)objc_msgSend(v69, "copy");
                          -[GEOPDComponentValue setVenueInfo:]((uint64_t)v68, v70);
                          goto LABEL_105;
                        }
                        goto LABEL_109;
                      }
                      goto LABEL_110;
                    case '@':
                      -[GEOPDComponent values]((id *)v58);
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (v67 && *(_QWORD *)(v67 + 120))
                      {
                        v68 = objc_alloc_init(GEOPDComponentValue);
                        -[GEOPDComponentValue businessHours]((id *)v67);
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        v70 = (void *)objc_msgSend(v69, "copy");
                        -[GEOPDComponentValue setBusinessHours:]((uint64_t)v68, v70);
                        goto LABEL_105;
                      }
                      goto LABEL_109;
                    case 'M':
                      -[GEOPDComponent values]((id *)v58);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (v67 && *(_QWORD *)(v67 + 312))
                      {
                        v68 = objc_alloc_init(GEOPDComponentValue);
                        -[GEOPDComponentValue iso3166Code]((id *)v67);
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        v70 = (void *)objc_msgSend(v69, "copy");
                        -[GEOPDComponentValue setIso3166Code:]((uint64_t)v68, v70);
                        goto LABEL_105;
                      }
                      goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                if (v65 > 104)
                {
                  if (v65 == 105)
                  {
                    -[GEOPDComponent values]((id *)v58);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "firstObject");
                    v67 = objc_claimAutoreleasedReturnValue();

                    if (v67 && *(_QWORD *)(v67 + 288))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue hikeSummary]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setHikeSummary:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  if (v65 == 106)
                  {
                    -[GEOPDComponent values]((id *)v58);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "firstObject");
                    v67 = objc_claimAutoreleasedReturnValue();

                    if (v67 && *(_QWORD *)(v67 + 280))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue hikeGeometry]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setHikeGeometry:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                if (v65 != 83)
                {
                  if (v65 == 104)
                  {
                    -[GEOPDComponent values]((id *)v58);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "firstObject");
                    v67 = objc_claimAutoreleasedReturnValue();

                    if (v67 && *(_QWORD *)(v67 + 272))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue hikeAssociatedInfo]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setHikeAssociatedInfo:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                -[GEOPDComponent values]((id *)v58);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "firstObject");
                v67 = objc_claimAutoreleasedReturnValue();

                if (!v67 || !*(_QWORD *)(v67 + 160))
                  goto LABEL_109;
                v68 = objc_alloc_init(GEOPDComponentValue);
                -[GEOPDComponentValue containmentPlace]((id *)v67);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = (void *)objc_msgSend(v69, "copy");
                -[GEOPDComponentValue setContainmentPlace:]((uint64_t)v68, v91);
              }
              else
              {
                if (v65 > 14)
                {
                  switch(v65)
                  {
                    case 15:
                      -[GEOPDComponent values]((id *)v58);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 64))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue amenities]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setAmenities:]((uint64_t)v68, v70);
                      break;
                    case 16:
                      v163 = 0u;
                      v164 = 0u;
                      v161 = 0u;
                      v162 = 0u;
                      -[GEOPDComponent values]((id *)v58);
                      v67 = objc_claimAutoreleasedReturnValue();
                      v75 = objc_msgSend((id)v67, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
                      if (v75)
                      {
                        v76 = v75;
                        v77 = *(_QWORD *)v162;
                        do
                        {
                          for (i = 0; i != v76; ++i)
                          {
                            if (*(_QWORD *)v162 != v77)
                              objc_enumerationMutation((id)v67);
                            v79 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * i);
                            if (v79 && *(_QWORD *)(v79 + 592))
                            {
                              v80 = objc_alloc_init(GEOPDComponentValue);
                              -[GEOPDComponentValue styleAttributes]((id *)v79);
                              v81 = (void *)objc_claimAutoreleasedReturnValue();
                              v82 = (void *)objc_msgSend(v81, "copy");
                              -[GEOPDComponentValue setStyleAttributes:]((uint64_t)v80, v82);

                              -[GEOPDComponent values]((id *)&v61->super.super.isa);
                              v83 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v83, "addObject:", v80);

                            }
                            if (v61)
                            {
                              v84 = *(_DWORD *)(v58 + 92);
                              *(_WORD *)&v61->_flags |= 0x100u;
                              v61->_valuesAvailable = v84;
                            }
                          }
                          v76 = objc_msgSend((id)v67, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
                        }
                        while (v76);
                        v56 = a4;
                        v6 = v156;
                      }
                      goto LABEL_109;
                    case 22:
                      -[GEOPDComponent values]((id *)v58);
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 616))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue textBlock]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setTextBlock:]((uint64_t)v68, v70);
                      break;
                    case 23:
                      -[GEOPDComponent values]((id *)v58);
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 232))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue factoid]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setFactoid:]((uint64_t)v68, v70);
                      break;
                    case 26:
                      if (v56 != 6)
                        goto LABEL_110;
                      -[GEOPDComponent values]((id *)v58);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 128))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue captionedPhoto]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setCaptionedPhoto:]((uint64_t)v68, v70);
                      break;
                    case 30:
                      -[GEOPDComponent values]((id *)v58);
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 528))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue resultSnippet]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setResultSnippet:]((uint64_t)v68, v70);
                      break;
                    case 31:
                      -[GEOPDComponent values]((id *)v58);
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "firstObject");
                      v67 = objc_claimAutoreleasedReturnValue();

                      if (!v67 || !*(_QWORD *)(v67 + 40))
                        goto LABEL_109;
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue addressObject]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setAddressObject:]((uint64_t)v68, v70);
                      break;
                    default:
                      goto LABEL_133;
                  }
LABEL_105:

LABEL_106:
                  -[GEOPDComponent values]((id *)&v61->super.super.isa);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "addObject:", v68);

                  if (v61)
                  {
                    v98 = *(_DWORD *)(v58 + 92);
                    *(_WORD *)&v61->_flags |= 0x100u;
                    v61->_valuesAvailable = v98;
                  }

LABEL_109:
LABEL_110:
                  -[GEOPDComponent values]((id *)&v61->super.super.isa);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = objc_msgSend(v99, "count");

                  if (v100)
                  {
                    if (*(_QWORD *)(v58 + 16))
                    {
                      -[GEOPDComponent attribution]((id *)v58);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      v102 = (void *)objc_msgSend(v101, "copy");
                      -[GEOPDComponent setAttribution:]((uint64_t)v61, v102);

                    }
                    if ((*(_WORD *)(v58 + 100) & 2) != 0 && v61)
                    {
                      v103 = *(_DWORD *)(v58 + 64);
                      *(_WORD *)&v61->_flags |= 2u;
                      v61->_cacheControl = v103;
                    }
                    if (*(_QWORD *)(v58 + 32))
                    {
                      -[GEOPDComponent source]((id *)v58);
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v105 = (void *)objc_msgSend(v104, "copy");
                      -[GEOPDComponent setSource:]((uint64_t)v61, v105);

                    }
                    v106 = *(_WORD *)(v58 + 100);
                    if ((v106 & 0x20) != 0)
                    {
                      if (v61)
                      {
                        v107 = *(_DWORD *)(v58 + 80);
                        *(_WORD *)&v61->_flags |= 0x20u;
                        v61->_status = v107;
                        v106 = *(_WORD *)(v58 + 100);
                        goto LABEL_121;
                      }
                    }
                    else
                    {
LABEL_121:
                      v108 = v61 == 0;
                      if ((v106 & 0x40) != 0 && v61)
                      {
                        v109 = *(_DWORD *)(v58 + 84);
                        *(_WORD *)&v61->_flags |= 0x40u;
                        v61->_ttl = v109;
                        v106 = *(_WORD *)(v58 + 100);
                      }
                      if ((v106 & 0x80) != 0)
                      {
                        if (!v61)
                          goto LABEL_130;
                        v108 = 0;
                        v110 = *(_DWORD *)(v58 + 88);
                        *(_WORD *)&v61->_flags |= 0x80u;
                        v61->_type = v110;
                        v106 = *(_WORD *)(v58 + 100);
                      }
                      if ((v106 & 0x200) != 0 && !v108)
                      {
                        v111 = *(_DWORD *)(v58 + 96);
                        *(_WORD *)&v61->_flags |= 0x200u;
                        v61->_version = v111;
                      }
                    }
LABEL_130:
                    -[GEOPDComponent versionDomains]((id *)v58);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = objc_msgSend(v112, "count");

                    if (v113)
                    {
                      -[GEOPDComponent versionDomains]((id *)v58);
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      v115 = (void *)objc_msgSend(v114, "copy");
                      -[GEOPDComponent setVersionDomains:]((uint64_t)v61, v115);

                    }
                    -[GEOPDComponent setTimestampFirstSeen:](v61, "setTimestampFirstSeen:", 0.0);
                    -[GEOMapItemStorage placeData](v6, "placeData");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "components");
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v117, "addObject:", v61);

                  }
LABEL_133:

                  v57 = v160;
                  goto LABEL_134;
                }
                if (v65 == 1)
                {
                  -[GEOPDComponent values]((id *)v58);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "firstObject");
                  v67 = objc_claimAutoreleasedReturnValue();

                  if (v67 && *(_QWORD *)(v67 + 192))
                  {
                    v68 = objc_alloc_init(GEOPDComponentValue);
                    -[GEOPDComponentValue entity]((id *)v67);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    v70 = (void *)objc_msgSend(v69, "copy");
                    -[GEOPDComponentValue setEntity:]((uint64_t)v68, v70);
                    goto LABEL_105;
                  }
                  goto LABEL_109;
                }
                if (v65 != 2)
                {
                  if (v65 == 4)
                  {
                    -[GEOPDComponent values]((id *)v58);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "firstObject");
                    v67 = objc_claimAutoreleasedReturnValue();

                    if (v67 && *(_QWORD *)(v67 + 88))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      -[GEOPDComponentValue bounds]((id *)v67);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = (void *)objc_msgSend(v69, "copy");
                      -[GEOPDComponentValue setBounds:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                -[GEOPDComponent values]((id *)v58);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "firstObject");
                v67 = objc_claimAutoreleasedReturnValue();

                if (!v67 || !*(_QWORD *)(v67 + 400))
                  goto LABEL_109;
                v68 = objc_alloc_init(GEOPDComponentValue);
                -[GEOPDComponentValue placeInfo]((id *)v67);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = (void *)objc_msgSend(v69, "copy");
                -[GEOPDComponentValue setPlaceInfo:]((uint64_t)v68, v91);
              }

              goto LABEL_106;
            }
LABEL_134:
            ++v57;
          }
          while (v57 != v159);
          v159 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v165, v170, 16);
          if (!v159)
          {
LABEL_136:

            v7 = v153;
            v5 = v154;
            break;
          }
        }
      }
    }
    if (objc_msgSend(v7, "hasPlace"))
    {
      objc_msgSend(v7, "place");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      __70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage setPlace:](v6, "setPlace:", v119);

    }
    if (objc_msgSend(v7, "hasClientAttributes"))
    {
      v120 = objc_alloc_init(GEOMapItemClientAttributes);
      -[GEOMapItemStorage setClientAttributes:](v6, "setClientAttributes:", v120);

      objc_msgSend(v7, "clientAttributes");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v121, "hasAddressBookAttributes");

      if (v122)
      {
        objc_msgSend(v7, "clientAttributes");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "addressBookAttributes");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)objc_msgSend(v124, "copy");
        -[GEOMapItemStorage clientAttributes](v6, "clientAttributes");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setAddressBookAttributes:", v125);

        v6 = v156;
      }
      objc_msgSend(v7, "clientAttributes");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v127, "hasCorrectedLocationAttributes");

      if (v128)
      {
        objc_msgSend(v7, "clientAttributes");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "correctedLocationAttributes");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = (void *)objc_msgSend(v130, "copy");
        -[GEOMapItemStorage clientAttributes](v6, "clientAttributes");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "setCorrectedLocationAttributes:", v131);

        v6 = v156;
      }
    }
    if (objc_msgSend(v7, "hasPlaceResult"))
    {
      v133 = objc_alloc_init(GEOPlaceResult);
      -[GEOMapItemStorage setPlaceResult:](v6, "setPlaceResult:", v133);

      objc_msgSend(v7, "placeResult");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v134, "hasFlyoverTourMuid");

      if (v135)
      {
        objc_msgSend(v7, "placeResult");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend(v136, "flyoverTourMuid");
        -[GEOMapItemStorage placeResult](v6, "placeResult");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setFlyoverTourMuid:", v137);

      }
      objc_msgSend(v7, "placeResult");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "hasCacheControl");

      if (v140)
      {
        objc_msgSend(v7, "placeResult");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = objc_msgSend(v141, "cacheControl");
        -[GEOMapItemStorage placeResult](v6, "placeResult");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "setCacheControl:", v142);

      }
      objc_msgSend(v7, "placeResult");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "place");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      __70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage placeResult](v6, "placeResult");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setPlace:", v146);

      v6 = v156;
    }
    if (objc_msgSend(v7, "hasMapsURL"))
    {
      objc_msgSend(v7, "mapsURL");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = (void *)objc_msgSend(v148, "copy");
      -[GEOMapItemStorage setMapsURL:](v6, "setMapsURL:", v149);

    }
    if (objc_msgSend(v7, "hasUserValues"))
    {
      objc_msgSend(v7, "userValues");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = (void *)objc_msgSend(v150, "copy");
      -[GEOMapItemStorage setUserValues:](v6, "setUserValues:", v151);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

GEOPlace *__70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(void *a1)
{
  id v1;
  GEOPlace *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  GEOBusiness *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(GEOPlace);
  if (objc_msgSend(v1, "hasArea"))
  {
    objc_msgSend(v1, "area");
    -[GEOPlace setArea:](v2, "setArea:");
  }
  if (objc_msgSend(v1, "hasAddress"))
  {
    objc_msgSend(v1, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    -[GEOPlace setAddress:](v2, "setAddress:", v4);

  }
  if (objc_msgSend(v1, "hasCenter"))
  {
    objc_msgSend(v1, "center");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[GEOPlace setCenter:](v2, "setCenter:", v6);

  }
  if (objc_msgSend(v1, "hasDisplayMapRegion"))
  {
    objc_msgSend(v1, "displayMapRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[GEOPlace setDisplayMapRegion:](v2, "setDisplayMapRegion:", v8);

  }
  if (objc_msgSend(v1, "hasMapRegion"))
  {
    objc_msgSend(v1, "mapRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[GEOPlace setMapRegion:](v2, "setMapRegion:", v10);

  }
  if (objc_msgSend(v1, "hasName"))
  {
    objc_msgSend(v1, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[GEOPlace setName:](v2, "setName:", v12);

  }
  if (objc_msgSend(v1, "hasType"))
    -[GEOPlace setType:](v2, "setType:", objc_msgSend(v1, "type"));
  if (objc_msgSend(v1, "hasIsDisputed"))
    -[GEOPlace setIsDisputed:](v2, "setIsDisputed:", objc_msgSend(v1, "isDisputed"));
  objc_msgSend(v1, "business");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v1, "business");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlace setBusiness:](v2, "setBusiness:", v17);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v1;
    objc_msgSend(v1, "business");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v22);
          v24 = objc_alloc_init(GEOBusiness);
          if (objc_msgSend(v23, "hasUID"))
            -[GEOBusiness setUID:](v24, "setUID:", objc_msgSend(v23, "uID"));
          objc_msgSend(v23, "categorys");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            objc_msgSend(v23, "categorys");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v27, "copy");
            -[GEOBusiness setCategorys:](v24, "setCategorys:", v28);

          }
          if (objc_msgSend(v23, "hasCenter"))
          {
            objc_msgSend(v23, "center");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v29, "copy");
            -[GEOBusiness setCenter:](v24, "setCenter:", v30);

          }
          if (objc_msgSend(v23, "hasName"))
          {
            objc_msgSend(v23, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v31, "copy");
            -[GEOBusiness setName:](v24, "setName:", v32);

          }
          -[GEOPlace business](v2, "business");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v20);
    }

    v1 = v35;
  }

  return v2;
}

+ (id)mapItemStorageForSerializedMapItemStorage:(id)a3
{
  id v3;
  void *v4;
  GEOMapItemStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = -[GEOMapItemStorage initWithData:]([GEOMapItemStorage alloc], "initWithData:", v4);
    -[GEOMapItemStorage placeData](v5, "placeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[GEOMapItemStorage placeData](v5, "placeData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage userValues](v5, "userValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOMapItemStorage mapItemStorageForPlaceData:detourInfo:userValues:](GEOMapItemStorage, "mapItemStorageForPlaceData:detourInfo:userValues:", v7, 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[GEOMapItemStorage place](v5, "place");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v10 = 0;
        goto LABEL_9;
      }
      -[GEOMapItemStorage place](v5, "place");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemStorage userValues](v5, "userValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOMapItemStorage mapItemStorageForPlace:clientAttributes:userValues:](GEOMapItemStorage, "mapItemStorageForPlace:clientAttributes:userValues:", v7, 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)mapItemStorageForSerializedPlaceData:(id)a3
{
  return (id)objc_msgSend(a1, "mapItemStorageForSerializedPlaceData:serializedDetourInfo:", a3, 0);
}

+ (id)mapItemStorageForSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4
{
  id v5;
  id v6;
  GEOPDPlace *v7;
  GEOPDResultDetourInfo *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = -[GEOPDPlace initWithData:]([GEOPDPlace alloc], "initWithData:", v5);
    if (v7)
    {
      if (objc_msgSend(v6, "length"))
        v8 = -[GEOPDResultDetourInfo initWithData:]([GEOPDResultDetourInfo alloc], "initWithData:", v6);
      else
        v8 = 0;
      +[GEOMapItemStorage mapItemStorageForPlaceData:detourInfo:](GEOMapItemStorage, "mapItemStorageForPlaceData:detourInfo:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)mapItemStorageForPlace:(id)a3
{
  id v3;
  GEOMapItemStorage *v4;

  v3 = a3;
  v4 = -[GEOMapItemStorage initWithPlace:clientAttributes:userValues:]([GEOMapItemStorage alloc], "initWithPlace:clientAttributes:userValues:", v3, 0, 0);

  return v4;
}

+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4
{
  id v5;
  id v6;
  GEOMapItemStorage *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOMapItemStorage initWithPlace:clientAttributes:userValues:]([GEOMapItemStorage alloc], "initWithPlace:clientAttributes:userValues:", v6, v5, 0);

  return v7;
}

+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOMapItemStorage *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEOMapItemStorage initWithPlace:clientAttributes:userValues:]([GEOMapItemStorage alloc], "initWithPlace:clientAttributes:userValues:", v9, v8, v7);

  return v10;
}

+ (id)mapItemStorageForPlaceResult:(id)a3
{
  id v3;
  GEOMapItemStorage *v4;

  v3 = a3;
  v4 = -[GEOMapItemStorage initWithPlaceResult:]([GEOMapItemStorage alloc], "initWithPlaceResult:", v3);

  return v4;
}

+ (id)mapItemStorageForPlaceData:(id)a3
{
  id v3;
  GEOMapItemStorage *v4;

  v3 = a3;
  v4 = -[GEOMapItemStorage initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:]([GEOMapItemStorage alloc], "initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:", v3, 0, 0, 0, 0);

  return v4;
}

+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4
{
  id v5;
  id v6;
  GEOMapItemStorage *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOMapItemStorage initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:]([GEOMapItemStorage alloc], "initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:", v6, v5, 0, 0, 0);

  return v7;
}

+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4 userValues:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOMapItemStorage *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEOMapItemStorage initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:]([GEOMapItemStorage alloc], "initWithPlaceData:detourInfo:clientAttributes:userValues:additionalPlaceDatas:", v9, v8, 0, v7, 0);

  return v10;
}

+ (id)mapItemStorageForCoordinate:(id)a3
{
  GEOPlace *v3;
  void *v4;

  v3 = -[GEOPlace initWithLatitude:longitude:]([GEOPlace alloc], "initWithLatitude:longitude:", a3.var0, a3.var1);
  +[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "isEqualToMapItem:", v4);

  if ((_DWORD)v6)
  {
    -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "_clientAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v8 = 0;
LABEL_14:

        goto LABEL_16;
      }
    }
    -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      if (v7)
      {

      }
LABEL_12:
      -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v8 = 1;
        goto LABEL_16;
      }
      v7 = (void *)v11;
      -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_clientAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "isEqual:", v13);

      goto LABEL_14;
    }
    objc_msgSend(v4, "_clientAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

    }
    if (!v10)
      goto LABEL_12;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (NSArray)_reviews
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_tips
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_photos
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasBusinessHours
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasBusinessHours");

  return v3;
}

- (BOOL)_isPartiallyClientized
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPartiallyClientized");

  return v3;
}

- (NSArray)_businessHours
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_businessHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasLinkedServices
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasLinkedServices");

  return v3;
}

- (NSArray)_linkedServices
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_linkedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOAssociatedApp)_associatedApp
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_associatedApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOAssociatedApp *)v3;
}

- (id)_mapItemByStrippingOptionalData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapItemByStrippingOptionalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOMapItemStorage)initWithPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapItemStorage *v11;
  GEOMapItemStorage *v12;
  uint64_t v13;
  GEOMapItem *geoMapItem;
  _GEOMapItemStorageNotificationTrampoline *v15;
  _GEOMapItemStorageNotificationTrampoline *trampoline;
  GEOMapItemStorage *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemStorage;
  v11 = -[GEOMapItemStorage init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    -[GEOMapItemStorage initAdditionalFields](v11, "initAdditionalFields");
    -[GEOMapItemStorage setPlace:](v12, "setPlace:", v8);
    -[GEOMapItemStorage setClientAttributes:](v12, "setClientAttributes:", v9);
    -[GEOMapItemStorage setUserValues:](v12, "setUserValues:", v10);
    objc_msgSend(v8, "geoMapItem");
    v13 = objc_claimAutoreleasedReturnValue();
    geoMapItem = v12->_geoMapItem;
    v12->_geoMapItem = (GEOMapItem *)v13;

    v15 = -[_GEOMapItemStorageNotificationTrampoline initWithMapItem:mapItemStorage:]([_GEOMapItemStorageNotificationTrampoline alloc], "initWithMapItem:mapItemStorage:", v12->_geoMapItem, v12);
    trampoline = v12->_trampoline;
    v12->_trampoline = v15;

    v17 = v12;
  }

  return v12;
}

- (GEOMapItemStorage)initWithPlaceResult:(id)a3
{
  id v4;
  GEOMapItemStorage *v5;
  GEOMapItemStorage *v6;
  uint64_t v7;
  GEOMapItem *geoMapItem;
  _GEOMapItemStorageNotificationTrampoline *v9;
  _GEOMapItemStorageNotificationTrampoline *trampoline;
  GEOMapItemStorage *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapItemStorage;
  v5 = -[GEOMapItemStorage init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOMapItemStorage initAdditionalFields](v5, "initAdditionalFields");
    -[GEOMapItemStorage setPlaceResult:](v6, "setPlaceResult:", v4);
    objc_msgSend(v4, "geoMapItem");
    v7 = objc_claimAutoreleasedReturnValue();
    geoMapItem = v6->_geoMapItem;
    v6->_geoMapItem = (GEOMapItem *)v7;

    v9 = -[_GEOMapItemStorageNotificationTrampoline initWithMapItem:mapItemStorage:]([_GEOMapItemStorageNotificationTrampoline alloc], "initWithMapItem:mapItemStorage:", v6->_geoMapItem, v6);
    trampoline = v6->_trampoline;
    v6->_trampoline = v9;

    v11 = v6;
  }

  return v6;
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItemCreatingAndAssociatingIfNeeded](self, "_geoMapItemCreatingAndAssociatingIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (NSString)name
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[GEOMapItemStorage userValues](self, "userValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasName");

  if (v4)
    -[GEOMapItemStorage userValues](self, "userValues");
  else
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)spokenNameForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spokenNameForLocale:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)secondaryName
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)secondarySpokenName
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondarySpokenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isDisputed
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisputed");

  return v3;
}

- (int)referenceFrame
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "referenceFrame");

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasCorrectedLocationAttributes") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedLocationAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedCoordinate");

  if (!v6)
  {
LABEL_5:
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerCoordinate");
    v11 = v14;
    v13 = v15;
    goto LABEL_6;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedCoordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v11 = v10;
  v13 = v12;

LABEL_6:
  v16 = v11;
  v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelCoordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (GEOMapRegion)displayMapRegion
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMapRegionOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (GEOMapRegion)offlineDownloadRegion
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offlineDownloadRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (BOOL)supportsOfflineMaps
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsOfflineMaps");

  return v3;
}

- (BOOL)hasDisplayMinZoom
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisplayMinZoom");

  return v3;
}

- (float)displayMinZoom
{
  void *v2;
  float v3;
  float v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMinZoom");
  v4 = v3;

  return v4;
}

- (BOOL)hasDisplayMaxZoom
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisplayMaxZoom");

  return v3;
}

- (float)displayMaxZoom
{
  void *v2;
  float v3;
  float v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMaxZoom");
  v4 = v3;

  return v4;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoFenceMapRegionOrNil");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (int)mapDisplayType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapDisplayType");

  return v3;
}

- (GEOLocalizedString)disclaimerText
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disclaimerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOLocalizedString *)v3;
}

- (GEOPDURLData)urlData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDURLData *)v3;
}

- (int)contactAddressType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v10;
  void *v11;
  void *v12;
  int v13;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAddressBookAttributes");

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "addressBookAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "addressType");

    return v8;
  }
  else
  {
    v10 = objc_msgSend(v5, "hasRoutineAttributes");

    if (v10)
    {
      -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routineAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "loiType");

      if ((v13 - 1) >= 3)
        return 0;
      else
        return v13;
    }
    else
    {
      return 0;
    }
  }
}

- (NSString)contactName
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressBookAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)contactSpokenName
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressBookAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spokenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)contactIsMe
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL result;
  int v10;
  void *v11;
  void *v12;
  int v13;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAddressBookAttributes");

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "addressBookAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isMe");

    return v8;
  }
  else
  {
    v10 = objc_msgSend(v5, "hasRoutineAttributes");

    result = 0;
    if (v10)
    {
      -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routineAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "loiType");

      if ((v13 - 1) < 3)
        return 1;
    }
  }
  return result;
}

- (NSString)eventName
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routineAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDate)eventDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routineAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventDate");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (BOOL)isEventAllDay
{
  void *v2;
  void *v3;
  char v4;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routineAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEventAllDay");

  return v4;
}

- (GEOPDPlace)_placeData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDPlace *)v3;
}

- (BOOL)_hasResolvablePartialInformation
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasResolvablePartialInformation");

  return v3;
}

- (BOOL)_responseStatusIsIncomplete
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_responseStatusIsIncomplete");

  return v3;
}

- (int)_placeType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeType");

  return v3;
}

- (GEOPlace)_place
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_place");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPlace *)v3;
}

- (GEOPlaceResult)_placeResult
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPlaceResult *)v3;
}

- (NSData)_placeDataAsData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeDataAsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (GEOAddress)geoAddress
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasCorrectedLocationAttributes") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedLocationAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedAddress");

  if (!v6)
  {
LABEL_5:
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "geoAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[GEOMapItemStorage clientAttributes](self, "clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return (GEOAddress *)v9;
}

- (int)_addressGeocodeAccuracy
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_addressGeocodeAccuracy");

  return v3;
}

- (id)_spokenAddressForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_spokenAddressForLocale:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_arrivalMapRegionForTransportType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)_roadAccessPoints
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_roadAccessPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasResultProviderID
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasResultProviderID");

  return v3;
}

- (int)_resultProviderID
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_resultProviderID");

  return v3;
}

- (GEOMapItemIdentifier)transitStationIdentifier
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitStationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemIdentifier *)v3;
}

- (BOOL)_isTransitDisplayFeature
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isTransitDisplayFeature");

  return v3;
}

- (BOOL)_hasTransit
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasTransit");

  return v3;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemTransitInfo *)v3;
}

- (GEOTransitAttribution)_transitAttribution
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitAttribution *)v3;
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitVehiclePosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitVehiclePosition *)v3;
}

- (NSArray)supportedTransitPaymentMethods
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedTransitPaymentMethods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)transitPaymentMethodSuggestions
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitPaymentMethodSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (double)cachingRadiusMeters
{
  void *v2;
  double v3;
  double v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachingRadiusMeters");
  v4 = v3;

  return v4;
}

- (BOOL)_hasFlyover
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasFlyover");

  return v3;
}

- (GEOPDFlyover)_flyover
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flyover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDFlyover *)v3;
}

- (NSString)_flyoverAnnouncementMessage
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flyoverAnnouncementMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOMuninViewState)_muninViewState
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_muninViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMuninViewState *)v3;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_storefrontInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStorefrontInfo *)v3;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_storefrontPresentationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStorefrontPresentationInfo *)v3;
}

- (BOOL)_hasMUID
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasMUID");

  return v3;
}

- (unint64_t)_muid
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_muid");

  return v3;
}

- (GEOMapItemIdentifier)_identifier
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemIdentifier *)v3;
}

- (NSSet)_alternateIdentifiers
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_alternateIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (int)_placeDisplayType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType");

  return v3;
}

- (BOOL)_hasAreaInMeters
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAreaInMeters");

  return v3;
}

- (double)_areaInMeters
{
  void *v2;
  double v3;
  double v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_areaInMeters");
  v4 = v3;

  return v4;
}

- (NSString)_businessURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[GEOMapItemStorage userValues](self, "userValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasUrl");

  if (v4)
  {
    -[GEOMapItemStorage userValues](self, "userValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
  }
  else
  {
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_businessURL");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)_hasUserRatingScore
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasUserRatingScore");

  return v3;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  void *v2;
  unsigned int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_sampleSizeForUserRatingScore");

  return v3;
}

- (float)_normalizedUserRatingScore
{
  void *v2;
  float v3;
  float v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_normalizedUserRatingScore");
  v4 = v3;

  return v4;
}

- (BOOL)_hasPriceRange
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPriceRange");

  return v3;
}

- (unsigned)_priceRange
{
  void *v2;
  unsigned int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_priceRange");

  return v3;
}

- (unsigned)_maxScoreForPriceRange
{
  void *v2;
  unsigned int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_maxScoreForPriceRange");

  return v3;
}

- (NSString)_resultSnippetLocationString
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resultSnippetLocationString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  void *v2;
  unsigned int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_resultSnippetDistanceDisplayThreshold");

  return v3;
}

- (NSArray)_childItems
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_childItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_localizedCategoryNamesForType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "_hasLocalizedCategoryNamesForType:", v3);

  return v3;
}

- (BOOL)_hasAnyAmenities
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAnyAmenities");

  return v3;
}

- (NSArray)_amenities
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_amenities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasOperatingHours
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasOperatingHours");

  return v3;
}

- (BOOL)_hasCurrentOperatingHours
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasCurrentOperatingHours");

  return v3;
}

- (BOOL)_hasEncyclopedicInfo
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasEncyclopedicInfo");

  return v3;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_encyclopedicInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEncyclopedicInfo *)v3;
}

- (BOOL)_hasTelephone
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasTelephone");

  return v3;
}

- (NSString)_telephone
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[GEOMapItemStorage userValues](self, "userValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPhoneNumber");

  if (v4)
  {
    -[GEOMapItemStorage userValues](self, "userValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
  }
  else
  {
    -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_telephone");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)_optsOutOfTelephoneAds
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_optsOutOfTelephoneAds");

  return v3;
}

- (NSString)_disambiguationName
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_disambiguationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)_openingHoursOptions
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_openingHoursOptions");

  return v3;
}

- (GEOInlineRapEnablement)_inlineRapEnablement
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inlineRapEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOInlineRapEnablement *)v3;
}

- (BOOL)_needsAttribution
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_needsAttribution");

  return v3;
}

- (NSURL)_webURL
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_webURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)_providerURL
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_providerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)_vendorID
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_vendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_poiSurveyURLString
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_poiSurveyURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_poiPinpointURLString
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_poiPinpointURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemPlaceAttribution *)v3;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photosAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemPhotosAttribution *)v3;
}

- (NSArray)_allPhotoAttributions
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allPhotoAttributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reviewsAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemReviewsAttribution *)v3;
}

- (NSString)_poiCategory
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItemStorage _styleAttributes](self, "_styleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "categoryForPOIType:", objc_msgSend(v2, "poiType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOFeatureStyleAttributes *)v3;
}

- (unint64_t)_customIconID
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_customIconID");

  return v3;
}

- (NSString)_mapsCategoryId
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapsCategoryId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)_additionalPlaceInfos
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_additionalPlaceInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_asPlaceInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_asPlaceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOMapRegion)mapRegion
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoFenceMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v3;
}

- (BOOL)_hasPOIClaim
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPOIClaim");

  return v3;
}

- (GEOPOIClaim)_poiClaim
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_poiClaim");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPOIClaim *)v3;
}

- (GEOBusinessAssets)businessAssets
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "businessAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOBusinessAssets *)v3;
}

- (NSArray)spatialMappedCategories
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spatialMappedCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasFeatureLink
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasFeatureLink");

  return v3;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_featureLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEORestaurantFeaturesLink *)v3;
}

- (int)_parsecSectionType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_parsecSectionType");

  return v3;
}

- (BOOL)_isStandaloneBrand
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isStandaloneBrand");

  return v3;
}

- (BOOL)_hasBrandMUID
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasBrandMUID");

  return v3;
}

- (unint64_t)_brandMUID
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_brandMUID");

  return v3;
}

- (GEOMessageLink)_messageLink
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_messageLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMessageLink *)v3;
}

- (NSArray)_quickLinks
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_quickLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_secondaryQuickLinks
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_secondaryQuickLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_placeCollections
{
  return 0;
}

- (NSArray)_searchResultPhotoCarousel
{
  return 0;
}

- (GEOExploreGuides)_exploreGuides
{
  return 0;
}

- (NSArray)_placeCollectionsIds
{
  return 0;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPlaceCollectionPullQuotes");

  return v3;
}

- (NSArray)_placeCollectionPullQuotes
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeCollectionPullQuotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_relatedPlaceLists
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_relatedPlaceLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_relatedPlaceListForComponentIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_firstRelatedPlaceListForType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hasEVCharger
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasEVCharger");

  return v3;
}

- (GEOEVCharger)_evCharger
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_evCharger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEVCharger *)v3;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placecardLayoutData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPlacecardLayoutData *)v3;
}

- (GEOMapItemDetourInfo)detourInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detourInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemDetourInfo *)v3;
}

- (BOOL)hasExpiredComponents
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasExpiredComponents");

  return v3;
}

- (id)addressObject
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shortAddress
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[GEOMapItemStorage _venueFeatureType](self, "_venueFeatureType") == 4)
  {
    -[GEOMapItemStorage addressObject](self, "addressObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "venueShortAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
      return v4;

  }
  -[GEOMapItemStorage _clientAttributes](self, "_clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedLocationAttributes");

  if (!v6)
  {
LABEL_7:
    -[GEOMapItemStorage addressObject](self, "addressObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  -[GEOMapItemStorage _clientAttributes](self, "_clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedAddressLines");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {

    goto LABEL_7;
  }
  return v4;
}

- (id)weatherDisplayName
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weatherDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)externalTransitStationCode
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalTransitStationCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)_hasVenueFeatureType
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasVenueFeatureType");

  return v3;
}

- (int)_venueFeatureType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_venueFeatureType");

  return v3;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_venueInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemVenueInfo *)v3;
}

- (NSArray)_browseCategories
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_browseCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_miniBrowseCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMiniBrowseCategories *)v3;
}

- (int)_placeDisplayStyle
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayStyle");

  return v3;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_annotatedItemList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOAnnotatedItemList *)v3;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasWifiFingerprintLabelStatusCode");

  return v3;
}

- (int)_wifiFingerprintLabelStatusCode
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wifiFingerprintLabelStatusCode");

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasWifiFingerprintLabelType");

  return v3;
}

- (int)_wifiFingerprintLabelType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wifiFingerprintLabelType");

  return v3;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasWifiFingerprintConfidence");

  return v3;
}

- (unsigned)_wifiFingerprintConfidence
{
  void *v2;
  unsigned int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wifiFingerprintConfidence");

  return v3;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v7;
  void *v8;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bestAvatarBrandIconURLForSize:allowSmaller:", v4, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v7;
  void *v8;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bestNavbarBrandIconURLForSize:allowSmaller:", v4, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v7;
  void *v8;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (GEOPriceDescription)_priceDescription
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_priceDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPriceDescription *)v3;
}

- (GEOMapItemContainedPlace)_containedPlace
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containedPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemContainedPlace *)v3;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isInLinkedPlaceRelationship");

  return v3;
}

- (BOOL)_hasGroundViewLocationId
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasGroundViewLocationId");

  return v3;
}

- (unint64_t)_groundViewLocationId
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_groundViewLocationId");

  return v3;
}

- (void)iterateGroundViewsWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iterateGroundViewsWithBlock:", v4);

}

- (BOOL)hasVenueCapacity
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVenueCapacity");

  return v3;
}

- (int64_t)venueCapacity
{
  void *v2;
  void *v3;
  int64_t v4;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "venueCapacity");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (NSString)_walletCategoryIdentifier
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletCategoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_walletMapsCategoryIdentifier
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletMapsCategoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletCategoryLocalizedStringLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_walletCategoryLocalizedString
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletCategoryLocalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletCategoryStyling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStyleAttributes *)v3;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletPlaceLocalizedStringLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_walletPlaceLocalizedString
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletPlaceLocalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_walletPlaceStyling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStyleAttributes *)v3;
}

- (BOOL)_enableRAPLightweightFeedback
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_enableRAPLightweightFeedback");

  return v3;
}

- (NSArray)_alternateSearchableNames
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_alternateSearchableNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)_iso3166CountryCode
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_iso3166CountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_iso3166SubdivisionCode
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_iso3166SubdivisionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_bestAvailableCountryCode
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bestAvailableCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_showSuggestAnEditButton
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;

  -[GEOMapItemStorage placeData](self, "placeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentOfType:options:", 41, 0);
  v3 = (id *)objc_claimAutoreleasedReturnValue();

  -[GEOPDComponent values](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();

  if (!v5 || !*(_QWORD *)(v5 + 480))
    goto LABEL_8;
  -[GEOPDComponentValue rap]((id *)v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6 || (*(_BYTE *)(v6 + 20) & 1) == 0)
  {

LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  v7 = *(_DWORD *)(v6 + 16);

  if (v7 != 1)
    goto LABEL_8;
  v8 = 0;
LABEL_9:

  return v8;
}

- (int)_RAPFlowType
{
  void *v2;
  int v3;
  int v4;

  -[GEOMapItemStorage placeData](self, "placeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rapFlowType");
  if ((v3 - 1) >= 7)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (BOOL)_hasAppleRatings
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAppleRatings");

  return v3;
}

- (NSArray)_appleRatings
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appleRatings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOAppleRating)_overallAppleRating
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_overallAppleRating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOAppleRating *)v3;
}

- (BOOL)_hasPlaceQuestionnaire
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPlaceQuestionnaire");

  return v3;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeQuestionnaire");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPlaceQuestionnaire *)v3;
}

- (NSArray)_identifierHistory
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_identifierHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_canDownloadMorePhotos
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canDownloadMorePhotos");

  return v3;
}

- (unint64_t)_totalPhotoCount
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_totalPhotoCount");

  return v3;
}

- (NSArray)_captionedPhotoAlbums
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_captionedPhotoAlbums");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasCaptionedPhotoAlbum");

  return v3;
}

- (BOOL)_hasEnclosingPlace
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasEnclosingPlace");

  return v3;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enclosingPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEnclosingPlace *)v3;
}

- (BOOL)_hasAreaHighlightId
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasAreaHighlightId");

  return v3;
}

- (unint64_t)_areaHighlightId
{
  void *v2;
  unint64_t v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_areaHighlightId");

  return v3;
}

- (BOOL)_hasPlaceDescription
{
  void *v2;
  char v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasPlaceDescription");

  return v3;
}

- (NSString)_placeDescription
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enhancedPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)_labelGeometry
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_labelGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOLabelGeometry *)v3;
}

- (GEOViewportFrame)_viewportFrame
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_viewportFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOViewportFrame *)v3;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enrichmentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEnrichmentInfo *)v3;
}

- (GEOEnrichmentData)_enrichmentData
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enrichmentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOEnrichmentData *)v3;
}

- (GEOTrailHead)_trailHead
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_trailHead");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTrailHead *)v3;
}

- (GEOHikeSummary)_hikeSummary
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hikeSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOHikeSummary *)v3;
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hikeGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDHikeGeometry *)v3;
}

- (int)_hikeGeometryElevationModel
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hikeGeometryElevationModel");

  return v3;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hikeAssociatedInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOPDHikeAssociatedInfo *)v3;
}

- (NSArray)_externalActionLinks
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_externalActionLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (GEOTooltip)_tooltip
{
  void *v2;
  void *v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tooltip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTooltip *)v3;
}

- (float)_photosMemoryScore
{
  return -1.0;
}

- (int)_placeCategoryType
{
  void *v2;
  int v3;

  -[GEOMapItemStorage _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeCategoryType");

  return v3;
}

- (GEOMapItemStorage)initWithData:(id)a3
{
  GEOMapItemStorage *v3;
  GEOMapItemStorage *v4;
  GEOMapItemStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemStorage;
  v3 = -[GEOMapItemStorage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    -[GEOMapItemStorage initAdditionalFields](v3, "initAdditionalFields");
    v5 = v4;
  }

  return v4;
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readPlace_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlace
{
  -[GEOMapItemStorage _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPlace)place
{
  -[GEOMapItemStorage _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (BOOL)hasClientAttributes
{
  -[GEOMapItemStorage _readClientAttributes]((uint64_t)self);
  return self->_clientAttributes != 0;
}

- (void)_readPlaceResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readPlaceResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlaceResult
{
  -[GEOMapItemStorage _readPlaceResult]((uint64_t)self);
  return self->_placeResult != 0;
}

- (GEOPlaceResult)placeResult
{
  -[GEOMapItemStorage _readPlaceResult]((uint64_t)self);
  return self->_placeResult;
}

- (void)setPlaceResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_placeResult, a3);
}

- (void)_readOriginatingCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readOriginatingCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginatingCoordinate
{
  -[GEOMapItemStorage _readOriginatingCoordinate]((uint64_t)self);
  return self->_originatingCoordinate != 0;
}

- (GEOLatLng)originatingCoordinate
{
  -[GEOMapItemStorage _readOriginatingCoordinate]((uint64_t)self);
  return self->_originatingCoordinate;
}

- (void)setOriginatingCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_originatingCoordinate, a3);
}

- (BOOL)hasInternalDetourInfo
{
  -[GEOMapItemStorage _readInternalDetourInfo]((uint64_t)self);
  return self->_internalDetourInfo != 0;
}

- (void)_readMapsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(_QWORD *)(a1 + 32), (int *)&_readMapsURL_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMapsURL
{
  -[GEOMapItemStorage _readMapsURL]((uint64_t)self);
  return self->_mapsURL != 0;
}

- (NSString)mapsURL
{
  -[GEOMapItemStorage _readMapsURL]((uint64_t)self);
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_mapsURL, a3);
}

- (BOOL)hasUserValues
{
  -[GEOMapItemStorage _readUserValues]((uint64_t)self);
  return self->_userValues != 0;
}

- (void)setAdditionalPlaceDatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *additionalPlaceDatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  additionalPlaceDatas = self->_additionalPlaceDatas;
  self->_additionalPlaceDatas = v4;

}

- (void)clearAdditionalPlaceDatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_additionalPlaceDatas, "removeAllObjects");
}

- (void)addAdditionalPlaceDatas:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  -[GEOMapItemStorage _addNoFlagsAdditionalPlaceDatas:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdditionalPlaceDatas:(uint64_t)a1
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

- (unint64_t)additionalPlaceDatasCount
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  return -[NSMutableArray count](self->_additionalPlaceDatas, "count");
}

- (id)additionalPlaceDatasAtIndex:(unint64_t)a3
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_additionalPlaceDatas, "objectAtIndex:", a3);
}

+ (Class)additionalPlaceDatasType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemStorage;
  -[GEOMapItemStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemStorage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
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
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "placeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("placeData"));

  }
  objc_msgSend((id)a1, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("place"));

  }
  objc_msgSend((id)a1, "clientAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("clientAttributes"));

  }
  objc_msgSend((id)a1, "placeResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("placeResult"));

  }
  objc_msgSend((id)a1, "originatingCoordinate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("originatingCoordinate"));

  }
  objc_msgSend((id)a1, "internalDetourInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("internalDetourInfo"));

  }
  objc_msgSend((id)a1, "mapsURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("mapsURL"));

  objc_msgSend((id)a1, "userValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("userValues");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("user_values");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v29 = *(id *)(a1 + 48);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v31);
    }

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("additionalPlaceDatas"));
  }
  v36 = *(void **)(a1 + 40);
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
      v43[2] = __47__GEOMapItemStorage__dictionaryRepresentation___block_invoke;
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
  return -[GEOMapItemStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOMapItemStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemStorage)initWithDictionary:(id)a3
{
  return (GEOMapItemStorage *)-[GEOMapItemStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDPlace *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOPlace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOMapItemClientAttributes *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GEOPlaceResult *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  GEOLatLng *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  GEOPDResultDetourInfo *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  GEOMapItemStorageUserValues *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  GEOPDPlace *v44;
  uint64_t v45;
  void *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDPlace alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPDPlace initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPDPlace initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setPlaceData:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOPlace alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOPlace initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOPlace initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setPlace:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientAttributes"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOMapItemClientAttributes alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOMapItemClientAttributes initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOMapItemClientAttributes initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setClientAttributes:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeResult"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOPlaceResult alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOPlaceResult initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOPlaceResult initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setPlaceResult:", v20);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originatingCoordinate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEOLatLng initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEOLatLng initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setOriginatingCoordinate:", v24);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("internalDetourInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOPDResultDetourInfo alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOPDResultDetourInfo initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOPDResultDetourInfo initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setInternalDetourInfo:", v28);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapsURL"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(a1, "setMapsURL:", v31);

      }
      if (a3)
        v32 = CFSTR("userValues");
      else
        v32 = CFSTR("user_values");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEOMapItemStorageUserValues alloc];
        if ((a3 & 1) != 0)
          v35 = -[GEOMapItemStorageUserValues initWithJSON:](v34, "initWithJSON:", v33);
        else
          v35 = -[GEOMapItemStorageUserValues initWithDictionary:](v34, "initWithDictionary:", v33);
        v36 = (void *)v35;
        objc_msgSend(a1, "setUserValues:", v35);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalPlaceDatas"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v5;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v50 != v41)
                objc_enumerationMutation(v38);
              v43 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v44 = [GEOPDPlace alloc];
                if ((a3 & 1) != 0)
                  v45 = -[GEOPDPlace initWithJSON:](v44, "initWithJSON:", v43);
                else
                  v45 = -[GEOPDPlace initWithDictionary:](v44, "initWithDictionary:", v43);
                v46 = (void *)v45;
                objc_msgSend(a1, "addAdditionalPlaceDatas:", v45);

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          }
          while (v40);
        }

        v5 = v48;
      }

    }
  }

  return a1;
}

- (GEOMapItemStorage)initWithJSON:(id)a3
{
  return (GEOMapItemStorage *)-[GEOMapItemStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_949;
    else
      v8 = (int *)&readAll__nonRecursiveTag_950;
    GEOMapItemStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOMapItemStorageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemStorageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOMapItemStorageIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMapItemStorage readAll:](self, "readAll:", 0);
    if (self->_placeData)
      PBDataWriterWriteSubmessage();
    if (self->_place)
      PBDataWriterWriteSubmessage();
    if (self->_clientAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_placeResult)
      PBDataWriterWriteSubmessage();
    if (self->_originatingCoordinate)
      PBDataWriterWriteSubmessage();
    if (self->_internalDetourInfo)
      PBDataWriterWriteSubmessage();
    if (self->_mapsURL)
      PBDataWriterWriteStringField();
    if (self->_userValues)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_additionalPlaceDatas;
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
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOMapItemStorageClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_additionalPlaceDatas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOMapItemStorage _readClientAttributes]((uint64_t)self);
  if (-[GEOMapItemClientAttributes hasGreenTeaWithValue:](self->_clientAttributes, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapItemStorage _readOriginatingCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_originatingCoordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapItemStorage _readPlace]((uint64_t)self);
  if (-[GEOPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapItemStorage _readPlaceData]((uint64_t)self);
  if (-[GEOPDPlace hasGreenTeaWithValue:](self->_placeData, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapItemStorage _readPlaceResult]((uint64_t)self);
  return -[GEOPlaceResult hasGreenTeaWithValue:](self->_placeResult, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOMapItemStorage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 4, self->_reader);
  *((_DWORD *)v8 + 30) = self->_readerMarkPos;
  *((_DWORD *)v8 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeData)
    objc_msgSend(v8, "setPlaceData:");
  if (self->_place)
    objc_msgSend(v8, "setPlace:");
  if (self->_clientAttributes)
    objc_msgSend(v8, "setClientAttributes:");
  if (self->_placeResult)
    objc_msgSend(v8, "setPlaceResult:");
  if (self->_originatingCoordinate)
    objc_msgSend(v8, "setOriginatingCoordinate:");
  if (self->_internalDetourInfo)
    objc_msgSend(v8, "setInternalDetourInfo:");
  if (self->_mapsURL)
    objc_msgSend(v8, "setMapsURL:");
  if (self->_userValues)
    objc_msgSend(v8, "setUserValues:");
  if (-[GEOMapItemStorage additionalPlaceDatasCount](self, "additionalPlaceDatasCount"))
  {
    objc_msgSend(v8, "clearAdditionalPlaceDatas");
    v4 = -[GEOMapItemStorage additionalPlaceDatasCount](self, "additionalPlaceDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOMapItemStorage additionalPlaceDatasAtIndex:](self, "additionalPlaceDatasAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAdditionalPlaceDatas:", v7);

      }
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPlace *placeData;
  GEOPlace *place;
  GEOMapItemClientAttributes *clientAttributes;
  GEOPlaceResult *placeResult;
  GEOLatLng *originatingCoordinate;
  GEOPDResultDetourInfo *internalDetourInfo;
  NSString *mapsURL;
  GEOMapItemStorageUserValues *userValues;
  NSMutableArray *additionalPlaceDatas;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOMapItemStorage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  placeData = self->_placeData;
  if ((unint64_t)placeData | v4[11])
  {
    if (!-[GEOPDPlace isEqual:](placeData, "isEqual:"))
      goto LABEL_20;
  }
  if (((place = self->_place, !((unint64_t)place | v4[13])) || -[GEOPlace isEqual:](place, "isEqual:"))
    && ((clientAttributes = self->_clientAttributes, !((unint64_t)clientAttributes | v4[7]))
     || -[GEOMapItemClientAttributes isEqual:](clientAttributes, "isEqual:"))
    && ((placeResult = self->_placeResult, !((unint64_t)placeResult | v4[12]))
     || -[GEOPlaceResult isEqual:](placeResult, "isEqual:"))
    && ((originatingCoordinate = self->_originatingCoordinate, !((unint64_t)originatingCoordinate | v4[10]))
     || -[GEOLatLng isEqual:](originatingCoordinate, "isEqual:"))
    && ((internalDetourInfo = self->_internalDetourInfo, !((unint64_t)internalDetourInfo | v4[8]))
     || -[GEOPDResultDetourInfo isEqual:](internalDetourInfo, "isEqual:"))
    && ((mapsURL = self->_mapsURL, !((unint64_t)mapsURL | v4[9]))
     || -[NSString isEqual:](mapsURL, "isEqual:"))
    && ((userValues = self->_userValues, !((unint64_t)userValues | v4[14]))
     || -[GEOMapItemStorageUserValues isEqual:](userValues, "isEqual:")))
  {
    additionalPlaceDatas = self->_additionalPlaceDatas;
    if ((unint64_t)additionalPlaceDatas | v4[6])
      v14 = -[NSMutableArray isEqual:](additionalPlaceDatas, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;

  -[GEOMapItemStorage readAll:](self, "readAll:", 1);
  v3 = -[GEOPDPlace hash](self->_placeData, "hash");
  v4 = -[GEOPlace hash](self->_place, "hash") ^ v3;
  v5 = -[GEOMapItemClientAttributes hash](self->_clientAttributes, "hash");
  v6 = v4 ^ v5 ^ -[GEOPlaceResult hash](self->_placeResult, "hash");
  v7 = -[GEOLatLng hash](self->_originatingCoordinate, "hash");
  v8 = v7 ^ -[GEOPDResultDetourInfo hash](self->_internalDetourInfo, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_mapsURL, "hash");
  v10 = -[GEOMapItemStorageUserValues hash](self->_userValues, "hash");
  return v9 ^ v10 ^ -[NSMutableArray hash](self->_additionalPlaceDatas, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOPDPlace *placeData;
  id v6;
  GEOPlace *place;
  id v8;
  GEOMapItemClientAttributes *clientAttributes;
  id v10;
  GEOPlaceResult *placeResult;
  id v12;
  GEOLatLng *originatingCoordinate;
  id v14;
  GEOPDResultDetourInfo *internalDetourInfo;
  id v16;
  GEOMapItemStorageUserValues *userValues;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  placeData = self->_placeData;
  v6 = v4[11];
  if (placeData)
  {
    if (v6)
      -[GEOPDPlace mergeFrom:](placeData, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOMapItemStorage setPlaceData:](self, "setPlaceData:");
  }
  place = self->_place;
  v8 = v4[13];
  if (place)
  {
    if (v8)
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOMapItemStorage setPlace:](self, "setPlace:");
  }
  clientAttributes = self->_clientAttributes;
  v10 = v4[7];
  if (clientAttributes)
  {
    if (v10)
      -[GEOMapItemClientAttributes mergeFrom:](clientAttributes, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEOMapItemStorage setClientAttributes:](self, "setClientAttributes:");
  }
  placeResult = self->_placeResult;
  v12 = v4[12];
  if (placeResult)
  {
    if (v12)
      -[GEOPlaceResult mergeFrom:](placeResult, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOMapItemStorage setPlaceResult:](self, "setPlaceResult:");
  }
  originatingCoordinate = self->_originatingCoordinate;
  v14 = v4[10];
  if (originatingCoordinate)
  {
    if (v14)
      -[GEOLatLng mergeFrom:](originatingCoordinate, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOMapItemStorage setOriginatingCoordinate:](self, "setOriginatingCoordinate:");
  }
  internalDetourInfo = self->_internalDetourInfo;
  v16 = v4[8];
  if (internalDetourInfo)
  {
    if (v16)
      -[GEOPDResultDetourInfo mergeFrom:](internalDetourInfo, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOMapItemStorage setInternalDetourInfo:](self, "setInternalDetourInfo:");
  }
  if (v4[9])
    -[GEOMapItemStorage setMapsURL:](self, "setMapsURL:");
  userValues = self->_userValues;
  v18 = v4[14];
  if (userValues)
  {
    if (v18)
      -[GEOMapItemStorageUserValues mergeFrom:](userValues, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEOMapItemStorage setUserValues:](self, "setUserValues:");
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v4[6];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[GEOMapItemStorage addAdditionalPlaceDatas:](self, "addAdditionalPlaceDatas:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_953);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMapItemStorage readAll:](self, "readAll:", 0);
    -[GEOPDPlace clearUnknownFields:](self->_placeData, "clearUnknownFields:", 1);
    -[GEOPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEOMapItemClientAttributes clearUnknownFields:](self->_clientAttributes, "clearUnknownFields:", 1);
    -[GEOPlaceResult clearUnknownFields:](self->_placeResult, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_originatingCoordinate, "clearUnknownFields:", 1);
    -[GEOPDResultDetourInfo clearUnknownFields:](self->_internalDetourInfo, "clearUnknownFields:", 1);
    -[GEOMapItemStorageUserValues clearUnknownFields:](self->_userValues, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_additionalPlaceDatas;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

@end
