@implementation _MRMRNowPlayingAudioFormatContentInfoProtobuf

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setSpatialized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spatialized = a3;
}

- (void)setResolvedSpatialExperience:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_resolvedSpatialExperience = a3;
}

- (void)setRenderingMode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_renderingMode = a3;
}

- (void)setPid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pid = a3;
}

- (void)setIntendedSpatialExperience:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_intendedSpatialExperience = a3;
}

- (void)setEligibleForSpatialization:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_eligibleForSpatialization = a3;
}

- (void)setChannelCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_channelCount = a3;
}

- (void)setBestAvailableContent:(id)a3
{
  objc_storeStrong((id *)&self->_bestAvailableContent, a3);
}

- (void)setAudioSessionID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_audioSessionID = a3;
}

- (void)setAudioFormat:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioFormat = a3;
}

- (BOOL)spatialized
{
  return self->_spatialized;
}

- (int64_t)resolvedSpatialExperience
{
  return self->_resolvedSpatialExperience;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (unint64_t)pid
{
  return self->_pid;
}

- (int64_t)intendedSpatialExperience
{
  return self->_intendedSpatialExperience;
}

- (BOOL)hasChannelCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasAudioSessionID
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasAudioFormat
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)eligibleForSpatialization
{
  return self->_eligibleForSpatialization;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bestAvailableContent
{
  return self->_bestAvailableContent;
}

- (unint64_t)audioSessionID
{
  return self->_audioSessionID;
}

- (unint64_t)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)readFrom:(id)a3
{
  return _MRMRNowPlayingAudioFormatContentInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bestAvailableContent, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
LABEL_7:
  if (self->_bestAvailableContent)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_14;
LABEL_24:
    PBDataWriterWriteUint64Field();
    v4 = v7;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_24;
LABEL_14:
  if ((v6 & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_16:

}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setHasAudioSessionID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setHasChannelCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBestAvailableContent
{
  return self->_bestAvailableContent != 0;
}

- (void)setHasEligibleForSpatialization:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEligibleForSpatialization
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasSpatialized:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSpatialized
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIntendedSpatialExperience:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIntendedSpatialExperience
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasResolvedSpatialExperience:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResolvedSpatialExperience
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasPid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPid
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRenderingMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRenderingMode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)_MRMRNowPlayingAudioFormatContentInfoProtobuf;
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRMRNowPlayingAudioFormatContentInfoProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleID;
  __int16 has;
  void *v7;
  NSString *bestAvailableContent;
  __int16 v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_audioSessionID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("audioSessionID"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_audioFormat);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("audioFormat"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_channelCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("channelCount"));

  }
LABEL_7:
  bestAvailableContent = self->_bestAvailableContent;
  if (bestAvailableContent)
    objc_msgSend(v4, "setObject:forKey:", bestAvailableContent, CFSTR("bestAvailableContent"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_eligibleForSpatialization);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("eligibleForSpatialization"));

    v9 = (__int16)self->_has;
    if ((v9 & 0x100) == 0)
    {
LABEL_11:
      if ((v9 & 8) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spatialized);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("spatialized"));

  v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_intendedSpatialExperience);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("intendedSpatialExperience"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_13:
    if ((v9 & 0x10) == 0)
      goto LABEL_14;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_pid);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("pid"));

    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v4;
    goto LABEL_15;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_resolvedSpatialExperience);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("resolvedSpatialExperience"));

  v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
    goto LABEL_24;
LABEL_14:
  if ((v9 & 0x20) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_renderingMode);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("renderingMode"));

  }
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_audioSessionID;
    *((_WORD *)v4 + 42) |= 2u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = self->_audioFormat;
  *((_WORD *)v4 + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = self->_channelCount;
    *((_WORD *)v4 + 42) |= 4u;
  }
LABEL_7:
  if (self->_bestAvailableContent)
  {
    objc_msgSend(v7, "setBestAvailableContent:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_eligibleForSpatialization;
    *((_WORD *)v4 + 42) |= 0x80u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 81) = self->_spatialized;
  *((_WORD *)v4 + 42) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)v4 + 4) = self->_intendedSpatialExperience;
  *((_WORD *)v4 + 42) |= 8u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_14;
LABEL_24:
    *((_QWORD *)v4 + 5) = self->_pid;
    *((_WORD *)v4 + 42) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  *((_QWORD *)v4 + 7) = self->_resolvedSpatialExperience;
  *((_WORD *)v4 + 42) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_24;
LABEL_14:
  if ((v6 & 0x20) != 0)
  {
LABEL_15:
    *((_QWORD *)v4 + 6) = self->_renderingMode;
    *((_WORD *)v4 + 42) |= 0x20u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  __int16 v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_audioSessionID;
    *(_WORD *)(v5 + 84) |= 2u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_audioFormat;
  *(_WORD *)(v5 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_channelCount;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_bestAvailableContent, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_eligibleForSpatialization;
    *(_WORD *)(v5 + 84) |= 0x80u;
    v11 = (__int16)self->_has;
    if ((v11 & 0x100) == 0)
    {
LABEL_7:
      if ((v11 & 8) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 81) = self->_spatialized;
  *(_WORD *)(v5 + 84) |= 0x100u;
  v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_8:
    if ((v11 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *(_QWORD *)(v5 + 32) = self->_intendedSpatialExperience;
  *(_WORD *)(v5 + 84) |= 8u;
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_9:
    if ((v11 & 0x10) == 0)
      goto LABEL_10;
LABEL_20:
    *(_QWORD *)(v5 + 40) = self->_pid;
    *(_WORD *)(v5 + 84) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_11;
  }
LABEL_19:
  *(_QWORD *)(v5 + 56) = self->_resolvedSpatialExperience;
  *(_WORD *)(v5 + 84) |= 0x40u;
  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v11 & 0x20) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 48) = self->_renderingMode;
    *(_WORD *)(v5 + 84) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleID;
  __int16 has;
  __int16 v7;
  NSString *bestAvailableContent;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_58;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 42);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_audioSessionID != *((_QWORD *)v4 + 2))
      goto LABEL_58;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_audioFormat != *((_QWORD *)v4 + 1))
      goto LABEL_58;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_channelCount != *((_QWORD *)v4 + 3))
      goto LABEL_58;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_58;
  }
  bestAvailableContent = self->_bestAvailableContent;
  if ((unint64_t)bestAvailableContent | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](bestAvailableContent, "isEqual:"))
      goto LABEL_58;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 42);
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_58;
    if (self->_eligibleForSpatialization)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_58;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) != 0)
    {
      if (self->_spatialized)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_58;
        goto LABEL_38;
      }
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_38;
    }
LABEL_58:
    v10 = 0;
    goto LABEL_59;
  }
  if ((*((_WORD *)v4 + 42) & 0x100) != 0)
    goto LABEL_58;
LABEL_38:
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_intendedSpatialExperience != *((_QWORD *)v4 + 4))
      goto LABEL_58;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_resolvedSpatialExperience != *((_QWORD *)v4 + 7))
      goto LABEL_58;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_pid != *((_QWORD *)v4 + 5))
      goto LABEL_58;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_renderingMode != *((_QWORD *)v4 + 6))
      goto LABEL_58;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x20) == 0;
  }
LABEL_59:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v3 = -[NSString hash](self->_bundleID, "hash");
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    v5 = 0;
    if ((has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761u * self->_audioSessionID;
  if ((has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761u * self->_audioFormat;
  if ((has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761u * self->_channelCount;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = -[NSString hash](self->_bestAvailableContent, "hash");
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    v10 = 2654435761 * self->_eligibleForSpatialization;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_10:
      v11 = 2654435761 * self->_spatialized;
      if ((v9 & 8) != 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
  }
  v11 = 0;
  if ((v9 & 8) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_intendedSpatialExperience;
    if ((v9 & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  v12 = 0;
  if ((v9 & 0x40) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_resolvedSpatialExperience;
    if ((v9 & 0x10) != 0)
      goto LABEL_13;
LABEL_19:
    v14 = 0;
    if ((v9 & 0x20) != 0)
      goto LABEL_14;
LABEL_20:
    v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_18:
  v13 = 0;
  if ((v9 & 0x10) == 0)
    goto LABEL_19;
LABEL_13:
  v14 = 2654435761u * self->_pid;
  if ((v9 & 0x20) == 0)
    goto LABEL_20;
LABEL_14:
  v15 = 2654435761 * self->_renderingMode;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBundleID:](self, "setBundleID:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 42);
  if ((v5 & 2) != 0)
  {
    self->_audioSessionID = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_audioFormat = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
LABEL_6:
    self->_channelCount = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 8))
  {
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBestAvailableContent:](self, "setBestAvailableContent:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x80) != 0)
  {
    self->_eligibleForSpatialization = *((_BYTE *)v4 + 80);
    *(_WORD *)&self->_has |= 0x80u;
    v6 = *((_WORD *)v4 + 42);
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x100) == 0)
  {
    goto LABEL_11;
  }
  self->_spatialized = *((_BYTE *)v4 + 81);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  self->_intendedSpatialExperience = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_14;
LABEL_24:
    self->_pid = *((_QWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    if ((*((_WORD *)v4 + 42) & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  self->_resolvedSpatialExperience = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x10) != 0)
    goto LABEL_24;
LABEL_14:
  if ((v6 & 0x20) != 0)
  {
LABEL_15:
    self->_renderingMode = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_16:

}

@end
