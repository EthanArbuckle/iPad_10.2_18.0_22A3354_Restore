@implementation ATXCandidateRelevanceModelPBCandidateMetrics

- (void)setCandidateNumberOfPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_candidateNumberOfPositiveSamples = a3;
}

- (void)setHasCandidateNumberOfPositiveSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCandidateNumberOfPositiveSamples
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCandidateNumberOfSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_candidateNumberOfSamples = a3;
}

- (void)setHasCandidateNumberOfSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCandidateNumberOfSamples
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCandidateNumberOfDaysWithPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_candidateNumberOfDaysWithPositiveSamples = a3;
}

- (void)setHasCandidateNumberOfDaysWithPositiveSamples:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCandidateNumberOfDaysWithPositiveSamples
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCandidateNumberOfModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_candidateNumberOfModelWeights = a3;
}

- (void)setHasCandidateNumberOfModelWeights:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCandidateNumberOfModelWeights
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCandidateNumberOfNonZeroModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_candidateNumberOfNonZeroModelWeights = a3;
}

- (void)setHasCandidateNumberOfNonZeroModelWeights:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCandidateNumberOfNonZeroModelWeights
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCandidateShadowLaunchPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_candidateShadowLaunchPercentage = a3;
}

- (void)setHasCandidateShadowLaunchPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCandidateShadowLaunchPercentage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCandidateShadowShownPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_candidateShadowShownPercentage = a3;
}

- (void)setHasCandidateShadowShownPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCandidateShadowShownPercentage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCandidateShadowPrecision:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_candidateShadowPrecision = a3;
}

- (void)setHasCandidateShadowPrecision:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCandidateShadowPrecision
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCandidateShadowRecall:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_candidateShadowRecall = a3;
}

- (void)setHasCandidateShadowRecall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCandidateShadowRecall
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCandidateShadowF1:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_candidateShadowF1 = a3;
}

- (void)setHasCandidateShadowF1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCandidateShadowF1
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCandidateUILaunchPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_candidateUILaunchPercentage = a3;
}

- (void)setHasCandidateUILaunchPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasCandidateUILaunchPercentage
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCandidateUIShownPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_candidateUIShownPercentage = a3;
}

- (void)setHasCandidateUIShownPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasCandidateUIShownPercentage
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setCandidateUIPrecision:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_candidateUIPrecision = a3;
}

- (void)setHasCandidateUIPrecision:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCandidateUIPrecision
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCandidateUIRecall:(float)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_candidateUIRecall = a3;
}

- (void)setHasCandidateUIRecall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasCandidateUIRecall
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCandidateUIF1:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_candidateUIF1 = a3;
}

- (void)setHasCandidateUIF1:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasCandidateUIF1
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasCandidateIdentifier
{
  return self->_candidateIdentifier != 0;
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
  v8.super_class = (Class)ATXCandidateRelevanceModelPBCandidateMetrics;
  -[ATXCandidateRelevanceModelPBCandidateMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelPBCandidateMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  __int16 has;
  void *v6;
  NSString *candidateIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_candidateNumberOfPositiveSamples);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("candidateNumberOfPositiveSamples"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_candidateNumberOfSamples);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("candidateNumberOfSamples"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_candidateNumberOfDaysWithPositiveSamples);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("candidateNumberOfDaysWithPositiveSamples"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_candidateNumberOfModelWeights);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("candidateNumberOfModelWeights"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_candidateNumberOfNonZeroModelWeights);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("candidateNumberOfNonZeroModelWeights"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&v4 = self->_candidateShadowLaunchPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("candidateShadowLaunchPercentage"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(float *)&v4 = self->_candidateShadowShownPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("candidateShadowShownPercentage"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(float *)&v4 = self->_candidateShadowPrecision;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("candidateShadowPrecision"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(float *)&v4 = self->_candidateShadowRecall;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("candidateShadowRecall"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(float *)&v4 = self->_candidateShadowF1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("candidateShadowF1"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(float *)&v4 = self->_candidateUILaunchPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("candidateUILaunchPercentage"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(float *)&v4 = self->_candidateUIShownPercentage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("candidateUIShownPercentage"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&v4 = self->_candidateUIPrecision;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("candidateUIPrecision"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  *(float *)&v4 = self->_candidateUIRecall;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("candidateUIRecall"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(float *)&v4 = self->_candidateUIF1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("candidateUIF1"));

  }
LABEL_17:
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier)
    objc_msgSend(v3, "setObject:forKey:", candidateIdentifier, CFSTR("candidateIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBCandidateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  has = (__int16)self->_has;
  v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  v4 = v6;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_17:
  if (self->_candidateIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  _DWORD *v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_candidateNumberOfPositiveSamples;
    *((_WORD *)v4 + 38) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_candidateNumberOfSamples;
  *((_WORD *)v4 + 38) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v4[4] = self->_candidateNumberOfDaysWithPositiveSamples;
  *((_WORD *)v4 + 38) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v4[5] = self->_candidateNumberOfModelWeights;
  *((_WORD *)v4 + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v4[6] = self->_candidateNumberOfNonZeroModelWeights;
  *((_WORD *)v4 + 38) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v4[10] = LODWORD(self->_candidateShadowLaunchPercentage);
  *((_WORD *)v4 + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v4[13] = LODWORD(self->_candidateShadowShownPercentage);
  *((_WORD *)v4 + 38) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v4[11] = LODWORD(self->_candidateShadowPrecision);
  *((_WORD *)v4 + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v4[12] = LODWORD(self->_candidateShadowRecall);
  *((_WORD *)v4 + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v4[9] = LODWORD(self->_candidateShadowF1);
  *((_WORD *)v4 + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v4[15] = LODWORD(self->_candidateUILaunchPercentage);
  *((_WORD *)v4 + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v4[18] = LODWORD(self->_candidateUIShownPercentage);
  *((_WORD *)v4 + 38) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v4[16] = LODWORD(self->_candidateUIPrecision);
  *((_WORD *)v4 + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  v4[17] = LODWORD(self->_candidateUIRecall);
  *((_WORD *)v4 + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    v4[14] = LODWORD(self->_candidateUIF1);
    *((_WORD *)v4 + 38) |= 0x400u;
  }
LABEL_17:
  if (self->_candidateIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setCandidateIdentifier:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  __int16 has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_candidateNumberOfPositiveSamples;
    *(_WORD *)(v5 + 76) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_candidateNumberOfSamples;
  *(_WORD *)(v5 + 76) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 16) = self->_candidateNumberOfDaysWithPositiveSamples;
  *(_WORD *)(v5 + 76) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 20) = self->_candidateNumberOfModelWeights;
  *(_WORD *)(v5 + 76) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 24) = self->_candidateNumberOfNonZeroModelWeights;
  *(_WORD *)(v5 + 76) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *(float *)(v5 + 40) = self->_candidateShadowLaunchPercentage;
  *(_WORD *)(v5 + 76) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *(float *)(v5 + 52) = self->_candidateShadowShownPercentage;
  *(_WORD *)(v5 + 76) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *(float *)(v5 + 44) = self->_candidateShadowPrecision;
  *(_WORD *)(v5 + 76) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *(float *)(v5 + 48) = self->_candidateShadowRecall;
  *(_WORD *)(v5 + 76) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *(float *)(v5 + 36) = self->_candidateShadowF1;
  *(_WORD *)(v5 + 76) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *(float *)(v5 + 60) = self->_candidateUILaunchPercentage;
  *(_WORD *)(v5 + 76) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *(float *)(v5 + 72) = self->_candidateUIShownPercentage;
  *(_WORD *)(v5 + 76) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
LABEL_31:
    *(float *)(v5 + 68) = self->_candidateUIRecall;
    *(_WORD *)(v5 + 76) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  *(float *)(v5 + 64) = self->_candidateUIPrecision;
  *(_WORD *)(v5 + 76) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
    goto LABEL_31;
LABEL_15:
  if ((has & 0x400) != 0)
  {
LABEL_16:
    *(float *)(v5 + 56) = self->_candidateUIF1;
    *(_WORD *)(v5 + 76) |= 0x400u;
  }
LABEL_17:
  v8 = -[NSString copyWithZone:](self->_candidateIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *candidateIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 38);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_candidateNumberOfPositiveSamples != *((_DWORD *)v4 + 7))
      goto LABEL_79;
  }
  else if ((v6 & 8) != 0)
  {
LABEL_79:
    v8 = 0;
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_candidateNumberOfSamples != *((_DWORD *)v4 + 8))
      goto LABEL_79;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_candidateNumberOfDaysWithPositiveSamples != *((_DWORD *)v4 + 4))
      goto LABEL_79;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_candidateNumberOfModelWeights != *((_DWORD *)v4 + 5))
      goto LABEL_79;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_candidateNumberOfNonZeroModelWeights != *((_DWORD *)v4 + 6))
      goto LABEL_79;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_candidateShadowLaunchPercentage != *((float *)v4 + 10))
      goto LABEL_79;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_candidateShadowShownPercentage != *((float *)v4 + 13))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_candidateShadowPrecision != *((float *)v4 + 11))
      goto LABEL_79;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_candidateShadowRecall != *((float *)v4 + 12))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_candidateShadowF1 != *((float *)v4 + 9))
      goto LABEL_79;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x800) == 0 || self->_candidateUILaunchPercentage != *((float *)v4 + 15))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x4000) == 0 || self->_candidateUIShownPercentage != *((float *)v4 + 18))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x4000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x1000) == 0 || self->_candidateUIPrecision != *((float *)v4 + 16))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x2000) == 0 || self->_candidateUIRecall != *((float *)v4 + 17))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x2000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x400) == 0 || self->_candidateUIF1 != *((float *)v4 + 14))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if ((unint64_t)candidateIdentifier | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](candidateIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_80:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  float candidateShadowLaunchPercentage;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float candidateShadowShownPercentage;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float candidateShadowPrecision;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float candidateShadowRecall;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float candidateShadowF1;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  float candidateUILaunchPercentage;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float candidateUIShownPercentage;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  float candidateUIPrecision;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  float candidateUIRecall;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  float candidateUIF1;
  float v51;
  float v52;
  float v53;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v61 = 2654435761 * self->_candidateNumberOfPositiveSamples;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v60 = 2654435761 * self->_candidateNumberOfSamples;
      if ((has & 1) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v61 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  v60 = 0;
  if ((has & 1) != 0)
  {
LABEL_4:
    v59 = 2654435761 * self->_candidateNumberOfDaysWithPositiveSamples;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v59 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v58 = 2654435761 * self->_candidateNumberOfModelWeights;
    if ((has & 4) != 0)
      goto LABEL_6;
LABEL_15:
    v57 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_7;
LABEL_16:
    v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v58 = 0;
  if ((has & 4) == 0)
    goto LABEL_15;
LABEL_6:
  v57 = 2654435761 * self->_candidateNumberOfNonZeroModelWeights;
  if ((has & 0x40) == 0)
    goto LABEL_16;
LABEL_7:
  candidateShadowLaunchPercentage = self->_candidateShadowLaunchPercentage;
  v5 = -candidateShadowLaunchPercentage;
  if (candidateShadowLaunchPercentage >= 0.0)
    v5 = self->_candidateShadowLaunchPercentage;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_19:
  if ((has & 0x200) != 0)
  {
    candidateShadowShownPercentage = self->_candidateShadowShownPercentage;
    v11 = -candidateShadowShownPercentage;
    if (candidateShadowShownPercentage >= 0.0)
      v11 = self->_candidateShadowShownPercentage;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v56 = v8;
  if ((has & 0x80) != 0)
  {
    candidateShadowPrecision = self->_candidateShadowPrecision;
    v16 = -candidateShadowPrecision;
    if (candidateShadowPrecision >= 0.0)
      v16 = self->_candidateShadowPrecision;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v55 = v9;
  if ((has & 0x100) != 0)
  {
    candidateShadowRecall = self->_candidateShadowRecall;
    v21 = -candidateShadowRecall;
    if (candidateShadowRecall >= 0.0)
      v21 = self->_candidateShadowRecall;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    candidateShadowF1 = self->_candidateShadowF1;
    v26 = -candidateShadowF1;
    if (candidateShadowF1 >= 0.0)
      v26 = self->_candidateShadowF1;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 0x800) != 0)
  {
    candidateUILaunchPercentage = self->_candidateUILaunchPercentage;
    v31 = -candidateUILaunchPercentage;
    if (candidateUILaunchPercentage >= 0.0)
      v31 = self->_candidateUILaunchPercentage;
    v32 = floorf(v31 + 0.5);
    v33 = (float)(v31 - v32) * 1.8447e19;
    v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 0x4000) != 0)
  {
    candidateUIShownPercentage = self->_candidateUIShownPercentage;
    v36 = -candidateUIShownPercentage;
    if (candidateUIShownPercentage >= 0.0)
      v36 = self->_candidateUIShownPercentage;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    candidateUIPrecision = self->_candidateUIPrecision;
    v41 = -candidateUIPrecision;
    if (candidateUIPrecision >= 0.0)
      v41 = self->_candidateUIPrecision;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((has & 0x2000) != 0)
  {
    candidateUIRecall = self->_candidateUIRecall;
    v46 = -candidateUIRecall;
    if (candidateUIRecall >= 0.0)
      v46 = self->_candidateUIRecall;
    v47 = floorf(v46 + 0.5);
    v48 = (float)(v46 - v47) * 1.8447e19;
    v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  if ((has & 0x400) != 0)
  {
    candidateUIF1 = self->_candidateUIF1;
    v51 = -candidateUIF1;
    if (candidateUIF1 >= 0.0)
      v51 = self->_candidateUIF1;
    v52 = floorf(v51 + 0.5);
    v53 = (float)(v51 - v52) * 1.8447e19;
    v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v49 ^ -[NSString hash](self->_candidateIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) != 0)
  {
    self->_candidateNumberOfPositiveSamples = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 38);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_candidateNumberOfSamples = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_candidateNumberOfDaysWithPositiveSamples = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_candidateNumberOfModelWeights = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_candidateNumberOfNonZeroModelWeights = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_candidateShadowLaunchPercentage = *((float *)v4 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_candidateShadowShownPercentage = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_candidateShadowPrecision = *((float *)v4 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_candidateShadowRecall = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_candidateShadowF1 = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_candidateUILaunchPercentage = *((float *)v4 + 15);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  self->_candidateUIShownPercentage = *((float *)v4 + 18);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_candidateUIPrecision = *((float *)v4 + 16);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  self->_candidateUIRecall = *((float *)v4 + 17);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
LABEL_16:
    self->_candidateUIF1 = *((float *)v4 + 14);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[ATXCandidateRelevanceModelPBCandidateMetrics setCandidateIdentifier:](self, "setCandidateIdentifier:");
    v4 = v6;
  }

}

- (unsigned)candidateNumberOfPositiveSamples
{
  return self->_candidateNumberOfPositiveSamples;
}

- (unsigned)candidateNumberOfSamples
{
  return self->_candidateNumberOfSamples;
}

- (unsigned)candidateNumberOfDaysWithPositiveSamples
{
  return self->_candidateNumberOfDaysWithPositiveSamples;
}

- (unsigned)candidateNumberOfModelWeights
{
  return self->_candidateNumberOfModelWeights;
}

- (unsigned)candidateNumberOfNonZeroModelWeights
{
  return self->_candidateNumberOfNonZeroModelWeights;
}

- (float)candidateShadowLaunchPercentage
{
  return self->_candidateShadowLaunchPercentage;
}

- (float)candidateShadowShownPercentage
{
  return self->_candidateShadowShownPercentage;
}

- (float)candidateShadowPrecision
{
  return self->_candidateShadowPrecision;
}

- (float)candidateShadowRecall
{
  return self->_candidateShadowRecall;
}

- (float)candidateShadowF1
{
  return self->_candidateShadowF1;
}

- (float)candidateUILaunchPercentage
{
  return self->_candidateUILaunchPercentage;
}

- (float)candidateUIShownPercentage
{
  return self->_candidateUIShownPercentage;
}

- (float)candidateUIPrecision
{
  return self->_candidateUIPrecision;
}

- (float)candidateUIRecall
{
  return self->_candidateUIRecall;
}

- (float)candidateUIF1
{
  return self->_candidateUIF1;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (void)setCandidateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_candidateIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
}

@end
