@implementation GEOPDAutocompleteOriginationRoutePlanningParameters

- (BOOL)hasPreviousLocation
{
  return self->_previousLocation != 0;
}

- (GEOLatLng)previousLocation
{
  return self->_previousLocation;
}

- (void)setPreviousLocation:(id)a3
{
  objc_storeStrong((id *)&self->_previousLocation, a3);
}

- (BOOL)isEditServerRecommendedStop
{
  return self->_isEditServerRecommendedStop;
}

- (void)setIsEditServerRecommendedStop:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_isEditServerRecommendedStop = a3;
}

- (void)setHasIsEditServerRecommendedStop:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsEditServerRecommendedStop
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isRoutePlanningEditStopFillRequest
{
  return self->_isRoutePlanningEditStopFillRequest;
}

- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isRoutePlanningEditStopFillRequest = a3;
}

- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsRoutePlanningEditStopFillRequest
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOPDAutocompleteOriginationRoutePlanningParameters;
  -[GEOPDAutocompleteOriginationRoutePlanningParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteOriginationRoutePlanningParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
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
  objc_msgSend((id)a1, "previousLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("previousLocation");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("previous_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_BYTE *)(a1 + 28);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isEditServerRecommendedStop");
    else
      v11 = CFSTR("is_edit_server_recommended_stop");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_BYTE *)(a1 + 28);
  }
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isRoutePlanningEditStopFillRequest");
    else
      v13 = CFSTR("is_route_planning_edit_stop_fill_request");
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
      v21[2] = __81__GEOPDAutocompleteOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __81__GEOPDAutocompleteOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteOriginationRoutePlanningParameters *)-[GEOPDAutocompleteOriginationRoutePlanningParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("previousLocation");
      else
        v6 = CFSTR("previous_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPreviousLocation:", v9);

      }
      if (a3)
        v11 = CFSTR("isEditServerRecommendedStop");
      else
        v11 = CFSTR("is_edit_server_recommended_stop");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsEditServerRecommendedStop:", objc_msgSend(v12, "BOOLValue"));

      if (a3)
        v13 = CFSTR("isRoutePlanningEditStopFillRequest");
      else
        v13 = CFSTR("is_route_planning_edit_stop_fill_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsRoutePlanningEditStopFillRequest:", objc_msgSend(v14, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteOriginationRoutePlanningParameters *)-[GEOPDAutocompleteOriginationRoutePlanningParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteOriginationRoutePlanningParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteOriginationRoutePlanningParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_previousLocation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_previousLocation, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOPDAutocompleteOriginationRoutePlanningParameters readAll:](self, "readAll:", 0);
  if (self->_previousLocation)
    objc_msgSend(v5, "setPreviousLocation:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[24] = self->_isEditServerRecommendedStop;
    v5[28] |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[25] = self->_isRoutePlanningEditStopFillRequest;
    v5[28] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_previousLocation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isEditServerRecommendedStop;
    *(_BYTE *)(v5 + 28) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_isRoutePlanningEditStopFillRequest;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *previousLocation;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDAutocompleteOriginationRoutePlanningParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  previousLocation = self->_previousLocation;
  if ((unint64_t)previousLocation | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](previousLocation, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_14;
    if (self->_isEditServerRecommendedStop)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) != 0)
    {
      if (self->_isRoutePlanningEditStopFillRequest)
      {
        if (!*((_BYTE *)v4 + 25))
          goto LABEL_14;
      }
      else if (*((_BYTE *)v4 + 25))
      {
        goto LABEL_14;
      }
      v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDAutocompleteOriginationRoutePlanningParameters readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_previousLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_isEditServerRecommendedStop;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isRoutePlanningEditStopFillRequest;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *previousLocation;
  uint64_t v5;
  BOOL v6;
  BOOL *v7;

  v7 = (BOOL *)a3;
  objc_msgSend(v7, "readAll:", 0);
  previousLocation = self->_previousLocation;
  v5 = *((_QWORD *)v7 + 2);
  if (previousLocation)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](previousLocation, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDAutocompleteOriginationRoutePlanningParameters setPreviousLocation:](self, "setPreviousLocation:");
  }
  v6 = v7[28];
  if (v6)
  {
    self->_isEditServerRecommendedStop = v7[24];
    *(_BYTE *)&self->_flags |= 1u;
    v6 = v7[28];
  }
  if ((v6 & 2) != 0)
  {
    self->_isRoutePlanningEditStopFillRequest = v7[25];
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
    -[GEOPDAutocompleteOriginationRoutePlanningParameters readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_previousLocation, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLocation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
