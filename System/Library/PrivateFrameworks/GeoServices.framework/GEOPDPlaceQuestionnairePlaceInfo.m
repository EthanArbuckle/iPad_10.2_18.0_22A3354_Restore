@implementation GEOPDPlaceQuestionnairePlaceInfo

- (GEOPDPlaceQuestionnairePlaceInfo)init
{
  GEOPDPlaceQuestionnairePlaceInfo *v2;
  GEOPDPlaceQuestionnairePlaceInfo *v3;
  GEOPDPlaceQuestionnairePlaceInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  v2 = -[GEOPDPlaceQuestionnairePlaceInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceQuestionnairePlaceInfo)initWithData:(id)a3
{
  GEOPDPlaceQuestionnairePlaceInfo *v3;
  GEOPDPlaceQuestionnairePlaceInfo *v4;
  GEOPDPlaceQuestionnairePlaceInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  v3 = -[GEOPDPlaceQuestionnairePlaceInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
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
  v8.super_class = (Class)GEOPDPlaceQuestionnairePlaceInfo;
  -[GEOPDPlaceQuestionnairePlaceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceQuestionnairePlaceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnairePlaceInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;

  if (a1)
  {
    -[GEOPDPlaceQuestionnairePlaceInfo readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceQuestionnairePlaceInfo _readMapsId](a1);
    v5 = *(id *)(a1 + 32);
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("mapsId");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("maps_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsCategoryId_tags_1);
        objc_sync_exit(v10);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v11 = *(id *)(a1 + 24);
    if (v11)
    {
      if (a2)
        v12 = CFSTR("mapsCategoryId");
      else
        v12 = CFSTR("maps_category_id");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        v14 = v13;
        objc_sync_enter(v14);
        GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_6);
        objc_sync_exit(v14);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v15 = *(id *)(a1 + 16);
    if (v15)
    {
      if (a2)
        v16 = CFSTR("countryCode");
      else
        v16 = CFSTR("country_code");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);
    }

    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("hasRichData");
      else
        v18 = CFSTR("has_rich_data");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceQuestionnairePlaceInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_87;
      else
        v6 = (int *)&readAll__nonRecursiveTag_87;
      GEOPDPlaceQuestionnairePlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnairePlaceInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 0);
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
    if (self->_mapsCategoryId)
      PBDataWriterWriteStringField();
    if (self->_countryCode)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceQuestionnairePlaceInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_mapsCategoryId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_hasRichData;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *mapsId;
  NSString *mapsCategoryId;
  NSString *countryCode;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_10;
  }
  mapsCategoryId = self->_mapsCategoryId;
  if ((unint64_t)mapsCategoryId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mapsCategoryId, "isEqual:"))
      goto LABEL_10;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_hasRichData)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOPDPlaceQuestionnairePlaceInfo readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  v4 = -[NSString hash](self->_mapsCategoryId, "hash");
  v5 = -[NSString hash](self->_countryCode, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_hasRichData;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
