@implementation ATXMPBAnchorModelEngagementTracker

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasCandidateType
{
  return self->_candidateType != 0;
}

- (void)setSecondsAfterAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_secondsAfterAnchor = a3;
}

- (void)setHasSecondsAfterAnchor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSecondsAfterAnchor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumPredictionsforAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numPredictionsforAnchor = a3;
}

- (void)setHasNumPredictionsforAnchor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumPredictionsforAnchor
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)engagementType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_engagementType;
  else
    return 0;
}

- (void)setEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEngagementType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82DFCD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Engaged")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Abandoned")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasExecutableObject
{
  return self->_executableObject != 0;
}

- (void)setPosteriorProbability:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_posteriorProbability = a3;
}

- (void)setHasPosteriorProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPosteriorProbability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClassConditionalProbability:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_classConditionalProbability = a3;
}

- (void)setHasClassConditionalProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClassConditionalProbability
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStandardDeviationOfOffsetFromAnchor:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_standardDeviationOfOffsetFromAnchor = a3;
}

- (void)setHasStandardDeviationOfOffsetFromAnchor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasStandardDeviationOfOffsetFromAnchor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumUniqueOccurrencesAfterAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numUniqueOccurrencesAfterAnchor = a3;
}

- (void)setHasNumUniqueOccurrencesAfterAnchor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumUniqueOccurrencesAfterAnchor
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAnchorPopularity:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_anchorPopularity = a3;
}

- (void)setHasAnchorPopularity:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAnchorPopularity
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGlobalPopularity:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_globalPopularity = a3;
}

- (void)setHasGlobalPopularity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlobalPopularity
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ATXMPBAnchorModelEngagementTracker;
  -[ATXMPBAnchorModelEngagementTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAnchorModelEngagementTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *anchorType;
  void *v6;
  NSString *candidateType;
  __int16 has;
  void *v9;
  void *v10;
  uint64_t engagementType;
  __CFString *v12;
  NSString *consumerSubType;
  NSString *abGroup;
  NSString *executableObject;
  __int16 v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  anchorType = self->_anchorType;
  if (anchorType)
    objc_msgSend(v3, "setObject:forKey:", anchorType, CFSTR("anchorType"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("score"));

  }
  candidateType = self->_candidateType;
  if (candidateType)
    objc_msgSend(v4, "setObject:forKey:", candidateType, CFSTR("candidateType"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_secondsAfterAnchor);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("secondsAfterAnchor"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numPredictionsforAnchor);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("numPredictionsforAnchor"));

  if ((*(_WORD *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_13:
  engagementType = self->_engagementType;
  if (engagementType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E82DFCD8[engagementType];
  }
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("engagementType"));

LABEL_17:
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  executableObject = self->_executableObject;
  if (executableObject)
    objc_msgSend(v4, "setObject:forKey:", executableObject, CFSTR("executableObject"));
  v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_posteriorProbability);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("posteriorProbability"));

    v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_25:
      if ((v16 & 0x20) == 0)
        goto LABEL_26;
      goto LABEL_33;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_classConditionalProbability);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("classConditionalProbability"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_26:
    if ((v16 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_standardDeviationOfOffsetFromAnchor);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("standardDeviationOfOffsetFromAnchor"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x100) == 0)
  {
LABEL_27:
    if ((v16 & 1) == 0)
      goto LABEL_28;
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_anchorPopularity);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("anchorPopularity"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_29;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numUniqueOccurrencesAfterAnchor);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("numUniqueOccurrencesAfterAnchor"));

  v16 = (__int16)self->_has;
  if ((v16 & 1) != 0)
    goto LABEL_35;
LABEL_28:
  if ((v16 & 4) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_globalPopularity);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("globalPopularity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_candidateType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_11:
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_executableObject)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0)
      goto LABEL_22;
LABEL_32:
    PBDataWriterWriteDoubleField();
    v4 = v7;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v6 & 4) != 0)
  {
LABEL_23:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_24:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_anchorType)
  {
    objc_msgSend(v4, "setAnchorType:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_score;
    *((_WORD *)v4 + 58) |= 0x10u;
  }
  if (self->_candidateType)
  {
    objc_msgSend(v7, "setCandidateType:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_secondsAfterAnchor;
    *((_WORD *)v4 + 58) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 26) = self->_numPredictionsforAnchor;
  *((_WORD *)v4 + 58) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 22) = self->_engagementType;
    *((_WORD *)v4 + 58) |= 0x40u;
  }
LABEL_11:
  if (self->_consumerSubType)
  {
    objc_msgSend(v7, "setConsumerSubType:");
    v4 = v7;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v7, "setAbGroup:");
    v4 = v7;
  }
  if (self->_executableObject)
  {
    objc_msgSend(v7, "setExecutableObject:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_posteriorProbability;
    *((_WORD *)v4 + 58) |= 8u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_classConditionalProbability;
  *((_WORD *)v4 + 58) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_standardDeviationOfOffsetFromAnchor;
  *((_WORD *)v4 + 58) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0)
      goto LABEL_22;
LABEL_32:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_anchorPopularity;
    *((_WORD *)v4 + 58) |= 1u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  *((_DWORD *)v4 + 27) = self->_numUniqueOccurrencesAfterAnchor;
  *((_WORD *)v4 + 58) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v6 & 4) != 0)
  {
LABEL_23:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_globalPopularity;
    *((_WORD *)v4 + 58) |= 4u;
  }
LABEL_24:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_anchorType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_score;
    *(_WORD *)(v5 + 116) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_candidateType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_secondsAfterAnchor;
    *(_WORD *)(v5 + 116) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 104) = self->_numPredictionsforAnchor;
  *(_WORD *)(v5 + 116) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 88) = self->_engagementType;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_7:
  v11 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  v13 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[NSString copyWithZone:](self->_executableObject, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_posteriorProbability;
    *(_WORD *)(v5 + 116) |= 8u;
    v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_9:
      if ((v17 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 16) = self->_classConditionalProbability;
  *(_WORD *)(v5 + 116) |= 2u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_10:
    if ((v17 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_standardDeviationOfOffsetFromAnchor;
  *(_WORD *)(v5 + 116) |= 0x20u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_11:
    if ((v17 & 1) == 0)
      goto LABEL_12;
LABEL_22:
    *(double *)(v5 + 8) = self->_anchorPopularity;
    *(_WORD *)(v5 + 116) |= 1u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_13;
  }
LABEL_21:
  *(_DWORD *)(v5 + 108) = self->_numUniqueOccurrencesAfterAnchor;
  *(_WORD *)(v5 + 116) |= 0x100u;
  v17 = (__int16)self->_has;
  if ((v17 & 1) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v17 & 4) != 0)
  {
LABEL_13:
    *(double *)(v5 + 24) = self->_globalPopularity;
    *(_WORD *)(v5 + 116) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *anchorType;
  __int16 has;
  __int16 v7;
  NSString *candidateType;
  __int16 v9;
  NSString *consumerSubType;
  NSString *abGroup;
  NSString *executableObject;
  __int16 v13;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](anchorType, "isEqual:"))
      goto LABEL_63;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 58);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_score != *((double *)v4 + 5))
      goto LABEL_63;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  candidateType = self->_candidateType;
  if ((unint64_t)candidateType | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](candidateType, "isEqual:"))
    {
LABEL_63:
      v15 = 0;
      goto LABEL_64;
    }
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 58);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_secondsAfterAnchor != *((_DWORD *)v4 + 28))
      goto LABEL_63;
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_numPredictionsforAnchor != *((_DWORD *)v4 + 26))
      goto LABEL_63;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_engagementType != *((_DWORD *)v4 + 22))
      goto LABEL_63;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_63;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_63;
  }
  executableObject = self->_executableObject;
  if ((unint64_t)executableObject | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](executableObject, "isEqual:"))
      goto LABEL_63;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 58);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_posteriorProbability != *((double *)v4 + 4))
      goto LABEL_63;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_classConditionalProbability != *((double *)v4 + 2))
      goto LABEL_63;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_standardDeviationOfOffsetFromAnchor != *((double *)v4 + 6))
      goto LABEL_63;
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_numUniqueOccurrencesAfterAnchor != *((_DWORD *)v4 + 27))
      goto LABEL_63;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_anchorPopularity != *((double *)v4 + 1))
      goto LABEL_63;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_globalPopularity != *((double *)v4 + 3))
      goto LABEL_63;
    v15 = 1;
  }
  else
  {
    v15 = (v14 & 4) == 0;
  }
LABEL_64:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  double score;
  double v5;
  long double v6;
  double v7;
  __int16 has;
  NSUInteger v9;
  __int16 v10;
  unint64_t v11;
  double posteriorProbability;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double classConditionalProbability;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double standardDeviationOfOffsetFromAnchor;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  double anchorPopularity;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double globalPopularity;
  double v34;
  long double v35;
  double v36;
  NSUInteger v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;

  v44 = -[NSString hash](self->_anchorType, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    score = self->_score;
    v5 = -score;
    if (score >= 0.0)
      v5 = self->_score;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v43 = -[NSString hash](self->_candidateType, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
    v42 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_11;
LABEL_14:
    v41 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v42 = 2654435761 * self->_secondsAfterAnchor;
  if ((has & 0x80) == 0)
    goto LABEL_14;
LABEL_11:
  v41 = 2654435761 * self->_numPredictionsforAnchor;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    v40 = 2654435761 * self->_engagementType;
    goto LABEL_16;
  }
LABEL_15:
  v40 = 0;
LABEL_16:
  v39 = -[NSString hash](self->_consumerSubType, "hash");
  v38 = -[NSString hash](self->_abGroup, "hash");
  v9 = -[NSString hash](self->_executableObject, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    posteriorProbability = self->_posteriorProbability;
    v13 = -posteriorProbability;
    if (posteriorProbability >= 0.0)
      v13 = self->_posteriorProbability;
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
  if ((v10 & 2) != 0)
  {
    classConditionalProbability = self->_classConditionalProbability;
    v18 = -classConditionalProbability;
    if (classConditionalProbability >= 0.0)
      v18 = self->_classConditionalProbability;
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
  if ((v10 & 0x20) != 0)
  {
    standardDeviationOfOffsetFromAnchor = self->_standardDeviationOfOffsetFromAnchor;
    v23 = -standardDeviationOfOffsetFromAnchor;
    if (standardDeviationOfOffsetFromAnchor >= 0.0)
      v23 = self->_standardDeviationOfOffsetFromAnchor;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((v10 & 0x100) != 0)
  {
    v26 = 2654435761 * self->_numUniqueOccurrencesAfterAnchor;
    if ((v10 & 1) != 0)
      goto LABEL_42;
LABEL_47:
    v31 = 0;
    goto LABEL_50;
  }
  v26 = 0;
  if ((v10 & 1) == 0)
    goto LABEL_47;
LABEL_42:
  anchorPopularity = self->_anchorPopularity;
  v28 = -anchorPopularity;
  if (anchorPopularity >= 0.0)
    v28 = self->_anchorPopularity;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_50:
  if ((v10 & 4) != 0)
  {
    globalPopularity = self->_globalPopularity;
    v34 = -globalPopularity;
    if (globalPopularity >= 0.0)
      v34 = self->_globalPopularity;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  return v3 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[ATXMPBAnchorModelEngagementTracker setAnchorType:](self, "setAnchorType:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 58) & 0x10) != 0)
  {
    self->_score = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ATXMPBAnchorModelEngagementTracker setCandidateType:](self, "setCandidateType:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x200) != 0)
  {
    self->_secondsAfterAnchor = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x80) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_numPredictionsforAnchor = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_10:
    self->_engagementType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 10))
  {
    -[ATXMPBAnchorModelEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[ATXMPBAnchorModelEngagementTracker setAbGroup:](self, "setAbGroup:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[ATXMPBAnchorModelEngagementTracker setExecutableObject:](self, "setExecutableObject:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 8) != 0)
  {
    self->_posteriorProbability = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 58);
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_classConditionalProbability = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
LABEL_30:
  self->_standardDeviationOfOffsetFromAnchor = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0)
      goto LABEL_22;
LABEL_32:
    self->_anchorPopularity = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    if ((*((_WORD *)v4 + 58) & 4) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  self->_numUniqueOccurrencesAfterAnchor = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 1) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v6 & 4) != 0)
  {
LABEL_23:
    self->_globalPopularity = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_24:

}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
  objc_storeStrong((id *)&self->_anchorType, a3);
}

- (double)score
{
  return self->_score;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (void)setCandidateType:(id)a3
{
  objc_storeStrong((id *)&self->_candidateType, a3);
}

- (unsigned)secondsAfterAnchor
{
  return self->_secondsAfterAnchor;
}

- (unsigned)numPredictionsforAnchor
{
  return self->_numPredictionsforAnchor;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)executableObject
{
  return self->_executableObject;
}

- (void)setExecutableObject:(id)a3
{
  objc_storeStrong((id *)&self->_executableObject, a3);
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (double)standardDeviationOfOffsetFromAnchor
{
  return self->_standardDeviationOfOffsetFromAnchor;
}

- (unsigned)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)anchorPopularity
{
  return self->_anchorPopularity;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableObject, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
