@implementation GEOVLFDeviceOrientation

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)orientation
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_orientation;
  else
    return 0;
}

- (void)setOrientation:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_orientation = a3;
}

- (void)setHasOrientation:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasOrientation
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)orientationAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C23990[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrientation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFDeviceOrientationType_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFDeviceOrientationType_OUT_OF_POCKET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFDeviceOrientationType_IN_POCKET")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFDeviceOrientationType_FACE_DOWN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFDeviceOrientationType_FACE_DOWN_ON_TABLE")))
  {
    v4 = 4;
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
  v8.super_class = (Class)GEOVLFDeviceOrientation;
  -[GEOVLFDeviceOrientation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFDeviceOrientation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFDeviceOrientation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("relativeTimestampMs");
      else
        v7 = CFSTR("relative_timestamp_ms");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 1) != 0)
    {
      v8 = *(int *)(a1 + 8);
      if (v8 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E1C23990[v8];
      }
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("orientation"));

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
  return -[GEOVLFDeviceOrientation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFDeviceOrientation)initWithDictionary:(id)a3
{
  return (GEOVLFDeviceOrientation *)-[GEOVLFDeviceOrientation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("relativeTimestampMs");
      else
        v6 = CFSTR("relative_timestamp_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("orientation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VLFDeviceOrientationType_UNKNOWN")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VLFDeviceOrientationType_OUT_OF_POCKET")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VLFDeviceOrientationType_IN_POCKET")) & 1) != 0)
        {
          v10 = 2;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VLFDeviceOrientationType_FACE_DOWN")) & 1) != 0)
        {
          v10 = 3;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("VLFDeviceOrientationType_FACE_DOWN_ON_TABLE")))
        {
          v10 = 4;
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
        {
LABEL_24:

          goto LABEL_25;
        }
        v10 = objc_msgSend(v8, "intValue");
      }
      objc_msgSend(a1, "setOrientation:", v10);
      goto LABEL_24;
    }
  }
LABEL_25:

  return a1;
}

- (GEOVLFDeviceOrientation)initWithJSON:(id)a3
{
  return (GEOVLFDeviceOrientation *)-[GEOVLFDeviceOrientation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFDeviceOrientationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFDeviceOrientationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOVLFDeviceOrientation readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_relativeTimestampMs;
    *((_BYTE *)v5 + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[2] = self->_orientation;
    *((_BYTE *)v5 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_relativeTimestampMs;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_orientation;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOVLFDeviceOrientation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_orientation != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOVLFDeviceOrientation readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_relativeTimestampMs;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_orientation;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_relativeTimestampMs = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 1) != 0)
  {
    self->_orientation = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
