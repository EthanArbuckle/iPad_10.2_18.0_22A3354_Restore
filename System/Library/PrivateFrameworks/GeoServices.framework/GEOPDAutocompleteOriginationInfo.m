@implementation GEOPDAutocompleteOriginationInfo

- (int)autocompleteOriginationType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_autocompleteOriginationType;
  else
    return 0;
}

- (void)setAutocompleteOriginationType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_autocompleteOriginationType = a3;
}

- (void)setHasAutocompleteOriginationType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAutocompleteOriginationType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)autocompleteOriginationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C045E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAutocompleteOriginationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_ADD_FAVORITES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRoutePlanningParameters
{
  return self->_routePlanningParameters != 0;
}

- (GEOPDAutocompleteOriginationRoutePlanningParameters)routePlanningParameters
{
  return self->_routePlanningParameters;
}

- (void)setRoutePlanningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_routePlanningParameters, a3);
}

- (int)clientSoftwarePlatform
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_clientSoftwarePlatform;
  else
    return 0;
}

- (void)setClientSoftwarePlatform:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_clientSoftwarePlatform = a3;
}

- (void)setHasClientSoftwarePlatform:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasClientSoftwarePlatform
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)clientSoftwarePlatformAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C04608[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsClientSoftwarePlatform:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_IOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WATCHOS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_MACOS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_TVOS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WEB")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEOPDAutocompleteOriginationInfo;
  -[GEOPDAutocompleteOriginationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteOriginationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    v5 = *(int *)(a1 + 24);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C045E8[v5];
    }
    if (a2)
      v7 = CFSTR("autocompleteOriginationType");
    else
      v7 = CFSTR("autocomplete_origination_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "routePlanningParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("routePlanningParameters");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("route_planning_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    v12 = *(int *)(a1 + 28);
    if (v12 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C04608[v12];
    }
    if (a2)
      v14 = CFSTR("clientSoftwarePlatform");
    else
      v14 = CFSTR("client_software_platform");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__GEOPDAutocompleteOriginationInfo__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDAutocompleteOriginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteOriginationInfo)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteOriginationInfo *)-[GEOPDAutocompleteOriginationInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOPDAutocompleteOriginationRoutePlanningParameters *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("autocompleteOriginationType");
      else
        v6 = CFSTR("autocomplete_origination_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_DEFAULT")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_ROUTE_PLANNING")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE")) & 1) != 0)
        {
          v9 = 2;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOCOMPLETE_ORIGINATION_TYPE_ADD_FAVORITES")))
        {
          v9 = 3;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setAutocompleteOriginationType:", v9);
LABEL_20:

      if (a3)
        v10 = CFSTR("routePlanningParameters");
      else
        v10 = CFSTR("route_planning_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOPDAutocompleteOriginationRoutePlanningParameters alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOPDAutocompleteOriginationRoutePlanningParameters initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOPDAutocompleteOriginationRoutePlanningParameters initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setRoutePlanningParameters:", v13);

      }
      if (a3)
        v15 = CFSTR("clientSoftwarePlatform");
      else
        v15 = CFSTR("client_software_platform");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_UNKNOWN")) & 1) != 0)
        {
          v18 = 0;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_IOS")) & 1) != 0)
        {
          v18 = 1;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WATCHOS")) & 1) != 0)
        {
          v18 = 2;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_MACOS")) & 1) != 0)
        {
          v18 = 3;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_TVOS")) & 1) != 0)
        {
          v18 = 4;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WEB")))
        {
          v18 = 5;
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        v18 = objc_msgSend(v16, "intValue");
      }
      objc_msgSend(a1, "setClientSoftwarePlatform:", v18);
      goto LABEL_49;
    }
  }
LABEL_50:

  return a1;
}

- (GEOPDAutocompleteOriginationInfo)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteOriginationInfo *)-[GEOPDAutocompleteOriginationInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteOriginationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteOriginationInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_routePlanningParameters)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOPDAutocompleteOriginationRoutePlanningParameters hasGreenTeaWithValue:](self->_routePlanningParameters, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  -[GEOPDAutocompleteOriginationInfo readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[6] = self->_autocompleteOriginationType;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  if (self->_routePlanningParameters)
  {
    objc_msgSend(v5, "setRoutePlanningParameters:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_clientSoftwarePlatform;
    *((_BYTE *)v4 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_autocompleteOriginationType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[GEOPDAutocompleteOriginationRoutePlanningParameters copyWithZone:](self->_routePlanningParameters, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_clientSoftwarePlatform;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDAutocompleteOriginationRoutePlanningParameters *routePlanningParameters;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDAutocompleteOriginationInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_autocompleteOriginationType != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }
  routePlanningParameters = self->_routePlanningParameters;
  if ((unint64_t)routePlanningParameters | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDAutocompleteOriginationRoutePlanningParameters isEqual:](routePlanningParameters, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 32);
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_clientSoftwarePlatform != *((_DWORD *)v4 + 7))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDAutocompleteOriginationInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_autocompleteOriginationType;
  else
    v3 = 0;
  v4 = -[GEOPDAutocompleteOriginationRoutePlanningParameters hash](self->_routePlanningParameters, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_clientSoftwarePlatform;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDAutocompleteOriginationRoutePlanningParameters *routePlanningParameters;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[8] & 1) != 0)
  {
    self->_autocompleteOriginationType = v7[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  routePlanningParameters = self->_routePlanningParameters;
  v6 = *((_QWORD *)v7 + 2);
  if (routePlanningParameters)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteOriginationRoutePlanningParameters mergeFrom:](routePlanningParameters, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteOriginationInfo setRoutePlanningParameters:](self, "setRoutePlanningParameters:");
  }
  v4 = v7;
LABEL_9:
  if ((v4[8] & 2) != 0)
  {
    self->_clientSoftwarePlatform = v4[7];
    *(_BYTE *)&self->_flags |= 2u;
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
    -[GEOPDAutocompleteOriginationInfo readAll:](self, "readAll:", 0);
    -[GEOPDAutocompleteOriginationRoutePlanningParameters clearUnknownFields:](self->_routePlanningParameters, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
