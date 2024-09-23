@implementation GEOPDSearchGeoIntent

- (GEOPDSearchGeoIntent)init
{
  GEOPDSearchGeoIntent *v2;
  GEOPDSearchGeoIntent *v3;
  GEOPDSearchGeoIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchGeoIntent;
  v2 = -[GEOPDSearchGeoIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchGeoIntent)initWithData:(id)a3
{
  GEOPDSearchGeoIntent *v3;
  GEOPDSearchGeoIntent *v4;
  GEOPDSearchGeoIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchGeoIntent;
  v3 = -[GEOPDSearchGeoIntent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_579);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
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
  v8.super_class = (Class)GEOPDSearchGeoIntent;
  -[GEOPDSearchGeoIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchGeoIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchGeoIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  id v35;
  id v36;
  const __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;

  if (a1)
  {
    -[GEOPDSearchGeoIntent readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_577);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v7 = *(id *)(a1 + 80);
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_578);
        objc_sync_exit(v9);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v10 = *(id *)(a1 + 88);
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("tokenSet");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("token_set");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    v14 = *(_WORD *)(a1 + 112);
    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v16 = CFSTR("geoId");
      else
        v16 = CFSTR("geo_id");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

      v14 = *(_WORD *)(a1 + 112);
    }
    if ((v14 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 108));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("geoTypeId");
      else
        v18 = CFSTR("geo_type_id");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        v20 = v19;
        objc_sync_enter(v20);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_0);
        objc_sync_exit(v20);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v21 = *(id *)(a1 + 32);
    if (v21)
    {
      if (a2)
        v22 = CFSTR("countryCode");
      else
        v22 = CFSTR("country_code");
      objc_msgSend(v4, "setObject:forKey:", v21, v22);
    }

    -[GEOPDSearchGeoIntent _readCenter](a1);
    v23 = *(id *)(a1 + 24);
    v24 = v23;
    if (v23)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v23, "jsonRepresentation");
      else
        objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("center"));

    }
    -[GEOPDSearchGeoIntent _readMapRegion](a1);
    v26 = *(id *)(a1 + 72);
    v27 = v26;
    if (v26)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v26, "jsonRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("mapRegion");
      }
      else
      {
        objc_msgSend(v26, "dictionaryRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("map_region");
      }
      objc_msgSend(v4, "setObject:forKey:", v28, v29);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        v31 = v30;
        objc_sync_enter(v31);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDoorNumber_tags);
        objc_sync_exit(v31);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v32 = *(id *)(a1 + 56);
    if (v32)
    {
      if (a2)
        v33 = CFSTR("doorNumber");
      else
        v33 = CFSTR("door_number");
      objc_msgSend(v4, "setObject:forKey:", v32, v33);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v34 = *(void **)(a1 + 8);
      if (v34)
      {
        v35 = v34;
        objc_sync_enter(v35);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_1);
        objc_sync_exit(v35);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v36 = *(id *)(a1 + 48);
    if (v36)
    {
      if (a2)
        v37 = CFSTR("displayName");
      else
        v37 = CFSTR("display_name");
      objc_msgSend(v4, "setObject:forKey:", v36, v37);
    }

    -[GEOPDSearchGeoIntent _readDisplayMapRegion](a1);
    v38 = *(id *)(a1 + 40);
    v39 = v38;
    if (v38)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v38, "jsonRepresentation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("displayMapRegion");
      }
      else
      {
        objc_msgSend(v38, "dictionaryRepresentation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("display_map_region");
      }
      objc_msgSend(v4, "setObject:forKey:", v40, v41);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 4) == 0)
    {
      v42 = *(void **)(a1 + 8);
      if (v42)
      {
        v43 = v42;
        objc_sync_enter(v43);
        GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_3);
        objc_sync_exit(v43);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v44 = *(id *)(a1 + 16);
    v45 = v44;
    if (v44)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v44, "jsonRepresentation");
      else
        objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("address"));

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
  return -[GEOPDSearchGeoIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_604;
      else
        v6 = (int *)&readAll__nonRecursiveTag_605;
      GEOPDSearchGeoIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchGeoIntentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchGeoIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchGeoIntentIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_tokenSet)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt64Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_countryCode)
      PBDataWriterWriteStringField();
    if (self->_center)
      PBDataWriterWriteSubmessage();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_doorNumber)
      PBDataWriterWriteStringField();
    if (self->_displayName)
      PBDataWriterWriteStringField();
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_address)
      PBDataWriterWriteSubmessage();
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    -[GEOPDSearchGeoIntent _readCenter](result);
    if ((objc_msgSend(v3[3], "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchGeoIntent _readDisplayMapRegion]((uint64_t)v3);
    if ((objc_msgSend(v3[5], "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchGeoIntent _readMapRegion]((uint64_t)v3);
      return objc_msgSend(v3[9], "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int16 flags;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchGeoIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_geoId;
    *(_WORD *)(v5 + 112) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_geoTypeId;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_doorNumber, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v24 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v24;

  v26 = -[GEOStructuredAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEOPDSearchTokenSet *tokenSet;
  __int16 flags;
  __int16 v8;
  NSString *countryCode;
  GEOLatLng *center;
  GEOMapRegion *mapRegion;
  NSString *doorNumber;
  NSString *displayName;
  GEOMapRegion *displayMapRegion;
  GEOStructuredAddress *address;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_30;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_30;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 56);
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_geoId != *((_QWORD *)v4 + 8))
      goto LABEL_30;
  }
  else if ((v8 & 1) != 0)
  {
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_geoTypeId != *((_DWORD *)v4 + 27))
      goto LABEL_30;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_30;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_30;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_30;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_30;
  }
  doorNumber = self->_doorNumber;
  if ((unint64_t)doorNumber | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](doorNumber, "isEqual:"))
      goto LABEL_30;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_30;
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_30;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 2))
    v16 = -[GEOStructuredAddress isEqual:](address, "isEqual:");
  else
    v16 = 1;
LABEL_31:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  __int16 flags;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;

  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v6 = 2654435761 * self->_geoId;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_geoTypeId;
LABEL_6:
  v8 = v4 ^ v3 ^ v6 ^ v7 ^ -[NSString hash](self->_countryCode, "hash");
  v9 = -[GEOLatLng hash](self->_center, "hash");
  v10 = v9 ^ -[GEOMapRegion hash](self->_mapRegion, "hash");
  v11 = v10 ^ -[NSString hash](self->_doorNumber, "hash");
  v12 = v8 ^ v11 ^ -[NSString hash](self->_displayName, "hash");
  v13 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  return v12 ^ v13 ^ -[GEOStructuredAddress hash](self->_address, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_doorNumber, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
