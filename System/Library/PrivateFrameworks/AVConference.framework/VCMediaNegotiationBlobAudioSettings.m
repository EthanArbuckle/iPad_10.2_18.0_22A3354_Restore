@implementation VCMediaNegotiationBlobAudioSettings

- (void)setAudioUnitModel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioUnitModel = a3;
}

- (void)setHasAudioUnitModel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioUnitModel
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobAudioSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobAudioSettings description](&v3, sel_description), -[VCMediaNegotiationBlobAudioSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_audioUnitModel), CFSTR("audioUnitModel"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportFlags), CFSTR("supportFlags"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloadFlags), CFSTR("payloadFlags"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_secondaryFlags), CFSTR("secondaryFlags"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useSBR), CFSTR("useSBR"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobAudioSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_rtpSSRC;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_audioUnitModel;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  *((_DWORD *)a3 + 6) = self->_supportFlags;
  *((_DWORD *)a3 + 3) = self->_payloadFlags;
  *((_DWORD *)a3 + 5) = self->_secondaryFlags;
  *((_BYTE *)a3 + 28) = self->_useSBR;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_rtpSSRC;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_audioUnitModel;
    *((_BYTE *)result + 32) |= 1u;
  }
  *((_DWORD *)result + 6) = self->_supportFlags;
  *((_DWORD *)result + 3) = self->_payloadFlags;
  *((_DWORD *)result + 5) = self->_secondaryFlags;
  *((_BYTE *)result + 28) = self->_useSBR;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int v6;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_rtpSSRC != *((_DWORD *)a3 + 4))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_audioUnitModel != *((_DWORD *)a3 + 2))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_13;
    }
    if (self->_supportFlags != *((_DWORD *)a3 + 6)
      || self->_payloadFlags != *((_DWORD *)a3 + 3)
      || self->_secondaryFlags != *((_DWORD *)a3 + 5))
    {
      goto LABEL_13;
    }
    v6 = *((unsigned __int8 *)a3 + 28);
    if (self->_useSBR)
      LOBYTE(v5) = v6 != 0;
    else
      LOBYTE(v5) = v6 == 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_audioUnitModel;
  else
    v2 = 0;
  return v2 ^ (2654435761 * self->_rtpSSRC) ^ (2654435761 * self->_supportFlags) ^ (2654435761
                                                                                      * self->_payloadFlags) ^ (2654435761 * self->_secondaryFlags) ^ (2654435761 * self->_useSBR);
}

- (void)mergeFrom:(id)a3
{
  self->_rtpSSRC = *((_DWORD *)a3 + 4);
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_audioUnitModel = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_supportFlags = *((_DWORD *)a3 + 6);
  self->_payloadFlags = *((_DWORD *)a3 + 3);
  self->_secondaryFlags = *((_DWORD *)a3 + 5);
  self->_useSBR = *((_BYTE *)a3 + 28);
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  self->_rtpSSRC = a3;
}

- (unsigned)audioUnitModel
{
  return self->_audioUnitModel;
}

- (unsigned)supportFlags
{
  return self->_supportFlags;
}

- (void)setSupportFlags:(unsigned int)a3
{
  self->_supportFlags = a3;
}

- (unsigned)payloadFlags
{
  return self->_payloadFlags;
}

- (void)setPayloadFlags:(unsigned int)a3
{
  self->_payloadFlags = a3;
}

- (unsigned)secondaryFlags
{
  return self->_secondaryFlags;
}

- (void)setSecondaryFlags:(unsigned int)a3
{
  self->_secondaryFlags = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_useSBR = a3;
}

- (VCMediaNegotiationBlobAudioSettings)initWithAudioConfiguration:(id)a3
{
  VCMediaNegotiationBlobAudioSettings *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  int v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[VCMediaNegotiationBlobAudioSettings init](self, "init");
  if (v4)
  {
    v4->_supportFlags |= objc_msgSend(a3, "allowAudioSwitching");
    v5 = objc_msgSend(a3, "allowAudioRecording") ? 2 : 0;
    v4->_supportFlags |= v5;
    v4->_rtpSSRC = objc_msgSend(a3, "ssrc");
    v4->_audioUnitModel = objc_msgSend(a3, "audioUnitNumber");
    *(_BYTE *)&v4->_has |= 1u;
    v4->_useSBR = objc_msgSend(a3, "useSBR");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_msgSend(a3, "audioPayloads");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "intValue");
          v12 = +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:](VCMediaNegotiationBlobAudioSettings, "negotiationPayloadFromPayload:", v11);
          if (v12 != -1)
          {
            v13 = v12;
            v4->_payloadFlags |= v12;
            if (objc_msgSend(a3, "isSecondaryPayload:", v11))
              v4->_secondaryFlags |= v13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v8);
    }
  }
  return v4;
}

- (BOOL)allowAudioRecording
{
  return (LOBYTE(self->_supportFlags) >> 1) & 1;
}

- (BOOL)allowAudioSwitching
{
  return self->_supportFlags & 1;
}

+ (int)negotiationPayloadFromPayload:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EF6698, &unk_1E9EF66B0, &unk_1E9EF66C8, &unk_1E9EF66E0, &unk_1E9EF66F8, &unk_1E9EF6710, &unk_1E9EF6728, &unk_1E9EF6740, &unk_1E9EF6758, &unk_1E9EF6770, &unk_1E9EF6788, &unk_1E9EF67A0, &unk_1E9EF67B8, &unk_1E9EF67D0, &unk_1E9EF67E8, &unk_1E9EF6800, &unk_1E9EF6818,
                 &unk_1E9EF6830,
                 &unk_1E9EF6848,
                 &unk_1E9EF6860,
                 &unk_1E9EF6878,
                 &unk_1E9EF6890,
                 &unk_1E9EF68A8,
                 &unk_1E9EF68C0,
                 &unk_1E9EF68D8,
                 &unk_1E9EF68F0,
                 0);
  v5 = (void *)objc_msgSend(v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = -1;

  return v6;
}

+ (int)payloadFromNegotiationPayload:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EF66B0, &unk_1E9EF6698, &unk_1E9EF66E0, &unk_1E9EF66C8, &unk_1E9EF6710, &unk_1E9EF66F8, &unk_1E9EF6740, &unk_1E9EF6728, &unk_1E9EF6770, &unk_1E9EF6758, &unk_1E9EF67A0, &unk_1E9EF6788, &unk_1E9EF67D0, &unk_1E9EF67B8, &unk_1E9EF6800, &unk_1E9EF67E8, &unk_1E9EF6830,
                 &unk_1E9EF6818,
                 &unk_1E9EF6860,
                 &unk_1E9EF6848,
                 &unk_1E9EF6890,
                 &unk_1E9EF6878,
                 &unk_1E9EF68C0,
                 &unk_1E9EF68A8,
                 &unk_1E9EF68F0,
                 &unk_1E9EF68D8,
                 0);
  v5 = (void *)objc_msgSend(v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = 128;

  return v6;
}

+ (BOOL)isAudioPayloadSupported:(int)a3
{
  return +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:](VCMediaNegotiationBlobAudioSettings, "negotiationPayloadFromPayload:", *(_QWORD *)&a3) != -1;
}

- (id)newMediaNegotiatorAudioConfiguration
{
  VCMediaNegotiatorAudioConfiguration *v3;
  unsigned int payloadFlags;
  uint64_t v5;

  v3 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", -[VCMediaNegotiationBlobAudioSettings allowAudioSwitching](self, "allowAudioSwitching"), -[VCMediaNegotiationBlobAudioSettings allowAudioRecording](self, "allowAudioRecording"), self->_useSBR, self->_rtpSSRC, self->_audioUnitModel);
  payloadFlags = self->_payloadFlags;
  if (payloadFlags)
  {
    v5 = 1;
    do
    {
      if ((v5 & payloadFlags) != 0)
      {
        payloadFlags &= ~(_DWORD)v5;
        -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v3, "addAudioPayload:isSecondary:", +[VCMediaNegotiationBlobAudioSettings payloadFromNegotiationPayload:](VCMediaNegotiationBlobAudioSettings, "payloadFromNegotiationPayload:", v5), (self->_secondaryFlags & v5) != 0);
      }
      v5 = (2 * v5);
    }
    while (payloadFlags);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3
{
  void *v5;
  int ErrorLogLevelForModule;
  NSObject **v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  os_log_t *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Audio Settings: SSRC=%x sbr=%d audioSwitching=%d audioRecording=%d"), self->_rtpSSRC, self->_useSBR, self->_supportFlags & 1, (self->_supportFlags >> 1) & 1);
  if (-[VCMediaNegotiationBlobAudioSettings hasAudioUnitModel](self, "hasAudioUnitModel"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" model=%u"), self->_audioUnitModel);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v7 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v46 = v8;
      v47 = 2080;
      v48 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      v49 = 1024;
      v50 = 975;
      v51 = 2080;
      v52 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  v44 = v5;
  v10 = objc_msgSend(v5, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - %s\n", v11, v12, v13, v14, v15, v16, v10);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Primary payloads:"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Secondary payloads:"));
  v19 = 1;
  do
  {
    if ((self->_payloadFlags & v19) != 0 && (self->_secondaryFlags & v19) == 0)
    {
      if ((int)v19 > 127)
      {
        if ((int)v19 <= 1023)
        {
          switch((_DWORD)v19)
          {
            case 0x80:
              v20 = CFSTR("AMR_8000");
              goto LABEL_38;
            case 0x100:
              v20 = CFSTR("AMR_16000");
              goto LABEL_38;
            case 0x200:
              v20 = CFSTR("CN");
              goto LABEL_38;
          }
        }
        else if ((int)v19 > 4095)
        {
          if ((_DWORD)v19 == 4096)
          {
            v20 = CFSTR("AACELD_48000");
            goto LABEL_38;
          }
          if ((_DWORD)v19 == 0x7FFF)
          {
            v20 = CFSTR("SUPPORTED");
            goto LABEL_38;
          }
        }
        else
        {
          if ((_DWORD)v19 == 1024)
          {
            v20 = CFSTR("RED");
            goto LABEL_38;
          }
          if ((_DWORD)v19 == 2048)
          {
            v20 = CFSTR("EVS_32000");
LABEL_38:
            objc_msgSend(v17, "appendFormat:", CFSTR(" %@,"), v20);
            goto LABEL_39;
          }
        }
      }
      else
      {
        if ((int)v19 <= 15)
        {
          v20 = CFSTR("G722");
          switch((int)v19)
          {
            case 1:
              goto LABEL_38;
            case 2:
              v20 = CFSTR("AACELD_16000");
              break;
            case 4:
              v20 = CFSTR("AACELD_22050");
              break;
            case 8:
              v20 = CFSTR("AACELD_24000");
              break;
            default:
              goto LABEL_37;
          }
          goto LABEL_38;
        }
        switch((_DWORD)v19)
        {
          case 0x10:
            v20 = CFSTR("SPEEX_8K");
            goto LABEL_38;
          case 0x20:
            v20 = CFSTR("SPEEX_16K");
            goto LABEL_38;
          case 0x40:
            v20 = CFSTR("OPUS");
            goto LABEL_38;
        }
      }
LABEL_37:
      v20 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
      goto LABEL_38;
    }
LABEL_39:
    if ((self->_secondaryFlags & v19) == 0)
      goto LABEL_71;
    if ((int)v19 <= 63)
    {
      v21 = CFSTR("G722");
      switch((int)v19)
      {
        case -1:
          v21 = CFSTR("INVALID");
          goto LABEL_70;
        case 0:
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_61;
        case 1:
          goto LABEL_70;
        case 2:
          v21 = CFSTR("AACELD_16000");
          goto LABEL_70;
        case 4:
          v21 = CFSTR("AACELD_22050");
          goto LABEL_70;
        case 8:
          v21 = CFSTR("AACELD_24000");
          goto LABEL_70;
        default:
          if ((_DWORD)v19 == 16)
          {
            v21 = CFSTR("SPEEX_8K");
          }
          else
          {
            if ((_DWORD)v19 != 32)
              goto LABEL_61;
            v21 = CFSTR("SPEEX_16K");
          }
          break;
      }
      goto LABEL_70;
    }
    if ((int)v19 > 1023)
    {
      if ((int)v19 > 4095)
      {
        if ((_DWORD)v19 == 4096)
        {
          v21 = CFSTR("AACELD_48000");
          goto LABEL_70;
        }
        if ((_DWORD)v19 != 0x7FFF)
          goto LABEL_61;
        v21 = CFSTR("SUPPORTED");
      }
      else
      {
        if ((_DWORD)v19 == 1024)
        {
          v21 = CFSTR("RED");
          goto LABEL_70;
        }
        if ((_DWORD)v19 != 2048)
          goto LABEL_61;
        v21 = CFSTR("EVS_32000");
      }
    }
    else if ((int)v19 > 255)
    {
      if ((_DWORD)v19 == 256)
      {
        v21 = CFSTR("AMR_16000");
        goto LABEL_70;
      }
      if ((_DWORD)v19 != 512)
        goto LABEL_61;
      v21 = CFSTR("CN");
    }
    else
    {
      if ((_DWORD)v19 == 64)
      {
        v21 = CFSTR("OPUS");
        goto LABEL_70;
      }
      if ((_DWORD)v19 != 128)
      {
LABEL_61:
        v21 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
        goto LABEL_70;
      }
      v21 = CFSTR("AMR_8000");
    }
LABEL_70:
    objc_msgSend(v18, "appendFormat:", CFSTR(" %@,"), v21);
LABEL_71:
    v22 = (v19 & 0x3FFF) == 0;
    v19 = (2 * v19);
  }
  while (!v22);
  v23 = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","));
  v24 = objc_msgSend((id)objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v23), "UTF8String");
  v25 = objc_msgSend((id)objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v23), "UTF8String");
  v26 = VRTraceGetErrorLogLevelForModule();
  v27 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (v26 > 6)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v46 = v28;
      v47 = 2080;
      v48 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      v49 = 1024;
      v50 = 991;
      v51 = 2080;
      v52 = v24;
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v46 = v36;
      v47 = 2080;
      v48 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      v49 = 1024;
      v50 = 992;
      v51 = 2080;
      v52 = v25;
      _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v30, v31, v32, v33, v34, v35, v24);
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v38, v39, v40, v41, v42, v43, v25);

}

@end
