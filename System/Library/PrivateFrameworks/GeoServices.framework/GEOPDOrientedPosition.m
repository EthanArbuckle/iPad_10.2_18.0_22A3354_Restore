@implementation GEOPDOrientedPosition

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasX
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasY
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasZ
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_yaw = a3;
}

- (void)setHasYaw:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasYaw
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPitch
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRoll
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
  v8.super_class = (Class)GEOPDOrientedPosition;
  -[GEOPDOrientedPosition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDOrientedPosition dictionaryRepresentation](self, "dictionaryRepresentation");
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
  v3 = *(_BYTE *)(a1 + 56);
  if ((v3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("x"));

    v3 = *(_BYTE *)(a1 + 56);
  }
  if ((v3 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("y"));

    v3 = *(_BYTE *)(a1 + 56);
    if ((v3 & 0x20) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("z"));

  v3 = *(_BYTE *)(a1 + 56);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0)
      goto LABEL_8;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("yaw"));

  v3 = *(_BYTE *)(a1 + 56);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0)
      return v2;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("pitch"));

  if ((*(_BYTE *)(a1 + 56) & 2) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("roll"));

  }
  return v2;
}

- (GEOPDOrientedPosition)initWithDictionary:(id)a3
{
  return (GEOPDOrientedPosition *)-[GEOPDOrientedPosition _initWithDictionary:isJSON:](self, a3);
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
      {
        objc_msgSend(v4, "doubleValue");
        objc_msgSend(a1, "setX:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(a1, "setY:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("z"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setZ:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("yaw"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setYaw:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pitch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(a1, "setPitch:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("roll"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setRoll:");
      }

    }
  }

  return a1;
}

- (GEOPDOrientedPosition)initWithJSON:(id)a3
{
  return (GEOPDOrientedPosition *)-[GEOPDOrientedPosition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedPositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedPositionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 2) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOPDOrientedPosition readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[3] = *(_QWORD *)&self->_x;
    *((_BYTE *)v5 + 56) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = *(_QWORD *)&self->_y;
  *((_BYTE *)v5 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[6] = *(_QWORD *)&self->_z;
  *((_BYTE *)v5 + 56) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    v5[1] = *(_QWORD *)&self->_pitch;
    *((_BYTE *)v5 + 56) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v5[4] = *(_QWORD *)&self->_yaw;
  *((_BYTE *)v5 + 56) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 2) != 0)
  {
LABEL_7:
    v5[2] = *(_QWORD *)&self->_roll;
    *((_BYTE *)v5 + 56) |= 2u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_x;
    *((_BYTE *)result + 56) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_y;
  *((_BYTE *)result + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_z;
  *((_BYTE *)result + 56) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_yaw;
  *((_BYTE *)result + 56) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_pitch;
  *((_BYTE *)result + 56) |= 1u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_roll;
  *((_BYTE *)result + 56) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOPDOrientedPosition readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_x != *((double *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_y != *((double *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_z != *((double *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_yaw != *((double *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_pitch != *((double *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_roll != *((double *)v4 + 2))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double x;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double y;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double z;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double yaw;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double pitch;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double roll;
  double v31;
  long double v32;
  double v33;

  -[GEOPDOrientedPosition readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    x = self->_x;
    v6 = -x;
    if (x >= 0.0)
      v6 = self->_x;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    y = self->_y;
    v11 = -y;
    if (y >= 0.0)
      v11 = self->_y;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    z = self->_z;
    v16 = -z;
    if (z >= 0.0)
      v16 = self->_z;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 8) != 0)
  {
    yaw = self->_yaw;
    v21 = -yaw;
    if (yaw >= 0.0)
      v21 = self->_yaw;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((flags & 1) != 0)
  {
    pitch = self->_pitch;
    v26 = -pitch;
    if (pitch >= 0.0)
      v26 = self->_pitch;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((flags & 2) != 0)
  {
    roll = self->_roll;
    v31 = -roll;
    if (roll >= 0.0)
      v31 = self->_roll;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 4) != 0)
  {
    self->_x = v5[3];
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 56);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if (((_BYTE)v5[7] & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_y = v5[5];
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_z = v5[6];
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
LABEL_13:
    self->_pitch = v5[1];
    *(_BYTE *)&self->_flags |= 1u;
    if (((_BYTE)v5[7] & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_yaw = v5[4];
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 2) != 0)
  {
LABEL_7:
    self->_roll = v5[2];
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_8:

}

@end
