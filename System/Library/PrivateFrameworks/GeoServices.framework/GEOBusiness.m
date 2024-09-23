@implementation GEOBusiness

- (GEOBusiness)initWithPlaceDataEntity:(id)a3 rating:(id)a4 hours:(id)a5 reviews:(id)a6 photos:(id)a7 entityAttribution:(id)a8
{
  id v12;
  id v13;
  id v14;
  id *v15;
  GEOBusiness *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  GEOSource *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  GEOHours *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  GEOPhoto *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  GEOCategory *v43;
  GEOBusiness *v44;
  id v46;
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
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (id *)a8;
  v59.receiver = self;
  v59.super_class = (Class)GEOBusiness;
  v16 = -[GEOBusiness init](&v59, sel_init);
  if (v16)
  {
    if (objc_msgSend(v12, "hasTelephone"))
    {
      objc_msgSend(v12, "telephone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOBusiness setTelephone:](v16, "setTelephone:", v17);

    }
    if (objc_msgSend(v12, "hasUrl"))
    {
      objc_msgSend(v12, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOBusiness setURL:](v16, "setURL:", v18);

    }
    if (objc_msgSend(v12, "hasIsPermanentlyClosed"))
      -[GEOBusiness setIsClosed:](v16, "setIsClosed:", objc_msgSend(v12, "isPermanentlyClosed"));
    if (v15)
    {
      -[GEOPDAttribution _readExternalItemId]((uint64_t)v15);
      if (v15[6])
      {
        -[GEOPDAttribution _readVendorId]((uint64_t)v15);
        if (v15[7])
        {
          -[GEOPDAttribution vendorId](v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("."));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "count") == 2)
          {
            objc_msgSend(v20, "lastObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("yelp"));

            if (v22)
            {
              v23 = objc_alloc_init(GEOSource);
              -[GEOPDAttribution externalItemId](v15);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOSource setSourceId:](v23, "setSourceId:", v24);

              objc_msgSend(v20, "lastObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOSource setSourceName:](v23, "setSourceName:", v25);

              -[GEOBusiness addSource:](v16, "addSource:", v23);
            }
          }

        }
      }
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = v13;
    v26 = v13;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = -[GEOHours initWithPlaceDataHours:]([GEOHours alloc], "initWithPlaceDataHours:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v30));
          -[GEOBusiness addOpenHours:](v16, "addOpenHours:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      }
      while (v28);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v32 = v14;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v52;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(v32);
          v37 = -[GEOPhoto initWithPlaceDataPhoto:]([GEOPhoto alloc], "initWithPlaceDataPhoto:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v36));
          -[GEOBusiness addPhoto:](v16, "addPhoto:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v34);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v12, "localizedCategorys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v48;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v48 != v41)
            objc_enumerationMutation(v38);
          v43 = -[GEOCategory initWithPlaceDataCategory:]([GEOCategory alloc], "initWithPlaceDataCategory:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v42));
          -[GEOBusiness addLocalizedCategories:](v16, "addLocalizedCategories:", v43);

          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v40);
    }

    v44 = v16;
    v13 = v46;
  }

  return v16;
}

- (GEOBusiness)init
{
  GEOBusiness *v2;
  GEOBusiness *v3;
  GEOBusiness *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBusiness;
  v2 = -[GEOBusiness init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusiness)initWithData:(id)a3
{
  GEOBusiness *v3;
  GEOBusiness *v4;
  GEOBusiness *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBusiness;
  v3 = -[GEOBusiness initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)uID
{
  return self->_uID;
}

- (void)setUID:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_uID = a3;
}

- (void)setHasUID:(BOOL)a3
{
  self->_flags = ($23BF971E30E7E59058E9414629412EE4)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
}

- (BOOL)hasUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_14);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasName
{
  -[GEOBusiness _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOBusiness _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneticName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasPhoneticName
{
  -[GEOBusiness _readPhoneticName]((uint64_t)self);
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEOBusiness _readPhoneticName]((uint64_t)self);
  return self->_phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readTelephone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 178) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTelephone_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasTelephone
{
  -[GEOBusiness _readTelephone]((uint64_t)self);
  return self->_telephone != 0;
}

- (NSString)telephone
{
  -[GEOBusiness _readTelephone]((uint64_t)self);
  return self->_telephone;
}

- (void)setTelephone:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_telephone, a3);
}

- (void)_readURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 176) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasURL
{
  -[GEOBusiness _readURL]((uint64_t)self);
  return self->_uRL != 0;
}

- (NSString)uRL
{
  -[GEOBusiness _readURL]((uint64_t)self);
  return self->_uRL;
}

- (void)setURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)setIsClosed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_isClosed = a3;
}

- (void)setHasIsClosed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524290;
  else
    v3 = 0x80000;
  self->_flags = ($23BF971E30E7E59058E9414629412EE4)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasIsClosed
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readMapsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasMapsURL
{
  -[GEOBusiness _readMapsURL]((uint64_t)self);
  return self->_mapsURL != 0;
}

- (NSString)mapsURL
{
  -[GEOBusiness _readMapsURL]((uint64_t)self);
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80200u;
  objc_storeStrong((id *)&self->_mapsURL, a3);
}

- (void)_readRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRatings_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)ratings
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  return self->_ratings;
}

- (void)setRatings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ratings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  ratings = self->_ratings;
  self->_ratings = v4;

}

- (void)clearRatings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_ratings, "removeAllObjects");
}

- (void)addRating:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readRatings]((uint64_t)self);
  -[GEOBusiness _addNoFlagsRating:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsRating:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)ratingsCount
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  return -[NSMutableArray count](self->_ratings, "count");
}

- (id)ratingAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readRatings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_ratings, "objectAtIndex:", a3);
}

+ (Class)ratingType
{
  return (Class)objc_opt_class();
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 176) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)categorys
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  return self->_categorys;
}

- (void)setCategorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *categorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  categorys = self->_categorys;
  self->_categorys = v4;

}

- (void)clearCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_categorys, "removeAllObjects");
}

- (void)addCategory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readCategorys]((uint64_t)self);
  -[GEOBusiness _addNoFlagsCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsCategory:(uint64_t)a1
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

- (unint64_t)categorysCount
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  return -[NSMutableArray count](self->_categorys, "count");
}

- (id)categoryAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readCategorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_categorys, "objectAtIndex:", a3);
}

+ (Class)categoryType
{
  return (Class)objc_opt_class();
}

- (void)_readPhotos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)photos
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *photos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  photos = self->_photos;
  self->_photos = v4;

}

- (void)clearPhotos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_photos, "removeAllObjects");
}

- (void)addPhoto:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readPhotos]((uint64_t)self);
  -[GEOBusiness _addNoFlagsPhoto:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)photosCount
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  return -[NSMutableArray count](self->_photos, "count");
}

- (id)photoAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readPhotos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_photos, "objectAtIndex:", a3);
}

+ (Class)photoType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributeKeyValues
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 176) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeKeyValues_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)attributeKeyValues
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  return self->_attributeKeyValues;
}

- (void)setAttributeKeyValues:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributeKeyValues;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributeKeyValues = self->_attributeKeyValues;
  self->_attributeKeyValues = v4;

}

- (void)clearAttributeKeyValues
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_attributeKeyValues, "removeAllObjects");
}

- (void)addAttributeKeyValue:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  -[GEOBusiness _addNoFlagsAttributeKeyValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsAttributeKeyValue:(uint64_t)a1
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

- (unint64_t)attributeKeyValuesCount
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  return -[NSMutableArray count](self->_attributeKeyValues, "count");
}

- (id)attributeKeyValueAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readAttributeKeyValues]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributeKeyValues, "objectAtIndex:", a3);
}

+ (Class)attributeKeyValueType
{
  return (Class)objc_opt_class();
}

- (void)_readOpenHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)openHours
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  return self->_openHours;
}

- (void)setOpenHours:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *openHours;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  openHours = self->_openHours;
  self->_openHours = v4;

}

- (void)clearOpenHours
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_openHours, "removeAllObjects");
}

- (void)addOpenHours:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  -[GEOBusiness _addNoFlagsOpenHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsOpenHours:(uint64_t)a1
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

- (unint64_t)openHoursCount
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  return -[NSMutableArray count](self->_openHours, "count");
}

- (id)openHoursAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readOpenHours]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_openHours, "objectAtIndex:", a3);
}

+ (Class)openHoursType
{
  return (Class)objc_opt_class();
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 176) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_8);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasCenter
{
  -[GEOBusiness _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOBusiness _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80080u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readLocalizedCategories
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedCategories_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)localizedCategories
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  return self->_localizedCategories;
}

- (void)setLocalizedCategories:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedCategories;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  localizedCategories = self->_localizedCategories;
  self->_localizedCategories = v4;

}

- (void)clearLocalizedCategories
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_localizedCategories, "removeAllObjects");
}

- (void)addLocalizedCategories:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  -[GEOBusiness _addNoFlagsLocalizedCategories:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsLocalizedCategories:(uint64_t)a1
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

- (unint64_t)localizedCategoriesCount
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedCategories, "count");
}

- (id)localizedCategoriesAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readLocalizedCategories]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedCategories, "objectAtIndex:", a3);
}

+ (Class)localizedCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 176) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributions_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)attributions
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  return self->_attributions;
}

- (void)setAttributions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  attributions = self->_attributions;
  self->_attributions = v4;

}

- (void)clearAttributions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_attributions, "removeAllObjects");
}

- (void)addAttribution:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readAttributions]((uint64_t)self);
  -[GEOBusiness _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
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

- (unint64_t)attributionsCount
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  return -[NSMutableArray count](self->_attributions, "count");
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readAttributions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributions, "objectAtIndex:", a3);
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readSources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 178) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)sources
{
  -[GEOBusiness _readSources]((uint64_t)self);
  return self->_sources;
}

- (void)setSources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *sources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  sources = self->_sources;
  self->_sources = v4;

}

- (void)clearSources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_sources, "removeAllObjects");
}

- (void)addSource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readSources]((uint64_t)self);
  -[GEOBusiness _addNoFlagsSource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsSource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)sourcesCount
{
  -[GEOBusiness _readSources]((uint64_t)self);
  return -[NSMutableArray count](self->_sources, "count");
}

- (id)sourceAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readSources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_sources, "objectAtIndex:", a3);
}

+ (Class)sourceType
{
  return (Class)objc_opt_class();
}

- (void)_readStarRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 178) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStarRatings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)starRatings
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  return self->_starRatings;
}

- (void)setStarRatings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *starRatings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  starRatings = self->_starRatings;
  self->_starRatings = v4;

}

- (void)clearStarRatings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_starRatings, "removeAllObjects");
}

- (void)addStarRating:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  -[GEOBusiness _addNoFlagsStarRating:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsStarRating:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)starRatingsCount
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  return -[NSMutableArray count](self->_starRatings, "count");
}

- (id)starRatingAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readStarRatings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_starRatings, "objectAtIndex:", a3);
}

+ (Class)starRatingType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceDataAmendments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 177) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceDataAmendments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)placeDataAmendments
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  return self->_placeDataAmendments;
}

- (void)setPlaceDataAmendments:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *placeDataAmendments;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  placeDataAmendments = self->_placeDataAmendments;
  self->_placeDataAmendments = v4;

}

- (void)clearPlaceDataAmendments
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_placeDataAmendments, "removeAllObjects");
}

- (void)addPlaceDataAmendment:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  -[GEOBusiness _addNoFlagsPlaceDataAmendment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsPlaceDataAmendment:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)placeDataAmendmentsCount
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  return -[NSMutableArray count](self->_placeDataAmendments, "count");
}

- (id)placeDataAmendmentAtIndex:(unint64_t)a3
{
  -[GEOBusiness _readPlaceDataAmendments]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_placeDataAmendments, "objectAtIndex:", a3);
}

+ (Class)placeDataAmendmentType
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
  v8.super_class = (Class)GEOBusiness;
  -[GEOBusiness description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusiness dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusiness _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ii;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t jj;
  void *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t kk;
  void *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  _QWORD v93[4];
  id v94;
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
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 176) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("uID");
    else
      v6 = CFSTR("UID");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  objc_msgSend((id)a1, "phoneticName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("phoneticName"));

  objc_msgSend((id)a1, "telephone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("telephone"));

  objc_msgSend((id)a1, "uRL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("uRL");
    else
      v11 = CFSTR("URL");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 176) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 172));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("isClosed"));

  }
  objc_msgSend((id)a1, "mapsURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("mapsURL"));

  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v15 = *(id *)(a1 + 128);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v124;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v124 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("rating"));
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "categorys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("category"));

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v24 = *(id *)(a1 + 112);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v119, v133, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v120 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v119, v133, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("photo"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v32 = *(id *)(a1 + 40);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v116;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v116 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
      }
      while (v34);
    }

    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("attributeKeyValue"));
  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v40 = *(id *)(a1 + 96);
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v131, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v112;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v112 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v45, "jsonRepresentation");
          else
            objc_msgSend(v45, "dictionaryRepresentation");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v46);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v111, v131, 16);
      }
      while (v42);
    }

    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("openHours"));
  }
  objc_msgSend((id)a1, "center");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v47, "jsonRepresentation");
    else
      objc_msgSend(v47, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("center"));

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v51 = *(id *)(a1 + 72);
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v108;
      do
      {
        for (n = 0; n != v53; ++n)
        {
          if (*(_QWORD *)v108 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v56, "jsonRepresentation");
          else
            objc_msgSend(v56, "dictionaryRepresentation");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v57);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("localizedCategories"));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v59 = *(id *)(a1 + 48);
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v104;
      do
      {
        for (ii = 0; ii != v61; ++ii)
        {
          if (*(_QWORD *)v104 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v64, "jsonRepresentation");
          else
            objc_msgSend(v64, "dictionaryRepresentation");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v65);

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
      }
      while (v61);
    }

    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("attribution"));
  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v67 = *(id *)(a1 + 136);
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v100;
      do
      {
        for (jj = 0; jj != v69; ++jj)
        {
          if (*(_QWORD *)v100 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v72, "jsonRepresentation");
          else
            objc_msgSend(v72, "dictionaryRepresentation");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v73);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
      }
      while (v69);
    }

    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("source"));
  }
  if (*(_QWORD *)(a1 + 144))
  {
    objc_msgSend((id)a1, "starRatings");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v75 = CFSTR("starRating");
    else
      v75 = CFSTR("star_rating");
    objc_msgSend(v4, "setObject:forKey:", v74, v75);

  }
  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v77 = *(id *)(a1 + 120);
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v95, v127, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v96;
      do
      {
        for (kk = 0; kk != v79; ++kk)
        {
          if (*(_QWORD *)v96 != v80)
            objc_enumerationMutation(v77);
          v82 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v82, "jsonRepresentation");
          else
            objc_msgSend(v82, "dictionaryRepresentation");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "addObject:", v83);

        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v95, v127, 16);
      }
      while (v79);
    }

    if (a2)
      v84 = CFSTR("placeDataAmendment");
    else
      v84 = CFSTR("place_data_amendment");
    objc_msgSend(v4, "setObject:forKey:", v76, v84);

  }
  v85 = *(void **)(a1 + 16);
  if (v85)
  {
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v86, "count"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __41__GEOBusiness__dictionaryRepresentation___block_invoke;
      v93[3] = &unk_1E1C00600;
      v89 = v88;
      v94 = v89;
      objc_msgSend(v87, "enumerateKeysAndObjectsUsingBlock:", v93);
      v90 = v89;

      v87 = v90;
    }
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("Unknown Fields"));

  }
  v91 = v4;

  return v91;
}

- (id)jsonRepresentation
{
  return -[GEOBusiness _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOBusiness__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOBusiness)initWithDictionary:(id)a3
{
  return (GEOBusiness *)-[GEOBusiness _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  char *v20;
  char *v21;
  void *v22;
  GEORating *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  GEOReview *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  GEOUser *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  GEOPhoto *v57;
  GEOPhoto *v58;
  GEOPhoto *v59;
  GEOPhoto *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  char v69;
  uint64_t v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  uint64_t v89;
  GEOPhoto *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  GEOAttributeKeyValue *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  GEOHours *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t k;
  void *v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  GEOTimeRange *v120;
  id v121;
  uint64_t v122;
  void *v123;
  int v124;
  void *v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  GEOLatLng *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t m;
  uint64_t v138;
  GEOCategory *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t n;
  uint64_t v147;
  GEOSearchAttribution *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t ii;
  uint64_t v156;
  GEOSource *v157;
  uint64_t v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t jj;
  void *v166;
  void *v167;
  const __CFString *v168;
  void *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t kk;
  uint64_t v174;
  GEOPlaceDataAmendment *v175;
  uint64_t v176;
  void *v177;
  void *v179;
  id v180;
  const __CFString *v181;
  id obj;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  char *v187;
  id v188;
  id v189;
  uint64_t v190;
  void *v191;
  const __CFString *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  id v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _BYTE v264[128];
  uint64_t v265;

  v265 = *MEMORY[0x1E0C80C00];
  v180 = a2;
  if (a1)
  {
    a1 = (id)objc_msgSend(a1, "init");

    v191 = a1;
    if (a1)
    {
      if (a3)
        v4 = CFSTR("uID");
      else
        v4 = CFSTR("UID");
      objc_msgSend(v180, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v191, "setUID:", objc_msgSend(v5, "unsignedLongLongValue"));

      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v191, "setName:", v7);

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("phoneticName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v191, "setPhoneticName:", v9);

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("telephone"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v191, "setTelephone:", v11);

      }
      if (a3)
        v12 = CFSTR("uRL");
      else
        v12 = CFSTR("URL");
      v181 = v12;
      objc_msgSend(v180, "objectForKeyedSubscript:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v191, "setURL:", v14);

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("isClosed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v191, "setIsClosed:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("mapsURL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v191, "setMapsURL:", v17);

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("rating"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = v179;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v240 = 0u;
        v241 = 0u;
        v238 = 0u;
        v239 = 0u;
        obj = v179;
        v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v259, 16);
        if (v184)
        {
          v19 = CFSTR("is_china_suppressed");
          v183 = *(_QWORD *)v239;
          if (a3)
            v19 = CFSTR("isChinaSuppressed");
          v193 = v19;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v239 != v183)
              {
                v21 = v20;
                objc_enumerationMutation(obj);
                v20 = v21;
              }
              v187 = v20;
              v22 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * (_QWORD)v20);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEORating alloc];
                if (v23)
                {
                  v189 = v22;
                  v195 = -[GEORating init](v23, "init");
                  if (v195)
                  {
                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("score"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v24, "doubleValue");
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 2u;
                      *(_QWORD *)(v195 + 64) = v25;
                    }

                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("maxScore"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v26, "doubleValue");
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 1u;
                      *(_QWORD *)(v195 + 32) = v27;
                    }

                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("numberOfRatings"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v29 = objc_msgSend(v28, "intValue");
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 4u;
                      *(_DWORD *)(v195 + 84) = v29;
                    }

                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("provider"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v31 = (void *)objc_msgSend(v30, "copy");
                      v32 = v31;
                      *(_WORD *)(v195 + 92) |= 0x40u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 40), v31);

                    }
                    objc_msgSend(v189, "objectForKeyedSubscript:", v181);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v34 = (void *)objc_msgSend(v33, "copy");
                      v35 = v34;
                      *(_WORD *)(v195 + 92) |= 0x20u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 24), v34);

                    }
                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("review"));
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v263 = 0u;
                      v262 = 0u;
                      v261 = 0u;
                      v260 = 0u;
                      v198 = v185;
                      v36 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v260, v264, 16);
                      if (v36)
                      {
                        v200 = *(_QWORD *)v261;
                        do
                        {
                          v37 = 0;
                          do
                          {
                            if (*(_QWORD *)v261 != v200)
                              objc_enumerationMutation(v198);
                            v38 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * v37);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v39 = [GEOReview alloc];
                              if (v39)
                              {
                                v40 = v38;
                                v41 = -[GEOReview init](v39, "init");
                                if (v41)
                                {
                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("snippet"));
                                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v43 = (void *)objc_msgSend(v42, "copy");
                                    v44 = v43;
                                    *(_WORD *)(v41 + 88) |= 0x40u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 56), v43);

                                  }
                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("score"));
                                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    objc_msgSend(v45, "doubleValue");
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 2u;
                                    *(_QWORD *)(v41 + 48) = v46;
                                  }

                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("reviewTime"));
                                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    objc_msgSend(v47, "doubleValue");
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 1u;
                                    *(_QWORD *)(v41 + 32) = v48;
                                  }

                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("reviewer"));
                                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v50 = [GEOUser alloc];
                                    if (v50)
                                    {
                                      v51 = v49;
                                      v52 = -[GEOUser init](v50, "init");
                                      if (v52)
                                      {
                                        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("name"));
                                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v54 = (void *)objc_msgSend(v53, "copy");
                                          v55 = v54;
                                          *(_BYTE *)(v52 + 52) |= 4u;
                                          *(_BYTE *)(v52 + 52) |= 8u;
                                          objc_storeStrong((id *)(v52 + 32), v54);

                                        }
                                        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("image"));
                                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v57 = [GEOPhoto alloc];
                                          if ((a3 & 1) != 0)
                                            v58 = -[GEOPhoto initWithJSON:](v57, "initWithJSON:", v56);
                                          else
                                            v58 = -[GEOPhoto initWithDictionary:](v57, "initWithDictionary:", v56);
                                          v59 = v58;
                                          v60 = v58;
                                          *(_BYTE *)(v52 + 52) |= 2u;
                                          *(_BYTE *)(v52 + 52) |= 8u;
                                          objc_storeStrong((id *)(v52 + 24), v59);

                                        }
                                      }

                                    }
                                    else
                                    {
                                      v52 = 0;
                                    }
                                    v61 = (id)v52;
                                    *(_WORD *)(v41 + 88) |= 0x20u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 40), (id)v52);

                                  }
                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("uid"));
                                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v63 = (void *)objc_msgSend(v62, "copy");
                                    v64 = v63;
                                    *(_WORD *)(v41 + 88) |= 0x80u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 64), v63);

                                  }
                                  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("languageCode"));
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v66 = (void *)objc_msgSend(v65, "copy");
                                    v67 = v66;
                                    *(_WORD *)(v41 + 88) |= 0x10u;
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    objc_storeStrong((id *)(v41 + 24), v66);

                                  }
                                  objc_msgSend(v40, "objectForKeyedSubscript:", v193);
                                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v69 = objc_msgSend(v68, "BOOLValue");
                                    *(_WORD *)(v41 + 88) |= 0x100u;
                                    *(_WORD *)(v41 + 88) |= 4u;
                                    *(_BYTE *)(v41 + 84) = v69;
                                  }

                                }
                              }
                              else
                              {
                                v41 = 0;
                              }
                              -[GEORating addReview:](v195, (void *)v41);

                            }
                            ++v37;
                          }
                          while (v36 != v37);
                          v70 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v260, v264, 16);
                          v36 = v70;
                        }
                        while (v70);
                      }

                    }
                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("numberOfReviews"));
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v72 = objc_msgSend(v71, "intValue");
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      *(_WORD *)(v195 + 92) |= 8u;
                      *(_DWORD *)(v195 + 88) = v72;
                    }

                    objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("ratingCategoryId"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v74 = (void *)objc_msgSend(v73, "copy");
                      v75 = v74;
                      *(_WORD *)(v195 + 92) |= 0x80u;
                      *(_WORD *)(v195 + 92) |= 0x200u;
                      objc_storeStrong((id *)(v195 + 48), v74);

                    }
                  }

                  objc_msgSend(v191, "addRating:", v195);
                }
                else
                {
                  v195 = 0;
                  objc_msgSend(v191, "addRating:", 0);
                }

              }
              v20 = v187 + 1;
            }
            while (v187 + 1 != (char *)v184);
            v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v238, v259, 16);
            v184 = v76;
          }
          while (v76);
        }

        v18 = v179;
      }

      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("category"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v236 = 0u;
        v237 = 0u;
        v234 = 0u;
        v235 = 0u;
        v78 = v77;
        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v234, v258, 16);
        if (v79)
        {
          v80 = *(_QWORD *)v235;
          do
          {
            for (i = 0; i != v79; ++i)
            {
              if (*(_QWORD *)v235 != v80)
                objc_enumerationMutation(v78);
              v82 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = (void *)objc_msgSend(v82, "copy");
                objc_msgSend(v191, "addCategory:", v83);

              }
            }
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v234, v258, 16);
          }
          while (v79);
        }

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("photo"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v232 = 0u;
        v233 = 0u;
        v230 = 0u;
        v231 = 0u;
        v85 = v84;
        v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
        if (v86)
        {
          v87 = *(_QWORD *)v231;
          do
          {
            for (j = 0; j != v86; ++j)
            {
              if (*(_QWORD *)v231 != v87)
                objc_enumerationMutation(v85);
              v89 = *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v90 = [GEOPhoto alloc];
                if ((a3 & 1) != 0)
                  v91 = -[GEOPhoto initWithJSON:](v90, "initWithJSON:", v89);
                else
                  v91 = -[GEOPhoto initWithDictionary:](v90, "initWithDictionary:", v89);
                v92 = (void *)v91;
                objc_msgSend(v191, "addPhoto:", v91);

              }
            }
            v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
          }
          while (v86);
        }

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("attributeKeyValue"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v228 = 0u;
        v229 = 0u;
        v226 = 0u;
        v227 = 0u;
        v94 = v93;
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v226, v256, 16);
        if (v95)
        {
          v96 = *(_QWORD *)v227;
          do
          {
            v97 = 0;
            do
            {
              if (*(_QWORD *)v227 != v96)
                objc_enumerationMutation(v94);
              v98 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * v97);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v99 = [GEOAttributeKeyValue alloc];
                if (v99)
                  v100 = (void *)-[GEOAttributeKeyValue _initWithDictionary:isJSON:]((uint64_t)v99, v98);
                else
                  v100 = 0;
                objc_msgSend(v191, "addAttributeKeyValue:", v100);

              }
              ++v97;
            }
            while (v95 != v97);
            v101 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v226, v256, 16);
            v95 = v101;
          }
          while (v101);
        }

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("openHours"));
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v188 = v186;
        v194 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v222, v255, 16);
        if (!v194)
          goto LABEL_202;
        v190 = *(_QWORD *)v223;
        while (1)
        {
          v102 = 0;
          do
          {
            if (*(_QWORD *)v223 != v190)
            {
              v103 = v102;
              objc_enumerationMutation(v188);
              v102 = v103;
            }
            v201 = v102;
            v104 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * v102);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_198;
            v105 = [GEOHours alloc];
            if (!v105)
            {
              v106 = 0;
              goto LABEL_197;
            }
            v199 = v104;
            v106 = -[GEOHours init](v105, "init");
            if (!v106)
              goto LABEL_196;
            objc_msgSend(v199, "objectForKeyedSubscript:", CFSTR("day"));
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_174;
            v248 = 0u;
            v249 = 0u;
            v246 = 0u;
            v247 = 0u;
            v107 = v196;
            v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v246, v264, 16);
            if (!v108)
              goto LABEL_173;
            v109 = *(_QWORD *)v247;
            do
            {
              for (k = 0; k != v108; ++k)
              {
                if (*(_QWORD *)v247 != v109)
                  objc_enumerationMutation(v107);
                v111 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v112 = v111;
                  if ((objc_msgSend(v112, "isEqualToString:", CFSTR("SUNDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("MONDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("TUESDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("THURSDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("FRIDAY")) & 1) == 0
                    && (objc_msgSend(v112, "isEqualToString:", CFSTR("SATURDAY")) & 1) == 0)
                  {
                    objc_msgSend(v112, "isEqualToString:", CFSTR("EVERYDAY"));
                  }

                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                  objc_msgSend(v111, "intValue");
                }
                os_unfair_lock_lock((os_unfair_lock_t)(v106 + 64));
                if ((*(_BYTE *)(v106 + 68) & 2) == 0)
                {
                  v113 = *(void **)(v106 + 8);
                  if (v113)
                  {
                    v114 = v113;
                    objc_sync_enter(v114);
                    GEOHoursReadSpecified(v106, *(_QWORD *)(v106 + 8), (int *)&_readDays_tags_1);
                    objc_sync_exit(v114);

                  }
                }
                os_unfair_lock_unlock((os_unfair_lock_t)(v106 + 64));
                PBRepeatedInt32Add();
                os_unfair_lock_lock_with_options();
                *(_BYTE *)(v106 + 68) |= 2u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v106 + 64));
                *(_BYTE *)(v106 + 68) |= 8u;
              }
              v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v246, v264, 16);
            }
            while (v108);
LABEL_173:

LABEL_174:
            objc_msgSend(v199, "objectForKeyedSubscript:", CFSTR("timeRange"));
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v244 = 0u;
              v245 = 0u;
              v242 = 0u;
              v243 = 0u;
              v115 = v197;
              v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v242, &v260, 16);
              if (v116)
              {
                v117 = *(_QWORD *)v243;
                do
                {
                  v118 = 0;
                  do
                  {
                    if (*(_QWORD *)v243 != v117)
                      objc_enumerationMutation(v115);
                    v119 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v118);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v120 = [GEOTimeRange alloc];
                      if (v120)
                      {
                        v121 = v119;
                        v122 = -[GEOTimeRange init](v120, "init");
                        if (v122)
                        {
                          objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("from"));
                          v123 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v124 = objc_msgSend(v123, "unsignedIntValue");
                            *(_BYTE *)(v122 + 24) |= 1u;
                            *(_DWORD *)(v122 + 16) = v124;
                          }

                          objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("to"));
                          v125 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v126 = objc_msgSend(v125, "unsignedIntValue");
                            *(_BYTE *)(v122 + 24) |= 2u;
                            *(_DWORD *)(v122 + 20) = v126;
                          }

                        }
                      }
                      else
                      {
                        v122 = 0;
                      }
                      -[GEOHours addTimeRange:](v106, (void *)v122);

                    }
                    ++v118;
                  }
                  while (v116 != v118);
                  v127 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v242, &v260, 16);
                  v116 = v127;
                }
                while (v127);
              }

            }
LABEL_196:

LABEL_197:
            objc_msgSend(v191, "addOpenHours:", v106);

LABEL_198:
            v102 = v201 + 1;
          }
          while (v201 + 1 != v194);
          v128 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v222, v255, 16);
          v194 = v128;
          if (!v128)
          {
LABEL_202:

            break;
          }
        }
      }

      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("center"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v130 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v131 = -[GEOLatLng initWithJSON:](v130, "initWithJSON:", v129);
        else
          v131 = -[GEOLatLng initWithDictionary:](v130, "initWithDictionary:", v129);
        v132 = (void *)v131;
        objc_msgSend(v191, "setCenter:", v131);

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("localizedCategories"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v220 = 0u;
        v221 = 0u;
        v218 = 0u;
        v219 = 0u;
        v134 = v133;
        v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v218, v254, 16);
        if (v135)
        {
          v136 = *(_QWORD *)v219;
          do
          {
            for (m = 0; m != v135; ++m)
            {
              if (*(_QWORD *)v219 != v136)
                objc_enumerationMutation(v134);
              v138 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v139 = [GEOCategory alloc];
                if ((a3 & 1) != 0)
                  v140 = -[GEOCategory initWithJSON:](v139, "initWithJSON:", v138);
                else
                  v140 = -[GEOCategory initWithDictionary:](v139, "initWithDictionary:", v138);
                v141 = (void *)v140;
                objc_msgSend(v191, "addLocalizedCategories:", v140);

              }
            }
            v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v218, v254, 16);
          }
          while (v135);
        }

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("attribution"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v216 = 0u;
        v217 = 0u;
        v214 = 0u;
        v215 = 0u;
        v143 = v142;
        v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v214, v253, 16);
        if (v144)
        {
          v145 = *(_QWORD *)v215;
          do
          {
            for (n = 0; n != v144; ++n)
            {
              if (*(_QWORD *)v215 != v145)
                objc_enumerationMutation(v143);
              v147 = *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v148 = [GEOSearchAttribution alloc];
                if ((a3 & 1) != 0)
                  v149 = -[GEOSearchAttribution initWithJSON:](v148, "initWithJSON:", v147);
                else
                  v149 = -[GEOSearchAttribution initWithDictionary:](v148, "initWithDictionary:", v147);
                v150 = (void *)v149;
                objc_msgSend(v191, "addAttribution:", v149);

              }
            }
            v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v214, v253, 16);
          }
          while (v144);
        }

      }
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("source"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v212 = 0u;
        v213 = 0u;
        v210 = 0u;
        v211 = 0u;
        v152 = v151;
        v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v210, v252, 16);
        if (v153)
        {
          v154 = *(_QWORD *)v211;
          do
          {
            for (ii = 0; ii != v153; ++ii)
            {
              if (*(_QWORD *)v211 != v154)
                objc_enumerationMutation(v152);
              v156 = *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * ii);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v157 = [GEOSource alloc];
                if ((a3 & 1) != 0)
                  v158 = -[GEOSource initWithJSON:](v157, "initWithJSON:", v156);
                else
                  v158 = -[GEOSource initWithDictionary:](v157, "initWithDictionary:", v156);
                v159 = (void *)v158;
                objc_msgSend(v191, "addSource:", v158);

              }
            }
            v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v210, v252, 16);
          }
          while (v153);
        }

      }
      if (a3)
        v160 = CFSTR("starRating");
      else
        v160 = CFSTR("star_rating");
      objc_msgSend(v180, "objectForKeyedSubscript:", v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v208 = 0u;
        v209 = 0u;
        v206 = 0u;
        v207 = 0u;
        v162 = v161;
        v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v206, v251, 16);
        if (v163)
        {
          v164 = *(_QWORD *)v207;
          do
          {
            for (jj = 0; jj != v163; ++jj)
            {
              if (*(_QWORD *)v207 != v164)
                objc_enumerationMutation(v162);
              v166 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * jj);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v167 = (void *)objc_msgSend(v166, "copy");
                objc_msgSend(v191, "addStarRating:", v167);

              }
            }
            v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v206, v251, 16);
          }
          while (v163);
        }

      }
      if (a3)
        v168 = CFSTR("placeDataAmendment");
      else
        v168 = CFSTR("place_data_amendment");
      objc_msgSend(v180, "objectForKeyedSubscript:", v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v204 = 0u;
        v205 = 0u;
        v202 = 0u;
        v203 = 0u;
        v170 = v169;
        v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v202, v250, 16);
        if (v171)
        {
          v172 = *(_QWORD *)v203;
          do
          {
            for (kk = 0; kk != v171; ++kk)
            {
              if (*(_QWORD *)v203 != v172)
                objc_enumerationMutation(v170);
              v174 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * kk);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v175 = [GEOPlaceDataAmendment alloc];
                if ((a3 & 1) != 0)
                  v176 = -[GEOPlaceDataAmendment initWithJSON:](v175, "initWithJSON:", v174);
                else
                  v176 = -[GEOPlaceDataAmendment initWithDictionary:](v175, "initWithDictionary:", v174);
                v177 = (void *)v176;
                objc_msgSend(v191, "addPlaceDataAmendment:", v176);

              }
            }
            v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v202, v250, 16);
          }
          while (v171);
        }

      }
      a1 = v191;

    }
  }

  return a1;
}

- (GEOBusiness)initWithJSON:(id)a3
{
  return (GEOBusiness *)-[GEOBusiness _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_201;
    else
      v8 = (int *)&readAll__nonRecursiveTag_202;
    GEOBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOBusinessCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBusinessIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t jj;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t kk;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t mm;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t nn;
  PBDataReader *v46;
  void *v47;
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
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOBusinessIsDirty((uint64_t)self) & 1) == 0)
  {
    v46 = self->_reader;
    objc_sync_enter(v46);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v47);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v46);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusiness readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_phoneticName)
      PBDataWriterWriteStringField();
    if (self->_telephone)
      PBDataWriterWriteStringField();
    if (self->_uRL)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_mapsURL)
      PBDataWriterWriteStringField();
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v6 = self->_ratings;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v85 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      }
      while (v7);
    }

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v10 = self->_categorys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v81 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
      }
      while (v11);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v14 = self->_photos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v77 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
      }
      while (v15);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v18 = self->_attributeKeyValues;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v73;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v73 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
      }
      while (v19);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v22 = self->_openHours;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v69;
      do
      {
        for (n = 0; n != v23; ++n)
        {
          if (*(_QWORD *)v69 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
      }
      while (v23);
    }

    if (self->_center)
      PBDataWriterWriteSubmessage();
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v26 = self->_localizedCategories;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v65;
      do
      {
        for (ii = 0; ii != v27; ++ii)
        {
          if (*(_QWORD *)v65 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteSubmessage();
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
      }
      while (v27);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v30 = self->_attributions;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v60, v91, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v61;
      do
      {
        for (jj = 0; jj != v31; ++jj)
        {
          if (*(_QWORD *)v61 != v32)
            objc_enumerationMutation(v30);
          PBDataWriterWriteSubmessage();
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v60, v91, 16);
      }
      while (v31);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v34 = self->_sources;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v56, v90, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v57;
      do
      {
        for (kk = 0; kk != v35; ++kk)
        {
          if (*(_QWORD *)v57 != v36)
            objc_enumerationMutation(v34);
          PBDataWriterWriteSubmessage();
        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v56, v90, 16);
      }
      while (v35);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v38 = self->_starRatings;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v89, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v53;
      do
      {
        for (mm = 0; mm != v39; ++mm)
        {
          if (*(_QWORD *)v53 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteStringField();
        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v89, 16);
      }
      while (v39);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v42 = self->_placeDataAmendments;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v48, v88, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v49;
      do
      {
        for (nn = 0; nn != v43; ++nn)
        {
          if (*(_QWORD *)v49 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteSubmessage();
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v48, v88, 16);
      }
      while (v43);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v48);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOBusiness _readCenter]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  id *v45;

  v45 = (id *)a3;
  -[GEOBusiness readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v45 + 1, self->_reader);
  *((_DWORD *)v45 + 40) = self->_readerMarkPos;
  *((_DWORD *)v45 + 41) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v45;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v45[3] = (id)self->_uID;
    *((_DWORD *)v45 + 44) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v45, "setName:");
    v4 = v45;
  }
  if (self->_phoneticName)
  {
    objc_msgSend(v45, "setPhoneticName:");
    v4 = v45;
  }
  if (self->_telephone)
  {
    objc_msgSend(v45, "setTelephone:");
    v4 = v45;
  }
  if (self->_uRL)
  {
    objc_msgSend(v45, "setURL:");
    v4 = v45;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 172) = self->_isClosed;
    *((_DWORD *)v4 + 44) |= 2u;
  }
  if (self->_mapsURL)
    objc_msgSend(v45, "setMapsURL:");
  if (-[GEOBusiness ratingsCount](self, "ratingsCount"))
  {
    objc_msgSend(v45, "clearRatings");
    v5 = -[GEOBusiness ratingsCount](self, "ratingsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOBusiness ratingAtIndex:](self, "ratingAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addRating:", v8);

      }
    }
  }
  if (-[GEOBusiness categorysCount](self, "categorysCount"))
  {
    objc_msgSend(v45, "clearCategorys");
    v9 = -[GEOBusiness categorysCount](self, "categorysCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOBusiness categoryAtIndex:](self, "categoryAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addCategory:", v12);

      }
    }
  }
  if (-[GEOBusiness photosCount](self, "photosCount"))
  {
    objc_msgSend(v45, "clearPhotos");
    v13 = -[GEOBusiness photosCount](self, "photosCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOBusiness photoAtIndex:](self, "photoAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addPhoto:", v16);

      }
    }
  }
  if (-[GEOBusiness attributeKeyValuesCount](self, "attributeKeyValuesCount"))
  {
    objc_msgSend(v45, "clearAttributeKeyValues");
    v17 = -[GEOBusiness attributeKeyValuesCount](self, "attributeKeyValuesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOBusiness attributeKeyValueAtIndex:](self, "attributeKeyValueAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addAttributeKeyValue:", v20);

      }
    }
  }
  if (-[GEOBusiness openHoursCount](self, "openHoursCount"))
  {
    objc_msgSend(v45, "clearOpenHours");
    v21 = -[GEOBusiness openHoursCount](self, "openHoursCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOBusiness openHoursAtIndex:](self, "openHoursAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addOpenHours:", v24);

      }
    }
  }
  if (self->_center)
    objc_msgSend(v45, "setCenter:");
  if (-[GEOBusiness localizedCategoriesCount](self, "localizedCategoriesCount"))
  {
    objc_msgSend(v45, "clearLocalizedCategories");
    v25 = -[GEOBusiness localizedCategoriesCount](self, "localizedCategoriesCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEOBusiness localizedCategoriesAtIndex:](self, "localizedCategoriesAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addLocalizedCategories:", v28);

      }
    }
  }
  if (-[GEOBusiness attributionsCount](self, "attributionsCount"))
  {
    objc_msgSend(v45, "clearAttributions");
    v29 = -[GEOBusiness attributionsCount](self, "attributionsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[GEOBusiness attributionAtIndex:](self, "attributionAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addAttribution:", v32);

      }
    }
  }
  if (-[GEOBusiness sourcesCount](self, "sourcesCount"))
  {
    objc_msgSend(v45, "clearSources");
    v33 = -[GEOBusiness sourcesCount](self, "sourcesCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[GEOBusiness sourceAtIndex:](self, "sourceAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addSource:", v36);

      }
    }
  }
  if (-[GEOBusiness starRatingsCount](self, "starRatingsCount"))
  {
    objc_msgSend(v45, "clearStarRatings");
    v37 = -[GEOBusiness starRatingsCount](self, "starRatingsCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[GEOBusiness starRatingAtIndex:](self, "starRatingAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addStarRating:", v40);

      }
    }
  }
  if (-[GEOBusiness placeDataAmendmentsCount](self, "placeDataAmendmentsCount"))
  {
    objc_msgSend(v45, "clearPlaceDataAmendments");
    v41 = -[GEOBusiness placeDataAmendmentsCount](self, "placeDataAmendmentsCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[GEOBusiness placeDataAmendmentAtIndex:](self, "placeDataAmendmentAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addPlaceDataAmendment:", v44);

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  id v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t jj;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t kk;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t mm;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t nn;
  void *v70;
  PBUnknownFields *v71;
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
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOBusinessReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_80;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBusiness readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_uID;
    *(_DWORD *)(v5 + 176) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_phoneticName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = -[NSString copyWithZone:](self->_telephone, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v13;

  v15 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 172) = self->_isClosed;
    *(_DWORD *)(v5 + 176) |= 2u;
  }
  v17 = -[NSString copyWithZone:](self->_mapsURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v19 = self->_ratings;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v110 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRating:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    }
    while (v20);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v24 = self->_categorys;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v106 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCategory:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    }
    while (v25);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v29 = self->_photos;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v102 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPhoto:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
    }
    while (v30);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v34 = self->_attributeKeyValues;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v98 != v36)
          objc_enumerationMutation(v34);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttributeKeyValue:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    }
    while (v35);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v39 = self->_openHours;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v94;
    do
    {
      for (n = 0; n != v40; ++n)
      {
        if (*(_QWORD *)v94 != v41)
          objc_enumerationMutation(v39);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOpenHours:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v118, 16);
    }
    while (v40);
  }

  v44 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v44;

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v46 = self->_localizedCategories;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v90;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v90 != v48)
          objc_enumerationMutation(v46);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedCategories:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
    }
    while (v47);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v51 = self->_attributions;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v86;
    do
    {
      for (jj = 0; jj != v52; ++jj)
      {
        if (*(_QWORD *)v86 != v53)
          objc_enumerationMutation(v51);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttribution:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
    }
    while (v52);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v56 = self->_sources;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v82;
    do
    {
      for (kk = 0; kk != v57; ++kk)
      {
        if (*(_QWORD *)v82 != v58)
          objc_enumerationMutation(v56);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSource:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
    }
    while (v57);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v61 = self->_starRatings;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v78;
    do
    {
      for (mm = 0; mm != v62; ++mm)
      {
        if (*(_QWORD *)v78 != v63)
          objc_enumerationMutation(v61);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStarRating:", v65);

      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
    }
    while (v62);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v66 = self->_placeDataAmendments;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v74;
    do
    {
      for (nn = 0; nn != v67; ++nn)
      {
        if (*(_QWORD *)v74 != v68)
          objc_enumerationMutation(v66);
        v70 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * nn), "copyWithZone:", a3, (_QWORD)v73);
        objc_msgSend((id)v5, "addPlaceDataAmendment:", v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
    }
    while (v67);
  }

  v71 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v71;
LABEL_80:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *name;
  NSString *phoneticName;
  NSString *telephone;
  NSString *uRL;
  int v10;
  NSString *mapsURL;
  NSMutableArray *ratings;
  NSMutableArray *categorys;
  NSMutableArray *photos;
  NSMutableArray *attributeKeyValues;
  NSMutableArray *openHours;
  GEOLatLng *center;
  NSMutableArray *localizedCategories;
  NSMutableArray *attributions;
  NSMutableArray *sources;
  NSMutableArray *starRatings;
  NSMutableArray *placeDataAmendments;
  char v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOBusiness readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_uID != *((_QWORD *)v4 + 3))
      goto LABEL_47;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_47;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_47;
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:"))
      goto LABEL_47;
  }
  telephone = self->_telephone;
  if ((unint64_t)telephone | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](telephone, "isEqual:"))
      goto LABEL_47;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:"))
      goto LABEL_47;
  }
  v10 = *((_DWORD *)v4 + 44);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) != 0)
    {
      if (self->_isClosed)
      {
        if (!*((_BYTE *)v4 + 172))
          goto LABEL_47;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 172))
        goto LABEL_23;
    }
LABEL_47:
    v23 = 0;
    goto LABEL_48;
  }
  if ((v10 & 2) != 0)
    goto LABEL_47;
LABEL_23:
  mapsURL = self->_mapsURL;
  if ((unint64_t)mapsURL | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](mapsURL, "isEqual:"))
    goto LABEL_47;
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](ratings, "isEqual:"))
      goto LABEL_47;
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](categorys, "isEqual:"))
      goto LABEL_47;
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:"))
      goto LABEL_47;
  }
  attributeKeyValues = self->_attributeKeyValues;
  if ((unint64_t)attributeKeyValues | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](attributeKeyValues, "isEqual:"))
      goto LABEL_47;
  }
  openHours = self->_openHours;
  if ((unint64_t)openHours | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](openHours, "isEqual:"))
      goto LABEL_47;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_47;
  }
  localizedCategories = self->_localizedCategories;
  if ((unint64_t)localizedCategories | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](localizedCategories, "isEqual:"))
      goto LABEL_47;
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:"))
      goto LABEL_47;
  }
  sources = self->_sources;
  if ((unint64_t)sources | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](sources, "isEqual:"))
      goto LABEL_47;
  }
  starRatings = self->_starRatings;
  if ((unint64_t)starRatings | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](starRatings, "isEqual:"))
      goto LABEL_47;
  }
  placeDataAmendments = self->_placeDataAmendments;
  if ((unint64_t)placeDataAmendments | *((_QWORD *)v4 + 15))
    v23 = -[NSMutableArray isEqual:](placeDataAmendments, "isEqual:");
  else
    v23 = 1;
LABEL_48:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[GEOBusiness readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_uID;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSString hash](self->_phoneticName, "hash");
  v6 = -[NSString hash](self->_telephone, "hash");
  v7 = -[NSString hash](self->_uRL, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_isClosed;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_mapsURL, "hash");
  v10 = -[NSMutableArray hash](self->_ratings, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_categorys, "hash");
  v12 = v11 ^ -[NSMutableArray hash](self->_photos, "hash");
  v13 = v9 ^ v12 ^ -[NSMutableArray hash](self->_attributeKeyValues, "hash");
  v14 = -[NSMutableArray hash](self->_openHours, "hash");
  v15 = v14 ^ -[GEOLatLng hash](self->_center, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_localizedCategories, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_attributions, "hash");
  v18 = v13 ^ v17 ^ -[NSMutableArray hash](self->_sources, "hash");
  v19 = -[NSMutableArray hash](self->_starRatings, "hash");
  return v18 ^ v19 ^ -[NSMutableArray hash](self->_placeDataAmendments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  GEOLatLng *center;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t kk;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t mm;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t nn;
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
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 176) & 1) != 0)
  {
    self->_uID = *((_QWORD *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 11))
    -[GEOBusiness setName:](self, "setName:");
  if (*((_QWORD *)v4 + 13))
    -[GEOBusiness setPhoneticName:](self, "setPhoneticName:");
  if (*((_QWORD *)v4 + 19))
    -[GEOBusiness setTelephone:](self, "setTelephone:");
  if (*((_QWORD *)v4 + 4))
    -[GEOBusiness setURL:](self, "setURL:");
  if ((*((_BYTE *)v4 + 176) & 2) != 0)
  {
    self->_isClosed = *((_BYTE *)v4 + 172);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 10))
    -[GEOBusiness setMapsURL:](self, "setMapsURL:");
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v5 = *((id *)v4 + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v94 != v8)
          objc_enumerationMutation(v5);
        -[GEOBusiness addRating:](self, "addRating:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    }
    while (v7);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v10 = *((id *)v4 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v90 != v13)
          objc_enumerationMutation(v10);
        -[GEOBusiness addCategory:](self, "addCategory:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    }
    while (v12);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v15 = *((id *)v4 + 14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v86 != v18)
          objc_enumerationMutation(v15);
        -[GEOBusiness addPhoto:](self, "addPhoto:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
    }
    while (v17);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v20 = *((id *)v4 + 5);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v82;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v82 != v23)
          objc_enumerationMutation(v20);
        -[GEOBusiness addAttributeKeyValue:](self, "addAttributeKeyValue:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
    }
    while (v22);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v25 = *((id *)v4 + 12);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v78;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v78 != v28)
          objc_enumerationMutation(v25);
        -[GEOBusiness addOpenHours:](self, "addOpenHours:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
    }
    while (v27);
  }

  center = self->_center;
  v31 = *((_QWORD *)v4 + 8);
  if (center)
  {
    if (v31)
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOBusiness setCenter:](self, "setCenter:");
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v32 = *((id *)v4 + 9);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v101, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v74;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v74 != v35)
          objc_enumerationMutation(v32);
        -[GEOBusiness addLocalizedCategories:](self, "addLocalizedCategories:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * ii));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v101, 16);
    }
    while (v34);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v37 = *((id *)v4 + 6);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v100, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v70;
    do
    {
      for (jj = 0; jj != v39; ++jj)
      {
        if (*(_QWORD *)v70 != v40)
          objc_enumerationMutation(v37);
        -[GEOBusiness addAttribution:](self, "addAttribution:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * jj));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v100, 16);
    }
    while (v39);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v42 = *((id *)v4 + 17);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v99, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v66;
    do
    {
      for (kk = 0; kk != v44; ++kk)
      {
        if (*(_QWORD *)v66 != v45)
          objc_enumerationMutation(v42);
        -[GEOBusiness addSource:](self, "addSource:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * kk));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v99, 16);
    }
    while (v44);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v47 = *((id *)v4 + 18);
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v98, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v62;
    do
    {
      for (mm = 0; mm != v49; ++mm)
      {
        if (*(_QWORD *)v62 != v50)
          objc_enumerationMutation(v47);
        -[GEOBusiness addStarRating:](self, "addStarRating:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * mm));
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v98, 16);
    }
    while (v49);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v52 = *((id *)v4 + 15);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v97, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v58;
    do
    {
      for (nn = 0; nn != v54; ++nn)
      {
        if (*(_QWORD *)v58 != v55)
          objc_enumerationMutation(v52);
        -[GEOBusiness addPlaceDataAmendment:](self, "addPlaceDataAmendment:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * nn), (_QWORD)v57);
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v97, 16);
    }
    while (v54);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_205);
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
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  uint64_t v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t jj;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t kk;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t mm;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t nn;
  GEOBusiness *v63;
  NSMutableArray *obj;
  NSMutableArray *obja;
  uint64_t v66;
  uint64_t v67;
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
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v3 = a3;
  v113 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOBusiness readAll:](self, "readAll:", 0);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v63 = self;
    obj = self->_ratings;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
    if (v7)
    {
      v8 = v7;
      v66 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v97 != v66)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
          if (v10)
          {
            os_unfair_lock_lock_with_options();
            *(_WORD *)(v10 + 92) |= 0x10u;
            *(_WORD *)(v10 + 92) |= 0x200u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 80));
            v11 = *(void **)(v10 + 16);
            *(_QWORD *)(v10 + 16) = 0;

            -[GEORating readAll:](v10, 0);
            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            v12 = *(id *)(v10 + 56);
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v101;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v101 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * j);
                  if (v17)
                  {
                    os_unfair_lock_lock_with_options();
                    *(_WORD *)(v17 + 88) |= 8u;
                    *(_WORD *)(v17 + 88) |= 0x100u;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 80));
                    v18 = *(void **)(v17 + 16);
                    *(_QWORD *)(v17 + 16) = 0;

                    -[GEOReview readAll:](v17, 0);
                    v19 = *(_QWORD *)(v17 + 40);
                    if (v19)
                    {
                      os_unfair_lock_lock_with_options();
                      *(_BYTE *)(v19 + 52) |= 1u;
                      *(_BYTE *)(v19 + 52) |= 8u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 48));
                      v20 = *(void **)(v19 + 16);
                      *(_QWORD *)(v19 + 16) = 0;

                      -[GEOUser readAll:](v19, 0);
                      objc_msgSend(*(id *)(v19 + 24), "clearUnknownFields:", 1);
                    }
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
              }
              while (v14);
            }

          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
      }
      while (v8);
    }

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v21 = v63->_photos;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v93 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "clearUnknownFields:", 1);
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
      }
      while (v23);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v26 = v63->_attributeKeyValues;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v89;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v89 != v29)
            objc_enumerationMutation(v26);
          -[GEOAttributeKeyValue clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * m), 1);
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
      }
      while (v28);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obja = v63->_openHours;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v84, v108, 16);
    if (v31)
    {
      v32 = v31;
      v67 = *(_QWORD *)v85;
      do
      {
        for (n = 0; n != v32; ++n)
        {
          if (*(_QWORD *)v85 != v67)
            objc_enumerationMutation(obja);
          v34 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * n);
          if (v34)
          {
            os_unfair_lock_lock_with_options();
            *(_BYTE *)(v34 + 68) |= 1u;
            *(_BYTE *)(v34 + 68) |= 8u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 64));
            v35 = *(void **)(v34 + 16);
            *(_QWORD *)(v34 + 16) = 0;

            -[GEOHours readAll:](v34, 0);
            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            v36 = *(id *)(v34 + 48);
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v101;
              do
              {
                for (ii = 0; ii != v38; ++ii)
                {
                  if (*(_QWORD *)v101 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * ii);
                  if (v41)
                  {
                    v42 = *(void **)(v41 + 8);
                    *(_QWORD *)(v41 + 8) = 0;

                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
              }
              while (v38);
            }

          }
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v84, v108, 16);
      }
      while (v32);
    }

    -[GEOLatLng clearUnknownFields:](v63->_center, "clearUnknownFields:", 1);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v43 = v63->_localizedCategories;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v80, v107, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v81;
      do
      {
        for (jj = 0; jj != v45; ++jj)
        {
          if (*(_QWORD *)v81 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * jj), "clearUnknownFields:", 1);
        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v80, v107, 16);
      }
      while (v45);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v48 = v63->_attributions;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v76, v106, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v77;
      do
      {
        for (kk = 0; kk != v50; ++kk)
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * kk), "clearUnknownFields:", 1);
        }
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v76, v106, 16);
      }
      while (v50);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v53 = v63->_sources;
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v72, v105, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v73;
      do
      {
        for (mm = 0; mm != v55; ++mm)
        {
          if (*(_QWORD *)v73 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * mm), "clearUnknownFields:", 1);
        }
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v72, v105, 16);
      }
      while (v55);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v58 = v63->_placeDataAmendments;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v68, v104, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v69;
      do
      {
        for (nn = 0; nn != v60; ++nn)
        {
          if (*(_QWORD *)v69 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * nn), "clearUnknownFields:", 1);
        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v68, v104, 16);
      }
      while (v60);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephone, 0);
  objc_storeStrong((id *)&self->_starRatings, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_placeDataAmendments, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_openHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_localizedCategories, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_attributeKeyValues, 0);
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOBusiness)initWithBusinessURL:(id)a3 phoneNumber:(id)a4 muid:(unint64_t)a5 attributionID:(id)a6 sampleSizeForUserRatingScore:(unsigned int)a7 normalizedUserRatingScore:(float)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  GEOBusiness *v17;
  void *v18;
  GEOSource *v19;
  GEORating *v20;
  double v21;
  GEORating *v22;
  GEOBusiness *v23;
  objc_super v25;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)GEOBusiness;
  v17 = -[GEOBusiness init](&v25, sel_init);
  if (v17)
  {
    if (v14)
    {
      objc_msgSend(v14, "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOBusiness setURL:](v17, "setURL:", v18);

    }
    if (objc_msgSend(v15, "length"))
      -[GEOBusiness setTelephone:](v17, "setTelephone:", v15);
    if (a5)
      -[GEOBusiness setUID:](v17, "setUID:", a5);
    if (objc_msgSend(v16, "length"))
    {
      v19 = -[GEOSource initWithAttributionID:]([GEOSource alloc], "initWithAttributionID:", v16);
      if (v19)
        -[GEOBusiness addSource:](v17, "addSource:", v19);

    }
    if ((_DWORD)v9)
    {
      v20 = [GEORating alloc];
      *(float *)&v21 = a8;
      v22 = -[GEORating initWithSampleSizeForUserRatingScore:normalizedUserRatingScore:](v20, "initWithSampleSizeForUserRatingScore:normalizedUserRatingScore:", v9, v21);
      if (v22)
        -[GEOBusiness addRating:](v17, "addRating:", v22);

    }
    v23 = v17;
  }

  return v17;
}

@end
