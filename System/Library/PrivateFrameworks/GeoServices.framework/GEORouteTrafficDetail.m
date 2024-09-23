@implementation GEORouteTrafficDetail

- (GEORouteTrafficDetail)init
{
  GEORouteTrafficDetail *v2;
  GEORouteTrafficDetail *v3;
  GEORouteTrafficDetail *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteTrafficDetail;
  v2 = -[GEORouteTrafficDetail init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteTrafficDetail)initWithData:(id)a3
{
  GEORouteTrafficDetail *v3;
  GEORouteTrafficDetail *v4;
  GEORouteTrafficDetail *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteTrafficDetail;
  v3 = -[GEORouteTrafficDetail initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)routeTrafficCondition
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_routeTrafficCondition;
  else
    return 0;
}

- (void)setRouteTrafficCondition:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_routeTrafficCondition = a3;
}

- (void)setHasRouteTrafficCondition:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasRouteTrafficCondition
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)routeTrafficConditionAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C086A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRouteTrafficCondition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_EXTREMELY_LIGHT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_LIGHT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_MEDIUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_HEAVY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_EXTREMELY_HEAVY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readWrittenRouteName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWrittenRouteName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasWrittenRouteName
{
  -[GEORouteTrafficDetail _readWrittenRouteName]((uint64_t)self);
  return self->_writtenRouteName != 0;
}

- (NSString)writtenRouteName
{
  -[GEORouteTrafficDetail _readWrittenRouteName]((uint64_t)self);
  return self->_writtenRouteName;
}

- (void)setWrittenRouteName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_writtenRouteName, a3);
}

- (void)_readSpokenRouteName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenRouteName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSpokenRouteName
{
  -[GEORouteTrafficDetail _readSpokenRouteName]((uint64_t)self);
  return self->_spokenRouteName != 0;
}

- (NSString)spokenRouteName
{
  -[GEORouteTrafficDetail _readSpokenRouteName]((uint64_t)self);
  return self->_spokenRouteName;
}

- (void)setSpokenRouteName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_spokenRouteName, a3);
}

- (void)_readUnabbreviatedRouteName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteTrafficDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnabbreviatedRouteName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUnabbreviatedRouteName
{
  -[GEORouteTrafficDetail _readUnabbreviatedRouteName]((uint64_t)self);
  return self->_unabbreviatedRouteName != 0;
}

- (NSString)unabbreviatedRouteName
{
  -[GEORouteTrafficDetail _readUnabbreviatedRouteName]((uint64_t)self);
  return self->_unabbreviatedRouteName;
}

- (void)setUnabbreviatedRouteName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_unabbreviatedRouteName, a3);
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
  v8.super_class = (Class)GEORouteTrafficDetail;
  -[GEORouteTrafficDetail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteTrafficDetail dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteTrafficDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
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
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v5 = *(int *)(a1 + 60);
    if (v5 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C086A0[v5];
    }
    if (a2)
      v7 = CFSTR("routeTrafficCondition");
    else
      v7 = CFSTR("route_traffic_condition");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "writtenRouteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("writtenRouteName");
    else
      v9 = CFSTR("written_route_name");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend((id)a1, "spokenRouteName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("spokenRouteName");
    else
      v11 = CFSTR("spoken_route_name");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "unabbreviatedRouteName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("unabbreviatedRouteName");
    else
      v13 = CFSTR("unabbreviated_route_name");
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
      v21[2] = __51__GEORouteTrafficDetail__dictionaryRepresentation___block_invoke;
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
  return -[GEORouteTrafficDetail _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORouteTrafficDetail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteTrafficDetail)initWithDictionary:(id)a3
{
  return (GEORouteTrafficDetail *)-[GEORouteTrafficDetail _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_40;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_40;
  if (a3)
    v6 = CFSTR("routeTrafficCondition");
  else
    v6 = CFSTR("route_traffic_condition");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_EXTREMELY_LIGHT")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_LIGHT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_MEDIUM")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_HEAVY")) & 1) != 0)
    {
      v9 = 4;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_CONDITION_EXTREMELY_HEAVY")))
    {
      v9 = 5;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_23:
    objc_msgSend(a1, "setRouteTrafficCondition:", v9);
  }

  if (a3)
    v10 = CFSTR("writtenRouteName");
  else
    v10 = CFSTR("written_route_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setWrittenRouteName:", v12);

  }
  if (a3)
    v13 = CFSTR("spokenRouteName");
  else
    v13 = CFSTR("spoken_route_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setSpokenRouteName:", v15);

  }
  if (a3)
    v16 = CFSTR("unabbreviatedRouteName");
  else
    v16 = CFSTR("unabbreviated_route_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setUnabbreviatedRouteName:", v18);

  }
LABEL_40:

  return a1;
}

- (GEORouteTrafficDetail)initWithJSON:(id)a3
{
  return (GEORouteTrafficDetail *)-[GEORouteTrafficDetail _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5523;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5524;
    GEORouteTrafficDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteTrafficDetailIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteTrafficDetailReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORouteTrafficDetail readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_writtenRouteName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_spokenRouteName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_unabbreviatedRouteName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORouteTrafficDetail readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_routeTrafficCondition;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_writtenRouteName)
  {
    objc_msgSend(v5, "setWrittenRouteName:");
    v4 = v5;
  }
  if (self->_spokenRouteName)
  {
    objc_msgSend(v5, "setSpokenRouteName:");
    v4 = v5;
  }
  if (self->_unabbreviatedRouteName)
  {
    objc_msgSend(v5, "setUnabbreviatedRouteName:");
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
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
      GEORouteTrafficDetailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteTrafficDetail readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_routeTrafficCondition;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_writtenRouteName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_spokenRouteName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_unabbreviatedRouteName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *writtenRouteName;
  NSString *spokenRouteName;
  NSString *unabbreviatedRouteName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORouteTrafficDetail readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_routeTrafficCondition != *((_DWORD *)v4 + 15))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  writtenRouteName = self->_writtenRouteName;
  if ((unint64_t)writtenRouteName | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](writtenRouteName, "isEqual:"))
  {
    goto LABEL_13;
  }
  spokenRouteName = self->_spokenRouteName;
  if ((unint64_t)spokenRouteName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](spokenRouteName, "isEqual:"))
      goto LABEL_13;
  }
  unabbreviatedRouteName = self->_unabbreviatedRouteName;
  if ((unint64_t)unabbreviatedRouteName | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](unabbreviatedRouteName, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  -[GEORouteTrafficDetail readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_routeTrafficCondition;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_writtenRouteName, "hash") ^ v3;
  v5 = -[NSString hash](self->_spokenRouteName, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_unabbreviatedRouteName, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[16] & 1) != 0)
  {
    self->_routeTrafficCondition = v5[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[GEORouteTrafficDetail setWrittenRouteName:](self, "setWrittenRouteName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEORouteTrafficDetail setSpokenRouteName:](self, "setSpokenRouteName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEORouteTrafficDetail setUnabbreviatedRouteName:](self, "setUnabbreviatedRouteName:");
    v4 = v5;
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
      GEORouteTrafficDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5527);
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
    -[GEORouteTrafficDetail readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_unabbreviatedRouteName, 0);
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
