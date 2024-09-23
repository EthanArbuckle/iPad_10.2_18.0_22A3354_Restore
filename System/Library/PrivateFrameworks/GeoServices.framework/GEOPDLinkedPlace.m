@implementation GEOPDLinkedPlace

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDLinkedPlace _readCenter](result);
    if ((objc_msgSend(*(id *)(v3 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDLinkedPlace _readMapsId](v3);
      return objc_msgSend(*(id *)(v3 + 40), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v1 + 76) |= 2u;
    *(_BYTE *)(v1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEOPDLinkedPlace readAll:](v1, 0);
    objc_msgSend(*(id *)(v1 + 40), "clearUnknownFields:", 1);
    objc_msgSend(*(id *)(v1 + 24), "clearUnknownFields:", 1);
    return objc_msgSend(*(id *)(v1 + 56), "clearUnknownFields:", 1);
  }
  return result;
}

- (GEOPDLinkedPlace)init
{
  GEOPDLinkedPlace *v2;
  GEOPDLinkedPlace *v3;
  GEOPDLinkedPlace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLinkedPlace;
  v2 = -[GEOPDLinkedPlace init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLinkedPlace)initWithData:(id)a3
{
  GEOPDLinkedPlace *v3;
  GEOPDLinkedPlace *v4;
  GEOPDLinkedPlace *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLinkedPlace;
  v3 = -[GEOPDLinkedPlace initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkedPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_4628);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)mapsId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLinkedPlace _readMapsId]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readName
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
        GEOPDLinkedPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_4629);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLinkedPlace _readName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readCenter
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
        GEOPDLinkedPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_4630);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)center
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLinkedPlace _readCenter]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readStyleAttributes
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
        GEOPDLinkedPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_4631);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)styleAttributes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLinkedPlace _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDLinkedPlace;
  -[GEOPDLinkedPlace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLinkedPlace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLinkedPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
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
  -[GEOPDLinkedPlace readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLinkedPlace mapsId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[GEOPDLinkedPlace name]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("name"));

  -[GEOPDLinkedPlace center]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("center"));

  }
  -[GEOPDLinkedPlace styleAttributes]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("featureId");
    else
      v18 = CFSTR("feature_id");
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
      v26[2] = __46__GEOPDLinkedPlace__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDLinkedPlace _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4632;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4633;
      GEOPDLinkedPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __46__GEOPDLinkedPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  GEOPDMapsIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  GEOPDMapsIdentifier *v11;
  GEOPDMapsIdentifier *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  GEOLatLng *v17;
  GEOLatLng *v18;
  GEOLatLng *v19;
  GEOLatLng *v20;
  const __CFString *v21;
  void *v22;
  GEOStyleAttributes *v23;
  GEOStyleAttributes *v24;
  GEOStyleAttributes *v25;
  GEOStyleAttributes *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("mapsId");
    else
      v7 = CFSTR("maps_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v10 = -[GEOPDMapsIdentifier initWithJSON:](v9, "initWithJSON:", v8);
      else
        v10 = -[GEOPDMapsIdentifier initWithDictionary:](v9, "initWithDictionary:", v8);
      v11 = v10;
      v12 = v10;
      *(_BYTE *)(v6 + 76) |= 8u;
      *(_BYTE *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v11);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      v15 = v14;
      *(_BYTE *)(v6 + 76) |= 0x10u;
      *(_BYTE *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v14);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v18 = -[GEOLatLng initWithJSON:](v17, "initWithJSON:", v16);
      else
        v18 = -[GEOLatLng initWithDictionary:](v17, "initWithDictionary:", v16);
      v19 = v18;
      v20 = v18;
      *(_BYTE *)(v6 + 76) |= 4u;
      *(_BYTE *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 24), v19);

    }
    if (a3)
      v21 = CFSTR("styleAttributes");
    else
      v21 = CFSTR("style_attributes");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = [GEOStyleAttributes alloc];
      if ((a3 & 1) != 0)
        v24 = -[GEOStyleAttributes initWithJSON:](v23, "initWithJSON:", v22);
      else
        v24 = -[GEOStyleAttributes initWithDictionary:](v23, "initWithDictionary:", v22);
      v25 = v24;
      v26 = v24;
      *(_BYTE *)(v6 + 76) |= 0x20u;
      *(_BYTE *)(v6 + 76) |= 0x40u;
      objc_storeStrong((id *)(v6 + 56), v25);

    }
    if (a3)
      v27 = CFSTR("featureId");
    else
      v27 = CFSTR("feature_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v28, "unsignedLongLongValue");
      *(_BYTE *)(v6 + 76) |= 0x40u;
      *(_BYTE *)(v6 + 76) |= 1u;
      *(_QWORD *)(v6 + 32) = v29;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLinkedPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
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
    -[GEOPDLinkedPlace readAll:]((uint64_t)self, 0);
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOPDLinkedPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_featureId;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *mapsId;
  NSString *name;
  GEOLatLng *center;
  GEOStyleAttributes *styleAttributes;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 1);
  -[GEOPDLinkedPlace readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_14;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_14;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_14;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) != 0 && self->_featureId == *((_QWORD *)v4 + 4))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDLinkedPlace readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[GEOLatLng hash](self->_center, "hash");
  v6 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761u * self->_featureId;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
