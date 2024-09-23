@implementation VCMediaNegotiationBlobV2MomentsSettings

- (unsigned)capabilities
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_capabilities;
  else
    return 4;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (unsigned)supportedCodecs
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_supportedCodecs;
  else
    return 10;
}

- (void)setSupportedCodecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supportedCodecs = a3;
}

- (void)setHasSupportedCodecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportedCodecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2MomentsSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2MomentsSettings description](&v3, sel_description), -[VCMediaNegotiationBlobV2MomentsSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capabilities), CFSTR("capabilities"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedCodecs), CFSTR("supportedCodecs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2MomentsSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_supportedCodecs;
    *((_BYTE *)a3 + 16) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = self->_capabilities;
  *((_BYTE *)a3 + 16) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_capabilities;
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_supportedCodecs;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) == 0 || self->_capabilities != *((_DWORD *)a3 + 2))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 16) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 2) == 0 || self->_supportedCodecs != *((_DWORD *)a3 + 3))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_capabilities;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_supportedCodecs;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 16) & 2) == 0)
      return;
LABEL_5:
    self->_supportedCodecs = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_capabilities = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 16) & 2) != 0)
    goto LABEL_5;
}

- (VCMediaNegotiationBlobV2MomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilitiesOneToOne:(unsigned __int8)a5 capabilitiesMultiway:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  VCMediaNegotiationBlobV2MomentsSettings *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a6;
  v7 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = -[VCMediaNegotiationBlobV2MomentsSettings init](self, "init");
  if (v10)
  {
    v11 = +[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:imageTypes:](VCMediaNegotiationBlobV2MomentsSettings, "supportedCodecsWithVideoCodecs:imageTypes:", a3, a4);
    v12 = v11;
    if (((_DWORD)v7 == 1 || (_DWORD)v6 == 1 || ((_DWORD)v6 != 2 ? (v13 = (_DWORD)v7 == 2) : (v13 = 1), v13))
      && !(_DWORD)v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = v16;
          v20 = 2080;
          v21 = "-[VCMediaNegotiationBlobV2MomentsSettings(Utils) initWithVideoCodecs:imageTypes:capabilitiesOneToOne:cap"
                "abilitiesMultiway:]";
          v22 = 1024;
          v23 = 29;
          v24 = 2112;
          v25 = a4;
          v26 = 2112;
          v27 = a3;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate image types and video codecs. imageTypes=%@ videoCodecExpected=%@", (uint8_t *)&v18, 0x30u);
        }
      }

      return 0;
    }
    else
    {
      if ((_DWORD)v11 != -[VCMediaNegotiationBlobV2MomentsSettings supportedCodecs](v10, "supportedCodecs"))
        -[VCMediaNegotiationBlobV2MomentsSettings setSupportedCodecs:](v10, "setSupportedCodecs:", v12);
      v14 = +[VCMediaNegotiationBlobV2MomentsSettings blobCapabilitiesWithOneToOneCapabilities:multiwayCapabilities:](VCMediaNegotiationBlobV2MomentsSettings, "blobCapabilitiesWithOneToOneCapabilities:multiwayCapabilities:", v7, v6);
      if ((_DWORD)v14 != -[VCMediaNegotiationBlobV2MomentsSettings capabilities](v10, "capabilities"))
        -[VCMediaNegotiationBlobV2MomentsSettings setCapabilities:](v10, "setCapabilities:", v14);
    }
  }
  return v10;
}

- (NSSet)videoCodecs
{
  return (NSSet *)+[VCMediaNegotiationBlobV2MomentsSettings videoCodecsWithSupportedCodecs:](VCMediaNegotiationBlobV2MomentsSettings, "videoCodecsWithSupportedCodecs:", -[VCMediaNegotiationBlobV2MomentsSettings supportedCodecs](self, "supportedCodecs"));
}

- (NSSet)imageTypes
{
  return (NSSet *)+[VCMediaNegotiationBlobV2MomentsSettings imageTypesWithSupportedCodecs:](VCMediaNegotiationBlobV2MomentsSettings, "imageTypesWithSupportedCodecs:", -[VCMediaNegotiationBlobV2MomentsSettings supportedCodecs](self, "supportedCodecs"));
}

- (unsigned)capabilitiesOneToOne
{
  return +[VCMediaNegotiationBlobV2MomentsSettings capabilitiesWithBlobCapabilities:](VCMediaNegotiationBlobV2MomentsSettings, "capabilitiesWithBlobCapabilities:", -[VCMediaNegotiationBlobV2MomentsSettings capabilities](self, "capabilities"));
}

- (unsigned)capabilitiesMultiway
{
  return +[VCMediaNegotiationBlobV2MomentsSettings multiwayCapabilitiesWithBlobCapabilities:](VCMediaNegotiationBlobV2MomentsSettings, "multiwayCapabilitiesWithBlobCapabilities:", -[VCMediaNegotiationBlobV2MomentsSettings capabilities](self, "capabilities"));
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2MomentsSettings data](self, "data"), "length"), a4);
  objc_msgSend(v6, "appendFormat:", CFSTR("Moments settings: "));
  -[VCMediaNegotiationBlobV2MomentsSettings appendFieldName:codecs:outString:](self, "appendFieldName:codecs:outString:", CFSTR("imageTypes"), +[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:imageTypes:](VCMediaNegotiationBlobV2MomentsSettings, "supportedCodecsWithVideoCodecs:imageTypes:", 0, +[VCMediaNegotiationBlobV2MomentsSettings imageTypesWithSupportedCodecs:](VCMediaNegotiationBlobV2MomentsSettings, "imageTypesWithSupportedCodecs:", -[VCMediaNegotiationBlobV2MomentsSettings supportedCodecs](self, "supportedCodecs"))), v6);
  -[VCMediaNegotiationBlobV2MomentsSettings appendFieldName:codecs:outString:](self, "appendFieldName:codecs:outString:", CFSTR("videoCodecs"), +[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:imageTypes:](VCMediaNegotiationBlobV2MomentsSettings, "supportedCodecsWithVideoCodecs:imageTypes:", +[VCMediaNegotiationBlobV2MomentsSettings videoCodecsWithSupportedCodecs:](VCMediaNegotiationBlobV2MomentsSettings, "videoCodecsWithSupportedCodecs:", -[VCMediaNegotiationBlobV2MomentsSettings supportedCodecs](self, "supportedCodecs")), 0), v6);
  v7 = objc_msgSend(v6, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v14;
      v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2MomentsSettings(Utils) printWithLogFile:prefix:]";
      v20 = 1024;
      v21 = 77;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (unsigned)supportedCodecsWithVideoCodecs:(id)a3 imageTypes:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  int v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(a3);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "intValue");
        if (v11 == 100)
        {
          v8 |= 2u;
        }
        else if (v11 == 123)
        {
          v8 |= 1u;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(a4);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "intValue");
        if (v16 == 1)
        {
          v8 |= 8u;
        }
        else if (!v16)
        {
          v8 |= 4u;
        }
      }
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v13);
  }
  return v8;
}

+ (id)videoCodecsWithSupportedCodecs:(unsigned int)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "addObject:", &unk_1E9EF7010);
  if ((v3 & 2) != 0)
    objc_msgSend(v5, "addObject:", &unk_1E9EF7028);
  return v5;
}

+ (id)imageTypesWithSupportedCodecs:(unsigned int)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = v4;
  if ((v3 & 4) != 0)
    objc_msgSend(v4, "addObject:", &unk_1E9EF7040);
  if ((v3 & 8) != 0)
    objc_msgSend(v5, "addObject:", &unk_1E9EF7058);
  return v5;
}

+ (unsigned)blobCapabilitiesWithOneToOneCapabilities:(unsigned __int8)a3 multiwayCapabilities:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;

  v4 = 2 * (a3 == 2);
  if (a3 == 1)
    v4 = 1;
  v5 = v4 | 8;
  if (a4 == 1)
    v4 |= 4u;
  if (a4 == 2)
    return v5;
  else
    return v4;
}

+ (unsigned)capabilitiesWithBlobCapabilities:(unsigned int)a3
{
  if ((a3 & 2) != 0)
    return 2;
  else
    return a3 & 1;
}

+ (unsigned)multiwayCapabilitiesWithBlobCapabilities:(unsigned int)a3
{
  if ((a3 & 8) != 0)
    return 2;
  else
    return (a3 & 4) != 0;
}

- (void)appendFieldName:(id)a3 codecs:(unsigned int)a4 outString:(id)a5
{
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;

  objc_msgSend(a5, "appendFormat:", CFSTR("%@=["), a3);
  if ((a4 & 0xF) != 0)
  {
    v7 = CFSTR("%@");
    v8 = 1;
    do
    {
      if ((v8 & a4) != 0)
      {
        v9 = CFSTR("H264");
        switch((int)v8)
        {
          case 1:
            break;
          case 2:
            v9 = CFSTR("HEVC");
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_8;
          case 4:
            v9 = CFSTR("JPEG");
            break;
          case 8:
            v9 = CFSTR("HEIF");
            break;
          default:
            if ((_DWORD)v8 == 15)
              v9 = CFSTR("SupportedMask");
            else
LABEL_8:
              v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            break;
        }
        objc_msgSend(a5, "appendFormat:", v7, v9);
        v7 = CFSTR(",%@");
      }
      a4 &= ~(_DWORD)v8;
      v8 = (2 * v8);
    }
    while ((a4 & 0xF) != 0);
  }
  objc_msgSend(a5, "appendString:", CFSTR("] "));
}

@end
