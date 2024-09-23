@implementation GEOVLFUsageTileID

- (BOOL)hasBuildId
{
  return self->_buildId != 0;
}

- (NSString)buildId
{
  return self->_buildId;
}

- (void)setBuildId:(id)a3
{
  objc_storeStrong((id *)&self->_buildId, a3);
}

- (double)xCoordinate
{
  return self->_xCoordinate;
}

- (void)setXCoordinate:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_xCoordinate = a3;
}

- (void)setHasXCoordinate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasXCoordinate
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)yCoordinate
{
  return self->_yCoordinate;
}

- (void)setYCoordinate:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_yCoordinate = a3;
}

- (void)setHasYCoordinate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasYCoordinate
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasUncertainty
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
  v8.super_class = (Class)GEOVLFUsageTileID;
  -[GEOVLFUsageTileID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFUsageTileID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFUsageTileID _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "buildId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("buildId");
    else
      v6 = CFSTR("build_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 40);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("xCoordinate");
    else
      v9 = CFSTR("x_coordinate");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 40);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0)
        return v4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("yCoordinate");
  else
    v11 = CFSTR("y_coordinate");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("uncertainty"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFUsageTileID _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFUsageTileID)initWithDictionary:(id)a3
{
  return (GEOVLFUsageTileID *)-[GEOVLFUsageTileID _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("buildId");
      else
        v6 = CFSTR("build_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setBuildId:", v8);

      }
      if (a3)
        v9 = CFSTR("xCoordinate");
      else
        v9 = CFSTR("x_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(a1, "setXCoordinate:");
      }

      if (a3)
        v11 = CFSTR("yCoordinate");
      else
        v11 = CFSTR("y_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setYCoordinate:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uncertainty"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setUncertainty:");
      }

    }
  }

  return a1;
}

- (GEOVLFUsageTileID)initWithJSON:(id)a3
{
  return (GEOVLFUsageTileID *)-[GEOVLFUsageTileID _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFUsageTileIDIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFUsageTileIDReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_buildId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOVLFUsageTileID readAll:](self, "readAll:", 0);
  if (self->_buildId)
    objc_msgSend(v5, "setBuildId:");
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_yCoordinate;
    *((_BYTE *)v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_xCoordinate;
  *((_BYTE *)v5 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_uncertainty;
    *((_BYTE *)v5 + 40) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_buildId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 32) = self->_yCoordinate;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_xCoordinate;
  *(_BYTE *)(v5 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_uncertainty;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *buildId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOVLFUsageTileID readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  buildId = self->_buildId;
  if ((unint64_t)buildId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildId, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_xCoordinate != *((double *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_yCoordinate != *((double *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_uncertainty != *((double *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char flags;
  unint64_t v5;
  double xCoordinate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double yCoordinate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double uncertainty;
  double v17;
  long double v18;
  double v19;

  -[GEOVLFUsageTileID readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_buildId, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    xCoordinate = self->_xCoordinate;
    v7 = -xCoordinate;
    if (xCoordinate >= 0.0)
      v7 = self->_xCoordinate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    yCoordinate = self->_yCoordinate;
    v12 = -yCoordinate;
    if (yCoordinate >= 0.0)
      v12 = self->_yCoordinate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 1) != 0)
  {
    uncertainty = self->_uncertainty;
    v17 = -uncertainty;
    if (uncertainty >= 0.0)
      v17 = self->_uncertainty;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOVLFUsageTileID setBuildId:](self, "setBuildId:");
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 2) == 0)
  {
    if (((_BYTE)v5[5] & 4) == 0)
      goto LABEL_5;
LABEL_9:
    self->_yCoordinate = v5[4];
    *(_BYTE *)&self->_flags |= 4u;
    if (((_BYTE)v5[5] & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_xCoordinate = v5[3];
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    self->_uncertainty = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildId, 0);
}

@end
