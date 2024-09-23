@implementation GEOPDPlaceSummaryLayoutUnitHours

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryLayoutUnitHours;
  -[GEOPDPlaceSummaryLayoutUnitHours dealloc](&v3, sel_dealloc);
}

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE_AND_HOURS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STATE_IF_NOT_OPEN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)allowedHoursStatesCount
{
  return self->_allowedHoursStates.count;
}

- (int)allowedHoursStates
{
  return self->_allowedHoursStates.list;
}

- (void)clearAllowedHoursStates
{
  PBRepeatedInt32Clear();
}

- (void)addAllowedHoursState:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)allowedHoursStateAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_allowedHoursStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_allowedHoursStates = &self->_allowedHoursStates;
  count = self->_allowedHoursStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_allowedHoursStates->list[a3];
}

- (void)setAllowedHoursStates:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)allowedHoursStatesAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C0E528[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAllowedHoursStates:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPORARILY_CLOSED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERMANENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENTLY_OPEN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPENING_SOON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSING_SOON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANY")))
  {
    v4 = 7;
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitHours;
  -[GEOPDPlaceSummaryLayoutUnitHours description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnitHours dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 36) & 1) != 0)
    {
      v5 = *(int *)(a1 + 32);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0E510[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    if (*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (_QWORD *)(a1 + 8);
      if (*(_QWORD *)(a1 + 16))
      {
        v9 = 0;
        do
        {
          v10 = *(int *)(*v8 + 4 * v9);
          if (v10 >= 8)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = off_1E1C0E528[v10];
          }
          objc_msgSend(v7, "addObject:", v11);

          ++v9;
          v8 = (_QWORD *)(a1 + 8);
        }
        while (v9 < *(_QWORD *)(a1 + 16));
      }
      if (a2)
        v12 = CFSTR("allowedHoursState");
      else
        v12 = CFSTR("allowed_hours_state");
      objc_msgSend(v4, "setObject:forKey:", v7, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitHours)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHours *)-[GEOPDPlaceSummaryLayoutUnitHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_50;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v9 = 0;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATE_AND_HOURS")) & 1) != 0)
      {
        v9 = 1;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("STATE_IF_NOT_OPEN")))
      {
        v9 = 2;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        if (a3)
          v10 = CFSTR("allowedHoursState");
        else
          v10 = CFSTR("allowed_hours_state");
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v11;
          v22 = v5;
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (!v13)
            goto LABEL_48;
          v14 = v13;
          v15 = *(_QWORD *)v24;
          while (1)
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = v17;
                if ((objc_msgSend(v18, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                {
                  v19 = 0;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CURRENTLY_CLOSED")) & 1) != 0)
                {
                  v19 = 1;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("TEMPORARILY_CLOSED")) & 1) != 0)
                {
                  v19 = 2;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("PERMANENTLY_CLOSED")) & 1) != 0)
                {
                  v19 = 3;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CURRENTLY_OPEN")) & 1) != 0)
                {
                  v19 = 4;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("OPENING_SOON")) & 1) != 0)
                {
                  v19 = 5;
                }
                else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CLOSING_SOON")) & 1) != 0)
                {
                  v19 = 6;
                }
                else if (objc_msgSend(v18, "isEqualToString:", CFSTR("ANY")))
                {
                  v19 = 7;
                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_46;
                v19 = objc_msgSend(v17, "intValue");
              }
              objc_msgSend(v6, "addAllowedHoursState:", v19, v21, v22, (_QWORD)v23);
LABEL_46:
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (!v14)
            {
LABEL_48:

              v11 = v21;
              v5 = v22;
              break;
            }
          }
        }

        goto LABEL_50;
      }
      v9 = objc_msgSend(v7, "intValue");
    }
    objc_msgSend(v6, "setType:", v9);
    goto LABEL_15;
  }
LABEL_50:

  return v6;
}

- (GEOPDPlaceSummaryLayoutUnitHours)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitHours *)-[GEOPDPlaceSummaryLayoutUnitHours _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitHoursReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_allowedHoursStates;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  p_allowedHoursStates = &self->_allowedHoursStates;
  if (p_allowedHoursStates->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_allowedHoursStates->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _DWORD *v7;

  v7 = a3;
  -[GEOPDPlaceSummaryLayoutUnitHours readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[8] = self->_type;
    *((_BYTE *)v7 + 36) |= 1u;
  }
  if (-[GEOPDPlaceSummaryLayoutUnitHours allowedHoursStatesCount](self, "allowedHoursStatesCount"))
  {
    objc_msgSend(v7, "clearAllowedHoursStates");
    v4 = -[GEOPDPlaceSummaryLayoutUnitHours allowedHoursStatesCount](self, "allowedHoursStatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAllowedHoursState:", -[GEOPDPlaceSummaryLayoutUnitHours allowedHoursStateAtIndex:](self, "allowedHoursStateAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_type;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOPDPlaceSummaryLayoutUnitHours readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_8;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPDPlaceSummaryLayoutUnitHours readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  if ((v7[9] & 1) != 0)
  {
    self->_type = v7[8];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v7, "allowedHoursStatesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPDPlaceSummaryLayoutUnitHours addAllowedHoursState:](self, "addAllowedHoursState:", objc_msgSend(v7, "allowedHoursStateAtIndex:", i));
  }

}

@end
