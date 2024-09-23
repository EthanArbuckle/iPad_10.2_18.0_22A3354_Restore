@implementation GEOLaneArrowhead

- (int)angle
{
  return self->_angle;
}

- (void)setAngle:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_angle = a3;
}

- (void)setHasAngle:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAngle
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)category
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_category;
  else
    return 0;
}

- (void)setCategory:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("U_TURN_LEFT");
      if (a3 == 32)
        return CFSTR("SHARP_LEFT");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("LEFT");
        case 128:
          return CFSTR("SLIGHT_LEFT");
        case 256:
          return CFSTR("U_TURN_RIGHT");
      }
    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("NO_DIRECTIONS_INDICATED");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STRAIGHT");
        return v3;
      case 2:
        result = CFSTR("SLIGHT_RIGHT");
        break;
      case 4:
        result = CFSTR("RIGHT");
        break;
      case 8:
        result = CFSTR("SHARP_RIGHT");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

- (int)StringAsCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_DIRECTIONS_INDICATED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRAIGHT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLIGHT_RIGHT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIGHT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARP_RIGHT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U_TURN_LEFT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARP_LEFT")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEFT")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLIGHT_LEFT")) & 1) != 0)
  {
    v4 = 128;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("U_TURN_RIGHT")))
  {
    v4 = 256;
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
  v8.super_class = (Class)GEOLaneArrowhead;
  -[GEOLaneArrowhead description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLaneArrowhead dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaneArrowhead _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("angle"));

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    v7 = *(_DWORD *)(a1 + 20);
    if (v7 <= 15)
    {
      v8 = CFSTR("NO_DIRECTIONS_INDICATED");
      switch(v7)
      {
        case 0:
          goto LABEL_23;
        case 1:
          v8 = CFSTR("STRAIGHT");
          break;
        case 2:
          v8 = CFSTR("SLIGHT_RIGHT");
          break;
        case 4:
          v8 = CFSTR("RIGHT");
          break;
        case 8:
          v8 = CFSTR("SHARP_RIGHT");
          break;
        default:
          goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v7 <= 63)
    {
      if (v7 == 16)
      {
        v8 = CFSTR("U_TURN_LEFT");
        goto LABEL_23;
      }
      if (v7 == 32)
      {
        v8 = CFSTR("SHARP_LEFT");
        goto LABEL_23;
      }
    }
    else
    {
      switch(v7)
      {
        case 64:
          v8 = CFSTR("LEFT");
          goto LABEL_23;
        case 128:
          v8 = CFSTR("SLIGHT_LEFT");
          goto LABEL_23;
        case 256:
          v8 = CFSTR("U_TURN_RIGHT");
LABEL_23:
          objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("category"));

          goto LABEL_24;
      }
    }
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__GEOLaneArrowhead__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E1C00600;
      v13 = v12;
      v17 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaneArrowhead _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOLaneArrowhead__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLaneArrowhead)initWithDictionary:(id)a3
{
  return (GEOLaneArrowhead *)-[GEOLaneArrowhead _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("angle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAngle:", objc_msgSend(v4, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("NO_DIRECTIONS_INDICATED")) & 1) != 0)
        {
          v7 = 0;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("STRAIGHT")) & 1) != 0)
        {
          v7 = 1;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SLIGHT_RIGHT")) & 1) != 0)
        {
          v7 = 2;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("RIGHT")) & 1) != 0)
        {
          v7 = 4;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SHARP_RIGHT")) & 1) != 0)
        {
          v7 = 8;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("U_TURN_LEFT")) & 1) != 0)
        {
          v7 = 16;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SHARP_LEFT")) & 1) != 0)
        {
          v7 = 32;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("LEFT")) & 1) != 0)
        {
          v7 = 64;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SLIGHT_LEFT")) & 1) != 0)
        {
          v7 = 128;
        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("U_TURN_RIGHT")))
        {
          v7 = 256;
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        v7 = objc_msgSend(v5, "intValue");
      }
      objc_msgSend(a1, "setCategory:", v7);
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (GEOLaneArrowhead)initWithJSON:(id)a3
{
  return (GEOLaneArrowhead *)-[GEOLaneArrowhead _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaneArrowheadIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaneArrowheadReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteSint32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLaneArrowhead readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[4] = self->_angle;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_category;
    *((_BYTE *)v5 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_angle;
    *(_BYTE *)(v4 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_category;
    *(_BYTE *)(v4 + 24) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOLaneArrowhead readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_angle != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_category != *((_DWORD *)v4 + 5))
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

  -[GEOLaneArrowhead readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_angle;
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
  v4 = 2654435761 * self->_category;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_angle = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_category = v5[5];
    *(_BYTE *)&self->_flags |= 2u;
  }

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
    -[GEOLaneArrowhead readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
