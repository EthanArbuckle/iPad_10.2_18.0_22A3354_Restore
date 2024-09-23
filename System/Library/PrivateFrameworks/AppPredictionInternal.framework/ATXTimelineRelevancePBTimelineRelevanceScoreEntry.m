@implementation ATXTimelineRelevancePBTimelineRelevanceScoreEntry

- (void)setRelevanceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_relevanceScore = a3;
}

- (void)setHasRelevanceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRelevanceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSuggestionID
{
  return self->_suggestionID != 0;
}

- (int)suggestionMappingReason
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_suggestionMappingReason;
  else
    return 0;
}

- (void)setSuggestionMappingReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_suggestionMappingReason = a3;
}

- (void)setHasSuggestionMappingReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuggestionMappingReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)suggestionMappingReasonAsString:(int)a3
{
  if (a3 < 7)
    return off_1E82E7E80[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuggestionMappingReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonCoalescedWithPreviousSuggestion")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonNewInfoSuggestion")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonPreviousSuggestionWasTrimmed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonNilRelevance")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonNonPositiveRelevanceScore")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonEndDateOfPreviousSuggestionWasSet")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ReasonUnknown")))
  {
    v4 = 6;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceScoreEntry;
  -[ATXTimelineRelevancePBTimelineRelevanceScoreEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevancePBTimelineRelevanceScoreEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *suggestionID;
  uint64_t suggestionMappingReason;
  __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relevanceScore);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("relevanceScore"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_duration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("duration"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
LABEL_5:
  suggestionID = self->_suggestionID;
  if (suggestionID)
    objc_msgSend(v3, "setObject:forKey:", suggestionID, CFSTR("suggestionID"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    suggestionMappingReason = self->_suggestionMappingReason;
    if (suggestionMappingReason >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestionMappingReason);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E82E7E80[suggestionMappingReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("suggestionMappingReason"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceScoreEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_suggestionID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_relevanceScore;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_duration;
  *((_BYTE *)v4 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_5:
  if (self->_suggestionID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSuggestionID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_suggestionMappingReason;
    *((_BYTE *)v4 + 44) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_relevanceScore;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_duration;
  *(_BYTE *)(v5 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_suggestionID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_suggestionMappingReason;
    *(_BYTE *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *suggestionID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_relevanceScore != *((double *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_duration != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_timestamp != *((_QWORD *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  suggestionID = self->_suggestionID;
  if ((unint64_t)suggestionID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](suggestionID, "isEqual:"))
    {
LABEL_24:
      v7 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_suggestionMappingReason != *((_DWORD *)v4 + 10))
      goto LABEL_24;
    v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double relevanceScore;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    relevanceScore = self->_relevanceScore;
    v6 = -relevanceScore;
    if (relevanceScore >= 0.0)
      v6 = self->_relevanceScore;
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
  if ((has & 1) != 0)
  {
    v9 = 2654435761 * self->_duration;
    if ((has & 4) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_timestamp;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[NSString hash](self->_suggestionID, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v12 = 2654435761 * self->_suggestionMappingReason;
  else
    v12 = 0;
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_relevanceScore = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_4:
    self->_timestamp = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[ATXTimelineRelevancePBTimelineRelevanceScoreEntry setSuggestionID:](self, "setSuggestionID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    self->_suggestionMappingReason = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionID, 0);
}

@end
