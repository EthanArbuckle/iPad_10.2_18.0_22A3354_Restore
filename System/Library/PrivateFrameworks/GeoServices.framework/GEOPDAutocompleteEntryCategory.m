@implementation GEOPDAutocompleteEntryCategory

- (GEOPDAutocompleteEntryCategory)init
{
  GEOPDAutocompleteEntryCategory *v2;
  GEOPDAutocompleteEntryCategory *v3;
  GEOPDAutocompleteEntryCategory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryCategory;
  v2 = -[GEOPDAutocompleteEntryCategory init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryCategory)initWithData:(id)a3
{
  GEOPDAutocompleteEntryCategory *v3;
  GEOPDAutocompleteEntryCategory *v4;
  GEOPDAutocompleteEntryCategory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryCategory;
  v3 = -[GEOPDAutocompleteEntryCategory initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDisplayName
{
  -[GEOPDAutocompleteEntryCategory _readDisplayName]((uint64_t)self);
  return self->_displayName != 0;
}

- (GEOLocalizedString)displayName
{
  -[GEOPDAutocompleteEntryCategory _readDisplayName]((uint64_t)self);
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)_readStyleAttributes
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
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPDAutocompleteEntryCategory _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDAutocompleteEntryCategory _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSuggestionEntryMetadata
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
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSuggestionEntryMetadata
{
  -[GEOPDAutocompleteEntryCategory _readSuggestionEntryMetadata]((uint64_t)self);
  return self->_suggestionEntryMetadata != 0;
}

- (NSData)suggestionEntryMetadata
{
  -[GEOPDAutocompleteEntryCategory _readSuggestionEntryMetadata]((uint64_t)self);
  return self->_suggestionEntryMetadata;
}

- (void)setSuggestionEntryMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, a3);
}

- (void)_readVenueIdentifier
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
        GEOPDAutocompleteEntryCategoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVenueIdentifier
{
  -[GEOPDAutocompleteEntryCategory _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOPDAutocompleteEntryCategory _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
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
  v8.super_class = (Class)GEOPDAutocompleteEntryCategory;
  -[GEOPDAutocompleteEntryCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryCategory _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("displayName"));

  }
  objc_msgSend(a1, "styleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend(a1, "suggestionEntryMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("suggestion_entry_metadata"));
    }
  }

  objc_msgSend(a1, "venueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("venueIdentifier");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("venue_identifier");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  v19 = (void *)a1[2];
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
      v26[2] = __60__GEOPDAutocompleteEntryCategory__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteEntryCategory _dictionaryRepresentation:](self, 1);
}

void __60__GEOPDAutocompleteEntryCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryCategory)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryCategory *)-[GEOPDAutocompleteEntryCategory _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLocalizedString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOStyleAttributes *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPDVenueIdentifier *v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOLocalizedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLocalizedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLocalizedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setDisplayName:", v8);

      }
      if (a3)
        v10 = CFSTR("styleAttributes");
      else
        v10 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOStyleAttributes initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOStyleAttributes initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setStyleAttributes:", v13);

      }
      if (a3)
        v15 = CFSTR("suggestionEntryMetadata");
      else
        v15 = CFSTR("suggestion_entry_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
        objc_msgSend(a1, "setSuggestionEntryMetadata:", v17);

      }
      if (a3)
        v18 = CFSTR("venueIdentifier");
      else
        v18 = CFSTR("venue_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPDVenueIdentifier alloc];
        if (v20)
          v21 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v20, v19, a3);
        else
          v21 = 0;
        objc_msgSend(a1, "setVenueIdentifier:", v21);

      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryCategory)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryCategory *)-[GEOPDAutocompleteEntryCategory _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_484;
    else
      v8 = (int *)&readAll__nonRecursiveTag_485;
    GEOPDAutocompleteEntryCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteEntryCategoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryCategoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryCategoryReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEOPDAutocompleteEntryCategoryIsDirty((uint64_t)self))
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
    -[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 0);
    if (self->_displayName)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_venueIdentifier)
    {
      PBDataWriterWriteSubmessage();
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
  -[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_displayName)
    objc_msgSend(v5, "setDisplayName:");
  if (self->_styleAttributes)
    objc_msgSend(v5, "setStyleAttributes:");
  v4 = v5;
  if (self->_suggestionEntryMetadata)
  {
    objc_msgSend(v5, "setSuggestionEntryMetadata:");
    v4 = v5;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v5, "setVenueIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 0);
    v8 = -[GEOLocalizedString copyWithZone:](self->_displayName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[GEOPDVenueIdentifier copyWithZone:](self->_venueIdentifier, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDAutocompleteEntryCategoryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLocalizedString *displayName;
  GEOStyleAttributes *styleAttributes;
  NSData *suggestionEntryMetadata;
  GEOPDVenueIdentifier *venueIdentifier;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[3]))
     || -[GEOLocalizedString isEqual:](displayName, "isEqual:"))
    && ((styleAttributes = self->_styleAttributes, !((unint64_t)styleAttributes | v4[4]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata, !((unint64_t)suggestionEntryMetadata | v4[5]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:")))
  {
    venueIdentifier = self->_venueIdentifier;
    if ((unint64_t)venueIdentifier | v4[6])
      v9 = -[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 1);
  v3 = -[GEOLocalizedString hash](self->_displayName, "hash");
  v4 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash") ^ v3;
  v5 = -[NSData hash](self->_suggestionEntryMetadata, "hash");
  return v4 ^ v5 ^ -[GEOPDVenueIdentifier hash](self->_venueIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOLocalizedString *displayName;
  uint64_t v5;
  GEOStyleAttributes *styleAttributes;
  uint64_t v7;
  GEOPDVenueIdentifier *venueIdentifier;
  void *v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  displayName = self->_displayName;
  v5 = v10[3];
  if (displayName)
  {
    if (v5)
      -[GEOLocalizedString mergeFrom:](displayName, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDAutocompleteEntryCategory setDisplayName:](self, "setDisplayName:");
  }
  styleAttributes = self->_styleAttributes;
  v7 = v10[4];
  if (styleAttributes)
  {
    if (v7)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPDAutocompleteEntryCategory setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (v10[5])
    -[GEOPDAutocompleteEntryCategory setSuggestionEntryMetadata:](self, "setSuggestionEntryMetadata:");
  venueIdentifier = self->_venueIdentifier;
  v9 = (void *)v10[6];
  if (venueIdentifier)
  {
    if (v9)
      -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v9);
  }
  else if (v9)
  {
    -[GEOPDAutocompleteEntryCategory setVenueIdentifier:](self, "setVenueIdentifier:", v10[6]);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_488);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteEntryCategory readAll:](self, "readAll:", 0);
    -[GEOLocalizedString clearUnknownFields:](self->_displayName, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)self->_venueIdentifier, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
