@implementation GEOPDDisplayHeaderSubstitute

- (GEOPDDisplayHeaderSubstitute)init
{
  GEOPDDisplayHeaderSubstitute *v2;
  GEOPDDisplayHeaderSubstitute *v3;
  GEOPDDisplayHeaderSubstitute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  v2 = -[GEOPDDisplayHeaderSubstitute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDisplayHeaderSubstitute)initWithData:(id)a3
{
  GEOPDDisplayHeaderSubstitute *v3;
  GEOPDDisplayHeaderSubstitute *v4;
  GEOPDDisplayHeaderSubstitute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  v3 = -[GEOPDDisplayHeaderSubstitute initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)substituteType
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

- (void)_readInterpretedQuery
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
        GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInterpretedQuery_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)interpretedQuery
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDisplayHeaderSubstitute _readInterpretedQuery]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readRelatedSearchSuggestion
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
        GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedSearchSuggestion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)relatedSearchSuggestion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDisplayHeaderSubstitute _readRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v1[4];
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
  v8.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  -[GEOPDDisplayHeaderSubstitute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDisplayHeaderSubstitute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDisplayHeaderSubstitute _dictionaryRepresentation:]((uint64_t)self, 0);
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
  -[GEOPDDisplayHeaderSubstitute readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v5 = *(int *)(a1 + 52);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04A58[v5];
    }
    if (a2)
      v7 = CFSTR("substituteType");
    else
      v7 = CFSTR("substitute_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDDisplayHeaderSubstitute interpretedQuery]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("interpretedQuery");
    else
      v9 = CFSTR("interpreted_query");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  -[GEOPDDisplayHeaderSubstitute relatedSearchSuggestion]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("relatedSearchSuggestion");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("related_search_suggestion");
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
      v21[2] = __58__GEOPDDisplayHeaderSubstitute__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDDisplayHeaderSubstitute _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2201;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2202;
      GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDRelatedSearchSuggestion readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __58__GEOPDDisplayHeaderSubstitute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDDisplayHeaderSubstituteReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEOPDDisplayHeaderSubstituteIsDirty((uint64_t)self))
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
    -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_interpretedQuery)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_relatedSearchSuggestion)
    {
      PBDataWriterWriteSubmessage();
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
  uint64_t v9;
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
      GEOPDDisplayHeaderSubstituteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_substituteType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_interpretedQuery, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDRelatedSearchSuggestion copyWithZone:](self->_relatedSearchSuggestion, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *interpretedQuery;
  GEOPDRelatedSearchSuggestion *relatedSearchSuggestion;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 1);
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_substituteType != *((_DWORD *)v4 + 13))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  interpretedQuery = self->_interpretedQuery;
  if ((unint64_t)interpretedQuery | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](interpretedQuery, "isEqual:"))
  {
    goto LABEL_11;
  }
  relatedSearchSuggestion = self->_relatedSearchSuggestion;
  if ((unint64_t)relatedSearchSuggestion | *((_QWORD *)v4 + 4))
    v7 = -[GEOPDRelatedSearchSuggestion isEqual:](relatedSearchSuggestion, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_substituteType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_interpretedQuery, "hash") ^ v3;
  return v4 ^ -[GEOPDRelatedSearchSuggestion hash](self->_relatedSearchSuggestion, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_interpretedQuery, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
