@implementation GEOLogMsgEventTileSetState

- (double)durationInOldState
{
  return self->_durationInOldState;
}

- (void)setDurationInOldState:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_durationInOldState = a3;
}

- (void)setHasDurationInOldState:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDurationInOldState
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)tileSetStateType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_tileSetStateType;
  else
    return 0;
}

- (void)setTileSetStateType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_tileSetStateType = a3;
}

- (void)setHasTileSetStateType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTileSetStateType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)tileSetStateTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22960[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTileSetStateType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_SET_STATE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_GRID_COVERAGE_CHANGED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_LOADED_COVERAGE_CHANGED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)oldCoverage
{
  return self->_oldCoverage;
}

- (void)setOldCoverage:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_oldCoverage = a3;
}

- (void)setHasOldCoverage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOldCoverage
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)newCoverage
{
  return self->_newCoverage;
}

- (void)setNewCoverage:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_newCoverage = a3;
}

- (void)setHasNewCoverage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNewCoverage
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
  v8.super_class = (Class)GEOLogMsgEventTileSetState;
  -[GEOLogMsgEventTileSetState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventTileSetState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTileSetState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("durationInOldState");
    else
      v7 = CFSTR("duration_in_old_state");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)(a1 + 36) & 8) == 0)
  {
    goto LABEL_4;
  }
  v8 = *(int *)(a1 + 32);
  if (v8 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C22960[v8];
  }
  if (a2)
    v10 = CFSTR("tileSetStateType");
  else
    v10 = CFSTR("tile_set_state_type");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      return v4;
    goto LABEL_22;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("oldCoverage");
  else
    v12 = CFSTR("old_coverage");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  if ((*(_BYTE *)(a1 + 36) & 2) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("newCoverage");
    else
      v14 = CFSTR("new_coverage");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTileSetState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTileSetState)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTileSetState *)-[GEOLogMsgEventTileSetState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  if (!a1)
    goto LABEL_34;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_34;
  if (a3)
    v6 = CFSTR("durationInOldState");
  else
    v6 = CFSTR("duration_in_old_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(a1, "setDurationInOldState:");
  }

  if (a3)
    v8 = CFSTR("tileSetStateType");
  else
    v8 = CFSTR("tile_set_state_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TILE_SET_STATE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TILE_GRID_COVERAGE_CHANGED")) & 1) != 0)
    {
      v11 = 1;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("TILE_LOADED_COVERAGE_CHANGED")))
    {
      v11 = 2;
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v9, "intValue");
LABEL_22:
    objc_msgSend(a1, "setTileSetStateType:", v11);
  }

  if (a3)
    v12 = CFSTR("oldCoverage");
  else
    v12 = CFSTR("old_coverage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setOldCoverage:");
  }

  if (a3)
    v14 = CFSTR("newCoverage");
  else
    v14 = CFSTR("new_coverage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(a1, "setNewCoverage:");
  }

LABEL_34:
  return a1;
}

- (GEOLogMsgEventTileSetState)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTileSetState *)-[GEOLogMsgEventTileSetState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTileSetStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTileSetStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOLogMsgEventTileSetState readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_durationInOldState;
    *((_BYTE *)v5 + 36) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v5[3] = *(_QWORD *)&self->_oldCoverage;
      *((_BYTE *)v5 + 36) |= 4u;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_tileSetStateType;
  *((_BYTE *)v5 + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    v5[2] = *(_QWORD *)&self->_newCoverage;
    *((_BYTE *)v5 + 36) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_durationInOldState;
    *((_BYTE *)result + 36) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_tileSetStateType;
  *((_BYTE *)result + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_oldCoverage;
  *((_BYTE *)result + 36) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_newCoverage;
  *((_BYTE *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOLogMsgEventTileSetState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_durationInOldState != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_tileSetStateType != *((_DWORD *)v4 + 8))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_oldCoverage != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_newCoverage != *((double *)v4 + 2))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double durationInOldState;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  double oldCoverage;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double newCoverage;
  double v17;
  long double v18;
  double v19;

  -[GEOLogMsgEventTileSetState readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    durationInOldState = self->_durationInOldState;
    v6 = -durationInOldState;
    if (durationInOldState >= 0.0)
      v6 = self->_durationInOldState;
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
  if ((flags & 8) != 0)
  {
    v9 = 2654435761 * self->_tileSetStateType;
    if ((flags & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  if ((flags & 4) == 0)
    goto LABEL_16;
LABEL_11:
  oldCoverage = self->_oldCoverage;
  v11 = -oldCoverage;
  if (oldCoverage >= 0.0)
    v11 = self->_oldCoverage;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((flags & 2) != 0)
  {
    newCoverage = self->_newCoverage;
    v17 = -newCoverage;
    if (newCoverage >= 0.0)
      v17 = self->_newCoverage;
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
  return v9 ^ v4 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 1) != 0)
  {
    self->_durationInOldState = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 36);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      self->_oldCoverage = *((double *)v5 + 3);
      *(_BYTE *)&self->_flags |= 4u;
      if ((*((_BYTE *)v5 + 36) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tileSetStateType = *((_DWORD *)v5 + 8);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    self->_newCoverage = *((double *)v5 + 2);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_6:

}

@end
