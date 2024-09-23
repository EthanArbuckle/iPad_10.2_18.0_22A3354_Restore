@implementation GEOStopWaypoint

- (GEOStopWaypoint)init
{
  GEOStopWaypoint *v2;
  GEOStopWaypoint *v3;
  GEOStopWaypoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStopWaypoint;
  v2 = -[GEOStopWaypoint init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStopWaypoint)initWithData:(id)a3
{
  GEOStopWaypoint *v3;
  GEOStopWaypoint *v4;
  GEOStopWaypoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStopWaypoint;
  v3 = -[GEOStopWaypoint initWithData:](&v7, sel_initWithData_, a3);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_6221);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  -[GEOStopWaypoint _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOStopWaypoint _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_6222);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPosition
{
  -[GEOStopWaypoint _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOStopWaypoint _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStopWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_6223);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOStopWaypoint _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOStopWaypoint _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
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
  v8.super_class = (Class)GEOStopWaypoint;
  -[GEOStopWaypoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStopWaypoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStopWaypoint _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

  objc_msgSend((id)a1, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("position"));

  }
  objc_msgSend((id)a1, "styleAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__GEOStopWaypoint__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStopWaypoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOStopWaypoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStopWaypoint)initWithDictionary:(id)a3
{
  return (GEOStopWaypoint *)-[GEOStopWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOLatLng *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOStyleAttributes *v15;
  uint64_t v16;
  void *v17;

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

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setName:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOLatLng initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOLatLng initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setPosition:", v11);

      }
      if (a3)
        v13 = CFSTR("styleAttributes");
      else
        v13 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOStyleAttributes initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOStyleAttributes initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setStyleAttributes:", v16);

      }
    }
  }

  return a1;
}

- (GEOStopWaypoint)initWithJSON:(id)a3
{
  return (GEOStopWaypoint *)-[GEOStopWaypoint _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6224;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6225;
    GEOStopWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_position, "readAll:", 1);
    -[GEOStyleAttributes readAll:](self->_styleAttributes, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStopWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStopWaypointReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
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
    -[GEOStopWaypoint readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOStopWaypoint _readPosition]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_position, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOStopWaypoint readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[3] = (id)self->_muid;
    *((_BYTE *)v5 + 68) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    v4 = v5;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v5, "setStyleAttributes:");
    v4 = v5;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  PBUnknownFields *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOStopWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStopWaypoint readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_muid;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_position, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEOLatLng *position;
  GEOStyleAttributes *styleAttributes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOStopWaypoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 3))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_13;
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
      goto LABEL_13;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 6))
    v8 = -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  -[GEOStopWaypoint readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[GEOLatLng hash](self->_position, "hash");
  return v4 ^ v5 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOLatLng *position;
  unint64_t v6;
  GEOStyleAttributes *styleAttributes;
  unint64_t v8;
  unint64_t *v9;

  v9 = (unint64_t *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if ((*((_BYTE *)v9 + 68) & 1) != 0)
  {
    self->_muid = v9[3];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v9[4])
  {
    -[GEOStopWaypoint setName:](self, "setName:");
    v4 = v9;
  }
  position = self->_position;
  v6 = v4[5];
  if (position)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOStopWaypoint setPosition:](self, "setPosition:");
  }
  v4 = v9;
LABEL_11:
  styleAttributes = self->_styleAttributes;
  v8 = v4[6];
  if (styleAttributes)
  {
    if (v8)
    {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[GEOStopWaypoint setStyleAttributes:](self, "setStyleAttributes:");
    goto LABEL_16;
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
      GEOStopWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6228);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStopWaypoint readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_position, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
