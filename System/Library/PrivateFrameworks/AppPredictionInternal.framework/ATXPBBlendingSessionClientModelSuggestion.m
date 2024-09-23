@implementation ATXPBBlendingSessionClientModelSuggestion

- (BOOL)hasExecutableId
{
  return self->_executableId != 0;
}

- (void)setRawScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawScore = a3;
}

- (void)setHasRawScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)suggestedConfidenceCategory
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_suggestedConfidenceCategory;
  else
    return 0;
}

- (void)setSuggestedConfidenceCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_suggestedConfidenceCategory = a3;
}

- (void)setHasSuggestedConfidenceCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuggestedConfidenceCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)suggestedConfidenceCategoryAsString:(int)a3
{
  if (a3 < 5)
    return off_1E82DCEC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuggestedConfidenceCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Low")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medium")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("High")))
  {
    v4 = 4;
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
  v8.super_class = (Class)ATXPBBlendingSessionClientModelSuggestion;
  -[ATXPBBlendingSessionClientModelSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingSessionClientModelSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *executableId;
  char has;
  void *v7;
  uint64_t suggestedConfidenceCategory;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  executableId = self->_executableId;
  if (executableId)
    objc_msgSend(v3, "setObject:forKey:", executableId, CFSTR("executableId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rawScore);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("rawScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
    if (suggestedConfidenceCategory >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestedConfidenceCategory);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E82DCEC0[suggestedConfidenceCategory];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("suggestedConfidenceCategory"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionClientModelSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_executableId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_executableId)
  {
    v6 = v4;
    objc_msgSend(v4, "setExecutableId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_rawScore;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_suggestedConfidenceCategory;
    *((_BYTE *)v4 + 28) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_executableId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_rawScore;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_suggestedConfidenceCategory;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *executableId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  executableId = self->_executableId;
  if ((unint64_t)executableId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](executableId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_rawScore != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_suggestedConfidenceCategory != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double rawScore;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_executableId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    rawScore = self->_rawScore;
    v7 = -rawScore;
    if (rawScore >= 0.0)
      v7 = self->_rawScore;
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
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_suggestedConfidenceCategory;
  else
    v10 = 0;
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[ATXPBBlendingSessionClientModelSuggestion setExecutableId:](self, "setExecutableId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_rawScore = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_suggestedConfidenceCategory = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)executableId
{
  return self->_executableId;
}

- (void)setExecutableId:(id)a3
{
  objc_storeStrong((id *)&self->_executableId, a3);
}

- (double)rawScore
{
  return self->_rawScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableId, 0);
}

@end
