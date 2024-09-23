@implementation GEORPGroundViewCorrections

- (int)correctionType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_correctionType;
  else
    return 0;
}

- (void)setCorrectionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C03BF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_BASIC_CENSOR_REQUEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_IMAGE_QUALITY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_STORE_LABEL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_CENSOR_ADDRESS_REQUEST")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_OTHER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_STREET_LABEL")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddressToCensor
{
  return self->_addressToCensor != 0;
}

- (GEORPFeedbackAddressFields)addressToCensor
{
  return self->_addressToCensor;
}

- (void)setAddressToCensor:(id)a3
{
  objc_storeStrong((id *)&self->_addressToCensor, a3);
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
  v8.super_class = (Class)GEORPGroundViewCorrections;
  -[GEORPGroundViewCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPGroundViewCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v5 = *(int *)(a1 + 24);
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03BF0[v5];
    }
    if (a2)
      v7 = CFSTR("correctionType");
    else
      v7 = CFSTR("correction_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "addressToCensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("addressToCensor");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("address_to_censor");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
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
      v19[2] = __56__GEORPGroundViewCorrections__dictionaryRepresentation___block_invoke;
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
  return -[GEORPGroundViewCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPGroundViewCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPGroundViewCorrections)initWithDictionary:(id)a3
{
  return (GEORPGroundViewCorrections *)-[GEORPGroundViewCorrections _initWithDictionary:isJSON:](self, a3, 0);
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
  GEORPFeedbackAddressFields *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_35;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_35;
  if (a3)
    v6 = CFSTR("correctionType");
  else
    v6 = CFSTR("correction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_BASIC_CENSOR_REQUEST")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_IMAGE_QUALITY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_STORE_LABEL")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_CENSOR_ADDRESS_REQUEST")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_OTHER")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("GROUND_VIEW_STREET_LABEL")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_25:
    objc_msgSend(a1, "setCorrectionType:", v9);
  }

  if (a3)
    v10 = CFSTR("addressToCensor");
  else
    v10 = CFSTR("address_to_censor");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEORPFeedbackAddressFields alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEORPFeedbackAddressFields initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEORPFeedbackAddressFields initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setAddressToCensor:", v13);

  }
LABEL_35:

  return a1;
}

- (GEORPGroundViewCorrections)initWithJSON:(id)a3
{
  return (GEORPGroundViewCorrections *)-[GEORPGroundViewCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_addressToCensor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEORPGroundViewCorrections readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_correctionType;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  if (self->_addressToCensor)
  {
    objc_msgSend(v5, "setAddressToCensor:");
    v4 = v5;
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
    *(_DWORD *)(v5 + 24) = self->_correctionType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[GEORPFeedbackAddressFields copyWithZone:](self->_addressToCensor, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPFeedbackAddressFields *addressToCensor;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEORPGroundViewCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  addressToCensor = self->_addressToCensor;
  if ((unint64_t)addressToCensor | *((_QWORD *)v4 + 2))
    v6 = -[GEORPFeedbackAddressFields isEqual:](addressToCensor, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORPGroundViewCorrections readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_correctionType;
  else
    v3 = 0;
  return -[GEORPFeedbackAddressFields hash](self->_addressToCensor, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPFeedbackAddressFields *addressToCensor;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[7] & 1) != 0)
  {
    self->_correctionType = v7[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  addressToCensor = self->_addressToCensor;
  v6 = *((_QWORD *)v7 + 2);
  if (addressToCensor)
  {
    if (v6)
    {
      -[GEORPFeedbackAddressFields mergeFrom:](addressToCensor, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEORPGroundViewCorrections setAddressToCensor:](self, "setAddressToCensor:");
    goto LABEL_8;
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
    -[GEORPGroundViewCorrections readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressToCensor, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
