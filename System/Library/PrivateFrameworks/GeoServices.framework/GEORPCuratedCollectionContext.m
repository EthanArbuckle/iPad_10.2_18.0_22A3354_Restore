@implementation GEORPCuratedCollectionContext

- (GEORPCuratedCollectionContext)init
{
  GEORPCuratedCollectionContext *v2;
  GEORPCuratedCollectionContext *v3;
  GEORPCuratedCollectionContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCuratedCollectionContext;
  v2 = -[GEORPCuratedCollectionContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCuratedCollectionContext)initWithData:(id)a3
{
  GEORPCuratedCollectionContext *v3;
  GEORPCuratedCollectionContext *v4;
  GEORPCuratedCollectionContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCuratedCollectionContext;
  v3 = -[GEORPCuratedCollectionContext initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEORPCuratedCollectionContext;
  -[GEORPCuratedCollectionContext dealloc](&v3, sel_dealloc);
}

- (unint64_t)curatedCollectionMuid
{
  return self->_curatedCollectionMuid;
}

- (void)setCuratedCollectionMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_curatedCollectionMuid = a3;
}

- (void)setHasCuratedCollectionMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCuratedCollectionMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readPlaceEntityMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceEntityMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)placeEntityMuidsCount
{
  -[GEORPCuratedCollectionContext _readPlaceEntityMuids]((uint64_t)self);
  return self->_placeEntityMuids.count;
}

- (unint64_t)placeEntityMuids
{
  -[GEORPCuratedCollectionContext _readPlaceEntityMuids]((uint64_t)self);
  return self->_placeEntityMuids.list;
}

- (void)clearPlaceEntityMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedUInt64Clear();
}

- (void)addPlaceEntityMuid:(unint64_t)a3
{
  -[GEORPCuratedCollectionContext _readPlaceEntityMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (unint64_t)placeEntityMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_placeEntityMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPCuratedCollectionContext _readPlaceEntityMuids]((uint64_t)self);
  p_placeEntityMuids = &self->_placeEntityMuids;
  count = self->_placeEntityMuids.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_placeEntityMuids->list[a3];
}

- (void)setPlaceEntityMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedUInt64Set();
}

- (void)_readOriginalName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalName
{
  -[GEORPCuratedCollectionContext _readOriginalName]((uint64_t)self);
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPCuratedCollectionContext _readOriginalName]((uint64_t)self);
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readOriginalUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalUrl
{
  -[GEORPCuratedCollectionContext _readOriginalUrl]((uint64_t)self);
  return self->_originalUrl != 0;
}

- (NSString)originalUrl
{
  -[GEORPCuratedCollectionContext _readOriginalUrl]((uint64_t)self);
  return self->_originalUrl;
}

- (void)setOriginalUrl:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_originalUrl, a3);
}

- (void)_readOriginalDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalDescription
{
  -[GEORPCuratedCollectionContext _readOriginalDescription]((uint64_t)self);
  return self->_originalDescription != 0;
}

- (NSString)originalDescription
{
  -[GEORPCuratedCollectionContext _readOriginalDescription]((uint64_t)self);
  return self->_originalDescription;
}

- (void)setOriginalDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_originalDescription, a3);
}

- (void)_readImageInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCuratedCollectionContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)imageInfos
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  return self->_imageInfos;
}

- (void)setImageInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *imageInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  imageInfos = self->_imageInfos;
  self->_imageInfos = v4;

}

- (void)clearImageInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_imageInfos, "removeAllObjects");
}

- (void)addImageInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  -[GEORPCuratedCollectionContext _addNoFlagsImageInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageInfo:(uint64_t)a1
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

- (unint64_t)imageInfosCount
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_imageInfos, "count");
}

- (id)imageInfoAtIndex:(unint64_t)a3
{
  -[GEORPCuratedCollectionContext _readImageInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_imageInfos, "objectAtIndex:", a3);
}

+ (Class)imageInfoType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORPCuratedCollectionContext;
  -[GEORPCuratedCollectionContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCuratedCollectionContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCuratedCollectionContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 100) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("curatedCollectionMuid");
    else
      v6 = CFSTR("curated_collection_muid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("placeEntityMuid");
    else
      v8 = CFSTR("place_entity_muid");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "originalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("originalName");
    else
      v10 = CFSTR("original_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "originalUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("originalUrl");
    else
      v12 = CFSTR("original_url");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend((id)a1, "originalDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("originalDescription");
    else
      v14 = CFSTR("original_description");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = *(id *)(a1 + 56);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("imageInfo");
    else
      v23 = CFSTR("image_info");
    objc_msgSend(v4, "setObject:forKey:", v15, v23);

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __59__GEORPCuratedCollectionContext__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCuratedCollectionContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEORPCuratedCollectionContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPCuratedCollectionContext)initWithDictionary:(id)a3
{
  return (GEORPCuratedCollectionContext *)-[GEORPCuratedCollectionContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  GEORPFeedbackClientImageInfo *v33;
  uint64_t v34;
  void *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("curatedCollectionMuid");
      else
        v6 = CFSTR("curated_collection_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCuratedCollectionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("placeEntityMuid");
      else
        v8 = CFSTR("place_entity_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v43 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPlaceEntityMuid:", objc_msgSend(v15, "unsignedLongLongValue"));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v12);
        }

      }
      if (a3)
        v16 = CFSTR("originalName");
      else
        v16 = CFSTR("original_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setOriginalName:", v18);

      }
      if (a3)
        v19 = CFSTR("originalUrl");
      else
        v19 = CFSTR("original_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setOriginalUrl:", v21);

      }
      if (a3)
        v22 = CFSTR("originalDescription");
      else
        v22 = CFSTR("original_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(a1, "setOriginalDescription:", v24);

      }
      if (a3)
        v25 = CFSTR("imageInfo");
      else
        v25 = CFSTR("image_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = v5;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEORPFeedbackClientImageInfo alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEORPFeedbackClientImageInfo initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEORPFeedbackClientImageInfo initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addImageInfo:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v29);
        }

        v5 = v37;
      }

    }
  }

  return a1;
}

- (GEORPCuratedCollectionContext)initWithJSON:(id)a3
{
  return (GEORPCuratedCollectionContext *)-[GEORPCuratedCollectionContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_432;
    else
      v8 = (int *)&readAll__nonRecursiveTag_433;
    GEORPCuratedCollectionContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPCuratedCollectionContextCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCuratedCollectionContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCuratedCollectionContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 3u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_placeEntityMuids.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_placeEntityMuids.count);
    }
    if (self->_originalName)
      PBDataWriterWriteStringField();
    if (self->_originalUrl)
      PBDataWriterWriteStringField();
    if (self->_originalDescription)
      PBDataWriterWriteStringField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_imageInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id *v11;

  v11 = (id *)a3;
  -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 22) = self->_readerMarkPos;
  *((_DWORD *)v11 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v11[6] = (id)self->_curatedCollectionMuid;
    *((_BYTE *)v11 + 100) |= 1u;
  }
  if (-[GEORPCuratedCollectionContext placeEntityMuidsCount](self, "placeEntityMuidsCount"))
  {
    objc_msgSend(v11, "clearPlaceEntityMuids");
    v4 = -[GEORPCuratedCollectionContext placeEntityMuidsCount](self, "placeEntityMuidsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPlaceEntityMuid:", -[GEORPCuratedCollectionContext placeEntityMuidAtIndex:](self, "placeEntityMuidAtIndex:", i));
    }
  }
  if (self->_originalName)
    objc_msgSend(v11, "setOriginalName:");
  if (self->_originalUrl)
    objc_msgSend(v11, "setOriginalUrl:");
  if (self->_originalDescription)
    objc_msgSend(v11, "setOriginalDescription:");
  if (-[GEORPCuratedCollectionContext imageInfosCount](self, "imageInfosCount"))
  {
    objc_msgSend(v11, "clearImageInfos");
    v7 = -[GEORPCuratedCollectionContext imageInfosCount](self, "imageInfosCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEORPCuratedCollectionContext imageInfoAtIndex:](self, "imageInfoAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addImageInfo:", v10);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PBUnknownFields *v20;
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
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPCuratedCollectionContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_curatedCollectionMuid;
    *(_BYTE *)(v5 + 100) |= 1u;
  }
  PBRepeatedUInt64Copy();
  v9 = -[NSString copyWithZone:](self->_originalName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = -[NSString copyWithZone:](self->_originalUrl, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  v13 = -[NSString copyWithZone:](self->_originalDescription, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_imageInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addImageInfo:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originalName;
  NSString *originalUrl;
  NSString *originalDescription;
  NSMutableArray *imageInfos;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_curatedCollectionMuid != *((_QWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_16;
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](originalName, "isEqual:"))
      goto LABEL_16;
  }
  originalUrl = self->_originalUrl;
  if ((unint64_t)originalUrl | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalUrl, "isEqual:"))
      goto LABEL_16;
  }
  originalDescription = self->_originalDescription;
  if ((unint64_t)originalDescription | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](originalDescription, "isEqual:"))
      goto LABEL_16;
  }
  imageInfos = self->_imageInfos;
  if ((unint64_t)imageInfos | *((_QWORD *)v4 + 7))
    v9 = -[NSMutableArray isEqual:](imageInfos, "isEqual:");
  else
    v9 = 1;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_curatedCollectionMuid;
  else
    v3 = 0;
  v4 = PBRepeatedUInt64Hash() ^ v3;
  v5 = v4 ^ -[NSString hash](self->_originalName, "hash");
  v6 = -[NSString hash](self->_originalUrl, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_originalDescription, "hash");
  return v7 ^ -[NSMutableArray hash](self->_imageInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    self->_curatedCollectionMuid = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v5 = objc_msgSend(v4, "placeEntityMuidsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEORPCuratedCollectionContext addPlaceEntityMuid:](self, "addPlaceEntityMuid:", objc_msgSend(v4, "placeEntityMuidAtIndex:", i));
  }
  if (*((_QWORD *)v4 + 9))
    -[GEORPCuratedCollectionContext setOriginalName:](self, "setOriginalName:");
  if (*((_QWORD *)v4 + 10))
    -[GEORPCuratedCollectionContext setOriginalUrl:](self, "setOriginalUrl:");
  if (*((_QWORD *)v4 + 8))
    -[GEORPCuratedCollectionContext setOriginalDescription:](self, "setOriginalDescription:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEORPCuratedCollectionContext addImageInfo:](self, "addImageInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPCuratedCollectionContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_436);
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
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPCuratedCollectionContext readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_imageInfos;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalUrl, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_originalDescription, 0);
  objc_storeStrong((id *)&self->_imageInfos, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
