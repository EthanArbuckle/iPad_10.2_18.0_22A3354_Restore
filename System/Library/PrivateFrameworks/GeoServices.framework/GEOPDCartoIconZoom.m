@implementation GEOPDCartoIconZoom

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCartoIconZoom;
  -[GEOPDCartoIconZoom description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCartoIconZoom dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCartoIconZoom _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 40);
  if ((v6 & 4) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("minZoom");
    else
      v8 = CFSTR("min_zoom");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v6 = *(_BYTE *)(a1 + 40);
  }
  if ((v6 & 2) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 20);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("maxZoom");
    else
      v10 = CFSTR("max_zoom");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v6 = *(_BYTE *)(a1 + 40);
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("popLowestMinZoom");
  else
    v12 = CFSTR("pop_lowest_min_zoom");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  v6 = *(_BYTE *)(a1 + 40);
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_21:
  LODWORD(v5) = *(_DWORD *)(a1 + 28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("popDefaultMinZoom");
  else
    v14 = CFSTR("pop_default_min_zoom");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v6 = *(_BYTE *)(a1 + 40);
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 1) == 0)
      goto LABEL_37;
    goto LABEL_29;
  }
LABEL_25:
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("popHighestMinZoom");
  else
    v16 = CFSTR("pop_highest_min_zoom");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    goto LABEL_37;
LABEL_29:
  v17 = *(_DWORD *)(a1 + 16) + 9;
  if (v17 < 0xD && ((0x1FC1u >> v17) & 1) != 0)
  {
    v18 = off_1E1C04B00[v17];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
    v19 = CFSTR("cartoSignificance");
  else
    v19 = CFSTR("carto_significance");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

LABEL_37:
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __48__GEOPDCartoIconZoom__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCartoIconZoom _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDCartoIconZoom__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  id v24;
  int v25;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("minZoom");
    else
      v7 = CFSTR("min_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      *(_BYTE *)(v6 + 40) |= 4u;
      *(_DWORD *)(v6 + 24) = v9;
    }

    if (a3)
      v10 = CFSTR("maxZoom");
    else
      v10 = CFSTR("max_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      *(_BYTE *)(v6 + 40) |= 2u;
      *(_DWORD *)(v6 + 20) = v12;
    }

    if (a3)
      v13 = CFSTR("popLowestMinZoom");
    else
      v13 = CFSTR("pop_lowest_min_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      *(_BYTE *)(v6 + 40) |= 0x20u;
      *(_DWORD *)(v6 + 36) = v15;
    }

    if (a3)
      v16 = CFSTR("popDefaultMinZoom");
    else
      v16 = CFSTR("pop_default_min_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      *(_BYTE *)(v6 + 40) |= 8u;
      *(_DWORD *)(v6 + 28) = v18;
    }

    if (a3)
      v19 = CFSTR("popHighestMinZoom");
    else
      v19 = CFSTR("pop_highest_min_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      *(_BYTE *)(v6 + 40) |= 0x10u;
      *(_DWORD *)(v6 + 32) = v21;
    }

    if (a3)
      v22 = CFSTR("cartoSignificance");
    else
      v22 = CFSTR("carto_significance");
    objc_msgSend(v5, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v23;
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_DEFAULT")) & 1) != 0)
      {
        v25 = -9;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_EXTRA_LOW")) & 1) != 0)
      {
        v25 = -3;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_LOW")) & 1) != 0)
      {
        v25 = -2;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_LOW")) & 1) != 0)
      {
        v25 = -1;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_MEDIUM")) & 1) != 0)
      {
        v25 = 0;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_HIGH")) & 1) != 0)
      {
        v25 = 1;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_HIGH")) & 1) != 0)
      {
        v25 = 2;
      }
      else if (objc_msgSend(v24, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_EXTRA_HIGH")))
      {
        v25 = 3;
      }
      else
      {
        v25 = -9;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_52:

        goto LABEL_53;
      }
      v25 = objc_msgSend(v23, "intValue");
    }
    *(_BYTE *)(v6 + 40) |= 1u;
    *(_DWORD *)(v6 + 16) = v25;
    goto LABEL_52;
  }
LABEL_53:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCartoIconZoomReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteFloatField();
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(float *)(v4 + 24) = self->_minZoom;
    *(_BYTE *)(v4 + 40) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 20) = self->_maxZoom;
  *(_BYTE *)(v4 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(float *)(v4 + 36) = self->_popLowestMinZoom;
  *(_BYTE *)(v4 + 40) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *(float *)(v4 + 32) = self->_popHighestMinZoom;
    *(_BYTE *)(v4 + 40) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(float *)(v4 + 28) = self->_popDefaultMinZoom;
  *(_BYTE *)(v4 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_cartoSignificance;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_minZoom != *((float *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_maxZoom != *((float *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0 || self->_popLowestMinZoom != *((float *)v4 + 9))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_popDefaultMinZoom != *((float *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0 || self->_popHighestMinZoom != *((float *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_cartoSignificance != *((_DWORD *)v4 + 4))
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
  float minZoom;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float maxZoom;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float popLowestMinZoom;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  float popDefaultMinZoom;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float popHighestMinZoom;
  double v26;
  long double v27;
  double v28;
  uint64_t v29;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    minZoom = self->_minZoom;
    v6 = minZoom;
    if (minZoom < 0.0)
      v6 = -minZoom;
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
  if ((flags & 2) != 0)
  {
    maxZoom = self->_maxZoom;
    v11 = maxZoom;
    if (maxZoom < 0.0)
      v11 = -maxZoom;
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
    popLowestMinZoom = self->_popLowestMinZoom;
    v16 = popLowestMinZoom;
    if (popLowestMinZoom < 0.0)
      v16 = -popLowestMinZoom;
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
    popDefaultMinZoom = self->_popDefaultMinZoom;
    v21 = popDefaultMinZoom;
    if (popDefaultMinZoom < 0.0)
      v21 = -popDefaultMinZoom;
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
  if ((flags & 0x10) != 0)
  {
    popHighestMinZoom = self->_popHighestMinZoom;
    v26 = popHighestMinZoom;
    if (popHighestMinZoom < 0.0)
      v26 = -popHighestMinZoom;
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
  if ((flags & 1) != 0)
    v29 = 2654435761 * self->_cartoSignificance;
  else
    v29 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
