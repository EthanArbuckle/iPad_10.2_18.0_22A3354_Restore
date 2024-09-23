@implementation CLPPipelineDiagnosticReport

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPPipelineDiagnosticReport;
  -[CLPPipelineDiagnosticReport dealloc](&v3, sel_dealloc);
}

- (int)yieldType
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    return self->_yieldType;
  else
    return 0;
}

- (void)setYieldType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_yieldType = a3;
}

- (void)setHasYieldType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasYieldType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)yieldTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E9595C28 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsYieldType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldTypePrimary")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldTypeAuxilary")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("YieldTypeDeadReckoning")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPrbPipelinedSaysYield:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prbPipelinedSaysYield = a3;
}

- (void)setHasPrbPipelinedSaysYield:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrbPipelinedSaysYield
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrbCoarseIndoorSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_prbCoarseIndoorSaysIndoor = a3;
}

- (void)setHasPrbCoarseIndoorSaysIndoor:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPrbCoarseIndoorSaysIndoor
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPrbWifiSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prbWifiSaysIndoor = a3;
}

- (void)setHasPrbWifiSaysIndoor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrbWifiSaysIndoor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPrbGpsSaysIndoor:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_prbGpsSaysIndoor = a3;
}

- (void)setHasPrbGpsSaysIndoor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPrbGpsSaysIndoor
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPrbParticleFilterSaysYield:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_prbParticleFilterSaysYield = a3;
}

- (void)setHasPrbParticleFilterSaysYield:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPrbParticleFilterSaysYield
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPrbOnFloorsEstimate:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_prbOnFloorsEstimate = a3;
}

- (void)setHasPrbOnFloorsEstimate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPrbOnFloorsEstimate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)prbOnFloorEstimatesCount
{
  return self->_prbOnFloorEstimates.count;
}

- (double)prbOnFloorEstimates
{
  return self->_prbOnFloorEstimates.list;
}

- (void)clearPrbOnFloorEstimates
{
  PBRepeatedDoubleClear();
}

- (void)addPrbOnFloorEstimate:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)prbOnFloorEstimateAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_prbOnFloorEstimates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_prbOnFloorEstimates = &self->_prbOnFloorEstimates;
  count = self->_prbOnFloorEstimates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_prbOnFloorEstimates->list[a3];
}

- (void)setPrbOnFloorEstimates:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)setPrbInlierEstimate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_prbInlierEstimate = a3;
}

- (void)setHasPrbInlierEstimate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPrbInlierEstimate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPrbLocalizerIoWrapperSaysWifiOk:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_prbLocalizerIoWrapperSaysWifiOk = a3;
}

- (void)setHasPrbLocalizerIoWrapperSaysWifiOk:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPrbLocalizerIoWrapperSaysWifiOk
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPrbInjectionOccupancyRetryLimitOk:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_prbInjectionOccupancyRetryLimitOk = a3;
}

- (void)setHasPrbInjectionOccupancyRetryLimitOk:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPrbInjectionOccupancyRetryLimitOk
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPrbInjectionGainRetryLimitOk:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_prbInjectionGainRetryLimitOk = a3;
}

- (void)setHasPrbInjectionGainRetryLimitOk:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPrbInjectionGainRetryLimitOk
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)pfYieldStatusBeforeCalculatePose
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_pfYieldStatusBeforeCalculatePose;
  else
    return 0;
}

- (void)setPfYieldStatusBeforeCalculatePose:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pfYieldStatusBeforeCalculatePose = a3;
}

- (void)setHasPfYieldStatusBeforeCalculatePose:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPfYieldStatusBeforeCalculatePose
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)pfYieldStatusBeforeCalculatePoseAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E9595C48 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPfYieldStatusBeforeCalculatePose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusOK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusLow")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusOffmap")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusNone")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)yieldStatusBeforeCalculatePose
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_yieldStatusBeforeCalculatePose;
  else
    return 0;
}

- (void)setYieldStatusBeforeCalculatePose:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_yieldStatusBeforeCalculatePose = a3;
}

- (void)setHasYieldStatusBeforeCalculatePose:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasYieldStatusBeforeCalculatePose
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)yieldStatusBeforeCalculatePoseAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E9595C48 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsYieldStatusBeforeCalculatePose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusOK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusLow")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusOffmap")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("YieldStatusNone")))
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
  v8.super_class = (Class)CLPPipelineDiagnosticReport;
  -[CLPPipelineDiagnosticReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPipelineDiagnosticReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t yieldType;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t pfYieldStatusBeforeCalculatePose;
  void *v20;
  uint64_t yieldStatusBeforeCalculatePose;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    yieldType = self->_yieldType;
    if (yieldType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_yieldType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E9595C28 + yieldType);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("yieldType"));

    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbPipelinedSaysYield);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("prbPipelinedSaysYield"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_8:
      if ((has & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_22;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbCoarseIndoorSaysIndoor);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("prbCoarseIndoorSaysIndoor"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbWifiSaysIndoor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("prbWifiSaysIndoor"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbGpsSaysIndoor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("prbGpsSaysIndoor"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbParticleFilterSaysYield);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("prbParticleFilterSaysYield"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbOnFloorsEstimate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("prbOnFloorsEstimate"));

  }
LABEL_13:
  PBRepeatedDoubleNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("prbOnFloorEstimate"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbInlierEstimate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("prbInlierEstimate"));

    v9 = (__int16)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0)
        goto LABEL_16;
      goto LABEL_28;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbLocalizerIoWrapperSaysWifiOk);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("prbLocalizerIoWrapperSaysWifiOk"));

  v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 4) == 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbInjectionOccupancyRetryLimitOk);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("prbInjectionOccupancyRetryLimitOk"));

  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_17:
    if ((v9 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prbInjectionGainRetryLimitOk);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("prbInjectionGainRetryLimitOk"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x400) == 0)
  {
LABEL_18:
    if ((v9 & 0x800) == 0)
      return v3;
    goto LABEL_34;
  }
LABEL_30:
  pfYieldStatusBeforeCalculatePose = self->_pfYieldStatusBeforeCalculatePose;
  if (pfYieldStatusBeforeCalculatePose >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pfYieldStatusBeforeCalculatePose);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = *(&off_1E9595C48 + pfYieldStatusBeforeCalculatePose);
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("pfYieldStatusBeforeCalculatePose"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_34:
    yieldStatusBeforeCalculatePose = self->_yieldStatusBeforeCalculatePose;
    if (yieldStatusBeforeCalculatePose >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_yieldStatusBeforeCalculatePose);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E9595C48 + yieldStatusBeforeCalculatePose);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("yieldStatusBeforeCalculatePose"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPipelineDiagnosticReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  __int16 v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:
  if (self->_prbOnFloorEstimates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_prbOnFloorEstimates.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_prbOnFloorEstimates.count);
    }
    PBDataWriterRecallMark();
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0)
        goto LABEL_17;
      goto LABEL_31;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteDoubleField();
  v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_17:
    if ((v7 & 4) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_18:
    if ((v7 & 0x400) == 0)
      goto LABEL_19;
LABEL_33:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0)
    goto LABEL_33;
LABEL_19:
  if ((v7 & 0x800) != 0)
LABEL_20:
    PBDataWriterWriteInt32Field();
LABEL_21:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int16 v9;
  id v10;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v4[30] = self->_yieldType;
    *((_WORD *)v4 + 62) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_prbPipelinedSaysYield;
  *((_WORD *)v4 + 62) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_prbCoarseIndoorSaysIndoor;
  *((_WORD *)v4 + 62) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_prbWifiSaysIndoor;
  *((_WORD *)v4 + 62) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
LABEL_26:
    *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_prbParticleFilterSaysYield;
    *((_WORD *)v4 + 62) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_25:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_prbGpsSaysIndoor;
  *((_WORD *)v4 + 62) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_26;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_prbOnFloorsEstimate;
    *((_WORD *)v4 + 62) |= 0x40u;
  }
LABEL_9:
  v10 = v4;
  if (-[CLPPipelineDiagnosticReport prbOnFloorEstimatesCount](self, "prbOnFloorEstimatesCount"))
  {
    objc_msgSend(v10, "clearPrbOnFloorEstimates");
    v6 = -[CLPPipelineDiagnosticReport prbOnFloorEstimatesCount](self, "prbOnFloorEstimatesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[CLPPipelineDiagnosticReport prbOnFloorEstimateAtIndex:](self, "prbOnFloorEstimateAtIndex:", i);
        objc_msgSend(v10, "addPrbOnFloorEstimate:");
      }
    }
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((_QWORD *)v10 + 8) = *(_QWORD *)&self->_prbInlierEstimate;
    *((_WORD *)v10 + 62) |= 0x10u;
    v9 = (__int16)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((_QWORD *)v10 + 9) = *(_QWORD *)&self->_prbLocalizerIoWrapperSaysWifiOk;
  *((_WORD *)v10 + 62) |= 0x20u;
  v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 4) == 0)
      goto LABEL_17;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v10 + 7) = *(_QWORD *)&self->_prbInjectionOccupancyRetryLimitOk;
  *((_WORD *)v10 + 62) |= 8u;
  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_17:
    if ((v9 & 0x400) == 0)
      goto LABEL_18;
LABEL_32:
    *((_DWORD *)v10 + 28) = self->_pfYieldStatusBeforeCalculatePose;
    *((_WORD *)v10 + 62) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_31:
  *((_QWORD *)v10 + 6) = *(_QWORD *)&self->_prbInjectionGainRetryLimitOk;
  *((_WORD *)v10 + 62) |= 4u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x400) != 0)
    goto LABEL_32;
LABEL_18:
  if ((v9 & 0x800) != 0)
  {
LABEL_19:
    *((_DWORD *)v10 + 29) = self->_yieldStatusBeforeCalculatePose;
    *((_WORD *)v10 + 62) |= 0x800u;
  }
LABEL_20:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(_DWORD *)(v4 + 120) = self->_yieldType;
    *(_WORD *)(v4 + 124) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 96) = self->_prbPipelinedSaysYield;
  *(_WORD *)(v4 + 124) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v4 + 32) = self->_prbCoarseIndoorSaysIndoor;
  *(_WORD *)(v4 + 124) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v4 + 104) = self->_prbWifiSaysIndoor;
  *(_WORD *)(v4 + 124) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(double *)(v4 + 40) = self->_prbGpsSaysIndoor;
  *(_WORD *)(v4 + 124) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_22:
  *(double *)(v4 + 88) = self->_prbParticleFilterSaysYield;
  *(_WORD *)(v4 + 124) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(double *)(v4 + 80) = self->_prbOnFloorsEstimate;
    *(_WORD *)(v4 + 124) |= 0x40u;
  }
LABEL_9:
  PBRepeatedDoubleCopy();
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *(double *)(v5 + 64) = self->_prbInlierEstimate;
    *(_WORD *)(v5 + 124) |= 0x10u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(double *)(v5 + 72) = self->_prbLocalizerIoWrapperSaysWifiOk;
  *(_WORD *)(v5 + 124) |= 0x20u;
  v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 56) = self->_prbInjectionOccupancyRetryLimitOk;
  *(_WORD *)(v5 + 124) |= 8u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0)
      goto LABEL_14;
LABEL_28:
    *(_DWORD *)(v5 + 112) = self->_pfYieldStatusBeforeCalculatePose;
    *(_WORD *)(v5 + 124) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      return (id)v5;
    goto LABEL_15;
  }
LABEL_27:
  *(double *)(v5 + 48) = self->_prbInjectionGainRetryLimitOk;
  *(_WORD *)(v5 + 124) |= 4u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0)
    goto LABEL_28;
LABEL_14:
  if ((v7 & 0x800) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 116) = self->_yieldStatusBeforeCalculatePose;
    *(_WORD *)(v5 + 124) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 62);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x1000) == 0 || self->_yieldType != *((_DWORD *)v4 + 30))
      goto LABEL_68;
  }
  else if ((*((_WORD *)v4 + 62) & 0x1000) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_prbPipelinedSaysYield != *((double *)v4 + 12))
      goto LABEL_68;
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_prbCoarseIndoorSaysIndoor != *((double *)v4 + 4))
      goto LABEL_68;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0 || self->_prbWifiSaysIndoor != *((double *)v4 + 13))
      goto LABEL_68;
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_prbGpsSaysIndoor != *((double *)v4 + 5))
      goto LABEL_68;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prbParticleFilterSaysYield != *((double *)v4 + 11))
      goto LABEL_68;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prbOnFloorsEstimate != *((double *)v4 + 10))
      goto LABEL_68;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if (!PBRepeatedDoubleIsEqual())
  {
LABEL_68:
    v9 = 0;
    goto LABEL_69;
  }
  v7 = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_prbInlierEstimate != *((double *)v4 + 8))
      goto LABEL_68;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_prbLocalizerIoWrapperSaysWifiOk != *((double *)v4 + 9))
      goto LABEL_68;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_prbInjectionOccupancyRetryLimitOk != *((double *)v4 + 7))
      goto LABEL_68;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_prbInjectionGainRetryLimitOk != *((double *)v4 + 6))
      goto LABEL_68;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x400) == 0 || self->_pfYieldStatusBeforeCalculatePose != *((_DWORD *)v4 + 28))
      goto LABEL_68;
  }
  else if ((*((_WORD *)v4 + 62) & 0x400) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x800) == 0 || self->_yieldStatusBeforeCalculatePose != *((_DWORD *)v4 + 29))
      goto LABEL_68;
    v9 = 1;
  }
  else
  {
    v9 = (v8 & 0x800) == 0;
  }
LABEL_69:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  double prbPipelinedSaysYield;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double prbCoarseIndoorSaysIndoor;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double prbWifiSaysIndoor;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double prbGpsSaysIndoor;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double prbParticleFilterSaysYield;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double prbOnFloorsEstimate;
  double v31;
  long double v32;
  double v33;
  __int16 v34;
  unint64_t v35;
  double prbInlierEstimate;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double prbLocalizerIoWrapperSaysWifiOk;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  double prbInjectionOccupancyRetryLimitOk;
  double v48;
  long double v49;
  double v50;
  unint64_t v51;
  double prbInjectionGainRetryLimitOk;
  double v53;
  long double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v62 = 2654435761 * self->_yieldType;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v62 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_8;
LABEL_3:
  prbPipelinedSaysYield = self->_prbPipelinedSaysYield;
  v5 = -prbPipelinedSaysYield;
  if (prbPipelinedSaysYield >= 0.0)
    v5 = self->_prbPipelinedSaysYield;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    prbCoarseIndoorSaysIndoor = self->_prbCoarseIndoorSaysIndoor;
    v11 = -prbCoarseIndoorSaysIndoor;
    if (prbCoarseIndoorSaysIndoor >= 0.0)
      v11 = self->_prbCoarseIndoorSaysIndoor;
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
  if ((has & 0x200) != 0)
  {
    prbWifiSaysIndoor = self->_prbWifiSaysIndoor;
    v16 = -prbWifiSaysIndoor;
    if (prbWifiSaysIndoor >= 0.0)
      v16 = self->_prbWifiSaysIndoor;
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
  if ((has & 2) != 0)
  {
    prbGpsSaysIndoor = self->_prbGpsSaysIndoor;
    v21 = -prbGpsSaysIndoor;
    if (prbGpsSaysIndoor >= 0.0)
      v21 = self->_prbGpsSaysIndoor;
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
  if ((has & 0x80) != 0)
  {
    prbParticleFilterSaysYield = self->_prbParticleFilterSaysYield;
    v26 = -prbParticleFilterSaysYield;
    if (prbParticleFilterSaysYield >= 0.0)
      v26 = self->_prbParticleFilterSaysYield;
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
  v61 = v8;
  if ((has & 0x40) != 0)
  {
    prbOnFloorsEstimate = self->_prbOnFloorsEstimate;
    v31 = -prbOnFloorsEstimate;
    if (prbOnFloorsEstimate >= 0.0)
      v31 = self->_prbOnFloorsEstimate;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v60 = v14;
  v59 = PBRepeatedDoubleHash();
  v34 = (__int16)self->_has;
  if ((v34 & 0x10) != 0)
  {
    prbInlierEstimate = self->_prbInlierEstimate;
    v37 = -prbInlierEstimate;
    if (prbInlierEstimate >= 0.0)
      v37 = self->_prbInlierEstimate;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((v34 & 0x20) != 0)
  {
    prbLocalizerIoWrapperSaysWifiOk = self->_prbLocalizerIoWrapperSaysWifiOk;
    v42 = -prbLocalizerIoWrapperSaysWifiOk;
    if (prbLocalizerIoWrapperSaysWifiOk >= 0.0)
      v42 = self->_prbLocalizerIoWrapperSaysWifiOk;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  v45 = v19;
  if ((v34 & 8) != 0)
  {
    prbInjectionOccupancyRetryLimitOk = self->_prbInjectionOccupancyRetryLimitOk;
    v48 = -prbInjectionOccupancyRetryLimitOk;
    if (prbInjectionOccupancyRetryLimitOk >= 0.0)
      v48 = self->_prbInjectionOccupancyRetryLimitOk;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  if ((v34 & 4) != 0)
  {
    prbInjectionGainRetryLimitOk = self->_prbInjectionGainRetryLimitOk;
    v53 = -prbInjectionGainRetryLimitOk;
    if (prbInjectionGainRetryLimitOk >= 0.0)
      v53 = self->_prbInjectionGainRetryLimitOk;
    v54 = floor(v53 + 0.5);
    v55 = (v53 - v54) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0)
        v51 += (unint64_t)v55;
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    v51 = 0;
  }
  if ((v34 & 0x400) != 0)
  {
    v56 = 2654435761 * self->_pfYieldStatusBeforeCalculatePose;
    if ((v34 & 0x800) != 0)
      goto LABEL_85;
LABEL_87:
    v57 = 0;
    return v61 ^ v62 ^ v9 ^ v60 ^ v45 ^ v24 ^ v29 ^ v35 ^ v40 ^ v46 ^ v51 ^ v59 ^ v56 ^ v57;
  }
  v56 = 0;
  if ((v34 & 0x800) == 0)
    goto LABEL_87;
LABEL_85:
  v57 = 2654435761 * self->_yieldStatusBeforeCalculatePose;
  return v61 ^ v62 ^ v9 ^ v60 ^ v45 ^ v24 ^ v29 ^ v35 ^ v40 ^ v46 ^ v51 ^ v59 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x1000) != 0)
  {
    self->_yieldType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x1000u;
    v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_prbPipelinedSaysYield = *((double *)v4 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_prbCoarseIndoorSaysIndoor = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_prbWifiSaysIndoor = *((double *)v4 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_prbGpsSaysIndoor = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_25:
  self->_prbParticleFilterSaysYield = *((double *)v4 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 62) & 0x40) != 0)
  {
LABEL_8:
    self->_prbOnFloorsEstimate = *((double *)v4 + 10);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_9:
  v10 = v4;
  v6 = objc_msgSend(v4, "prbOnFloorEstimatesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v10, "prbOnFloorEstimateAtIndex:", i);
      -[CLPPipelineDiagnosticReport addPrbOnFloorEstimate:](self, "addPrbOnFloorEstimate:");
    }
  }
  v9 = *((_WORD *)v10 + 62);
  if ((v9 & 0x10) != 0)
  {
    self->_prbInlierEstimate = *((double *)v10 + 8);
    *(_WORD *)&self->_has |= 0x10u;
    v9 = *((_WORD *)v10 + 62);
    if ((v9 & 0x20) == 0)
    {
LABEL_14:
      if ((v9 & 8) == 0)
        goto LABEL_15;
      goto LABEL_29;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  self->_prbLocalizerIoWrapperSaysWifiOk = *((double *)v10 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v9 = *((_WORD *)v10 + 62);
  if ((v9 & 8) == 0)
  {
LABEL_15:
    if ((v9 & 4) == 0)
      goto LABEL_16;
    goto LABEL_30;
  }
LABEL_29:
  self->_prbInjectionOccupancyRetryLimitOk = *((double *)v10 + 7);
  *(_WORD *)&self->_has |= 8u;
  v9 = *((_WORD *)v10 + 62);
  if ((v9 & 4) == 0)
  {
LABEL_16:
    if ((v9 & 0x400) == 0)
      goto LABEL_17;
LABEL_31:
    self->_pfYieldStatusBeforeCalculatePose = *((_DWORD *)v10 + 28);
    *(_WORD *)&self->_has |= 0x400u;
    if ((*((_WORD *)v10 + 62) & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_30:
  self->_prbInjectionGainRetryLimitOk = *((double *)v10 + 6);
  *(_WORD *)&self->_has |= 4u;
  v9 = *((_WORD *)v10 + 62);
  if ((v9 & 0x400) != 0)
    goto LABEL_31;
LABEL_17:
  if ((v9 & 0x800) != 0)
  {
LABEL_18:
    self->_yieldStatusBeforeCalculatePose = *((_DWORD *)v10 + 29);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_19:

}

- (double)prbPipelinedSaysYield
{
  return self->_prbPipelinedSaysYield;
}

- (double)prbCoarseIndoorSaysIndoor
{
  return self->_prbCoarseIndoorSaysIndoor;
}

- (double)prbWifiSaysIndoor
{
  return self->_prbWifiSaysIndoor;
}

- (double)prbGpsSaysIndoor
{
  return self->_prbGpsSaysIndoor;
}

- (double)prbParticleFilterSaysYield
{
  return self->_prbParticleFilterSaysYield;
}

- (double)prbOnFloorsEstimate
{
  return self->_prbOnFloorsEstimate;
}

- (double)prbInlierEstimate
{
  return self->_prbInlierEstimate;
}

- (double)prbLocalizerIoWrapperSaysWifiOk
{
  return self->_prbLocalizerIoWrapperSaysWifiOk;
}

- (double)prbInjectionOccupancyRetryLimitOk
{
  return self->_prbInjectionOccupancyRetryLimitOk;
}

- (double)prbInjectionGainRetryLimitOk
{
  return self->_prbInjectionGainRetryLimitOk;
}

@end
