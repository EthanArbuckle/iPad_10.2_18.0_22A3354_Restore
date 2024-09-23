@implementation GEOPDPaginationInfo

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD *v7;

  v7 = a2;
  -[GEOPDPaginationInfo readAll:]((uint64_t)v7, 0);
  v3 = v7;
  v4 = (void *)v7[4];
  if (v4)
  {
    -[GEOPDPaginationInfo setPrevPageToken:](a1, v4);
    v3 = v7;
  }
  v5 = (void *)v3[3];
  if (v5)
  {
    -[GEOPDPaginationInfo setNextPageToken:](a1, v5);
    v3 = v7;
  }
  v6 = *((_BYTE *)v3 + 60);
  if ((v6 & 1) != 0)
  {
    *(_DWORD *)(a1 + 52) = *((_DWORD *)v3 + 13);
    *(_BYTE *)(a1 + 60) |= 1u;
    v6 = *((_BYTE *)v3 + 60);
  }
  if ((v6 & 2) != 0)
  {
    *(_DWORD *)(a1 + 56) = *((_DWORD *)v3 + 14);
    *(_BYTE *)(a1 + 60) |= 2u;
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPaginationInfo readAll:](a1, 0);
  }
}

- (GEOPDPaginationInfo)init
{
  GEOPDPaginationInfo *v2;
  GEOPDPaginationInfo *v3;
  GEOPDPaginationInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPaginationInfo;
  v2 = -[GEOPDPaginationInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPaginationInfo)initWithData:(id)a3
{
  GEOPDPaginationInfo *v3;
  GEOPDPaginationInfo *v4;
  GEOPDPaginationInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPaginationInfo;
  v3 = -[GEOPDPaginationInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setPrevPageToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 0x10u;
  *(_BYTE *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setNextPageToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 8u;
  *(_BYTE *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDPaginationInfo;
  -[GEOPDPaginationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPaginationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPaginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  -[GEOPDPaginationInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDPaginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrevPageToken_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("prevPageToken");
    else
      v8 = CFSTR("prev_page_token");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDPaginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNextPageToken_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v11 = *(id *)(a1 + 24);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("nextPageToken");
    else
      v12 = CFSTR("next_page_token");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = *(_BYTE *)(a1 + 60);
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("totalPageCount");
    else
      v15 = CFSTR("total_page_count");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_BYTE *)(a1 + 60);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("totalResults");
    else
      v17 = CFSTR("total_results");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __49__GEOPDPaginationInfo__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPaginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_3485;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3486;
      GEOPDPaginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __49__GEOPDPaginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  int v18;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("prevPageToken");
    else
      v7 = CFSTR("prev_page_token");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[GEOPDPaginationInfo setPrevPageToken:](v6, v9);

    }
    if (a3)
      v10 = CFSTR("nextPageToken");
    else
      v10 = CFSTR("next_page_token");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[GEOPDPaginationInfo setNextPageToken:](v6, v12);

    }
    if (a3)
      v13 = CFSTR("totalPageCount");
    else
      v13 = CFSTR("total_page_count");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "unsignedIntValue");
      *(_BYTE *)(v6 + 60) |= 0x20u;
      *(_BYTE *)(v6 + 60) |= 1u;
      *(_DWORD *)(v6 + 52) = v15;
    }

    if (a3)
      v16 = CFSTR("totalResults");
    else
      v16 = CFSTR("total_results");
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "unsignedIntValue");
      *(_BYTE *)(v6 + 60) |= 0x20u;
      *(_BYTE *)(v6 + 60) |= 2u;
      *(_DWORD *)(v6 + 56) = v18;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPaginationInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPaginationInfo readAll:]((uint64_t)self, 0);
    if (self->_prevPageToken)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_nextPageToken)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char flags;
  PBUnknownFields *v14;

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
      GEOPDPaginationInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_prevPageToken, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_nextPageToken, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_totalPageCount;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_totalResults;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *prevPageToken;
  NSString *nextPageToken;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPaginationInfo readAll:]((uint64_t)v4, 1);
  prevPageToken = self->_prevPageToken;
  if ((unint64_t)prevPageToken | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](prevPageToken, "isEqual:"))
      goto LABEL_15;
  }
  nextPageToken = self->_nextPageToken;
  if ((unint64_t)nextPageToken | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](nextPageToken, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_totalPageCount != *((_DWORD *)v4 + 13))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_totalResults != *((_DWORD *)v4 + 14))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDPaginationInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_prevPageToken, "hash");
  v4 = -[NSString hash](self->_nextPageToken, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_totalPageCount;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_totalResults;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevPageToken, 0);
  objc_storeStrong((id *)&self->_nextPageToken, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
