@implementation GEOPDAutocompleteEntryOfflineArea

- (unint64_t)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_featureId = a3;
}

- (void)setHasFeatureId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeatureId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)availableForDownload
{
  return self->_availableForDownload;
}

- (void)setAvailableForDownload:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_availableForDownload = a3;
}

- (void)setHasAvailableForDownload:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvailableForDownload
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  objc_storeStrong((id *)&self->_mapsId, a3);
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
  v8.super_class = (Class)GEOPDAutocompleteEntryOfflineArea;
  -[GEOPDAutocompleteEntryOfflineArea description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryOfflineArea dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryOfflineArea _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("featureId");
    else
      v7 = CFSTR("feature_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("availableForDownload");
    else
      v9 = CFSTR("available_for_download");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "mapsId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 8);
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
      v21[2] = __63__GEOPDAutocompleteEntryOfflineArea__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteEntryOfflineArea _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDAutocompleteEntryOfflineArea__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryOfflineArea)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryOfflineArea *)-[GEOPDAutocompleteEntryOfflineArea _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOPDMapsIdentifier *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("featureId");
      else
        v6 = CFSTR("feature_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFeatureId:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("availableForDownload");
      else
        v8 = CFSTR("available_for_download");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAvailableForDownload:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("mapsId");
      else
        v10 = CFSTR("maps_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOPDMapsIdentifier initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOPDMapsIdentifier initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setMapsId:", v13);

      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryOfflineArea)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryOfflineArea *)-[GEOPDAutocompleteEntryOfflineArea _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryOfflineAreaIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryOfflineAreaReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_mapsId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOPDAutocompleteEntryOfflineArea readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v6 + 2) = self->_featureId;
    *((_BYTE *)v6 + 36) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v6 + 32) = self->_availableForDownload;
    *((_BYTE *)v6 + 36) |= 2u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_featureId;
    *(_BYTE *)(v5 + 36) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_availableForDownload;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  GEOPDMapsIdentifier *mapsId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDAutocompleteEntryOfflineArea readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_featureId != *((_QWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  if ((*((_BYTE *)v4 + 36) & 2) == 0)
    goto LABEL_11;
  if (!self->_availableForDownload)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_17;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_11;
LABEL_17:
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 3))
    v5 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  else
    v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOPDAutocompleteEntryOfflineArea readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_featureId;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_availableForDownload;
  return v4 ^ v3 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  GEOPDMapsIdentifier *mapsId;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 36);
  if ((v5 & 1) != 0)
  {
    self->_featureId = *((_QWORD *)v8 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v8 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_availableForDownload = *((_BYTE *)v8 + 32);
    *(_BYTE *)&self->_flags |= 2u;
  }
  mapsId = self->_mapsId;
  v7 = *((_QWORD *)v8 + 3);
  if (mapsId)
  {
    if (v7)
    {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
LABEL_10:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOPDAutocompleteEntryOfflineArea setMapsId:](self, "setMapsId:");
    goto LABEL_10;
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
    -[GEOPDAutocompleteEntryOfflineArea readAll:](self, "readAll:", 0);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_mapsId, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
