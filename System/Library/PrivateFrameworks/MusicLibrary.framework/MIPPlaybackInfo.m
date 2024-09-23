@implementation MIPPlaybackInfo

- (void)setBitRate:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_bitRate = a3;
}

- (void)setHasBitRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasBitRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCodecType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_codecType = a3;
}

- (void)setHasCodecType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasCodecType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCodecSubType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_codecSubType = a3;
}

- (void)setHasCodecSubType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasCodecSubType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDataKind:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_dataKind = a3;
}

- (void)setHasDataKind:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDataKind
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasDataUrl
{
  return self->_dataUrl != 0;
}

- (BOOL)hasEqPreset
{
  return self->_eqPreset != 0;
}

- (BOOL)hasPlaybackFormat
{
  return self->_playbackFormat != 0;
}

- (void)setGaplessHeuristicCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_gaplessHeuristicCode = a3;
}

- (void)setHasGaplessHeuristicCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGaplessHeuristicCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGaplessHeuristicDelayCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gaplessHeuristicDelayCode = a3;
}

- (void)setHasGaplessHeuristicDelayCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGaplessHeuristicDelayCode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGaplessEncodingDrainCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_gaplessEncodingDrainCode = a3;
}

- (void)setHasGaplessEncodingDrainCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGaplessEncodingDrainCode
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setGaplessFrameResyncCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_gaplessFrameResyncCode = a3;
}

- (void)setHasGaplessFrameResyncCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGaplessFrameResyncCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRelativeVolume:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_relativeVolume = a3;
}

- (void)setHasRelativeVolume:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasRelativeVolume
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setSampleRate:(int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_sampleRate = a3;
}

- (void)setHasSampleRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasSampleRate
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setStopTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_stopTime = a3;
}

- (void)setHasStopTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStopTime
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setVolumeNormalizationEnergy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_volumeNormalizationEnergy = a3;
}

- (void)setHasVolumeNormalizationEnergy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasVolumeNormalizationEnergy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBeatsPerMinute:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_beatsPerMinute = a3;
}

- (void)setHasBeatsPerMinute:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasBeatsPerMinute
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setProgressionDirection:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_progressionDirection = a3;
}

- (void)setHasProgressionDirection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasProgressionDirection
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDurationInSamples:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_durationInSamples = a3;
}

- (void)setHasDurationInSamples:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDurationInSamples
{
  return *(_WORD *)&self->_has & 1;
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
  v8.super_class = (Class)MIPPlaybackInfo;
  -[MIPPlaybackInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPlaybackInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *dataUrl;
  NSString *eqPreset;
  NSString *playbackFormat;
  __int16 v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bitRate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("bitRate"));

    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_codecType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("codecType"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_codecSubType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("codecSubType"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dataKind);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dataKind"));

  }
LABEL_6:
  dataUrl = self->_dataUrl;
  if (dataUrl)
    objc_msgSend(v3, "setObject:forKey:", dataUrl, CFSTR("dataUrl"));
  eqPreset = self->_eqPreset;
  if (eqPreset)
    objc_msgSend(v3, "setObject:forKey:", eqPreset, CFSTR("eqPreset"));
  playbackFormat = self->_playbackFormat;
  if (playbackFormat)
    objc_msgSend(v3, "setObject:forKey:", playbackFormat, CFSTR("playbackFormat"));
  v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_gaplessHeuristicCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("gaplessHeuristicCode"));

    v9 = (__int16)self->_has;
    if ((v9 & 0x10) == 0)
    {
LABEL_14:
      if ((v9 & 2) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_gaplessHeuristicDelayCode);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("gaplessHeuristicDelayCode"));

  v9 = (__int16)self->_has;
  if ((v9 & 2) == 0)
  {
LABEL_15:
    if ((v9 & 4) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_gaplessEncodingDrainCode);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("gaplessEncodingDrainCode"));

  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_gaplessFrameResyncCode);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("gaplessFrameResyncCode"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_relativeVolume);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("relativeVolume"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x8000) == 0)
  {
LABEL_18:
    if ((v9 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sampleRate);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sampleRate"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_19:
    if ((v9 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startTime);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("startTime"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_20:
    if ((v9 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stopTime);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("stopTime"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_21:
    if ((v9 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_volumeNormalizationEnergy);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("volumeNormalizationEnergy"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_22:
    if ((v9 & 0x2000) == 0)
      goto LABEL_23;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_progressionDirection);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("progressionDirection"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_24;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_beatsPerMinute);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("beatsPerMinute"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x2000) != 0)
    goto LABEL_40;
LABEL_23:
  if ((v9 & 1) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_durationInSamples);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("durationInSamples"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPPlaybackInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  id v6;

  v6 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_dataUrl)
    PBDataWriterWriteStringField();
  if (self->_eqPreset)
    PBDataWriterWriteStringField();
  if (self->_playbackFormat)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = (__int16)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_14:
      if ((v5 & 2) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 4) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_19:
    if ((v5 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_20:
    if ((v5 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000) == 0)
      goto LABEL_23;
LABEL_40:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x2000) != 0)
    goto LABEL_40;
LABEL_23:
  if ((v5 & 1) != 0)
LABEL_24:
    PBDataWriterWriteInt64Field();
LABEL_25:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  _DWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[19] = self->_bitRate;
    *((_WORD *)v4 + 66) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[21] = self->_codecType;
  *((_WORD *)v4 + 66) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  v4[20] = self->_codecSubType;
  *((_WORD *)v4 + 66) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    v4[22] = self->_dataKind;
    *((_WORD *)v4 + 66) |= 0x1000u;
  }
LABEL_6:
  v7 = v4;
  if (self->_dataUrl)
  {
    objc_msgSend(v4, "setDataUrl:");
    v4 = v7;
  }
  if (self->_eqPreset)
  {
    objc_msgSend(v7, "setEqPreset:");
    v4 = v7;
  }
  if (self->_playbackFormat)
  {
    objc_msgSend(v7, "setPlaybackFormat:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_gaplessHeuristicCode;
    *((_WORD *)v4 + 66) |= 8u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_14:
      if ((v6 & 2) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  *((_QWORD *)v4 + 5) = self->_gaplessHeuristicDelayCode;
  *((_WORD *)v4 + 66) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 2) = self->_gaplessEncodingDrainCode;
  *((_WORD *)v4 + 66) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 3) = self->_gaplessFrameResyncCode;
  *((_WORD *)v4 + 66) |= 4u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  v4[31] = self->_relativeVolume;
  *((_WORD *)v4 + 66) |= 0x4000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  v4[32] = self->_sampleRate;
  *((_WORD *)v4 + 66) |= 0x8000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)v4 + 6) = self->_startTime;
  *((_WORD *)v4 + 66) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v4 + 7) = self->_stopTime;
  *((_WORD *)v4 + 66) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 8) = self->_volumeNormalizationEnergy;
  *((_WORD *)v4 + 66) |= 0x80u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0)
      goto LABEL_23;
LABEL_40:
    v4[30] = self->_progressionDirection;
    *((_WORD *)v4 + 66) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_39:
  v4[18] = self->_beatsPerMinute;
  *((_WORD *)v4 + 66) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x2000) != 0)
    goto LABEL_40;
LABEL_23:
  if ((v6 & 1) != 0)
  {
LABEL_24:
    *((_QWORD *)v4 + 1) = self->_durationInSamples;
    *((_WORD *)v4 + 66) |= 1u;
  }
LABEL_25:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_bitRate;
    *(_WORD *)(v5 + 132) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 84) = self->_codecType;
  *(_WORD *)(v5 + 132) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  *(_DWORD *)(v5 + 80) = self->_codecSubType;
  *(_WORD *)(v5 + 132) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 88) = self->_dataKind;
    *(_WORD *)(v5 + 132) |= 0x1000u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_dataUrl, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v8;

  v10 = -[NSString copyWithZone:](self->_eqPreset, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v10;

  v12 = -[NSString copyWithZone:](self->_playbackFormat, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v12;

  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_gaplessHeuristicCode;
    *(_WORD *)(v6 + 132) |= 8u;
    v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_8:
      if ((v14 & 2) == 0)
        goto LABEL_9;
      goto LABEL_26;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 40) = self->_gaplessHeuristicDelayCode;
  *(_WORD *)(v6 + 132) |= 0x10u;
  v14 = (__int16)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_9:
    if ((v14 & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v6 + 16) = self->_gaplessEncodingDrainCode;
  *(_WORD *)(v6 + 132) |= 2u;
  v14 = (__int16)self->_has;
  if ((v14 & 4) == 0)
  {
LABEL_10:
    if ((v14 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v6 + 24) = self->_gaplessFrameResyncCode;
  *(_WORD *)(v6 + 132) |= 4u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_11:
    if ((v14 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 124) = self->_relativeVolume;
  *(_WORD *)(v6 + 132) |= 0x4000u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x8000) == 0)
  {
LABEL_12:
    if ((v14 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 128) = self->_sampleRate;
  *(_WORD *)(v6 + 132) |= 0x8000u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_13:
    if ((v14 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v6 + 48) = self->_startTime;
  *(_WORD *)(v6 + 132) |= 0x20u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x40) == 0)
  {
LABEL_14:
    if ((v14 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v6 + 56) = self->_stopTime;
  *(_WORD *)(v6 + 132) |= 0x40u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_15:
    if ((v14 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v6 + 64) = self->_volumeNormalizationEnergy;
  *(_WORD *)(v6 + 132) |= 0x80u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_16:
    if ((v14 & 0x2000) == 0)
      goto LABEL_17;
LABEL_34:
    *(_DWORD *)(v6 + 120) = self->_progressionDirection;
    *(_WORD *)(v6 + 132) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_18;
  }
LABEL_33:
  *(_DWORD *)(v6 + 72) = self->_beatsPerMinute;
  *(_WORD *)(v6 + 132) |= 0x100u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x2000) != 0)
    goto LABEL_34;
LABEL_17:
  if ((v14 & 1) != 0)
  {
LABEL_18:
    *(_QWORD *)(v6 + 8) = self->_durationInSamples;
    *(_WORD *)(v6 + 132) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *dataUrl;
  NSString *eqPreset;
  NSString *playbackFormat;
  __int16 has;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_88;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_bitRate != *((_DWORD *)v4 + 19))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x800) == 0 || self->_codecType != *((_DWORD *)v4 + 21))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) == 0 || self->_codecSubType != *((_DWORD *)v4 + 20))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x1000) == 0 || self->_dataKind != *((_DWORD *)v4 + 22))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  dataUrl = self->_dataUrl;
  if ((unint64_t)dataUrl | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](dataUrl, "isEqual:"))
    goto LABEL_88;
  eqPreset = self->_eqPreset;
  if ((unint64_t)eqPreset | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](eqPreset, "isEqual:"))
      goto LABEL_88;
  }
  playbackFormat = self->_playbackFormat;
  if ((unint64_t)playbackFormat | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](playbackFormat, "isEqual:"))
      goto LABEL_88;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 66);
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_gaplessHeuristicCode != *((_QWORD *)v4 + 4))
      goto LABEL_88;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_gaplessHeuristicDelayCode != *((_QWORD *)v4 + 5))
      goto LABEL_88;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_gaplessEncodingDrainCode != *((_QWORD *)v4 + 2))
      goto LABEL_88;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_gaplessFrameResyncCode != *((_QWORD *)v4 + 3))
      goto LABEL_88;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x4000) == 0 || self->_relativeVolume != *((_DWORD *)v4 + 31))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x8000) == 0 || self->_sampleRate != *((_DWORD *)v4 + 32))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x8000) != 0)
  {
LABEL_88:
    v10 = 0;
    goto LABEL_89;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_startTime != *((_QWORD *)v4 + 6))
      goto LABEL_88;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_stopTime != *((_QWORD *)v4 + 7))
      goto LABEL_88;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_volumeNormalizationEnergy != *((_QWORD *)v4 + 8))
      goto LABEL_88;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_beatsPerMinute != *((_DWORD *)v4 + 18))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x2000) == 0 || self->_progressionDirection != *((_DWORD *)v4 + 30))
      goto LABEL_88;
  }
  else if ((*((_WORD *)v4 + 66) & 0x2000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_durationInSamples != *((_QWORD *)v4 + 1))
      goto LABEL_88;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 1) == 0;
  }
LABEL_89:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  __int16 has;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v3 = 2654435761 * self->_bitRate;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_codecType;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_codecSubType;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_dataKind;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSString hash](self->_dataUrl, "hash");
  v8 = -[NSString hash](self->_eqPreset, "hash");
  v9 = -[NSString hash](self->_playbackFormat, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v11 = 2654435761 * self->_gaplessHeuristicCode;
    if ((has & 0x10) != 0)
    {
LABEL_12:
      v12 = 2654435761 * self->_gaplessHeuristicDelayCode;
      if ((has & 2) != 0)
        goto LABEL_13;
      goto LABEL_25;
    }
  }
  else
  {
    v11 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_12;
  }
  v12 = 0;
  if ((has & 2) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_gaplessEncodingDrainCode;
    if ((has & 4) != 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  v13 = 0;
  if ((has & 4) != 0)
  {
LABEL_14:
    v14 = 2654435761 * self->_gaplessFrameResyncCode;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_15:
    v15 = 2654435761 * self->_relativeVolume;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_16:
    v16 = 2654435761 * self->_sampleRate;
    if ((has & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  v16 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_17:
    v17 = 2654435761 * self->_startTime;
    if ((has & 0x40) != 0)
      goto LABEL_18;
    goto LABEL_30;
  }
LABEL_29:
  v17 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_18:
    v18 = 2654435761 * self->_stopTime;
    if ((has & 0x80) != 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  v18 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_19:
    v19 = 2654435761 * self->_volumeNormalizationEnergy;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_32;
  }
LABEL_31:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    v20 = 2654435761 * self->_beatsPerMinute;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_21;
LABEL_33:
    v21 = 0;
    if ((has & 1) != 0)
      goto LABEL_22;
LABEL_34:
    v22 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_32:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_33;
LABEL_21:
  v21 = 2654435761 * self->_progressionDirection;
  if ((has & 1) == 0)
    goto LABEL_34;
LABEL_22:
  v22 = 2654435761 * self->_durationInSamples;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x200) != 0)
  {
    self->_bitRate = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 66);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_codecType = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  self->_codecSubType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
LABEL_5:
    self->_dataKind = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_6:
  v7 = v4;
  if (*((_QWORD *)v4 + 12))
  {
    -[MIPPlaybackInfo setDataUrl:](self, "setDataUrl:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[MIPPlaybackInfo setEqPreset:](self, "setEqPreset:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[MIPPlaybackInfo setPlaybackFormat:](self, "setPlaybackFormat:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) != 0)
  {
    self->_gaplessHeuristicCode = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 66);
    if ((v6 & 0x10) == 0)
    {
LABEL_14:
      if ((v6 & 2) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  self->_gaplessHeuristicDelayCode = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->_gaplessEncodingDrainCode = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  self->_gaplessFrameResyncCode = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  self->_relativeVolume = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_has |= 0x4000u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  self->_sampleRate = *((_DWORD *)v4 + 32);
  *(_WORD *)&self->_has |= 0x8000u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  self->_startTime = *((_QWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  self->_stopTime = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x80) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  self->_volumeNormalizationEnergy = *((_QWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0)
      goto LABEL_23;
LABEL_40:
    self->_progressionDirection = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x2000u;
    if ((*((_WORD *)v4 + 66) & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_39:
  self->_beatsPerMinute = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x2000) != 0)
    goto LABEL_40;
LABEL_23:
  if ((v6 & 1) != 0)
  {
LABEL_24:
    self->_durationInSamples = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_25:

}

- (int)bitRate
{
  return self->_bitRate;
}

- (int)codecType
{
  return self->_codecType;
}

- (int)codecSubType
{
  return self->_codecSubType;
}

- (int)dataKind
{
  return self->_dataKind;
}

- (NSString)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
  objc_storeStrong((id *)&self->_dataUrl, a3);
}

- (NSString)eqPreset
{
  return self->_eqPreset;
}

- (void)setEqPreset:(id)a3
{
  objc_storeStrong((id *)&self->_eqPreset, a3);
}

- (NSString)playbackFormat
{
  return self->_playbackFormat;
}

- (void)setPlaybackFormat:(id)a3
{
  objc_storeStrong((id *)&self->_playbackFormat, a3);
}

- (int64_t)gaplessHeuristicCode
{
  return self->_gaplessHeuristicCode;
}

- (int64_t)gaplessHeuristicDelayCode
{
  return self->_gaplessHeuristicDelayCode;
}

- (int64_t)gaplessEncodingDrainCode
{
  return self->_gaplessEncodingDrainCode;
}

- (int64_t)gaplessFrameResyncCode
{
  return self->_gaplessFrameResyncCode;
}

- (int)relativeVolume
{
  return self->_relativeVolume;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)stopTime
{
  return self->_stopTime;
}

- (int64_t)volumeNormalizationEnergy
{
  return self->_volumeNormalizationEnergy;
}

- (int)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (int)progressionDirection
{
  return self->_progressionDirection;
}

- (int64_t)durationInSamples
{
  return self->_durationInSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackFormat, 0);
  objc_storeStrong((id *)&self->_eqPreset, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
}

@end
