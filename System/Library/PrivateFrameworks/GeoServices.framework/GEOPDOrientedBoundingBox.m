@implementation GEOPDOrientedBoundingBox

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOPDOrientedPosition)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
  objc_storeStrong((id *)&self->_position, a3);
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeight
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)depth
{
  return self->_depth;
}

- (void)setDepth:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_depth = a3;
}

- (void)setHasDepth:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDepth
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
  v8.super_class = (Class)GEOPDOrientedBoundingBox;
  -[GEOPDOrientedBoundingBox description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDOrientedBoundingBox dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDOrientedBoundingBox _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "position");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("position"));

  }
  v8 = *(_BYTE *)(a1 + 40);
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("width"));

    v8 = *(_BYTE *)(a1 + 40);
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 1) == 0)
        return v4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("height"));

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("depth"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDOrientedBoundingBox _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDOrientedBoundingBox)initWithDictionary:(id)a3
{
  return (GEOPDOrientedBoundingBox *)-[GEOPDOrientedBoundingBox _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDOrientedPosition *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDOrientedPosition alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPDOrientedPosition initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPDOrientedPosition initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setPosition:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("width"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(a1, "setWidth:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("height"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setHeight:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("depth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setDepth:");
      }

    }
  }

  return a1;
}

- (GEOPDOrientedBoundingBox)initWithJSON:(id)a3
{
  return (GEOPDOrientedBoundingBox *)-[GEOPDOrientedBoundingBox _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDOrientedBoundingBoxIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDOrientedBoundingBoxReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_position)
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
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
  -[GEOPDOrientedBoundingBox readAll:](self, "readAll:", 0);
  if (self->_position)
    objc_msgSend(v5, "setPosition:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_height;
    *((_BYTE *)v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_width;
  *((_BYTE *)v5 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_depth;
    *((_BYTE *)v5 + 40) |= 1u;
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
  v6 = -[GEOPDOrientedPosition copyWithZone:](self->_position, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 16) = self->_height;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 32) = self->_width;
  *(_BYTE *)(v5 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_depth;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDOrientedPosition *position;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPDOrientedBoundingBox readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_width != *((double *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_height != *((double *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_depth != *((double *)v4 + 1))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  unint64_t v5;
  double width;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double height;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double depth;
  double v17;
  long double v18;
  double v19;

  -[GEOPDOrientedBoundingBox readAll:](self, "readAll:", 1);
  v3 = -[GEOPDOrientedPosition hash](self->_position, "hash");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    width = self->_width;
    v7 = -width;
    if (width >= 0.0)
      v7 = self->_width;
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
  if ((flags & 2) != 0)
  {
    height = self->_height;
    v12 = -height;
    if (height >= 0.0)
      v12 = self->_height;
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
    depth = self->_depth;
    v17 = -depth;
    if (depth >= 0.0)
      v17 = self->_depth;
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
  GEOPDOrientedPosition *position;
  uint64_t v5;
  char v6;
  double *v7;

  v7 = (double *)a3;
  objc_msgSend(v7, "readAll:", 0);
  position = self->_position;
  v5 = *((_QWORD *)v7 + 3);
  if (position)
  {
    if (v5)
      -[GEOPDOrientedPosition mergeFrom:](position, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDOrientedBoundingBox setPosition:](self, "setPosition:");
  }
  v6 = *((_BYTE *)v7 + 40);
  if ((v6 & 4) == 0)
  {
    if (((_BYTE)v7[5] & 2) == 0)
      goto LABEL_8;
LABEL_12:
    self->_height = v7[2];
    *(_BYTE *)&self->_flags |= 2u;
    if (((_BYTE)v7[5] & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_width = v7[4];
  *(_BYTE *)&self->_flags |= 4u;
  v6 = *((_BYTE *)v7 + 40);
  if ((v6 & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v6 & 1) != 0)
  {
LABEL_9:
    self->_depth = v7[1];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
}

@end
