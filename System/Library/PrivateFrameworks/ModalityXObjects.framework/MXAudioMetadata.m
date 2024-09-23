@implementation MXAudioMetadata

- (int)codec
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_codec;
  else
    return 0;
}

- (void)setCodec:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCodec
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)codecAsString:(int)a3
{
  if (a3 < 8)
    return off_2512EF910[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCodec:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CODEC_UNDEF")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPXWB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPXNB")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PCM_8K")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PCM_16K")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPUS_8K")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPUS_16K")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ULAW_8K")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)audioSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_audioSource;
  else
    return 0;
}

- (void)setAudioSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioSource = a3;
}

- (void)setHasAudioSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)audioSourceAsString:(int)a3
{
  if (a3 < 8)
    return off_2512EF950[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAudioSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BuiltInMic")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LineIn")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiredHeadsetMic")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothHandsFreeDeviceSource")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UsbAudioSource")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarAudioSource")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothDoAPDevice")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CarJarvisDevice")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsFarField:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isFarField = a3;
}

- (void)setHasIsFarField:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFarField
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasVoiceTriggerInfo
{
  return self->_voiceTriggerInfo != 0;
}

- (void)setEnableServerEndpoint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enableServerEndpoint = a3;
}

- (void)setHasEnableServerEndpoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableServerEndpoint
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientModelVersion
{
  return self->_clientModelVersion != 0;
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
  v8.super_class = (Class)MXAudioMetadata;
  -[MXAudioMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXAudioMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t codec;
  __CFString *v6;
  uint64_t audioSource;
  __CFString *v8;
  void *v9;
  MXVoiceTriggerInfo *voiceTriggerInfo;
  void *v11;
  void *v12;
  NSString *clientModelVersion;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    codec = self->_codec;
    if (codec >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_codec);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_2512EF910[codec];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("codec"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    audioSource = self->_audioSource;
    if (audioSource >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_audioSource);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_2512EF950[audioSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("audio_source"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFarField);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("is_far_field"));

  }
  voiceTriggerInfo = self->_voiceTriggerInfo;
  if (voiceTriggerInfo)
  {
    -[MXVoiceTriggerInfo dictionaryRepresentation](voiceTriggerInfo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("voice_trigger_info"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableServerEndpoint);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("enable_server_endpoint"));

  }
  clientModelVersion = self->_clientModelVersion;
  if (clientModelVersion)
    objc_msgSend(v3, "setObject:forKey:", clientModelVersion, CFSTR("client_model_version"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXAudioMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:
  if (self->_voiceTriggerInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_clientModelVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_codec;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_audioSource;
  *((_BYTE *)v4 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 41) = self->_isFarField;
    *((_BYTE *)v4 + 44) |= 8u;
  }
LABEL_5:
  v6 = v4;
  if (self->_voiceTriggerInfo)
  {
    objc_msgSend(v4, "setVoiceTriggerInfo:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_enableServerEndpoint;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  if (self->_clientModelVersion)
  {
    objc_msgSend(v6, "setClientModelVersion:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_codec;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_audioSource;
  *(_BYTE *)(v5 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 41) = self->_isFarField;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
LABEL_5:
  v8 = -[MXVoiceTriggerInfo copyWithZone:](self->_voiceTriggerInfo, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_enableServerEndpoint;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_clientModelVersion, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  MXVoiceTriggerInfo *voiceTriggerInfo;
  char v7;
  NSString *clientModelVersion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_codec != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_audioSource != *((_DWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_27;
    if (self->_isFarField)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  voiceTriggerInfo = self->_voiceTriggerInfo;
  if ((unint64_t)voiceTriggerInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[MXVoiceTriggerInfo isEqual:](voiceTriggerInfo, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_33;
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 44) & 4) == 0)
    goto LABEL_27;
  if (!self->_enableServerEndpoint)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_33;
    goto LABEL_27;
  }
  if (!*((_BYTE *)v4 + 40))
    goto LABEL_27;
LABEL_33:
  clientModelVersion = self->_clientModelVersion;
  if ((unint64_t)clientModelVersion | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](clientModelVersion, "isEqual:");
  else
    v7 = 1;
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_codec;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_audioSource;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_isFarField;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[MXVoiceTriggerInfo hash](self->_voiceTriggerInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_enableServerEndpoint;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ -[NSString hash](self->_clientModelVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  MXVoiceTriggerInfo *voiceTriggerInfo;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_codec = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 44);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_audioSource = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
LABEL_4:
    self->_isFarField = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  voiceTriggerInfo = self->_voiceTriggerInfo;
  v8 = *((_QWORD *)v5 + 4);
  v9 = v5;
  if (voiceTriggerInfo)
  {
    if (!v8)
      goto LABEL_14;
    -[MXVoiceTriggerInfo mergeFrom:](voiceTriggerInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[MXAudioMetadata setVoiceTriggerInfo:](self, "setVoiceTriggerInfo:");
  }
  v5 = v9;
LABEL_14:
  if ((*((_BYTE *)v5 + 44) & 4) != 0)
  {
    self->_enableServerEndpoint = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[MXAudioMetadata setClientModelVersion:](self, "setClientModelVersion:");
    v5 = v9;
  }

}

- (BOOL)isFarField
{
  return self->_isFarField;
}

- (MXVoiceTriggerInfo)voiceTriggerInfo
{
  return self->_voiceTriggerInfo;
}

- (void)setVoiceTriggerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerInfo, a3);
}

- (BOOL)enableServerEndpoint
{
  return self->_enableServerEndpoint;
}

- (NSString)clientModelVersion
{
  return self->_clientModelVersion;
}

- (void)setClientModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
}

@end
