@implementation GEOPDResultRefinementRangeContinuous

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 8u;
    *(_BYTE *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementRangeContinuous readAll:](a1, 0);
      -[GEOPDResultRefinementRangeElement clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
      -[GEOPDResultRefinementRangeElement clearUnknownFields:](*(_QWORD *)(a1 + 40), 1);
    }
  }
}

- (GEOPDResultRefinementRangeContinuous)init
{
  GEOPDResultRefinementRangeContinuous *v2;
  GEOPDResultRefinementRangeContinuous *v3;
  GEOPDResultRefinementRangeContinuous *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  v2 = -[GEOPDResultRefinementRangeContinuous init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementRangeContinuous)initWithData:(id)a3
{
  GEOPDResultRefinementRangeContinuous *v3;
  GEOPDResultRefinementRangeContinuous *v4;
  GEOPDResultRefinementRangeContinuous *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  v3 = -[GEOPDResultRefinementRangeContinuous initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
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
  v8.super_class = (Class)GEOPDResultRefinementRangeContinuous;
  -[GEOPDResultRefinementRangeContinuous description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementRangeContinuous dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementRangeContinuous _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementRangeContinuous readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readElementMinimum_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v7 = *(id *)(a1 + 48);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("elementMinimum");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("element_minimum");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readElementMaximum_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v13 = *(id *)(a1 + 40);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("elementMaximum");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("element_maximum");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(_BYTE *)(a1 + 76);
  if ((v17 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
      goto LABEL_20;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("currentMinValue");
    else
      v29 = CFSTR("current_min_value");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("increment"));

  v17 = *(_BYTE *)(a1 + 76);
  if ((v17 & 2) != 0)
    goto LABEL_32;
LABEL_20:
  if ((v17 & 1) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("currentMaxValue");
    else
      v19 = CFSTR("current_max_value");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
LABEL_25:
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __66__GEOPDResultRefinementRangeContinuous__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v24 = v23;
      v31 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v30);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementRangeContinuous _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_817;
      else
        v6 = (int *)&readAll__nonRecursiveTag_818;
      GEOPDResultRefinementRangeContinuousReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDResultRefinementRangeElement readAll:](*(_QWORD *)(a1 + 48), 1);
      -[GEOPDResultRefinementRangeElement readAll:](*(_QWORD *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __66__GEOPDResultRefinementRangeContinuous__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementRangeContinuousReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDResultRefinementRangeContinuousIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_16;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 0);
  if (self->_elementMinimum)
    PBDataWriterWriteSubmessage();
  v5 = v9;
  if (self->_elementMaximum)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteDoubleField();
    v5 = v9;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteDoubleField();
  v5 = v9;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    v5 = v9;
  }
LABEL_11:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char flags;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 0);
    v9 = -[GEOPDResultRefinementRangeElement copyWithZone:](self->_elementMinimum, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v9;

    v11 = -[GEOPDResultRefinementRangeElement copyWithZone:](self->_elementMaximum, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v11;

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(double *)(v5 + 56) = self->_increment;
      *(_BYTE *)(v5 + 76) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
        {
LABEL_9:
          v14 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(double *)(v5 + 24) = self->_currentMaxValue;
        *(_BYTE *)(v5 + 76) |= 1u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_currentMinValue;
    *(_BYTE *)(v5 + 76) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementRangeContinuousReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDResultRefinementRangeElement *elementMinimum;
  GEOPDResultRefinementRangeElement *elementMaximum;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)v4, 1);
  elementMinimum = self->_elementMinimum;
  if ((unint64_t)elementMinimum | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDResultRefinementRangeElement isEqual:](elementMinimum, "isEqual:"))
      goto LABEL_20;
  }
  elementMaximum = self->_elementMaximum;
  if ((unint64_t)elementMaximum | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDResultRefinementRangeElement isEqual:](elementMaximum, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_increment != *((double *)v4 + 7))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_currentMinValue != *((double *)v4 + 4))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  v7 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_currentMaxValue != *((double *)v4 + 3))
      goto LABEL_20;
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  char flags;
  unint64_t v6;
  double increment;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double currentMinValue;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double currentMaxValue;
  double v18;
  long double v19;
  double v20;

  -[GEOPDResultRefinementRangeContinuous readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDResultRefinementRangeElement hash](self->_elementMinimum, "hash");
  v4 = -[GEOPDResultRefinementRangeElement hash](self->_elementMaximum, "hash");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    increment = self->_increment;
    v8 = -increment;
    if (increment >= 0.0)
      v8 = self->_increment;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((flags & 2) != 0)
  {
    currentMinValue = self->_currentMinValue;
    v13 = -currentMinValue;
    if (currentMinValue >= 0.0)
      v13 = self->_currentMinValue;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((flags & 1) != 0)
  {
    currentMaxValue = self->_currentMaxValue;
    v18 = -currentMaxValue;
    if (currentMaxValue >= 0.0)
      v18 = self->_currentMaxValue;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementMinimum, 0);
  objc_storeStrong((id *)&self->_elementMaximum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
