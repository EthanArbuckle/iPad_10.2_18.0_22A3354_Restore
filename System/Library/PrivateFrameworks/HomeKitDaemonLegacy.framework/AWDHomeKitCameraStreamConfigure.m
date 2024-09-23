@implementation AWDHomeKitCameraStreamConfigure

- (int)resolution
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_resolution;
  else
    return 1;
}

- (void)setResolution:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resolution = a3;
}

- (void)setHasResolution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResolution
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)resolutionAsString:(int)a3
{
  if ((a3 - 1) < 0xB)
    return off_1E89AEE90[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResolution:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_320x240")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_480x360")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_640x480")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_1024x768")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_1280x960")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_320x180")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_480x270")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_640x360")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_1280x720")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_1920x1080")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitVideoResolutionType_Count")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setFramerate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_framerate = a3;
}

- (void)setHasFramerate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFramerate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)audioCodec
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_audioCodec;
  else
    return 2;
}

- (void)setAudioCodec:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioCodec = a3;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioCodec
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)audioCodecAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 2)
    return CFSTR("HMDAudioCodecGroupTypeAACELD");
  if (a3 == 3)
  {
    v3 = CFSTR("HMDAudioCodecGroupTypeOpus");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAudioCodec:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDAudioCodecGroupTypeAACELD")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDAudioCodecGroupTypeOpus")))
      v4 = 3;
    else
      v4 = 2;
  }

  return v4;
}

- (int)sampleRate
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_sampleRate;
  else
    return 1;
}

- (void)setSampleRate:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sampleRate = a3;
}

- (void)setHasSampleRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSampleRate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)sampleRateAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("HMDAudioSampleRateType_16");
  if (a3 == 2)
  {
    v3 = CFSTR("HMDAudioSampleRateType_24");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSampleRate:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDAudioSampleRateType_16")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDAudioSampleRateType_24")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (int)cryptoSuite
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cryptoSuite;
  else
    return 0;
}

- (void)setCryptoSuite:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cryptoSuite = a3;
}

- (void)setHasCryptoSuite:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCryptoSuite
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)cryptoSuiteAsString:(int)a3
{
  if (a3 < 3)
    return off_1E89AEEE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCryptoSuite:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDSRTPCryptoSuiteType_AES_CM_128_HMAC_SHA1_80")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDSRTPCryptoSuiteType_AES_256_CM_HMAC_SHA1_80")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDSRTPCryptoSuiteType_None")))
  {
    v4 = 2;
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
  v8.super_class = (Class)AWDHomeKitCameraStreamConfigure;
  -[AWDHomeKitCameraStreamConfigure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraStreamConfigure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  int audioCodec;
  __CFString *v9;
  int sampleRate;
  __CFString *v11;
  uint64_t cryptoSuite;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = self->_resolution - 1;
    if (v5 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_resolution);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E89AEE90[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("resolution"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_framerate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("framerate"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_12:
  audioCodec = self->_audioCodec;
  if (audioCodec == 2)
  {
    v9 = CFSTR("HMDAudioCodecGroupTypeAACELD");
  }
  else if (audioCodec == 3)
  {
    v9 = CFSTR("HMDAudioCodecGroupTypeOpus");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_audioCodec);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("audioCodec"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return v3;
    goto LABEL_24;
  }
LABEL_18:
  sampleRate = self->_sampleRate;
  if (sampleRate == 1)
  {
    v11 = CFSTR("HMDAudioSampleRateType_16");
  }
  else if (sampleRate == 2)
  {
    v11 = CFSTR("HMDAudioSampleRateType_24");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sampleRate);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sampleRate"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_24:
    cryptoSuite = self->_cryptoSuite;
    if (cryptoSuite >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cryptoSuite);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E89AEEE8[cryptoSuite];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cryptoSuite"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitCameraStreamConfigureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_resolution;
    *((_BYTE *)v4 + 28) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_framerate;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    v4[6] = self->_sampleRate;
    *((_BYTE *)v4 + 28) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[2] = self->_audioCodec;
  *((_BYTE *)v4 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_cryptoSuite;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_resolution;
    *((_BYTE *)result + 28) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_framerate;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 2) = self->_audioCodec;
  *((_BYTE *)result + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_sampleRate;
  *((_BYTE *)result + 28) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_cryptoSuite;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_resolution != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_framerate != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_audioCodec != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0 || self->_sampleRate != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_cryptoSuite != *((_DWORD *)v4 + 3))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_resolution;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_framerate;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_audioCodec;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_sampleRate;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_cryptoSuite;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 8) != 0)
  {
    self->_resolution = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_framerate = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    self->_sampleRate = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_audioCodec = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_cryptoSuite = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (unsigned)framerate
{
  return self->_framerate;
}

@end
