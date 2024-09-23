@implementation GEOPDOrientedTilePosition

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasX
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasY
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)yaw
{
  return self->_yaw;
}

- (void)setYaw:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_yaw = a3;
}

- (void)setHasYaw:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasYaw
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)pitch
{
  return self->_pitch;
}

- (void)setPitch:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPitch
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)roll
{
  return self->_roll;
}

- (void)setRoll:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRoll
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPDOrientedTilePosition;
  -[GEOPDOrientedTilePosition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDOrientedTilePosition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("x"));

    v3 = *(_BYTE *)(a1 + 32);
  }
  if ((v3 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("y"));

    v3 = *(_BYTE *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_6:
      if ((v3 & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("altitude"));

  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("yaw"));

  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      return v2;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("pitch"));

  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("roll"));

  }
  return v2;
}

- (GEOPDOrientedTilePosition)initWithDictionary:(id)a3
{
  return (GEOPDOrientedTilePosition *)-[GEOPDOrientedTilePosition _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setX:", objc_msgSend(v4, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setY:", objc_msgSend(v5, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("altitude"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAltitude:", objc_msgSend(v6, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("yaw"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setYaw:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pitch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPitch:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("roll"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRoll:", objc_msgSend(v9, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOPDOrientedTilePosition)initWithJSON:(id)a3
{
  return (GEOPDOrientedTilePosition *)-[GEOPDOrientedTilePosition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedTilePositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedTilePositionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 4) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOPDOrientedTilePosition readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[5] = self->_x;
    *((_BYTE *)v5 + 32) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_y;
  *((_BYTE *)v5 + 32) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[2] = self->_altitude;
  *((_BYTE *)v5 + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
LABEL_13:
    v5[3] = self->_pitch;
    *((_BYTE *)v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v5[6] = self->_yaw;
  *((_BYTE *)v5 + 32) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 4) != 0)
  {
LABEL_7:
    v5[4] = self->_roll;
    *((_BYTE *)v5 + 32) |= 4u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_x;
    *((_BYTE *)result + 32) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_y;
  *((_BYTE *)result + 32) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_altitude;
  *((_BYTE *)result + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_yaw;
  *((_BYTE *)result + 32) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_pitch;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 4) = self->_roll;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOPDOrientedTilePosition readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_x != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0 || self->_y != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_altitude != *((_DWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_yaw != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_pitch != *((_DWORD *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_roll != *((_DWORD *)v4 + 4))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDOrientedTilePosition readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v3 = 2654435761 * self->_x;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_y;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_altitude;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_yaw;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_pitch;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761 * self->_roll;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_x = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_y = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_altitude = *((_DWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_pitch = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 32) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_yaw = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 4) != 0)
  {
LABEL_7:
    self->_roll = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_8:

}

@end
