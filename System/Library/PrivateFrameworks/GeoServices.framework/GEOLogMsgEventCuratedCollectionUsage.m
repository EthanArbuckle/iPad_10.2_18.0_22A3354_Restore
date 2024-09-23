@implementation GEOLogMsgEventCuratedCollectionUsage

- (GEOLogMsgEventCuratedCollectionUsage)init
{
  GEOLogMsgEventCuratedCollectionUsage *v2;
  GEOLogMsgEventCuratedCollectionUsage *v3;
  GEOLogMsgEventCuratedCollectionUsage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  v2 = -[GEOLogMsgEventCuratedCollectionUsage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithData:(id)a3
{
  GEOLogMsgEventCuratedCollectionUsage *v3;
  GEOLogMsgEventCuratedCollectionUsage *v4;
  GEOLogMsgEventCuratedCollectionUsage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  v3 = -[GEOLogMsgEventCuratedCollectionUsage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)collectionMuid
{
  return self->_collectionMuid;
}

- (void)setCollectionMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_collectionMuid = a3;
}

- (void)setHasCollectionMuid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCollectionMuid
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)viewsToday
{
  return self->_viewsToday;
}

- (void)setViewsToday:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  self->_viewsToday = a3;
}

- (void)setHasViewsToday:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -120;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasViewsToday
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)collectionFirstViewedDate
{
  return self->_collectionFirstViewedDate;
}

- (void)setCollectionFirstViewedDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_collectionFirstViewedDate = a3;
}

- (void)setHasCollectionFirstViewedDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCollectionFirstViewedDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)collectionLastViewedDate
{
  return self->_collectionLastViewedDate;
}

- (void)setCollectionLastViewedDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_collectionLastViewedDate = a3;
}

- (void)setHasCollectionLastViewedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCollectionLastViewedDate
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readTouristInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTouristInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTouristInfo
{
  -[GEOLogMsgEventCuratedCollectionUsage _readTouristInfo]((uint64_t)self);
  return self->_touristInfo != 0;
}

- (GEOTouristInfo)touristInfo
{
  -[GEOLogMsgEventCuratedCollectionUsage _readTouristInfo]((uint64_t)self);
  return self->_touristInfo;
}

- (void)setTouristInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_touristInfo, a3);
}

- (void)_readHomeCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHomeCountryCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHomeCountryCode
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeCountryCode]((uint64_t)self);
  return self->_homeCountryCode != 0;
}

- (NSString)homeCountryCode
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeCountryCode]((uint64_t)self);
  return self->_homeCountryCode;
}

- (void)setHomeCountryCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_homeCountryCode, a3);
}

- (void)_readHomeMetroRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventCuratedCollectionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHomeMetroRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHomeMetroRegion
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeMetroRegion]((uint64_t)self);
  return self->_homeMetroRegion != 0;
}

- (NSString)homeMetroRegion
{
  -[GEOLogMsgEventCuratedCollectionUsage _readHomeMetroRegion]((uint64_t)self);
  return self->_homeMetroRegion;
}

- (void)setHomeMetroRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_homeMetroRegion, a3);
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
  v8.super_class = (Class)GEOLogMsgEventCuratedCollectionUsage;
  -[GEOLogMsgEventCuratedCollectionUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventCuratedCollectionUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 80);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("collectionMuid");
    else
      v13 = CFSTR("collection_muid");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v5 = *(_BYTE *)(a1 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("collectionFirstViewedDate");
      else
        v17 = CFSTR("collection_first_viewed_date");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

      if ((*(_BYTE *)(a1 + 80) & 2) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 80) & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("viewsToday");
  else
    v15 = CFSTR("views_today");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_BYTE *)(a1 + 80);
  if ((v5 & 1) != 0)
    goto LABEL_21;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("collectionLastViewedDate");
    else
      v7 = CFSTR("collection_last_viewed_date");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
  objc_msgSend((id)a1, "touristInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("touristInfo");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("tourist_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "homeCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("homeCountryCode");
    else
      v19 = CFSTR("home_country_code");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  objc_msgSend((id)a1, "homeMetroRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("homeMetroRegion");
    else
      v21 = CFSTR("home_metro_region");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionUsage *)-[GEOLogMsgEventCuratedCollectionUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
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
  GEOTouristInfo *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("collectionMuid");
      else
        v6 = CFSTR("collection_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCollectionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("viewsToday");
      else
        v8 = CFSTR("views_today");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setViewsToday:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("collectionFirstViewedDate");
      else
        v10 = CFSTR("collection_first_viewed_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setCollectionFirstViewedDate:");
      }

      if (a3)
        v12 = CFSTR("collectionLastViewedDate");
      else
        v12 = CFSTR("collection_last_viewed_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setCollectionLastViewedDate:");
      }

      if (a3)
        v14 = CFSTR("touristInfo");
      else
        v14 = CFSTR("tourist_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOTouristInfo alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOTouristInfo initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOTouristInfo initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setTouristInfo:", v17);

      }
      if (a3)
        v19 = CFSTR("homeCountryCode");
      else
        v19 = CFSTR("home_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setHomeCountryCode:", v21);

      }
      if (a3)
        v22 = CFSTR("homeMetroRegion");
      else
        v22 = CFSTR("home_metro_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(a1, "setHomeMetroRegion:", v24);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventCuratedCollectionUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionUsage *)-[GEOLogMsgEventCuratedCollectionUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1688;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1689;
    GEOLogMsgEventCuratedCollectionUsageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTouristInfo readAll:](self->_touristInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCuratedCollectionUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCuratedCollectionUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_BYTE *)&self->_flags <= 0xFu)
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
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventCuratedCollectionUsage readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0)
        goto LABEL_6;
LABEL_16:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_16;
LABEL_6:
  if ((flags & 2) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_touristInfo)
    PBDataWriterWriteSubmessage();
  if (self->_homeCountryCode)
    PBDataWriterWriteStringField();
  if (self->_homeMetroRegion)
    PBDataWriterWriteStringField();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgEventCuratedCollectionUsage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v6[4] = (id)self->_collectionMuid;
    *((_BYTE *)v6 + 80) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 19) = self->_viewsToday;
  *((_BYTE *)v6 + 80) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  v6[2] = *(id *)&self->_collectionFirstViewedDate;
  *((_BYTE *)v6 + 80) |= 1u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v6[3] = *(id *)&self->_collectionLastViewedDate;
    *((_BYTE *)v6 + 80) |= 2u;
  }
LABEL_6:
  if (self->_touristInfo)
  {
    objc_msgSend(v6, "setTouristInfo:");
    v4 = v6;
  }
  if (self->_homeCountryCode)
  {
    objc_msgSend(v6, "setHomeCountryCode:");
    v4 = v6;
  }
  if (self->_homeMetroRegion)
  {
    objc_msgSend(v6, "setHomeMetroRegion:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventCuratedCollectionUsage readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_QWORD *)(v5 + 32) = self->_collectionMuid;
      *(_BYTE *)(v5 + 80) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_viewsToday;
    *(_BYTE *)(v5 + 80) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0)
      {
LABEL_10:
        v10 = -[GEOTouristInfo copyWithZone:](self->_touristInfo, "copyWithZone:", a3);
        v11 = *(void **)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v10;

        v12 = -[NSString copyWithZone:](self->_homeCountryCode, "copyWithZone:", a3);
        v13 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v12;

        v14 = -[NSString copyWithZone:](self->_homeMetroRegion, "copyWithZone:", a3);
        v8 = *(id *)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v14;
        goto LABEL_11;
      }
LABEL_9:
      *(double *)(v5 + 24) = self->_collectionLastViewedDate;
      *(_BYTE *)(v5 + 80) |= 2u;
      goto LABEL_10;
    }
LABEL_14:
    *(double *)(v5 + 16) = self->_collectionFirstViewedDate;
    *(_BYTE *)(v5 + 80) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventCuratedCollectionUsageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_11:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTouristInfo *touristInfo;
  NSString *homeCountryCode;
  NSString *homeMetroRegion;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOLogMsgEventCuratedCollectionUsage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_collectionMuid != *((_QWORD *)v4 + 4))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_viewsToday != *((_DWORD *)v4 + 19))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_collectionFirstViewedDate != *((double *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_collectionLastViewedDate != *((double *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_28;
  }
  touristInfo = self->_touristInfo;
  if ((unint64_t)touristInfo | *((_QWORD *)v4 + 7) && !-[GEOTouristInfo isEqual:](touristInfo, "isEqual:"))
    goto LABEL_28;
  homeCountryCode = self->_homeCountryCode;
  if ((unint64_t)homeCountryCode | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](homeCountryCode, "isEqual:"))
      goto LABEL_28;
  }
  homeMetroRegion = self->_homeMetroRegion;
  if ((unint64_t)homeMetroRegion | *((_QWORD *)v4 + 6))
    v8 = -[NSString isEqual:](homeMetroRegion, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  uint64_t v5;
  double collectionFirstViewedDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double collectionLastViewedDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  NSUInteger v17;

  -[GEOLogMsgEventCuratedCollectionUsage readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761u * self->_collectionMuid;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_viewsToday;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_4:
  collectionFirstViewedDate = self->_collectionFirstViewedDate;
  v7 = -collectionFirstViewedDate;
  if (collectionFirstViewedDate >= 0.0)
    v7 = self->_collectionFirstViewedDate;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((flags & 2) != 0)
  {
    collectionLastViewedDate = self->_collectionLastViewedDate;
    v13 = -collectionLastViewedDate;
    if (collectionLastViewedDate >= 0.0)
      v13 = self->_collectionLastViewedDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = v5 ^ v4 ^ v10 ^ v11 ^ -[GEOTouristInfo hash](self->_touristInfo, "hash");
  v17 = -[NSString hash](self->_homeCountryCode, "hash");
  return v16 ^ v17 ^ -[NSString hash](self->_homeMetroRegion, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOTouristInfo *touristInfo;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 80);
  if ((v5 & 4) != 0)
  {
    self->_collectionMuid = *((_QWORD *)v8 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v8 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v8 + 80) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_viewsToday = *((_DWORD *)v8 + 19);
  *(_BYTE *)&self->_flags |= 8u;
  v5 = *((_BYTE *)v8 + 80);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_collectionFirstViewedDate = *((double *)v8 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  if ((*((_BYTE *)v8 + 80) & 2) != 0)
  {
LABEL_5:
    self->_collectionLastViewedDate = *((double *)v8 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_6:
  touristInfo = self->_touristInfo;
  v7 = *((_QWORD *)v8 + 7);
  if (touristInfo)
  {
    if (!v7)
      goto LABEL_16;
    -[GEOTouristInfo mergeFrom:](touristInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    -[GEOLogMsgEventCuratedCollectionUsage setTouristInfo:](self, "setTouristInfo:");
  }
  v4 = v8;
LABEL_16:
  if (v4[5])
  {
    -[GEOLogMsgEventCuratedCollectionUsage setHomeCountryCode:](self, "setHomeCountryCode:");
    v4 = v8;
  }
  if (v4[6])
  {
    -[GEOLogMsgEventCuratedCollectionUsage setHomeMetroRegion:](self, "setHomeMetroRegion:");
    v4 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touristInfo, 0);
  objc_storeStrong((id *)&self->_homeMetroRegion, 0);
  objc_storeStrong((id *)&self->_homeCountryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
