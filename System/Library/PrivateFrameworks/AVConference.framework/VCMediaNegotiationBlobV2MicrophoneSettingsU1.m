@implementation VCMediaNegotiationBlobV2MicrophoneSettingsU1

- (void)setRtpSSRC:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRtpSSRC
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unsigned)payloads
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_payloads;
  else
    return 15;
}

- (void)setPayloads:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_payloads = a3;
}

- (void)setHasPayloads:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPayloads
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)cipherSuites
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cipherSuites;
  else
    return 1;
}

- (void)setCipherSuites:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cipherSuites = a3;
}

- (void)setHasCipherSuites:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipherSuites
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cipherSuitesAsString:(int)a3
{
  int v3;

  v3 = a3 - 1;
  if ((a3 - 1) < 7 && ((0x4Bu >> v3) & 1) != 0)
    return off_1E9E57B00[v3];
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsCipherSuites:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthNoneRCCM3")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthSHA280RCCM2Deferred")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthSHA232RCCM2Deferred")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SupportedMask")))
    return 7;
  return 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2MicrophoneSettingsU1;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloads), CFSTR("payloads"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) == 0)
    return v3;
LABEL_7:
  v5 = self->_cipherSuites - 1;
  if (v5 < 7 && ((0x4Bu >> v5) & 1) != 0)
    v6 = off_1E9E57B00[v5];
  else
    v6 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cipherSuites);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cipherSuites"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2MicrophoneSettingsU1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      PBDataWriterWriteInt32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_rtpSSRC;
    *((_BYTE *)a3 + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_cipherSuites;
      *((_BYTE *)a3 + 20) |= 1u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_payloads;
  *((_BYTE *)a3 + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_rtpSSRC;
    *((_BYTE *)result + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_payloads;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_cipherSuites;
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 4) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 4))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 20) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 2) == 0 || self->_payloads != *((_DWORD *)a3 + 3))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 20) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_cipherSuites != *((_DWORD *)a3 + 2))
        goto LABEL_16;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_rtpSSRC;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_payloads;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_cipherSuites;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 20);
  if ((v3 & 4) != 0)
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        return;
LABEL_7:
      self->_cipherSuites = *((_DWORD *)a3 + 2);
      *(_BYTE *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_payloads = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
    goto LABEL_7;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)initWithSSRC:(unsigned int)a3 audioPayloads:(id)a4 u1AuthTagEnabled:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *v28;
  uint64_t v29;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 init](self, "init");
  if (!v8)
    return v8;
  if (!objc_msgSend(a4, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:].cold.1(v15, v16);
    }
    goto LABEL_22;
  }
  if (-[VCMediaNegotiationBlobV2MicrophoneSettingsU1 rtpSSRC](v8, "rtpSSRC") != (_DWORD)v7)
    -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 setRtpSSRC:](v8, "setRtpSSRC:", v7);
  v9 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloadBitmapWithAudioPayloads:](v8, "payloadBitmapWithAudioPayloads:", a4);
  if (!(_DWORD)v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:].cold.2(v17, (uint64_t)a4, v18);
    }
LABEL_22:

    return 0;
  }
  v10 = v9;
  if ((_DWORD)v9 != -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloads](v8, "payloads"))
    -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 setPayloads:](v8, "setPayloads:", v10);
  v11 = +[VCMediaNegotiationBlobV2SettingsU1 negotiationCipherSuitesFromMediaStreamCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "negotiationCipherSuitesFromMediaStreamCipherSuites:", +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:isOneToOne:](VCEncryptionRules, "supportedCipherSuitesForStreamGroupID:isOneToOne:", 1835623282, 1));
  if (v5 && VCFeatureFlagManager_U1AuthTagEnabled())
  {
    if ((_DWORD)v11 != -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 cipherSuites](v8, "cipherSuites"))
      -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 setCipherSuites:](v8, "setCipherSuites:", v11);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316162;
      v20 = v12;
      v21 = 2080;
      v22 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
      v23 = 1024;
      v24 = 41;
      v25 = 2112;
      v26 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v11, objc_msgSend(MEMORY[0x1E0CB37A0], "string"));
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning cipherSuites=%@ for blob=%@ because U1AuthTag is NOT enabled", (uint8_t *)&v19, 0x30u);
    }
  }
  return v8;
}

- (NSSet)audioPayloads
{
  NSSet *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;

  v3 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloads](self, "payloads");
  if (v4)
  {
    v5 = v4;
    v6 = 1;
    do
    {
      if ((v6 & v5) != 0)
        -[NSSet addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloadFromFlag:](VCMediaNegotiationBlobV2MicrophoneSettingsU1, "payloadFromFlag:", v6)));
      v5 &= ~(_DWORD)v6;
      if (!v5)
        break;
      v7 = v6 & 0x7F;
      v6 = (2 * v6);
    }
    while (v7);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2MicrophoneSettingsU1 data](self, "data"), "length"), a4);
  objc_msgSend(v5, "appendFormat:", CFSTR("Mic settings (U+1): "));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v5, "appendFormat:", CFSTR("ssrc=%08x "), -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 rtpSSRC](self, "rtpSSRC"));
  v6 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloads](self, "payloads");
  v7 = v6;
  objc_msgSend(v5, "appendFormat:", CFSTR("payloads=0x%x ["), v6);
  if (v7)
  {
    v8 = CFSTR("%@");
    v9 = 1;
    do
    {
      if ((v9 & v7) != 0)
      {
        v10 = CFSTR("AACELD_24000");
        switch((int)v9)
        {
          case 1:
            break;
          case 2:
            v10 = CFSTR("EVS_32000");
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_11;
          case 4:
            v10 = CFSTR("CN");
            break;
          case 8:
            v10 = CFSTR("RED");
            break;
          default:
            if ((_DWORD)v9 == 64)
            {
              v10 = CFSTR("AACELD_48000");
            }
            else if ((_DWORD)v9 == 255)
            {
              v10 = CFSTR("SupportedMask");
            }
            else
            {
LABEL_11:
              v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
            }
            break;
        }
        objc_msgSend(v5, "appendFormat:", v8, v10);
        v8 = CFSTR(",%@");
      }
      v7 &= ~(_DWORD)v9;
      if (!v7)
        break;
      v11 = v9 & 0x7F;
      v9 = (2 * v9);
    }
    while (v11);
  }
  objc_msgSend(v5, "appendString:", CFSTR("] "));
  +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 cipherSuites](self, "cipherSuites"), v5);
  v12 = objc_msgSend(v5, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v13, v14, v15, v16, v17, v18, v12);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v23 = v19;
      v24 = 2080;
      v25 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) printWithLogFile:prefix:]";
      v26 = 1024;
      v27 = 86;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (int)flagFromPayload:(int)a3
{
  if (a3 <= 100)
  {
    if (a3 == 13)
      return 4;
    if (a3 == 20)
      return 8;
  }
  else
  {
    switch(a3)
    {
      case 'e':
        return 64;
      case 'h':
        return 1;
      case 'l':
        return 2;
    }
  }
  return 0;
}

+ (int)payloadFromFlag:(int)a3
{
  int result;

  result = 104;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = 108;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_5;
    case 4:
      result = 13;
      break;
    case 8:
      result = 20;
      break;
    default:
      if (a3 == 64)
        result = 101;
      else
LABEL_5:
        result = 128;
      break;
  }
  return result;
}

- (unsigned)payloadBitmapWithAudioPayloads:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      v6 |= +[VCMediaNegotiationBlobV2MicrophoneSettingsU1 flagFromPayload:](VCMediaNegotiationBlobV2MicrophoneSettingsU1, "flagFromPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue"));
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  }
  while (v5);
  return v6;
}

@end
