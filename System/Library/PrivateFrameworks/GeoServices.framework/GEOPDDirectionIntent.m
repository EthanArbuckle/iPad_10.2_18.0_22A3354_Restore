@implementation GEOPDDirectionIntent

- (GEOPDDirectionIntent)init
{
  GEOPDDirectionIntent *v2;
  GEOPDDirectionIntent *v3;
  GEOPDDirectionIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDDirectionIntent;
  v2 = -[GEOPDDirectionIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDirectionIntent)initWithData:(id)a3
{
  GEOPDDirectionIntent *v3;
  GEOPDDirectionIntent *v4;
  GEOPDDirectionIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDDirectionIntent;
  v3 = -[GEOPDDirectionIntent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOrigin
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
        GEOPDDirectionIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOrigin_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)origin
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDirectionIntent _readOrigin]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setOrigin:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 56) |= 8u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readDestination
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDirectionIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestination_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)destination
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDirectionIntent _readDestination]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDestination:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 56) |= 4u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (uint64_t)transportType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 52);
    else
      return 0;
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
  v8.super_class = (Class)GEOPDDirectionIntent;
  -[GEOPDDirectionIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDirectionIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v11;
  __CFString *v12;
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
  -[GEOPDDirectionIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDirectionIntent origin]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("origin"));

  }
  -[GEOPDDirectionIntent destination]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("destination"));

  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v11 = *(int *)(a1 + 52);
    if (v11 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C0B920[v11];
    }
    if (a2)
      v13 = CFSTR("transportType");
    else
      v13 = CFSTR("transport_type");
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
      v21[2] = __50__GEOPDDirectionIntent__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_3063;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3064;
      GEOPDDirectionIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __50__GEOPDDirectionIntent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v6;
  GEOPDResolvedItem *v7;
  void *v8;
  void *v9;
  GEOPDResolvedItem *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  int v15;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDResolvedItem alloc];
        if (v7)
          v8 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v7, v6, a3);
        else
          v8 = 0;
        -[GEOPDDirectionIntent setOrigin:](a1, v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPDResolvedItem alloc];
        if (v10)
          v11 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v10, v9, a3);
        else
          v11 = 0;
        -[GEOPDDirectionIntent setDestination:](a1, v11);

      }
      if (a3)
        v12 = CFSTR("transportType");
      else
        v12 = CFSTR("transport_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v15 = 0;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v15 = 1;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v15 = 2;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v15 = 3;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v15 = 4;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v15 = 5;
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v15 = 6;
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_34:

          goto LABEL_35;
        }
        v15 = objc_msgSend(v13, "intValue");
      }
      *(_BYTE *)(a1 + 56) |= 0x10u;
      *(_BYTE *)(a1 + 56) |= 1u;
      *(_DWORD *)(a1 + 52) = v15;
      goto LABEL_34;
    }
  }
LABEL_35:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOPDDirectionIntent readAll:]((uint64_t)self, 0);
    if (self->_origin)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_destination)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
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
  id v11;
  void *v12;
  PBUnknownFields *v13;

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
      GEOPDDirectionIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDResolvedItem copyWithZone:](self->_origin, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPDResolvedItem copyWithZone:](self->_destination, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_transportType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDResolvedItem *origin;
  GEOPDResolvedItem *destination;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 1);
  -[GEOPDDirectionIntent readAll:]((uint64_t)v4, 1);
  origin = self->_origin;
  if ((unint64_t)origin | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResolvedItem isEqual:](origin, "isEqual:"))
      goto LABEL_10;
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDResolvedItem isEqual:](destination, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_transportType == *((_DWORD *)v4 + 13))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDResolvedItem hash](self->_origin, "hash");
  v4 = -[GEOPDResolvedItem hash](self->_destination, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_transportType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_16;
  v9 = v3;
  -[GEOPDDirectionIntent readAll:]((uint64_t)v3, 0);
  v4 = v9;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)v9[4];
  if (v5)
  {
    if (!v6)
      goto LABEL_8;
    -[GEOPDResolvedItem mergeFrom:](v5, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    -[GEOPDDirectionIntent setOrigin:](a1, v6);
  }
  v4 = v9;
LABEL_8:
  v7 = *(_QWORD *)(a1 + 24);
  v8 = (void *)v4[3];
  if (v7)
  {
    if (!v8)
      goto LABEL_14;
    -[GEOPDResolvedItem mergeFrom:](v7, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[GEOPDDirectionIntent setDestination:](a1, v8);
  }
  v4 = v9;
LABEL_14:
  if ((v4[7] & 1) != 0)
  {
    *(_DWORD *)(a1 + 52) = *((_DWORD *)v4 + 13);
    *(_BYTE *)(a1 + 56) |= 1u;
  }
LABEL_16:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 56) |= 2u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDDirectionIntent readAll:](a1, 0);
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      v7 = *(_QWORD *)(a1 + 24);
      if (v7)
      {
        v8 = *(void **)(v7 + 8);
        *(_QWORD *)(v7 + 8) = 0;

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
