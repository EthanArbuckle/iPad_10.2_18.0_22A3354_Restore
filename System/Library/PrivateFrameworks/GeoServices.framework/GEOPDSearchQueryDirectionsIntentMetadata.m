@implementation GEOPDSearchQueryDirectionsIntentMetadata

- (GEOPDSearchQueryDirectionsIntentMetadata)init
{
  GEOPDSearchQueryDirectionsIntentMetadata *v2;
  GEOPDSearchQueryDirectionsIntentMetadata *v3;
  GEOPDSearchQueryDirectionsIntentMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  v2 = -[GEOPDSearchQueryDirectionsIntentMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryDirectionsIntentMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryDirectionsIntentMetadata *v3;
  GEOPDSearchQueryDirectionsIntentMetadata *v4;
  GEOPDSearchQueryDirectionsIntentMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  v3 = -[GEOPDSearchQueryDirectionsIntentMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  -[GEOPDSearchQueryDirectionsIntentMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryDirectionsIntentMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryDirectionsIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  char v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  id v23;
  id v24;

  if (a1)
  {
    -[GEOPDSearchQueryDirectionsIntentMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      v5 = *(int *)(a1 + 52);
      if (v5 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0A698[v5];
      }
      if (a2)
        v7 = CFSTR("intentType");
      else
        v7 = CFSTR("intent_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionPhrase_tags);
        objc_sync_exit(v9);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v10 = *(id *)(a1 + 16);
    if (v10)
    {
      if (a2)
        v11 = CFSTR("directionPhrase");
      else
        v11 = CFSTR("direction_phrase");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
    }

    v12 = *(_BYTE *)(a1 + 68);
    if ((v12 & 8) != 0)
    {
      v13 = *(int *)(a1 + 64);
      if (v13 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E1C0A6C8[v13];
      }
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("type"));

      v12 = *(_BYTE *)(a1 + 68);
    }
    if ((v12 & 2) != 0)
    {
      v15 = *(int *)(a1 + 56);
      if (v15 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E1C0A700[v15];
      }
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("preposition1"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        v18 = v17;
        objc_sync_enter(v18);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace1_tags);
        objc_sync_exit(v18);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v19 = *(id *)(a1 + 24);
    if (v19)
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("place1"));

    if ((*(_BYTE *)(a1 + 68) & 4) != 0)
    {
      v20 = *(int *)(a1 + 60);
      if (v20 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E1C0A700[v20];
      }
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("preposition2"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 68) & 0x40) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        v23 = v22;
        objc_sync_enter(v23);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace2_tags);
        objc_sync_exit(v23);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v24 = *(id *)(a1 + 32);
    if (v24)
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("place2"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryDirectionsIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_940;
      else
        v6 = (int *)&readAll__nonRecursiveTag_941;
      GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryDirectionsIntentMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0xFu))
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
    -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_directionPhrase)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_place1)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_place2)
      PBDataWriterWriteStringField();
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
  char flags;
  uint64_t v12;
  void *v13;
  uint64_t v14;

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
      GEOPDSearchQueryDirectionsIntentMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_intentType;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_directionPhrase, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(_BYTE *)(v5 + 68) |= 8u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_preposition1;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_place1, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_preposition2;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_place2, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *directionPhrase;
  NSString *place1;
  NSString *place2;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)v4, 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 68);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_intentType != *((_DWORD *)v4 + 13))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_30;
  }
  directionPhrase = self->_directionPhrase;
  if ((unint64_t)directionPhrase | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](directionPhrase, "isEqual:"))
      goto LABEL_30;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_type != *((_DWORD *)v4 + 16))
      goto LABEL_30;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_preposition1 != *((_DWORD *)v4 + 14))
      goto LABEL_30;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  place1 = self->_place1;
  if ((unint64_t)place1 | *((_QWORD *)v4 + 3))
  {
    if (-[NSString isEqual:](place1, "isEqual:"))
    {
      flags = (char)self->_flags;
      v6 = *((_BYTE *)v4 + 68);
      goto LABEL_23;
    }
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
LABEL_23:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_preposition2 != *((_DWORD *)v4 + 15))
      goto LABEL_30;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_30;
  }
  place2 = self->_place2;
  if ((unint64_t)place2 | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](place2, "isEqual:");
  else
    v10 = 1;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_intentType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_directionPhrase, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v5 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_preposition1;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[NSString hash](self->_place1, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v8 = 2654435761 * self->_preposition2;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_place2, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place2, 0);
  objc_storeStrong((id *)&self->_place1, 0);
  objc_storeStrong((id *)&self->_directionPhrase, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
