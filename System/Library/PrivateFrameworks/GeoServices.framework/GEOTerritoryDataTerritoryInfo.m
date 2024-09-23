@implementation GEOTerritoryDataTerritoryInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  -[GEOTerritoryDataTerritoryInfo dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_interestedPartyCountryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOTerritoryDataTerritoryInfo)init
{
  GEOTerritoryDataTerritoryInfo *v2;
  GEOTerritoryDataTerritoryInfo *v3;
  GEOTerritoryDataTerritoryInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  v2 = -[GEOTerritoryDataTerritoryInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)polygon
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOTerritoryDataTerritoryInfo _readPolygon]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)_readPolygon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPolygon_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readTerritoryTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTerritoryTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)territoryTypeAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes](result);
    v4 = *(_QWORD *)(v3 + 48);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 40) + 4 * a2);
  }
  return result;
}

- (GEOTerritoryDataTerritoryInfo)initWithData:(id)a3
{
  GEOTerritoryDataTerritoryInfo *v3;
  GEOTerritoryDataTerritoryInfo *v4;
  GEOTerritoryDataTerritoryInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  v3 = -[GEOTerritoryDataTerritoryInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readInterestedPartys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 112) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInterestedPartys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)interestedPartyAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOTerritoryDataTerritoryInfo _readInterestedPartys](result);
    v4 = *(_QWORD *)(v3 + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 16) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  -[GEOTerritoryDataTerritoryInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTerritoryDataTerritoryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTerritoryDataTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
  const __CFString *v26;

  if (a1)
  {
    -[GEOTerritoryDataTerritoryInfo readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (_QWORD *)(a1 + 40);
      if (*(_QWORD *)(a1 + 48))
      {
        v7 = 0;
        do
        {
          v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E1C0CEE8[v8];
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = (_QWORD *)(a1 + 40);
        }
        while (v7 < *(_QWORD *)(a1 + 48));
      }
      if (a2)
        v10 = CFSTR("territoryType");
      else
        v10 = CFSTR("territory_type");
      objc_msgSend(v4, "setObject:forKey:", v5, v10);

    }
    if ((*(_BYTE *)(a1 + 112) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("nameId");
      else
        v12 = CFSTR("name_id");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 112) & 0x20) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        v14 = v13;
        objc_sync_enter(v14);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_10);
        objc_sync_exit(v14);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v15 = *(id *)(a1 + 80);
    if (v15)
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("name"));

    if ((*(_BYTE *)(a1 + 112) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("featureId");
      else
        v17 = CFSTR("feature_id");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    -[GEOTerritoryDataTerritoryInfo polygon]((id *)a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v18, "jsonRepresentation");
      else
        objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("polygon"));

    }
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedUInt32NSArray();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v22 = CFSTR("interestedParty");
      else
        v22 = CFSTR("interested_party");
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 112) & 0x10) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        v24 = v23;
        objc_sync_enter(v24);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInterestedPartyCountryCode_tags);
        objc_sync_exit(v24);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v25 = *(id *)(a1 + 72);
    if (v25)
    {
      if (a2)
        v26 = CFSTR("interestedPartyCountryCode");
      else
        v26 = CFSTR("interested_party_country_code");
      objc_msgSend(v4, "setObject:forKey:", v25, v26);
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
  return -[GEOTerritoryDataTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_82_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_83_0;
      GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOTerritoryDataPolygon readAll:](*(_QWORD *)(a1 + 88), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTerritoryDataTerritoryInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  GEOTerritoryDataPolygon *polygon;
  int v8;
  unint64_t v9;
  unint64_t v10;
  PBDataReader *v11;
  void *v12;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0xA8) != 0)
    goto LABEL_8;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    polygon = self->_polygon;
    if (polygon)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&polygon->_readerLock);
      v8 = *(_BYTE *)&polygon->_flags & 7;
      os_unfair_lock_unlock(&polygon->_readerLock);
      if (v8)
        goto LABEL_8;
      flags = (char)self->_flags;
    }
  }
  if ((flags & 0x14) == 0)
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
    goto LABEL_26;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 0);
  if (self->_territoryTypes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_territoryTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_polygon)
    PBDataWriterWriteSubmessage();
  if (self->_interestedPartys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_interestedPartys.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_interestedPartys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_interestedPartyCountryCode)
    PBDataWriterWriteStringField();
LABEL_26:

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
  uint64_t v13;

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
      GEOTerritoryDataTerritoryInfoReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_nameId;
    *(_BYTE *)(v5 + 112) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_featureId;
    *(_BYTE *)(v5 + 112) |= 1u;
  }
  v11 = -[GEOTerritoryDataPolygon copyWithZone:](self->_polygon, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  PBRepeatedUInt32Copy();
  v13 = -[NSString copyWithZone:](self->_interestedPartyCountryCode, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *name;
  GEOTerritoryDataPolygon *polygon;
  NSString *interestedPartyCountryCode;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 1);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_21;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 112);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 2) == 0 || self->_nameId != *((_DWORD *)v4 + 27))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    goto LABEL_21;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_21:
      v10 = 0;
      goto LABEL_22;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 112);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_featureId != *((_QWORD *)v4 + 8))
      goto LABEL_21;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_21;
  }
  polygon = self->_polygon;
  if ((unint64_t)polygon | *((_QWORD *)v4 + 11) && !-[GEOTerritoryDataPolygon isEqual:](polygon, "isEqual:")
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_21;
  }
  interestedPartyCountryCode = self->_interestedPartyCountryCode;
  if ((unint64_t)interestedPartyCountryCode | *((_QWORD *)v4 + 9))
    v10 = -[NSString isEqual:](interestedPartyCountryCode, "isEqual:");
  else
    v10 = 1;
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v4 = 2654435761 * self->_nameId;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761u * self->_featureId;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v6 ^ v5;
  v8 = -[GEOTerritoryDataPolygon hash](self->_polygon, "hash");
  v9 = v7 ^ v8 ^ PBRepeatedUInt32Hash();
  return v9 ^ -[NSString hash](self->_interestedPartyCountryCode, "hash");
}

@end
