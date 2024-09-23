@implementation GEOPDSearchSpellSuggestion

- (void)setSuggestion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(a1 + 16), a2);

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
  v8.super_class = (Class)GEOPDSearchSpellSuggestion;
  -[GEOPDSearchSpellSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSpellSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 16);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("suggestion"));

  }
  v9 = *(_BYTE *)(a1 + 32);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("score"));

    v9 = *(_BYTE *)(a1 + 32);
    if ((v9 & 2) == 0)
    {
LABEL_9:
      if ((v9 & 4) == 0)
        return v4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)(a1 + 32) & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("editDistance");
  else
    v12 = CFSTR("edit_distance");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
  {
LABEL_16:
    LODWORD(v8) = *(_DWORD *)(a1 + 28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("rawScore");
    else
      v14 = CFSTR("raw_score");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDSearchTokenSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  int v16;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDSearchTokenSet alloc];
        if (v7)
          v8 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v7, v6, a3);
        else
          v8 = 0;
        -[GEOPDSearchSpellSuggestion setSuggestion:](a1, v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_QWORD *)(a1 + 8) = v10;
      }

      if (a3)
        v11 = CFSTR("editDistance");
      else
        v11 = CFSTR("edit_distance");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "unsignedIntValue");
        *(_BYTE *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 24) = v13;
      }

      if (a3)
        v14 = CFSTR("rawScore");
      else
        v14 = CFSTR("raw_score");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "floatValue");
        *(_BYTE *)(a1 + 32) |= 4u;
        *(_DWORD *)(a1 + 28) = v16;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellSuggestionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_suggestion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteFloatField();
    v4 = v6;
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
  v6 = -[GEOPDSearchTokenSet copyWithZone:](self->_suggestion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_editDistance;
    *(_BYTE *)(v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_score;
  *(_BYTE *)(v5 + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 28) = self->_rawScore;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchTokenSet *suggestion;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  suggestion = self->_suggestion;
  if ((unint64_t)suggestion | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](suggestion, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_editDistance != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_rawScore != *((float *)v4 + 7))
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
  double score;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  float rawScore;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  v3 = -[GEOPDSearchTokenSet hash](self->_suggestion, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    score = self->_score;
    v7 = -score;
    if (score >= 0.0)
      v7 = self->_score;
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
    v10 = 2654435761 * self->_editDistance;
    if ((flags & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    return v5 ^ v3 ^ v10 ^ v15;
  }
  v10 = 0;
  if ((flags & 4) == 0)
    goto LABEL_16;
LABEL_11:
  rawScore = self->_rawScore;
  v12 = rawScore;
  if (rawScore < 0.0)
    v12 = -rawScore;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
