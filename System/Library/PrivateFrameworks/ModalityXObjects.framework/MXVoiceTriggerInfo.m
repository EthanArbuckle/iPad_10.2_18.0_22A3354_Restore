@implementation MXVoiceTriggerInfo

- (void)setTriggerScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_triggerScore = a3;
}

- (void)setHasTriggerScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTriggerScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTriggerThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_triggerThreshold = a3;
}

- (void)setHasTriggerThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTriggerThreshold
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSatScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_satScore = a3;
}

- (void)setHasSatScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSatScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSatThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_satThreshold = a3;
}

- (void)setHasSatThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSatThreshold
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRecognizerScore:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_recognizerScore = a3;
}

- (void)setHasRecognizerScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRecognizerScore
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRecognizerThresholdOffset:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recognizerThresholdOffset = a3;
}

- (void)setHasRecognizerThresholdOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecognizerThresholdOffset
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)setHardwareSampleRate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hardwareSampleRate = a3;
}

- (void)setHasHardwareSampleRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHardwareSampleRate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setExtraSamplesAtStart:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_extraSamplesAtStart = a3;
}

- (void)setHasExtraSamplesAtStart:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasExtraSamplesAtStart
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTriggerEnd:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_triggerEnd = a3;
}

- (void)setHasTriggerEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTriggerEnd
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXVoiceTriggerInfo;
  -[MXVoiceTriggerInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXVoiceTriggerInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSString *configVersion;
  __int16 v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_triggerScore);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("trigger_score"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_triggerThreshold);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("trigger_threshold"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_satScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sat_score"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_satThreshold);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sat_threshold"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerScore);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("recognizer_score"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerThresholdOffset);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("recognizer_threshold_offset"));

  }
LABEL_8:
  configVersion = self->_configVersion;
  if (configVersion)
    objc_msgSend(v3, "setObject:forKey:", configVersion, CFSTR("config_version"));
  v7 = (__int16)self->_has;
  if ((v7 & 2) == 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_12;
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_extraSamplesAtStart);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("extra_samples_at_start"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hardwareSampleRate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("hardware_sample_rate"));

  v7 = (__int16)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v7 & 0x40) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_triggerEnd);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("trigger_end"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXVoiceTriggerInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  id v6;

  v6 = a3;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_configVersion)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_12;
LABEL_22:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  v5 = (__int16)self->_has;
  if ((v5 & 1) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v5 & 0x40) != 0)
LABEL_13:
    PBDataWriterWriteDoubleField();
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  _QWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v4[8] = *(_QWORD *)&self->_triggerScore;
    *((_WORD *)v4 + 44) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = *(_QWORD *)&self->_triggerThreshold;
  *((_WORD *)v4 + 44) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v4[5] = *(_QWORD *)&self->_satScore;
  *((_WORD *)v4 + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v4[6] = *(_QWORD *)&self->_satThreshold;
  *((_WORD *)v4 + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  v4[3] = *(_QWORD *)&self->_recognizerScore;
  *((_WORD *)v4 + 44) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    v4[4] = *(_QWORD *)&self->_recognizerThresholdOffset;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_8:
  if (self->_configVersion)
  {
    v7 = v4;
    objc_msgSend(v4, "setConfigVersion:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_12;
LABEL_22:
    v4[1] = *(_QWORD *)&self->_extraSamplesAtStart;
    *((_WORD *)v4 + 44) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v4[2] = *(_QWORD *)&self->_hardwareSampleRate;
  *((_WORD *)v4 + 44) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v6 & 0x40) != 0)
  {
LABEL_13:
    v4[7] = *(_QWORD *)&self->_triggerEnd;
    *((_WORD *)v4 + 44) |= 0x40u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_triggerScore;
    *(_WORD *)(v5 + 88) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 72) = self->_triggerThreshold;
  *(_WORD *)(v5 + 88) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v5 + 40) = self->_satScore;
  *(_WORD *)(v5 + 88) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v5 + 48) = self->_satThreshold;
  *(_WORD *)(v5 + 88) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *(double *)(v5 + 24) = self->_recognizerScore;
  *(_WORD *)(v5 + 88) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(double *)(v5 + 32) = self->_recognizerThresholdOffset;
    *(_WORD *)(v5 + 88) |= 8u;
  }
LABEL_8:
  v8 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((v10 & 1) == 0)
      goto LABEL_10;
LABEL_20:
    *(double *)(v6 + 8) = self->_extraSamplesAtStart;
    *(_WORD *)(v6 + 88) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return (id)v6;
    goto LABEL_11;
  }
  *(double *)(v6 + 16) = self->_hardwareSampleRate;
  *(_WORD *)(v6 + 88) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v10 & 0x40) != 0)
  {
LABEL_11:
    *(double *)(v6 + 56) = self->_triggerEnd;
    *(_WORD *)(v6 + 88) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *configVersion;
  __int16 v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 44);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_triggerScore != *((double *)v4 + 8))
      goto LABEL_49;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0 || self->_triggerThreshold != *((double *)v4 + 9))
      goto LABEL_49;
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_satScore != *((double *)v4 + 5))
      goto LABEL_49;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_satThreshold != *((double *)v4 + 6))
      goto LABEL_49;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_recognizerScore != *((double *)v4 + 3))
      goto LABEL_49;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_recognizerThresholdOffset != *((double *)v4 + 4))
      goto LABEL_49;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_49;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](configVersion, "isEqual:"))
    {
LABEL_49:
      v9 = 0;
      goto LABEL_50;
    }
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 44);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_hardwareSampleRate != *((double *)v4 + 2))
      goto LABEL_49;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_extraSamplesAtStart != *((double *)v4 + 1))
      goto LABEL_49;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_49;
  }
  v9 = (v8 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_triggerEnd != *((double *)v4 + 7))
      goto LABEL_49;
    v9 = 1;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double triggerScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double triggerThreshold;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double satScore;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double satThreshold;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double recognizerScore;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  double recognizerThresholdOffset;
  double v32;
  long double v33;
  double v34;
  NSUInteger v35;
  __int16 v36;
  unint64_t v37;
  double hardwareSampleRate;
  double v39;
  long double v40;
  double v41;
  unint64_t v42;
  double extraSamplesAtStart;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  double triggerEnd;
  double v49;
  long double v50;
  double v51;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    triggerScore = self->_triggerScore;
    v6 = -triggerScore;
    if (triggerScore >= 0.0)
      v6 = self->_triggerScore;
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
  if ((has & 0x100) != 0)
  {
    triggerThreshold = self->_triggerThreshold;
    v11 = -triggerThreshold;
    if (triggerThreshold >= 0.0)
      v11 = self->_triggerThreshold;
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
  if ((has & 0x10) != 0)
  {
    satScore = self->_satScore;
    v16 = -satScore;
    if (satScore >= 0.0)
      v16 = self->_satScore;
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
  if ((has & 0x20) != 0)
  {
    satThreshold = self->_satThreshold;
    v21 = -satThreshold;
    if (satThreshold >= 0.0)
      v21 = self->_satThreshold;
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
  if ((has & 4) != 0)
  {
    recognizerScore = self->_recognizerScore;
    v26 = -recognizerScore;
    if (recognizerScore >= 0.0)
      v26 = self->_recognizerScore;
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
  v53 = v24;
  v55 = v14;
  if ((has & 8) != 0)
  {
    recognizerThresholdOffset = self->_recognizerThresholdOffset;
    v32 = -recognizerThresholdOffset;
    if (recognizerThresholdOffset >= 0.0)
      v32 = self->_recognizerThresholdOffset;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    v29 = v4;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v29 = v4;
    v30 = 0;
  }
  v35 = -[NSString hash](self->_configVersion, "hash", v53, v55);
  v36 = (__int16)self->_has;
  if ((v36 & 2) != 0)
  {
    hardwareSampleRate = self->_hardwareSampleRate;
    v39 = -hardwareSampleRate;
    if (hardwareSampleRate >= 0.0)
      v39 = self->_hardwareSampleRate;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  if ((v36 & 1) != 0)
  {
    extraSamplesAtStart = self->_extraSamplesAtStart;
    v44 = -extraSamplesAtStart;
    if (extraSamplesAtStart >= 0.0)
      v44 = self->_extraSamplesAtStart;
    v45 = floor(v44 + 0.5);
    v46 = (v44 - v45) * 1.84467441e19;
    v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0)
        v42 += (unint64_t)v46;
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    v42 = 0;
  }
  if ((v36 & 0x40) != 0)
  {
    triggerEnd = self->_triggerEnd;
    v49 = -triggerEnd;
    if (triggerEnd >= 0.0)
      v49 = self->_triggerEnd;
    v50 = floor(v49 + 0.5);
    v51 = (v49 - v50) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0)
        v47 += (unint64_t)v51;
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    v47 = 0;
  }
  return v9 ^ v29 ^ v56 ^ v19 ^ v54 ^ v30 ^ v37 ^ v42 ^ v47 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) != 0)
  {
    self->_triggerScore = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_triggerThreshold = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_satScore = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_satThreshold = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  self->_recognizerScore = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
LABEL_7:
    self->_recognizerThresholdOffset = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 10))
  {
    v7 = v4;
    -[MXVoiceTriggerInfo setConfigVersion:](self, "setConfigVersion:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 2) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_12;
LABEL_22:
    self->_extraSamplesAtStart = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    if ((*((_WORD *)v4 + 44) & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  self->_hardwareSampleRate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 1) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v6 & 0x40) != 0)
  {
LABEL_13:
    self->_triggerEnd = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:

}

- (double)triggerScore
{
  return self->_triggerScore;
}

- (double)triggerThreshold
{
  return self->_triggerThreshold;
}

- (double)satScore
{
  return self->_satScore;
}

- (double)satThreshold
{
  return self->_satThreshold;
}

- (double)recognizerScore
{
  return self->_recognizerScore;
}

- (double)recognizerThresholdOffset
{
  return self->_recognizerThresholdOffset;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

- (double)hardwareSampleRate
{
  return self->_hardwareSampleRate;
}

- (double)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (double)triggerEnd
{
  return self->_triggerEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
