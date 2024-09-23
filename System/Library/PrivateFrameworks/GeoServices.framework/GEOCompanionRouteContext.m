@implementation GEOCompanionRouteContext

- (unsigned)legacyTimestamp
{
  return self->_legacyTimestamp;
}

- (void)setLegacyTimestamp:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_legacyTimestamp = a3;
}

- (void)setHasLegacyTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLegacyTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C070C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GIZMO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPANION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
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
  v8.super_class = (Class)GEOCompanionRouteContext;
  -[GEOCompanionRouteContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteContext dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t v5;
  __CFString *v6;
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
  if ((v3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("legacyTimestamp"));

    v3 = *(_BYTE *)(a1 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_4:
      if ((v3 & 1) == 0)
        return v2;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 4) == 0)
  {
    goto LABEL_4;
  }
  v5 = *(int *)(a1 + 20);
  if (v5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E1C070C0[v5];
  }
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("origin"));

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("timestamp"));

  }
  return v2;
}

- (GEOCompanionRouteContext)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteContext *)-[GEOCompanionRouteContext _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (!a1)
    goto LABEL_20;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("legacyTimestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLegacyTimestamp:", objc_msgSend(v4, "unsignedIntValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("origin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("GIZMO")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("COMPANION")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "intValue");
LABEL_16:
    objc_msgSend(a1, "setOrigin:", v7);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(a1, "setTimestamp:");
  }

LABEL_20:
  return a1;
}

- (GEOCompanionRouteContext)initWithJSON:(id)a3
{
  return (GEOCompanionRouteContext *)-[GEOCompanionRouteContext _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteContextReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOCompanionRouteContext readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[5] = self->_origin;
    *((_BYTE *)v5 + 24) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[4] = self->_legacyTimestamp;
  *((_BYTE *)v5 + 24) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 24) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_legacyTimestamp;
    *((_BYTE *)result + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_origin;
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOCompanionRouteContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_legacyTimestamp != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_origin != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
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
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  -[GEOCompanionRouteContext readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  v3 = 2654435761 * self->_legacyTimestamp;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_origin;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_4:
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 24) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_origin = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 24) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_legacyTimestamp = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_timestamp = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

+ (id)context
{
  id v2;
  double v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "setTimestamp:");
  objc_msgSend(v2, "timestamp");
  objc_msgSend(v2, "setLegacyTimestamp:", v3);
  objc_msgSend(v2, "setOrigin:", objc_msgSend((id)objc_opt_class(), "defaultOrigin"));
  return v2;
}

- (BOOL)isForeignOrigin
{
  int v2;

  v2 = -[GEOCompanionRouteContext origin](self, "origin");
  return v2 != objc_msgSend((id)objc_opt_class(), "defaultOrigin");
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;
  double v10;
  double v11;
  int64_t v12;

  v4 = a3;
  if (-[GEOCompanionRouteContext hasTimestamp](self, "hasTimestamp"))
  {
    -[GEOCompanionRouteContext timestamp](self, "timestamp");
    v6 = v5;
  }
  else
  {
    v6 = (double)-[GEOCompanionRouteContext legacyTimestamp](self, "legacyTimestamp");
  }
  if (objc_msgSend(v4, "hasTimestamp"))
  {
    objc_msgSend(v4, "timestamp");
    v8 = v7;
  }
  else
  {
    v8 = (double)objc_msgSend(v4, "legacyTimestamp");
  }
  if (-[GEOCompanionRouteContext hasTimestamp](self, "hasTimestamp"))
  {
    v9 = objc_msgSend(v4, "hasTimestamp");
    v10 = floor(v6);
    v11 = floor(v8);
    if ((v9 & 1) == 0)
    {
      v6 = v10;
      v8 = v11;
    }
  }
  else
  {
    v6 = floor(v6);
    v8 = floor(v8);
  }
  if (-[GEOCompanionRouteContext origin](self, "origin") && objc_msgSend(v4, "origin"))
  {
    if (v6 >= v8)
      v12 = v6 > v8;
    else
      v12 = -1;
  }
  else if (v6 == v8)
  {
    v12 = 0;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (BOOL)isStaleComparedToContext:(id)a3
{
  return objc_msgSend(a3, "compare:", self) == 1;
}

+ (int)defaultOrigin
{
  return 2;
}

- (id)simpleDescription
{
  double v3;
  double v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;

  if (-[GEOCompanionRouteContext hasTimestamp](self, "hasTimestamp"))
  {
    -[GEOCompanionRouteContext timestamp](self, "timestamp");
    v4 = v3;
    v5 = "";
  }
  else
  {
    v4 = (double)-[GEOCompanionRouteContext legacyTimestamp](self, "legacyTimestamp");
    v5 = " (legacy)";
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[GEOCompanionRouteContext origin](self, "origin");
  if (v7 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C0DAB8[(int)v7];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{%@:%@%s}"), v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
