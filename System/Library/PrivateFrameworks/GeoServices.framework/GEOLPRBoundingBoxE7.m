@implementation GEOLPRBoundingBoxE7

- (int)centerLatE7
{
  int v3;
  uint64_t v4;

  v3 = -[GEOLPRBoundingBoxE7 southLatE7](self, "southLatE7");
  v4 = -[GEOLPRBoundingBoxE7 northLatE7](self, "northLatE7") + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- (int)centerLngE7
{
  int v3;
  uint64_t v4;

  v3 = -[GEOLPRBoundingBoxE7 westLngE7](self, "westLngE7");
  v4 = -[GEOLPRBoundingBoxE7 eastLngE7](self, "eastLngE7") + (uint64_t)v3;
  return (v4 + (unint64_t)(v4 < 0)) >> 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)center
{
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = (double)-[GEOLPRBoundingBoxE7 centerLatE7](self, "centerLatE7") * 0.0000001;
  v4 = (double)-[GEOLPRBoundingBoxE7 centerLngE7](self, "centerLngE7") * 0.0000001;
  v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (GEOMapRegion)mapRegion
{
  GEOMapRegion *v3;

  if (-[GEOLPRBoundingBoxE7 isValid](self, "isValid"))
  {
    v3 = objc_alloc_init(GEOMapRegion);
    -[GEOMapRegion setSouthLat:](v3, "setSouthLat:", (double)-[GEOLPRBoundingBoxE7 southLatE7](self, "southLatE7") * 0.0000001);
    -[GEOMapRegion setWestLng:](v3, "setWestLng:", (double)-[GEOLPRBoundingBoxE7 westLngE7](self, "westLngE7") * 0.0000001);
    -[GEOMapRegion setNorthLat:](v3, "setNorthLat:", (double)-[GEOLPRBoundingBoxE7 northLatE7](self, "northLatE7") * 0.0000001);
    -[GEOMapRegion setEastLng:](v3, "setEastLng:", (double)-[GEOLPRBoundingBoxE7 eastLngE7](self, "eastLngE7") * 0.0000001);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isValid
{
  return -[GEOLPRBoundingBoxE7 hasNorthLatE7](self, "hasNorthLatE7")
      && -[GEOLPRBoundingBoxE7 hasSouthLatE7](self, "hasSouthLatE7")
      && -[GEOLPRBoundingBoxE7 hasEastLngE7](self, "hasEastLngE7")
      && -[GEOLPRBoundingBoxE7 hasWestLngE7](self, "hasWestLngE7");
}

- (int)southLatE7
{
  return self->_southLatE7;
}

- (void)setSouthLatE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_southLatE7 = a3;
}

- (void)setHasSouthLatE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSouthLatE7
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)westLngE7
{
  return self->_westLngE7;
}

- (void)setWestLngE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_westLngE7 = a3;
}

- (void)setHasWestLngE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWestLngE7
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)northLatE7
{
  return self->_northLatE7;
}

- (void)setNorthLatE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_northLatE7 = a3;
}

- (void)setHasNorthLatE7:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNorthLatE7
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)eastLngE7
{
  return self->_eastLngE7;
}

- (void)setEastLngE7:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_eastLngE7 = a3;
}

- (void)setHasEastLngE7:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEastLngE7
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
  v8.super_class = (Class)GEOLPRBoundingBoxE7;
  -[GEOLPRBoundingBoxE7 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRBoundingBoxE7 dictionaryRepresentation](self, "dictionaryRepresentation");
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

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 24);
  if ((v3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("southLatE7"));

    v3 = *(_BYTE *)(a1 + 24);
  }
  if ((v3 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("westLngE7"));

    v3 = *(_BYTE *)(a1 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_6:
      if ((v3 & 1) == 0)
        return v2;
      goto LABEL_10;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 12));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("northLatE7"));

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("eastLngE7"));

  }
  return v2;
}

- (GEOLPRBoundingBoxE7)initWithDictionary:(id)a3
{
  return (GEOLPRBoundingBoxE7 *)-[GEOLPRBoundingBoxE7 _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("southLatE7"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSouthLatE7:", objc_msgSend(v4, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("westLngE7"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWestLngE7:", objc_msgSend(v5, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("northLatE7"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNorthLatE7:", objc_msgSend(v6, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eastLngE7"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEastLngE7:", objc_msgSend(v7, "intValue"));

    }
  }

  return a1;
}

- (GEOLPRBoundingBoxE7)initWithJSON:(id)a3
{
  return (GEOLPRBoundingBoxE7 *)-[GEOLPRBoundingBoxE7 _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRBoundingBoxE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRBoundingBoxE7ReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteSfixed32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteSfixed32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSfixed32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteSfixed32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLPRBoundingBoxE7 readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_southLatE7;
    *((_BYTE *)v5 + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v5[3] = self->_northLatE7;
      *((_BYTE *)v5 + 24) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_westLngE7;
  *((_BYTE *)v5 + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v5[2] = self->_eastLngE7;
    *((_BYTE *)v5 + 24) |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_southLatE7;
    *((_BYTE *)result + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_westLngE7;
  *((_BYTE *)result + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_northLatE7;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = self->_eastLngE7;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOLPRBoundingBoxE7 readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_southLatE7 != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_westLngE7 != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_northLatE7 != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_eastLngE7 != *((_DWORD *)v4 + 2))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLPRBoundingBoxE7 readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_southLatE7;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_westLngE7;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_northLatE7;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_eastLngE7;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_southLatE7 = v5[4];
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_northLatE7 = v5[3];
      *(_BYTE *)&self->_flags |= 2u;
      if ((v5[6] & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v5[6] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_westLngE7 = v5[5];
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 1) != 0)
  {
LABEL_5:
    self->_eastLngE7 = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:

}

@end
