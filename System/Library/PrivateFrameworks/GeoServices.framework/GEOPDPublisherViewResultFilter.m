@implementation GEOPDPublisherViewResultFilter

- (BOOL)hasGreenTeaWithValue:(_BOOL8)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    -[GEOPDPublisherViewResultFilter _readFilterAddress](result);
    v4 = *(_QWORD *)(v3 + 24);
    return v4 && (objc_msgSend(*(id *)(v4 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0;
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 56) |= 2u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPublisherViewResultFilter readAll:](a1, 0);
    v3 = *(_QWORD *)(a1 + 24);
    if (v3)
    {
      v4 = *(void **)(v3 + 8);
      *(_QWORD *)(v3 + 8) = 0;

      objc_msgSend(*(id *)(v3 + 16), "clearUnknownFields:", 1);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = *(void **)(v5 + 8);
      *(_QWORD *)(v5 + 8) = 0;

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(v5 + 16), 1);
    }
  }
}

- (GEOPDPublisherViewResultFilter)init
{
  GEOPDPublisherViewResultFilter *v2;
  GEOPDPublisherViewResultFilter *v3;
  GEOPDPublisherViewResultFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPublisherViewResultFilter;
  v2 = -[GEOPDPublisherViewResultFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPublisherViewResultFilter)initWithData:(id)a3
{
  GEOPDPublisherViewResultFilter *v3;
  GEOPDPublisherViewResultFilter *v4;
  GEOPDPublisherViewResultFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPublisherViewResultFilter;
  v3 = -[GEOPDPublisherViewResultFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)filterType
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

- (void)_readFilterAddress
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
        GEOPDPublisherViewResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilterAddress_tags_4804);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPublisherViewResultFilter _readFilterAddress]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setFilterAddress:(uint64_t)a1
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

- (void)_readFilterKeyword
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
        GEOPDPublisherViewResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilterKeyword_tags_4805);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterKeyword
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPublisherViewResultFilter _readFilterKeyword]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setFilterKeyword:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPublisherViewResultFilter;
  -[GEOPDPublisherViewResultFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPublisherViewResultFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisherViewResultFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  -[GEOPDPublisherViewResultFilter readAll:](a1, 1);
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
      v6 = off_1E1C04E38[v5];
    }
    if (a2)
      v7 = CFSTR("filterType");
    else
      v7 = CFSTR("filter_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDPublisherViewResultFilter filterAddress]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("filterAddress");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("filter_address");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  -[GEOPDPublisherViewResultFilter filterKeyword]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("filterKeyword");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("filter_keyword");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __60__GEOPDPublisherViewResultFilter__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPublisherViewResultFilter _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4808;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4809;
      GEOPDPublisherViewResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __60__GEOPDPublisherViewResultFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  GEOPDPublisherViewResultFilterAddress *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  GEOPDMapsIdentifier *v17;
  GEOPDMapsIdentifier *v18;
  GEOPDMapsIdentifier *v19;
  const __CFString *v20;
  void *v21;
  GEOPDPublisherViewResultFilterKeyword *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  GEOPDRelatedSearchSuggestion *v26;
  void *v27;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_51;
  if (a3)
    v7 = CFSTR("filterType");
  else
    v7 = CFSTR("filter_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PUBLISHER_VIEW_RESULT_FILTER_TYPE_UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PUBLISHER_VIEW_RESULT_FILTER_TYPE_ADDRESS")) & 1) != 0)
    {
      v10 = 1;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PUBLISHER_VIEW_RESULT_FILTER_TYPE_KEYWORD")))
    {
      v10 = 2;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_16:
    *(_BYTE *)(v6 + 56) |= 0x10u;
    *(_BYTE *)(v6 + 56) |= 1u;
    *(_DWORD *)(v6 + 52) = v10;
  }

  if (a3)
    v11 = CFSTR("filterAddress");
  else
    v11 = CFSTR("filter_address");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDPublisherViewResultFilterAddress alloc];
    if (v13)
    {
      v14 = v12;
      v13 = -[GEOPDPublisherViewResultFilterAddress init](v13, "init");
      if (v13)
      {
        if (a3)
          v15 = CFSTR("geoId");
        else
          v15 = CFSTR("geo_id");
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = [GEOPDMapsIdentifier alloc];
          if ((a3 & 1) != 0)
            v18 = -[GEOPDMapsIdentifier initWithJSON:](v17, "initWithJSON:", v16);
          else
            v18 = -[GEOPDMapsIdentifier initWithDictionary:](v17, "initWithDictionary:", v16);
          v19 = v18;
          -[GEOPDPublisherViewResultFilterAddress setGeoId:]((uint64_t)v13, v18);

        }
      }

    }
    -[GEOPDPublisherViewResultFilter setFilterAddress:](v6, v13);

  }
  if (a3)
    v20 = CFSTR("filterKeyword");
  else
    v20 = CFSTR("filter_keyword");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPDPublisherViewResultFilterKeyword alloc];
    if (v22)
    {
      v23 = v21;
      v22 = -[GEOPDPublisherViewResultFilterKeyword init](v22, "init");
      if (v22)
      {
        if (a3)
          v24 = CFSTR("relatedSearchSuggestion");
        else
          v24 = CFSTR("related_search_suggestion");
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = [GEOPDRelatedSearchSuggestion alloc];
          if (v26)
            v27 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v26, v25, a3);
          else
            v27 = 0;
          -[GEOPDPublisherViewResultFilterKeyword setRelatedSearchSuggestion:]((uint64_t)v22, v27);

        }
      }

    }
    -[GEOPDPublisherViewResultFilter setFilterKeyword:](v6, v22);

  }
LABEL_51:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherViewResultFilterReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_filterAddress)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_filterKeyword)
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
      GEOPDPublisherViewResultFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_filterType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[GEOPDPublisherViewResultFilterAddress copyWithZone:](self->_filterAddress, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDPublisherViewResultFilterKeyword copyWithZone:](self->_filterKeyword, "copyWithZone:", a3);
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
  GEOPDPublisherViewResultFilterAddress *filterAddress;
  GEOPDPublisherViewResultFilterKeyword *filterKeyword;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)self, 1);
  -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 13))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  filterAddress = self->_filterAddress;
  if ((unint64_t)filterAddress | *((_QWORD *)v4 + 3)
    && !-[GEOPDPublisherViewResultFilterAddress isEqual:](filterAddress, "isEqual:"))
  {
    goto LABEL_11;
  }
  filterKeyword = self->_filterKeyword;
  if ((unint64_t)filterKeyword | *((_QWORD *)v4 + 4))
    v7 = -[GEOPDPublisherViewResultFilterKeyword isEqual:](filterKeyword, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_filterType;
  else
    v3 = 0;
  v4 = -[GEOPDPublisherViewResultFilterAddress hash](self->_filterAddress, "hash") ^ v3;
  return v4 ^ -[GEOPDPublisherViewResultFilterKeyword hash](self->_filterKeyword, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterKeyword, 0);
  objc_storeStrong((id *)&self->_filterAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
