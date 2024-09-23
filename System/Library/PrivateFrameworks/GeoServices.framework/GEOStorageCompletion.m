@implementation GEOStorageCompletion

- (BOOL)hasAutocompleteEntry
{
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  return self->_autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
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
  v8.super_class = (Class)GEOStorageCompletion;
  -[GEOStorageCompletion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStorageCompletion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageCompletion _dictionaryRepresentation:](self, 0);
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
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "autocompleteEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("autocompleteEntry"));

  }
  v8 = (void *)a1[1];
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__GEOStorageCompletion__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStorageCompletion _dictionaryRepresentation:](self, 1);
}

void __50__GEOStorageCompletion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageCompletion)initWithDictionary:(id)a3
{
  return (GEOStorageCompletion *)-[GEOStorageCompletion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDAutocompleteEntry *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autocompleteEntry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDAutocompleteEntry alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPDAutocompleteEntry initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPDAutocompleteEntry initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setAutocompleteEntry:", v8);

      }
    }
  }

  return a1;
}

- (GEOStorageCompletion)initWithJSON:(id)a3
{
  return (GEOStorageCompletion *)-[GEOStorageCompletion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageCompletionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageCompletionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_autocompleteEntry)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOPDAutocompleteEntry hasGreenTeaWithValue:](self->_autocompleteEntry, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStorageCompletion readAll:](self, "readAll:", 0);
  if (self->_autocompleteEntry)
    objc_msgSend(v4, "setAutocompleteEntry:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPDAutocompleteEntry copyWithZone:](self->_autocompleteEntry, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOPDAutocompleteEntry *autocompleteEntry;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOStorageCompletion readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    autocompleteEntry = self->_autocompleteEntry;
    if ((unint64_t)autocompleteEntry | v4[2])
      v5 = -[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOStorageCompletion readAll:](self, "readAll:", 1);
  return -[GEOPDAutocompleteEntry hash](self->_autocompleteEntry, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDAutocompleteEntry *autocompleteEntry;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  autocompleteEntry = self->_autocompleteEntry;
  v6 = v4[2];

  if (autocompleteEntry)
  {
    if (v6)
      -[GEOPDAutocompleteEntry mergeFrom:](autocompleteEntry, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOStorageCompletion setAutocompleteEntry:](self, "setAutocompleteEntry:", v6);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStorageCompletion readAll:](self, "readAll:", 0);
    -[GEOPDAutocompleteEntry clearUnknownFields:](self->_autocompleteEntry, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

+ (id)storageForCompletionItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF8EAC8))
  {
    v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    objc_msgSend(v5, "_placeDataAutocompleteEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAutocompleteEntry:", v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyToUserSearchInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEOStorageCompletion autocompleteEntry](self, "autocompleteEntry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocompleteEntry:", v5);

}

@end
