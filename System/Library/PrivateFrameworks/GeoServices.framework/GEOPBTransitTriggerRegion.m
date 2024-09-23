@implementation GEOPBTransitTriggerRegion

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)transition
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_transition;
  else
    return 0;
}

- (void)setTransition:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_transition = a3;
}

- (void)setHasTransition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransition
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)transitionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E090[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)signalStrength
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_signalStrength;
  else
    return 0;
}

- (void)setSignalStrength:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_signalStrength = a3;
}

- (void)setHasSignalStrength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSignalStrength
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)signalStrengthAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E0A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSignalStrength:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_STRONG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_NONE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)delaySeconds
{
  return self->_delaySeconds;
}

- (void)setDelaySeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_delaySeconds = a3;
}

- (void)setHasDelaySeconds:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDelaySeconds
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPBTransitTriggerRegion;
  -[GEOPBTransitTriggerRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitTriggerRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitTriggerRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  v8 = *(_BYTE *)(a1 + 36);
  if ((v8 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 2) == 0)
      goto LABEL_9;
LABEL_23:
    v20 = *(int *)(a1 + 28);
    if (v20 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C0E0A8[v20];
    }
    if (a2)
      v22 = CFSTR("signalStrength");
    else
      v22 = CFSTR("signal_strength");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 36) & 1) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  v18 = *(int *)(a1 + 32);
  if (v18 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E1C0E090[v18];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("transition"));

  v8 = *(_BYTE *)(a1 + 36);
  if ((v8 & 2) != 0)
    goto LABEL_23;
LABEL_9:
  if ((v8 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("delaySeconds");
    else
      v10 = CFSTR("delay_seconds");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_14:
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __55__GEOPBTransitTriggerRegion__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v15 = v14;
      v24 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitTriggerRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPBTransitTriggerRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitTriggerRegion)initWithDictionary:(id)a3
{
  return (GEOPBTransitTriggerRegion *)-[GEOPBTransitTriggerRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_41;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_41;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setLocation:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ENTER")) & 1) != 0)
    {
      v12 = 1;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("EXIT")))
    {
      v12 = 2;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(a1, "setTransition:", v12);
LABEL_20:

  if (a3)
    v13 = CFSTR("signalStrength");
  else
    v13 = CFSTR("signal_strength");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_UNKNOWN")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_STRONG")) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("SIGNAL_STRENGTH_NONE")))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_34:
    objc_msgSend(a1, "setSignalStrength:", v16);
  }

  if (a3)
    v17 = CFSTR("delaySeconds");
  else
    v17 = CFSTR("delay_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDelaySeconds:", objc_msgSend(v18, "unsignedIntValue"));

LABEL_41:
  return a1;
}

- (GEOPBTransitTriggerRegion)initWithJSON:(id)a3
{
  return (GEOPBTransitTriggerRegion *)-[GEOPBTransitTriggerRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitTriggerRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitTriggerRegionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOPBTransitTriggerRegion readAll:](self, "readAll:", 0);
  if (self->_location)
    objc_msgSend(v5, "setLocation:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v5 + 7) = self->_signalStrength;
    *((_BYTE *)v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v5 + 8) = self->_transition;
  *((_BYTE *)v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 6) = self->_delaySeconds;
    *((_BYTE *)v5 + 36) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_signalStrength;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_transition;
  *(_BYTE *)(v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_delaySeconds;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *location;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPBTransitTriggerRegion readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_transition != *((_DWORD *)v4 + 8))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_signalStrength != *((_DWORD *)v4 + 7))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_delaySeconds != *((_DWORD *)v4 + 6))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPBTransitTriggerRegion readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_transition;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_signalStrength;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_delaySeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *location;
  uint64_t v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  location = self->_location;
  v5 = *((_QWORD *)v7 + 2);
  if (location)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPBTransitTriggerRegion setLocation:](self, "setLocation:");
  }
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 4) == 0)
  {
    if ((*((_BYTE *)v7 + 36) & 2) == 0)
      goto LABEL_8;
LABEL_12:
    self->_signalStrength = *((_DWORD *)v7 + 7);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v7 + 36) & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_transition = *((_DWORD *)v7 + 8);
  *(_BYTE *)&self->_flags |= 4u;
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v6 & 1) != 0)
  {
LABEL_9:
    self->_delaySeconds = *((_DWORD *)v7 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_10:

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
    -[GEOPBTransitTriggerRegion readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
