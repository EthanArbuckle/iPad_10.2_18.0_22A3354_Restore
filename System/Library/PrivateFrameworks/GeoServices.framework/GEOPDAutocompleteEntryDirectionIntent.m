@implementation GEOPDAutocompleteEntryDirectionIntent

- (BOOL)hasDirectionIntent
{
  return self->_directionIntent != 0;
}

- (GEOPDDirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
  objc_storeStrong((id *)&self->_directionIntent, a3);
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
  v8.super_class = (Class)GEOPDAutocompleteEntryDirectionIntent;
  -[GEOPDAutocompleteEntryDirectionIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryDirectionIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryDirectionIntent _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directionIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("directionIntent");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("direction_intent");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = (void *)a1[1];
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __67__GEOPDAutocompleteEntryDirectionIntent__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E1C00600;
      v13 = v12;
      v17 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntryDirectionIntent _dictionaryRepresentation:](self, 1);
}

void __67__GEOPDAutocompleteEntryDirectionIntent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryDirectionIntent)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryDirectionIntent *)-[GEOPDAutocompleteEntryDirectionIntent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDDirectionIntent *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionIntent");
      else
        v6 = CFSTR("direction_intent");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDDirectionIntent alloc];
        if (v8)
          v9 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v8, v7, a3);
        else
          v9 = 0;
        objc_msgSend(a1, "setDirectionIntent:", v9);

      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryDirectionIntent)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryDirectionIntent *)-[GEOPDAutocompleteEntryDirectionIntent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryDirectionIntentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_directionIntent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDAutocompleteEntryDirectionIntent readAll:](self, "readAll:", 0);
  if (self->_directionIntent)
    objc_msgSend(v4, "setDirectionIntent:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPDDirectionIntent copyWithZone:](self->_directionIntent, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOPDDirectionIntent *directionIntent;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOPDAutocompleteEntryDirectionIntent readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    directionIntent = self->_directionIntent;
    if ((unint64_t)directionIntent | v4[2])
      v5 = -[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOPDAutocompleteEntryDirectionIntent readAll:](self, "readAll:", 1);
  return -[GEOPDDirectionIntent hash](self->_directionIntent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDDirectionIntent *directionIntent;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  directionIntent = self->_directionIntent;
  v6 = (void *)v4[2];

  if (directionIntent)
  {
    if (v6)
      -[GEOPDDirectionIntent mergeFrom:]((uint64_t)directionIntent, v6);
  }
  else if (v6)
  {
    -[GEOPDAutocompleteEntryDirectionIntent setDirectionIntent:](self, "setDirectionIntent:", v6);
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
    -[GEOPDAutocompleteEntryDirectionIntent readAll:](self, "readAll:", 0);
    -[GEOPDDirectionIntent clearUnknownFields:]((uint64_t)self->_directionIntent, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
