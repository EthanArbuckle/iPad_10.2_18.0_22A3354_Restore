@implementation GEOVLFCorrection

- (unsigned)locationCorrectionMagnitude
{
  return self->_locationCorrectionMagnitude;
}

- (void)setLocationCorrectionMagnitude:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_locationCorrectionMagnitude = a3;
}

- (void)setHasLocationCorrectionMagnitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLocationCorrectionMagnitude
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)headingCorrectionMagnitude
{
  return self->_headingCorrectionMagnitude;
}

- (void)setHeadingCorrectionMagnitude:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_headingCorrectionMagnitude = a3;
}

- (void)setHasHeadingCorrectionMagnitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeadingCorrectionMagnitude
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)altitudeCorrectionMagnitude
{
  return self->_altitudeCorrectionMagnitude;
}

- (void)setAltitudeCorrectionMagnitude:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_altitudeCorrectionMagnitude = a3;
}

- (void)setHasAltitudeCorrectionMagnitude:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitudeCorrectionMagnitude
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
  v8.super_class = (Class)GEOVLFCorrection;
  -[GEOVLFCorrection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFCorrection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFCorrection _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("locationCorrectionMagnitude");
    else
      v7 = CFSTR("location_correction_magnitude");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        return v4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)(a1 + 20) & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("headingCorrectionMagnitude");
  else
    v9 = CFSTR("heading_correction_magnitude");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("altitudeCorrectionMagnitude");
    else
      v11 = CFSTR("altitude_correction_magnitude");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFCorrection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFCorrection)initWithDictionary:(id)a3
{
  return (GEOVLFCorrection *)-[GEOVLFCorrection _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("locationCorrectionMagnitude");
      else
        v6 = CFSTR("location_correction_magnitude");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocationCorrectionMagnitude:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("headingCorrectionMagnitude");
      else
        v8 = CFSTR("heading_correction_magnitude");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHeadingCorrectionMagnitude:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("altitudeCorrectionMagnitude");
      else
        v10 = CFSTR("altitude_correction_magnitude");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAltitudeCorrectionMagnitude:", objc_msgSend(v11, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOVLFCorrection)initWithJSON:(id)a3
{
  return (GEOVLFCorrection *)-[GEOVLFCorrection _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFCorrectionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOVLFCorrection readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[3] = self->_headingCorrectionMagnitude;
    *((_BYTE *)v5 + 20) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[4] = self->_locationCorrectionMagnitude;
  *((_BYTE *)v5 + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[2] = self->_altitudeCorrectionMagnitude;
    *((_BYTE *)v5 + 20) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_locationCorrectionMagnitude;
    *((_BYTE *)result + 20) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_headingCorrectionMagnitude;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_altitudeCorrectionMagnitude;
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOVLFCorrection readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_locationCorrectionMagnitude != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_headingCorrectionMagnitude != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_altitudeCorrectionMagnitude != *((_DWORD *)v4 + 2))
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

  -[GEOVLFCorrection readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_locationCorrectionMagnitude;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_headingCorrectionMagnitude;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_altitudeCorrectionMagnitude;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  unsigned int *v5;

  v5 = (unsigned int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 4) == 0)
  {
    if ((v5[5] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_headingCorrectionMagnitude = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    if ((v5[5] & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_locationCorrectionMagnitude = v5[4];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_altitudeCorrectionMagnitude = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

@end
