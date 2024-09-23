@implementation GEOPDEvChargingPort

- (unsigned)power
{
  return self->_power;
}

- (void)setPower:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_power = a3;
}

- (void)setHasPower:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPower
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)chargingConnectorType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_chargingConnectorType;
  else
    return 0;
}

- (void)setChargingConnectorType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_chargingConnectorType = a3;
}

- (void)setHasChargingConnectorType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChargingConnectorType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)chargingConnectorTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E1C0BFC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChargingConnectorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CHADEMO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_J1772")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_TESLA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS1")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS2")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT1")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT2")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_MENNEKES")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_AC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_DC")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)chargingLevel
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_chargingLevel;
  else
    return 0;
}

- (void)setChargingLevel:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_chargingLevel = a3;
}

- (void)setHasChargingLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasChargingLevel
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)chargingLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0BA30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChargingLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_ONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_TWO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_THREE")))
  {
    v4 = 3;
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
  v8.super_class = (Class)GEOPDEvChargingPort;
  -[GEOPDEvChargingPort description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEvChargingPort dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEvChargingPort _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_4;
LABEL_7:
    v7 = *(int *)(a1 + 16);
    if (v7 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C0BFC0[v7];
    }
    if (a2)
      v9 = CFSTR("chargingConnectorType");
    else
      v9 = CFSTR("charging_connector_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    if ((*(_BYTE *)(a1 + 28) & 2) == 0)
      goto LABEL_21;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("power"));

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_14:
    v10 = *(int *)(a1 + 20);
    if (v10 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C0BA30[v10];
    }
    if (a2)
      v12 = CFSTR("chargingLevel");
    else
      v12 = CFSTR("charging_level");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
LABEL_21:
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49__GEOPDEvChargingPort__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDEvChargingPort _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDEvChargingPort__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDEvChargingPort)initWithDictionary:(id)a3
{
  return (GEOPDEvChargingPort *)-[GEOPDEvChargingPort _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("power"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPower:", objc_msgSend(v6, "unsignedIntValue"));

      if (a3)
        v7 = CFSTR("chargingConnectorType");
      else
        v7 = CFSTR("charging_connector_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_UNKNOWN")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CHADEMO")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_J1772")) & 1) != 0)
        {
          v10 = 2;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_TESLA")) & 1) != 0)
        {
          v10 = 3;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS1")) & 1) != 0)
        {
          v10 = 4;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS2")) & 1) != 0)
        {
          v10 = 5;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT1")) & 1) != 0)
        {
          v10 = 6;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT2")) & 1) != 0)
        {
          v10 = 7;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_MENNEKES")) & 1) != 0)
        {
          v10 = 8;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_AC")) & 1) != 0)
        {
          v10 = 9;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_DC")))
        {
          v10 = 10;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        v10 = objc_msgSend(v8, "intValue");
      }
      objc_msgSend(a1, "setChargingConnectorType:", v10);
LABEL_36:

      if (a3)
        v11 = CFSTR("chargingLevel");
      else
        v11 = CFSTR("charging_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
        {
          v14 = 0;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LEVEL_ONE")) & 1) != 0)
        {
          v14 = 1;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LEVEL_TWO")) & 1) != 0)
        {
          v14 = 2;
        }
        else if (objc_msgSend(v13, "isEqualToString:", CFSTR("LEVEL_THREE")))
        {
          v14 = 3;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        v14 = objc_msgSend(v12, "intValue");
      }
      objc_msgSend(a1, "setChargingLevel:", v14);
      goto LABEL_53;
    }
  }
LABEL_54:

  return a1;
}

- (GEOPDEvChargingPort)initWithJSON:(id)a3
{
  return (GEOPDEvChargingPort *)-[GEOPDEvChargingPort _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDEvChargingPortIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEvChargingPortReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOPDEvChargingPort readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v5[4] = self->_chargingConnectorType;
    *((_BYTE *)v5 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[6] = self->_power;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_chargingLevel;
    *((_BYTE *)v5 + 28) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_chargingConnectorType;
    *(_BYTE *)(v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_power;
  *(_BYTE *)(v4 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_chargingLevel;
    *(_BYTE *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDEvChargingPort readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_power != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_chargingConnectorType != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_chargingLevel != *((_DWORD *)v4 + 5))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDEvChargingPort readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_power;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_chargingConnectorType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_chargingLevel;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_chargingConnectorType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 28) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_power = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    self->_chargingLevel = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:

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
    -[GEOPDEvChargingPort readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
