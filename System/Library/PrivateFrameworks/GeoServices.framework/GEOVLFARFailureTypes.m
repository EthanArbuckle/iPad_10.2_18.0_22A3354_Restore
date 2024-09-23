@implementation GEOVLFARFailureTypes

- (BOOL)arWalkingNoLabels
{
  return self->_arWalkingNoLabels;
}

- (void)setArWalkingNoLabels:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_arWalkingNoLabels = a3;
}

- (void)setHasArWalkingNoLabels:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArWalkingNoLabels
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)arWalkingUndulationFailure
{
  return self->_arWalkingUndulationFailure;
}

- (void)setArWalkingUndulationFailure:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_arWalkingUndulationFailure = a3;
}

- (void)setHasArWalkingUndulationFailure:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasArWalkingUndulationFailure
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
  v8.super_class = (Class)GEOVLFARFailureTypes;
  -[GEOVLFARFailureTypes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFARFailureTypes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFARFailureTypes _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[12];
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("arWalkingNoLabels");
      else
        v7 = CFSTR("ar_walking_no_labels");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = a1[12];
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[9]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("arWalkingUndulationFailure");
      else
        v9 = CFSTR("ar_walking_undulation_failure");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFARFailureTypes _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOVLFARFailureTypes)initWithDictionary:(id)a3
{
  return (GEOVLFARFailureTypes *)-[GEOVLFARFailureTypes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("arWalkingNoLabels");
      else
        v6 = CFSTR("ar_walking_no_labels");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArWalkingNoLabels:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("arWalkingUndulationFailure");
      else
        v8 = CFSTR("ar_walking_undulation_failure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArWalkingUndulationFailure:", objc_msgSend(v9, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOVLFARFailureTypes)initWithJSON:(id)a3
{
  return (GEOVLFARFailureTypes *)-[GEOVLFARFailureTypes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFARFailureTypesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFARFailureTypesReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOVLFARFailureTypes readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[8] = self->_arWalkingNoLabels;
    v5[12] |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[9] = self->_arWalkingUndulationFailure;
    v5[12] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_arWalkingNoLabels;
    *((_BYTE *)result + 12) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_arWalkingUndulationFailure;
    *((_BYTE *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOVLFARFailureTypes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_12;
    if (self->_arWalkingNoLabels)
    {
      if (!v4[8])
        goto LABEL_12;
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_12;
  }
  v5 = (v4[12] & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_arWalkingUndulationFailure)
      {
        if (!v4[9])
          goto LABEL_12;
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOVLFARFailureTypes readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_arWalkingNoLabels;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_arWalkingUndulationFailure;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[12];
  if (v4)
  {
    self->_arWalkingNoLabels = v5[8];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = v5[12];
  }
  if ((v4 & 2) != 0)
  {
    self->_arWalkingUndulationFailure = v5[9];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

@end
