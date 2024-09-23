@implementation GEOSearchCategoryStorage

- (GEOSearchCategoryStorage)init
{
  GEOSearchCategoryStorage *v2;
  GEOSearchCategoryStorage *v3;
  GEOSearchCategoryStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSearchCategoryStorage;
  v2 = -[GEOSearchCategoryStorage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSearchCategoryStorage)initWithData:(id)a3
{
  GEOSearchCategoryStorage *v3;
  GEOSearchCategoryStorage *v4;
  GEOSearchCategoryStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSearchCategoryStorage;
  v3 = -[GEOSearchCategoryStorage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBrowseCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchCategoryStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrowseCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasBrowseCategory
{
  -[GEOSearchCategoryStorage _readBrowseCategory]((uint64_t)self);
  return self->_browseCategory != 0;
}

- (GEOPDBrowseCategory)browseCategory
{
  -[GEOSearchCategoryStorage _readBrowseCategory]((uint64_t)self);
  return self->_browseCategory;
}

- (void)setBrowseCategory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_browseCategory, a3);
}

- (void)_readAutocompleteEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchCategoryStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteEntry_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAutocompleteEntry
{
  -[GEOSearchCategoryStorage _readAutocompleteEntry]((uint64_t)self);
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  -[GEOSearchCategoryStorage _readAutocompleteEntry]((uint64_t)self);
  return self->_autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_autocompleteEntry, a3);
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
  v8.super_class = (Class)GEOSearchCategoryStorage;
  -[GEOSearchCategoryStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchCategoryStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchCategoryStorage _dictionaryRepresentation:](self, 0);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "browseCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("browseCategory"));

  }
  objc_msgSend(a1, "autocompleteEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("autocompleteEntry"));

  }
  v11 = (void *)a1[2];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__GEOSearchCategoryStorage__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchCategoryStorage _dictionaryRepresentation:](self, 1);
}

void __54__GEOSearchCategoryStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSearchCategoryStorage)initWithDictionary:(id)a3
{
  return (GEOSearchCategoryStorage *)-[GEOSearchCategoryStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDBrowseCategory *v7;
  void *v8;
  void *v9;
  GEOPDAutocompleteEntry *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("browseCategory"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDBrowseCategory alloc];
        if (v7)
          v8 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v7, v6, a3);
        else
          v8 = 0;
        objc_msgSend(a1, "setBrowseCategory:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autocompleteEntry"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPDAutocompleteEntry alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOPDAutocompleteEntry initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOPDAutocompleteEntry initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setAutocompleteEntry:", v11);

      }
    }
  }

  return a1;
}

- (GEOSearchCategoryStorage)initWithJSON:(id)a3
{
  return (GEOSearchCategoryStorage *)-[GEOSearchCategoryStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2684;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2685;
    GEOSearchCategoryStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDBrowseCategory readAll:]((uint64_t)self->_browseCategory, 1);
    -[GEOPDAutocompleteEntry readAll:](self->_autocompleteEntry, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchCategoryStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchCategoryStorageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOSearchCategoryStorageIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOSearchCategoryStorage readAll:](self, "readAll:", 0);
    if (self->_browseCategory)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_autocompleteEntry)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOSearchCategoryStorageClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOSearchCategoryStorage _readAutocompleteEntry]((uint64_t)self);
  return -[GEOPDAutocompleteEntry hasGreenTeaWithValue:](self->_autocompleteEntry, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOSearchCategoryStorage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_browseCategory)
    objc_msgSend(v4, "setBrowseCategory:");
  if (self->_autocompleteEntry)
    objc_msgSend(v4, "setAutocompleteEntry:");

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSearchCategoryStorage readAll:](self, "readAll:", 0);
    v8 = -[GEOPDBrowseCategory copyWithZone:](self->_browseCategory, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOPDAutocompleteEntry copyWithZone:](self->_autocompleteEntry, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOSearchCategoryStorageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDBrowseCategory *browseCategory;
  GEOPDAutocompleteEntry *autocompleteEntry;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSearchCategoryStorage readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         browseCategory = self->_browseCategory,
         !((unint64_t)browseCategory | v4[4]))
     || -[GEOPDBrowseCategory isEqual:](browseCategory, "isEqual:")))
  {
    autocompleteEntry = self->_autocompleteEntry;
    if ((unint64_t)autocompleteEntry | v4[3])
      v7 = -[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOSearchCategoryStorage readAll:](self, "readAll:", 1);
  v3 = -[GEOPDBrowseCategory hash](self->_browseCategory, "hash");
  return -[GEOPDAutocompleteEntry hash](self->_autocompleteEntry, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOPDBrowseCategory *browseCategory;
  void *v5;
  GEOPDAutocompleteEntry *autocompleteEntry;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  browseCategory = self->_browseCategory;
  v5 = (void *)v8[4];
  if (browseCategory)
  {
    if (v5)
      -[GEOPDBrowseCategory mergeFrom:]((uint64_t)browseCategory, v5);
  }
  else if (v5)
  {
    -[GEOSearchCategoryStorage setBrowseCategory:](self, "setBrowseCategory:", v8[4]);
  }
  autocompleteEntry = self->_autocompleteEntry;
  v7 = v8[3];
  if (autocompleteEntry)
  {
    if (v7)
      -[GEOPDAutocompleteEntry mergeFrom:](autocompleteEntry, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOSearchCategoryStorage setAutocompleteEntry:](self, "setAutocompleteEntry:");
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
      GEOSearchCategoryStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2688);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSearchCategoryStorage readAll:](self, "readAll:", 0);
    -[GEOPDBrowseCategory clearUnknownFields:]((uint64_t)self->_browseCategory, 1);
    -[GEOPDAutocompleteEntry clearUnknownFields:](self->_autocompleteEntry, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseCategory, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOSearchCategoryStorage)initWithSearchCategory:(id)a3
{
  id v4;
  GEOSearchCategoryStorage *v5;
  GEOSearchCategoryStorage *v6;
  GEOSearchCategoryStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOSearchCategoryStorage;
  v5 = -[GEOSearchCategoryStorage init](&v12, sel_init);
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v4, "_browseCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "_browseCategory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSearchCategoryStorage setBrowseCategory:](v6, "setBrowseCategory:", v9);
    }
    else
    {
      objc_msgSend(v4, "_autocompleteEntry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_8:
        v7 = v6;
        goto LABEL_9;
      }
      objc_msgSend(v4, "_autocompleteEntry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOSearchCategoryStorage setAutocompleteEntry:](v6, "setAutocompleteEntry:", v9);
    }

    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

@end
