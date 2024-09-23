@implementation GEOPDSearchCTRStoreKeyValuePair

- (GEOPDSearchCTRStoreKeyValuePair)init
{
  GEOPDSearchCTRStoreKeyValuePair *v2;
  GEOPDSearchCTRStoreKeyValuePair *v3;
  GEOPDSearchCTRStoreKeyValuePair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  v2 = -[GEOPDSearchCTRStoreKeyValuePair init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchCTRStoreKeyValuePair)initWithData:(id)a3
{
  GEOPDSearchCTRStoreKeyValuePair *v3;
  GEOPDSearchCTRStoreKeyValuePair *v4;
  GEOPDSearchCTRStoreKeyValuePair *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  v3 = -[GEOPDSearchCTRStoreKeyValuePair initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  -[GEOPDSearchCTRStoreKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchCTRStoreKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCTRStoreKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unsigned int v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDSearchCTRStoreKeyValuePair readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("numTaps");
    else
      v17 = CFSTR("num_taps");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v5 = *(_BYTE *)(a1 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("numImpressions");
  else
    v19 = CFSTR("num_impressions");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("forwardSctr");
    else
      v23 = CFSTR("forward_sctr");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("numQueryTaps");
  else
    v21 = CFSTR("num_query_taps");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 2) != 0)
    goto LABEL_35;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("backwardSctr");
    else
      v7 = CFSTR("backward_sctr");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_11:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(_BYTE *)(a1 + 68) & 0x40) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_1);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v10 = *(id *)(a1 + 24);
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("query"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoHash_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v13 = *(id *)(a1 + 16);
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("geoHash"));

  v14 = *(_DWORD *)(a1 + 64) - 1;
  if (v14 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 64));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E1C0A5D8[v14];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("type"));

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchCTRStoreKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_275;
      else
        v6 = (int *)&readAll__nonRecursiveTag_276;
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCTRStoreKeyValuePairReadAllFrom((uint64_t)self, a3, 0);
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
    if (*(_BYTE *)&self->_flags <= 0x1Fu)
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
      goto LABEL_18;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 0);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0)
        goto LABEL_8;
LABEL_15:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((flags & 1) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  PBDataWriterWriteStringField();
  if (self->_geoHash)
    PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 0);
    flags = (char)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_numTaps;
      *(_BYTE *)(v5 + 68) |= 0x10u;
      flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 52) = self->_numImpressions;
    *(_BYTE *)(v5 + 68) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
LABEL_15:
    *(_DWORD *)(v5 + 56) = self->_numQueryTaps;
    *(_BYTE *)(v5 + 68) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0)
      {
LABEL_11:
        v10 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
        v11 = *(void **)(v5 + 24);
        *(_QWORD *)(v5 + 24) = v10;

        v12 = -[NSString copyWithZone:](self->_geoHash, "copyWithZone:", a3);
        v13 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v12;

        *(_DWORD *)(v5 + 64) = self->_type;
        return (id)v5;
      }
LABEL_10:
      *(_DWORD *)(v5 + 44) = self->_backwardSctr;
      *(_BYTE *)(v5 + 68) |= 1u;
      goto LABEL_11;
    }
LABEL_16:
    *(_DWORD *)(v5 + 48) = self->_forwardSctr;
    *(_BYTE *)(v5 + 68) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
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
  GEOPDSearchCTRStoreKeyValuePairReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  NSString *geoHash;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 1);
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_numTaps != *((_DWORD *)v4 + 15))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
LABEL_32:
    v7 = 0;
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_numImpressions != *((_DWORD *)v4 + 13))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_numQueryTaps != *((_DWORD *)v4 + 14))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_forwardSctr != *((_DWORD *)v4 + 12))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_backwardSctr != *((_DWORD *)v4 + 11))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_32;
  }
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](query, "isEqual:"))
    goto LABEL_32;
  geoHash = self->_geoHash;
  if ((unint64_t)geoHash | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](geoHash, "isEqual:"))
      goto LABEL_32;
  }
  v7 = self->_type == *((_DWORD *)v4 + 16);
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v3 = 2654435761 * self->_numTaps;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numImpressions;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numQueryTaps;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_forwardSctr;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_backwardSctr;
LABEL_12:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_query, "hash");
  return v8 ^ -[NSString hash](self->_geoHash, "hash") ^ (2654435761 * self->_type);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_geoHash, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
