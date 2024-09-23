@implementation GEOMapsSearchResult

- (GEOMapsSearchResult)init
{
  GEOMapsSearchResult *v2;
  GEOMapsSearchResult *v3;
  GEOMapsSearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapsSearchResult;
  v2 = -[GEOMapsSearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapsSearchResult)initWithData:(id)a3
{
  GEOMapsSearchResult *v3;
  GEOMapsSearchResult *v4;
  GEOMapsSearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapsSearchResult;
  v3 = -[GEOMapsSearchResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddress
{
  -[GEOMapsSearchResult _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOAddress)address
{
  -[GEOMapsSearchResult _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readPlaceActionDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceActionDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPlaceActionDetails
{
  -[GEOMapsSearchResult _readPlaceActionDetails]((uint64_t)self);
  return self->_placeActionDetails != 0;
}

- (GEOPlaceActionDetails)placeActionDetails
{
  -[GEOMapsSearchResult _readPlaceActionDetails]((uint64_t)self);
  return self->_placeActionDetails;
}

- (void)setPlaceActionDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_placeActionDetails, a3);
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapsId
{
  -[GEOMapsSearchResult _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOMapsSearchResult _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapsId, a3);
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
  v8.super_class = (Class)GEOMapsSearchResult;
  -[GEOMapsSearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapsSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 60) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

    }
    objc_msgSend((id)a1, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("address"));

    }
    objc_msgSend((id)a1, "placeActionDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("placeActionDetails");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("place_action_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "mapsId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("mapsId");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("maps_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

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
  return -[GEOMapsSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsSearchResult)initWithDictionary:(id)a3
{
  return (GEOMapsSearchResult *)-[GEOMapsSearchResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOAddress *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPlaceActionDetails *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOPDMapsIdentifier *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOAddress alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOAddress initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOAddress initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setAddress:", v9);

      }
      if (a3)
        v11 = CFSTR("placeActionDetails");
      else
        v11 = CFSTR("place_action_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPlaceActionDetails alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPlaceActionDetails initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPlaceActionDetails initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setPlaceActionDetails:", v14);

      }
      if (a3)
        v16 = CFSTR("mapsId");
      else
        v16 = CFSTR("maps_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOPDMapsIdentifier initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOPDMapsIdentifier initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setMapsId:", v19);

      }
    }
  }

  return a1;
}

- (GEOMapsSearchResult)initWithJSON:(id)a3
{
  return (GEOMapsSearchResult *)-[GEOMapsSearchResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_543_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_544_0;
    GEOMapsSearchResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOAddress readAll:](self->_address, "readAll:", 1);
    -[GEOPlaceActionDetails readAll:](self->_placeActionDetails, "readAll:", 1);
    -[GEOPDMapsIdentifier readAll:](self->_mapsId, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsSearchResultReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOMapsSearchResultIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMapsSearchResult readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_address)
      PBDataWriterWriteSubmessage();
    if (self->_placeActionDetails)
      PBDataWriterWriteSubmessage();
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOMapsSearchResult _readMapsId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOMapsSearchResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[4] = (id)self->_muid;
    *((_BYTE *)v5 + 60) |= 1u;
  }
  if (self->_address)
  {
    objc_msgSend(v5, "setAddress:");
    v4 = v5;
  }
  if (self->_placeActionDetails)
  {
    objc_msgSend(v5, "setPlaceActionDetails:");
    v4 = v5;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v5, "setMapsId:");
    v4 = v5;
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
      GEOMapsSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapsSearchResult readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[GEOAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEOPlaceActionDetails copyWithZone:](self->_placeActionDetails, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOAddress *address;
  GEOPlaceActionDetails *placeActionDetails;
  GEOPDMapsIdentifier *mapsId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOMapsSearchResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 2) && !-[GEOAddress isEqual:](address, "isEqual:"))
    goto LABEL_13;
  placeActionDetails = self->_placeActionDetails;
  if ((unint64_t)placeActionDetails | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPlaceActionDetails isEqual:](placeActionDetails, "isEqual:"))
      goto LABEL_13;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 3))
    v8 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOMapsSearchResult readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[GEOAddress hash](self->_address, "hash") ^ v3;
  v5 = -[GEOPlaceActionDetails hash](self->_placeActionDetails, "hash");
  return v4 ^ v5 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOAddress *address;
  unint64_t v6;
  GEOPlaceActionDetails *placeActionDetails;
  unint64_t v8;
  GEOPDMapsIdentifier *mapsId;
  unint64_t v10;
  unint64_t *v11;

  v11 = (unint64_t *)a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if ((*((_BYTE *)v11 + 60) & 1) != 0)
  {
    self->_muid = v11[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  address = self->_address;
  v6 = v11[2];
  if (address)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapsSearchResult setAddress:](self, "setAddress:");
  }
  v4 = v11;
LABEL_9:
  placeActionDetails = self->_placeActionDetails;
  v8 = v4[5];
  if (placeActionDetails)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPlaceActionDetails mergeFrom:](placeActionDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOMapsSearchResult setPlaceActionDetails:](self, "setPlaceActionDetails:");
  }
  v4 = v11;
LABEL_15:
  mapsId = self->_mapsId;
  v10 = v4[3];
  if (mapsId)
  {
    if (v10)
    {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
LABEL_20:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEOMapsSearchResult setMapsId:](self, "setMapsId:");
    goto LABEL_20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeActionDetails, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
