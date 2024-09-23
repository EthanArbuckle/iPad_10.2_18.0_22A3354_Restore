@implementation _MRAudioFormatProtobuf

- (int)tier
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_tier;
  else
    return 0;
}

- (void)setTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tier = a3;
}

- (void)setHasTier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTier
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)tierAsString:(int)a3
{
  if (a3 < 5)
    return off_1E30C9808[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LowBandwidthStereo")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighQualityStereo")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Lossless")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighResolutionLossless")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Spatial")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setBitrate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBitrate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSampleRate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sampleRate = a3;
}

- (void)setHasSampleRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSampleRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBitDepth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitDepth = a3;
}

- (void)setHasBitDepth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitDepth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCodec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCodec
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSpatialized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spatialized = a3;
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

- (void)setMultiChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_multiChannel = a3;
}

- (void)setHasMultiChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMultiChannel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setChannelLayout:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_channelLayout = a3;
}

- (void)setHasChannelLayout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasChannelLayout
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasAudioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription != 0;
}

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasStableVariantID
{
  return self->_stableVariantID != 0;
}

- (int)renderingMode
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_renderingMode;
  else
    return 0;
}

- (void)setRenderingMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_renderingMode = a3;
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

- (id)renderingModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E30C9830[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRenderingMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MonoStereo")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Surround")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpatialAudio")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DolbyAudio")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DolbyAtmos")))
  {
    v4 = 5;
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
  v8.super_class = (Class)_MRAudioFormatProtobuf;
  -[_MRAudioFormatProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioFormatProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t tier;
  __CFString *v6;
  void *v7;
  NSString *audioChannelLayoutDescription;
  NSString *groupID;
  NSString *stableVariantID;
  uint64_t renderingMode;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    tier = self->_tier;
    if (tier >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tier);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E30C9808[tier];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("tier"));

    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bitrate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("bitrate"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sampleRate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("sampleRate"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bitDepth);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("bitDepth"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_codec);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("codec"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spatialized);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("spatialized"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_multiChannel);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("multiChannel"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_channelLayout);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("channelLayout"));

  }
LABEL_14:
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  if (audioChannelLayoutDescription)
    objc_msgSend(v3, "setObject:forKey:", audioChannelLayoutDescription, CFSTR("audioChannelLayoutDescription"));
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v3, "setObject:forKey:", groupID, CFSTR("groupID"));
  stableVariantID = self->_stableVariantID;
  if (stableVariantID)
    objc_msgSend(v3, "setObject:forKey:", stableVariantID, CFSTR("stableVariantID"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    renderingMode = self->_renderingMode;
    if (renderingMode >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_renderingMode);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E30C9830[renderingMode];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("renderingMode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioFormatProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_audioChannelLayoutDescription)
    PBDataWriterWriteStringField();
  if (self->_groupID)
    PBDataWriterWriteStringField();
  if (self->_stableVariantID)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  _DWORD *v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[18] = self->_tier;
    *((_WORD *)v4 + 40) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 2) = self->_bitrate;
  *((_WORD *)v4 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)v4 + 3) = self->_sampleRate;
  *((_WORD *)v4 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)v4 + 1) = self->_bitDepth;
  *((_WORD *)v4 + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v4[11] = self->_codec;
  *((_WORD *)v4 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)v4 + 77) = self->_spatialized;
  *((_WORD *)v4 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_25:
  *((_BYTE *)v4 + 76) = self->_multiChannel;
  *((_WORD *)v4 + 40) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    v4[10] = self->_channelLayout;
    *((_WORD *)v4 + 40) |= 8u;
  }
LABEL_10:
  v6 = v4;
  if (self->_audioChannelLayoutDescription)
  {
    objc_msgSend(v4, "setAudioChannelLayoutDescription:");
    v4 = v6;
  }
  if (self->_groupID)
  {
    objc_msgSend(v6, "setGroupID:");
    v4 = v6;
  }
  if (self->_stableVariantID)
  {
    objc_msgSend(v6, "setStableVariantID:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[14] = self->_renderingMode;
    *((_WORD *)v4 + 40) |= 0x20u;
  }

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_tier;
    *(_WORD *)(v5 + 80) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_bitrate;
  *(_WORD *)(v5 + 80) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_QWORD *)(v5 + 24) = self->_sampleRate;
  *(_WORD *)(v5 + 80) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_QWORD *)(v5 + 8) = self->_bitDepth;
  *(_WORD *)(v5 + 80) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_codec;
  *(_WORD *)(v5 + 80) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(_BYTE *)(v5 + 77) = self->_spatialized;
  *(_WORD *)(v5 + 80) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  *(_BYTE *)(v5 + 76) = self->_multiChannel;
  *(_WORD *)(v5 + 80) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 40) = self->_channelLayout;
    *(_WORD *)(v5 + 80) |= 8u;
  }
LABEL_10:
  v8 = -[NSString copyWithZone:](self->_audioChannelLayoutDescription, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_groupID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_stableVariantID, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v12;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_renderingMode;
    *(_WORD *)(v6 + 80) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *audioChannelLayoutDescription;
  NSString *groupID;
  NSString *stableVariantID;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 40);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_tier != *((_DWORD *)v4 + 18))
      goto LABEL_59;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bitrate != *((_QWORD *)v4 + 2))
      goto LABEL_59;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sampleRate != *((_QWORD *)v4 + 3))
      goto LABEL_59;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bitDepth != *((_QWORD *)v4 + 1))
      goto LABEL_59;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_codec != *((_DWORD *)v4 + 11))
      goto LABEL_59;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0)
      goto LABEL_59;
    if (self->_spatialized)
    {
      if (!*((_BYTE *)v4 + 77))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 77))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_multiChannel)
      {
        if (!*((_BYTE *)v4 + 76))
          goto LABEL_59;
        goto LABEL_43;
      }
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_43;
    }
LABEL_59:
    v11 = 0;
    goto LABEL_60;
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_59;
LABEL_43:
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_channelLayout != *((_DWORD *)v4 + 10))
      goto LABEL_59;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_59;
  }
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  if ((unint64_t)audioChannelLayoutDescription | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](audioChannelLayoutDescription, "isEqual:"))
  {
    goto LABEL_59;
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:"))
      goto LABEL_59;
  }
  stableVariantID = self->_stableVariantID;
  if ((unint64_t)stableVariantID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](stableVariantID, "isEqual:"))
      goto LABEL_59;
  }
  v10 = *((_WORD *)v4 + 40);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_renderingMode != *((_DWORD *)v4 + 14))
      goto LABEL_59;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x20) == 0;
  }
LABEL_60:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v16 = 2654435761 * self->_tier;
    if ((has & 2) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_bitrate;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v14 = 2654435761 * self->_sampleRate;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v14 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_bitDepth;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_codec;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_spatialized;
    if ((has & 0x80) != 0)
      goto LABEL_8;
LABEL_16:
    v7 = 0;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_8:
  v7 = 2654435761 * self->_multiChannel;
  if ((has & 8) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_channelLayout;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
LABEL_18:
  v9 = -[NSString hash](self->_audioChannelLayoutDescription, "hash");
  v10 = -[NSString hash](self->_groupID, "hash");
  v11 = -[NSString hash](self->_stableVariantID, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v12 = 2654435761 * self->_renderingMode;
  else
    v12 = 0;
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) != 0)
  {
    self->_tier = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bitrate = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_sampleRate = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_bitDepth = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_codec = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_spatialized = *((_BYTE *)v4 + 77);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_25:
  self->_multiChannel = *((_BYTE *)v4 + 76);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 40) & 8) != 0)
  {
LABEL_9:
    self->_channelLayout = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_10:
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[_MRAudioFormatProtobuf setAudioChannelLayoutDescription:](self, "setAudioChannelLayoutDescription:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[_MRAudioFormatProtobuf setGroupID:](self, "setGroupID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[_MRAudioFormatProtobuf setStableVariantID:](self, "setStableVariantID:");
    v4 = v6;
  }
  if ((*((_WORD *)v4 + 40) & 0x20) != 0)
  {
    self->_renderingMode = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }

}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)spatialized
{
  return self->_spatialized;
}

- (BOOL)multiChannel
{
  return self->_multiChannel;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (void)setAudioChannelLayoutDescription:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)stableVariantID
{
  return self->_stableVariantID;
}

- (void)setStableVariantID:(id)a3
{
  objc_storeStrong((id *)&self->_stableVariantID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableVariantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, 0);
}

@end
