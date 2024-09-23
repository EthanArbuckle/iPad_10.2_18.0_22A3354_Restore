@implementation GEOPDRelatedSearchSuggestion

- (GEOPDRelatedSearchSuggestion)init
{
  GEOPDRelatedSearchSuggestion *v2;
  GEOPDRelatedSearchSuggestion *v3;
  GEOPDRelatedSearchSuggestion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDRelatedSearchSuggestion;
  v2 = -[GEOPDRelatedSearchSuggestion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRelatedSearchSuggestion)initWithData:(id)a3
{
  GEOPDRelatedSearchSuggestion *v3;
  GEOPDRelatedSearchSuggestion *v4;
  GEOPDRelatedSearchSuggestion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDRelatedSearchSuggestion;
  v3 = -[GEOPDRelatedSearchSuggestion initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayString_tags_294);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDRelatedSearchSuggestion _readDisplayString]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 2u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readSuggestionEntryMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_295);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)suggestionEntryMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDRelatedSearchSuggestion _readSuggestionEntryMetadata]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 8u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readSearchBarDisplayToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedSearchSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchBarDisplayToken_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)searchBarDisplayToken
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDRelatedSearchSuggestion _readSearchBarDisplayToken]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setSearchBarDisplayToken:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
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
  v8.super_class = (Class)GEOPDRelatedSearchSuggestion;
  -[GEOPDRelatedSearchSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedSearchSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRelatedSearchSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  -[GEOPDRelatedSearchSuggestion readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedSearchSuggestion displayString]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayString");
    else
      v6 = CFSTR("display_string");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDRelatedSearchSuggestion suggestionEntryMetadata]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("suggestion_entry_metadata"));
    }
  }

  -[GEOPDRelatedSearchSuggestion searchBarDisplayToken]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("searchBarDisplayToken");
    else
      v11 = CFSTR("search_bar_display_token");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __58__GEOPDRelatedSearchSuggestion__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRelatedSearchSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_300;
      else
        v6 = (int *)&readAll__nonRecursiveTag_301;
      GEOPDRelatedSearchSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __58__GEOPDRelatedSearchSuggestion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("displayString");
      else
        v6 = CFSTR("display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        -[GEOPDRelatedSearchSuggestion setDisplayString:]((uint64_t)a1, v8);

      }
      if (a3)
        v9 = CFSTR("suggestionEntryMetadata");
      else
        v9 = CFSTR("suggestion_entry_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        -[GEOPDRelatedSearchSuggestion setSuggestionEntryMetadata:]((uint64_t)a1, v11);

      }
      if (a3)
        v12 = CFSTR("searchBarDisplayToken");
      else
        v12 = CFSTR("search_bar_display_token");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        -[GEOPDRelatedSearchSuggestion setSearchBarDisplayToken:]((uint64_t)a1, v14);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRelatedSearchSuggestionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 0);
    if (self->_displayString)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_searchBarDisplayToken)
    {
      PBDataWriterWriteStringField();
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
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_displayString, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSString copyWithZone:](self->_searchBarDisplayToken, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDRelatedSearchSuggestionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *displayString;
  NSData *suggestionEntryMetadata;
  NSString *searchBarDisplayToken;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 1),
         -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)v4, 1),
         displayString = self->_displayString,
         !((unint64_t)displayString | v4[3]))
     || -[NSString isEqual:](displayString, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata, !((unint64_t)suggestionEntryMetadata | v4[5]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:")))
  {
    searchBarDisplayToken = self->_searchBarDisplayToken;
    if ((unint64_t)searchBarDisplayToken | v4[4])
      v8 = -[NSString isEqual:](searchBarDisplayToken, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayString, "hash");
  v4 = -[NSData hash](self->_suggestionEntryMetadata, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_searchBarDisplayToken, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    -[GEOPDRelatedSearchSuggestion readAll:]((uint64_t)v3, 0);
    v3 = v7;
    v4 = (void *)v7[3];
    if (v4)
    {
      -[GEOPDRelatedSearchSuggestion setDisplayString:](a1, v4);
      v3 = v7;
    }
    v5 = (void *)v3[5];
    if (v5)
    {
      -[GEOPDRelatedSearchSuggestion setSuggestionEntryMetadata:](a1, v5);
      v3 = v7;
    }
    v6 = (void *)v3[4];
    if (v6)
    {
      -[GEOPDRelatedSearchSuggestion setSearchBarDisplayToken:](a1, v6);
      v3 = v7;
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 1u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDRelatedSearchSuggestion readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_searchBarDisplayToken, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
