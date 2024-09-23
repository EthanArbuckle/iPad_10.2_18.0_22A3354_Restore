@implementation VCMediaNegotiationBlobV2VideoPayload

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2VideoPayload setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2VideoPayload;
  -[VCMediaNegotiationBlobV2VideoPayload dealloc](&v3, sel_dealloc);
}

- (unsigned)videoPayload
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_videoPayload;
  else
    return 1;
}

- (void)setVideoPayload:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_videoPayload = a3;
}

- (void)setHasVideoPayload:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVideoPayload
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setParameterSet:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_parameterSet = a3;
}

- (void)setHasParameterSet:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParameterSet
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEncodeFormats:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_encodeFormats = a3;
}

- (void)setHasEncodeFormats:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEncodeFormats
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDecodeFormats:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_decodeFormats = a3;
}

- (void)setHasDecodeFormats:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecodeFormats
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncodeDecodeFeatures
{
  return self->_encodeDecodeFeatures != 0;
}

- (void)setPreferredDecodeFormat:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_preferredDecodeFormat = a3;
}

- (void)setHasPreferredDecodeFormat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredDecodeFormat
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2VideoPayload;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2VideoPayload description](&v3, sel_description), -[VCMediaNegotiationBlobV2VideoPayload dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSData *encodeDecodeFeatures;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoPayload), CFSTR("videoPayload"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_parameterSet), CFSTR("parameterSet"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_encodeFormats), CFSTR("encodeFormats"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_decodeFormats), CFSTR("decodeFormats"));
LABEL_6:
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures)
    objc_msgSend(v3, "setObject:forKey:", encodeDecodeFeatures, CFSTR("encodeDecodeFeatures"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_preferredDecodeFormat), CFSTR("preferredDecodeFormat"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2VideoPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_encodeDecodeFeatures)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_videoPayload;
    *((_BYTE *)a3 + 40) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_parameterSet;
  *((_BYTE *)a3 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_encodeFormats;
  *((_BYTE *)a3 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 2) = self->_decodeFormats;
    *((_BYTE *)a3 + 40) |= 1u;
  }
LABEL_6:
  if (self->_encodeDecodeFeatures)
    objc_msgSend(a3, "setEncodeDecodeFeatures:");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_preferredDecodeFormat;
    *((_BYTE *)a3 + 40) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_videoPayload;
    *(_BYTE *)(v5 + 40) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_parameterSet;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *(_DWORD *)(v5 + 24) = self->_encodeFormats;
  *(_BYTE *)(v5 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 8) = self->_decodeFormats;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
LABEL_6:

  *(_QWORD *)(v6 + 16) = -[NSData copyWithZone:](self->_encodeDecodeFeatures, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_preferredDecodeFormat;
    *(_BYTE *)(v6 + 40) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSData *encodeDecodeFeatures;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_videoPayload != *((_DWORD *)a3 + 9))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_parameterSet != *((_DWORD *)a3 + 7))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_encodeFormats != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_decodeFormats != *((_DWORD *)a3 + 2))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_29;
    }
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    if ((unint64_t)encodeDecodeFeatures | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSData isEqual:](encodeDecodeFeatures, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_preferredDecodeFormat != *((_DWORD *)a3 + 8))
        goto LABEL_29;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_videoPayload;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_parameterSet;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_encodeFormats;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_decodeFormats;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSData hash](self->_encodeDecodeFeatures, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_preferredDecodeFormat;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_videoPayload = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_parameterSet = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  self->_encodeFormats = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
LABEL_5:
    self->_decodeFormats = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 2))
    -[VCMediaNegotiationBlobV2VideoPayload setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:");
  if ((*((_BYTE *)a3 + 40) & 8) != 0)
  {
    self->_preferredDecodeFormat = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
}

- (unsigned)parameterSet
{
  return self->_parameterSet;
}

- (unsigned)encodeFormats
{
  return self->_encodeFormats;
}

- (unsigned)decodeFormats
{
  return self->_decodeFormats;
}

- (NSData)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)preferredDecodeFormat
{
  return self->_preferredDecodeFormat;
}

- (VCMediaNegotiationBlobV2VideoPayload)initWithPayload:(int)a3 encodeVideoRules:(id)a4 decodeVideoRules:(id)a5 videoParameterSupport:(unsigned int)a6 featureListStrings:(id)a7
{
  uint64_t v8;
  uint64_t v11;
  VCMediaNegotiationBlobV2VideoPayload *v12;
  VCMediaNegotiationBlobV2VideoPayload *v13;
  VCMediaNegotiationBlobV2VideoPayload *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v12 = -[VCMediaNegotiationBlobV2VideoPayload init](self, "init");
  if (v12)
  {
    v13 = +[VCMediaNegotiationBlobV2VideoPayload payloadWithRTPPayload:](VCMediaNegotiationBlobV2VideoPayload, "payloadWithRTPPayload:", v11);
    if ((_DWORD)v13)
    {
      v14 = v13;
      if (-[VCMediaNegotiationBlobV2VideoPayload videoPayload](v12, "videoPayload") != (_DWORD)v13)
        -[VCMediaNegotiationBlobV2VideoPayload setVideoPayload:](v12, "setVideoPayload:", v14);
      v15 = _os_feature_enabled_impl();
      if (a7)
      {
        if (v15)
        {
          v16 = objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
          if (v16)
          {
            v17 = v16;
            -[VCMediaNegotiationBlobV2VideoPayload setEncodeDecodeFeatures:](v12, "setEncodeDecodeFeatures:", (id)VCPCreateCompressedFLS());
            if (!-[VCMediaNegotiationBlobV2VideoPayload encodeDecodeFeatures](v12, "encodeDecodeFeatures")
              && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v21 = 136316162;
                v22 = v18;
                v23 = 2080;
                v24 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:vi"
                      "deoParameterSupport:featureListStrings:]";
                v25 = 1024;
                v26 = 41;
                v27 = 2112;
                v28 = v17;
                v29 = 1024;
                v30 = v11;
                _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCPCreateCompressedFLS return nil for featureString=%@, payload=%u)", (uint8_t *)&v21, 0x2Cu);
              }
            }
          }
        }
      }
      -[VCMediaNegotiationBlobV2VideoPayload setupVideoParameterSupport:](v12, "setupVideoParameterSupport:", v8);
      if (-[VCMediaNegotiationBlobV2VideoPayload setupEncode:videoRules:](v12, "setupEncode:videoRules:", 1, a4))
      {
        if (-[VCMediaNegotiationBlobV2VideoPayload setupEncode:videoRules:](v12, "setupEncode:videoRules:", 0, a5))
          return v12;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:].cold.1();
    }

    return 0;
  }
  return v12;
}

- (int)payload
{
  return +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:](VCMediaNegotiationBlobV2VideoPayload, "rtpPayloadWithPayload:", -[VCMediaNegotiationBlobV2VideoPayload videoPayload](self, "videoPayload"));
}

- (NSArray)encodeVideoRules
{
  return (NSArray *)-[VCMediaNegotiationBlobV2VideoPayload videoRulesWithBitmap:preferredBitmap:](self, "videoRulesWithBitmap:preferredBitmap:", -[VCMediaNegotiationBlobV2VideoPayload encodeFormats](self, "encodeFormats"), 0);
}

- (NSArray)decodeVideoRules
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[VCMediaNegotiationBlobV2VideoPayload decodeFormats](self, "decodeFormats");
  if (-[VCMediaNegotiationBlobV2VideoPayload hasPreferredDecodeFormat](self, "hasPreferredDecodeFormat"))
    v4 = -[VCMediaNegotiationBlobV2VideoPayload preferredDecodeFormat](self, "preferredDecodeFormat");
  else
    v4 = 0;
  return (NSArray *)-[VCMediaNegotiationBlobV2VideoPayload videoRulesWithBitmap:preferredBitmap:](self, "videoRulesWithBitmap:preferredBitmap:", v3, v4);
}

- (id)videoRulesWithBitmap:(unsigned int)a3 preferredBitmap:(unsigned int)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  VCVideoRule *v10;
  double v11;
  VCVideoRule *v12;
  double v13;
  VCVideoRule *v14;
  VCVideoRule *v15;
  double v16;
  VCVideoRule *v17;
  double v18;
  VCVideoRule *v19;
  VCVideoRule *v20;
  double v21;
  VCVideoRule *v22;
  double v23;
  VCVideoRule *v24;
  VCVideoRule *v25;
  double v26;
  VCVideoRule *v27;
  double v28;
  VCVideoRule *v29;
  VCVideoRule *v30;
  double v31;
  VCVideoRule *v32;
  double v33;
  VCVideoRule *v34;
  VCVideoRule *v35;
  double v36;
  VCVideoRule *v37;
  double v38;
  VCVideoRule *v39;
  VCVideoRule *v40;
  double v41;
  VCVideoRule *v42;
  double v43;
  VCVideoRule *v44;
  VCVideoRule *v45;
  double v46;
  VCVideoRule *v47;
  double v48;
  VCVideoRule *v49;
  VCVideoRule *v50;
  double v51;
  VCVideoRule *v52;
  double v53;
  VCVideoRule *v54;
  VCVideoRule *v55;
  double v56;
  VCVideoRule *v57;
  double v58;
  VCVideoRule *v59;
  VCVideoRule *v60;
  double v61;
  VCVideoRule *v62;
  double v63;
  VCVideoRule *v64;
  VCVideoRule *v65;
  double v66;
  VCVideoRule *v67;
  double v68;
  VCVideoRule *v69;
  VCVideoRule *v70;
  double v71;
  VCVideoRule *v72;
  double v73;
  VCVideoRule *v74;
  VCVideoRule *v75;
  double v76;
  VCVideoRule *v77;
  double v78;
  VCVideoRule *v79;
  VCVideoRule *v80;
  double v81;
  VCVideoRule *v82;
  double v83;
  VCVideoRule *v84;
  VCVideoRule *v85;
  double v86;
  VCVideoRule *v87;
  double v88;
  VCVideoRule *v89;
  VCVideoRule *v90;
  double v91;
  VCVideoRule *v92;
  double v93;
  VCVideoRule *v94;
  VCVideoRule *v95;
  double v96;
  VCVideoRule *v97;
  double v98;
  VCVideoRule *v99;
  VCVideoRule *v100;
  double v101;
  VCVideoRule *v102;
  double v103;
  VCVideoRule *v104;
  VCVideoRule *v105;
  double v106;
  VCVideoRule *v107;
  double v108;
  VCVideoRule *v109;
  VCVideoRule *v110;
  double v111;
  VCVideoRule *v112;
  double v113;
  VCVideoRule *v114;
  VCVideoRule *v115;
  double v116;
  VCVideoRule *v117;
  double v118;
  VCVideoRule *v119;
  VCVideoRule *v120;
  double v121;
  VCVideoRule *v122;
  double v123;
  VCVideoRule *v124;
  VCVideoRule *v125;
  double v126;
  VCVideoRule *v127;
  double v128;
  VCVideoRule *v129;
  VCVideoRule *v130;
  double v131;
  VCVideoRule *v132;
  double v133;
  VCVideoRule *v134;
  VCVideoRule *v135;
  double v136;
  VCVideoRule *v137;
  double v138;
  VCVideoRule *v139;
  VCVideoRule *v140;
  double v141;
  VCVideoRule *v142;
  double v143;
  VCVideoRule *v144;
  VCVideoRule *v145;
  double v146;
  VCVideoRule *v147;
  double v148;
  VCVideoRule *v149;
  VCVideoRule *v150;
  double v151;
  VCVideoRule *v152;
  double v153;
  VCVideoRule *v154;
  uint64_t v155;
  NSObject *v156;
  uint64_t v158;
  NSObject *v159;
  uint64_t v160;
  NSObject *v161;
  int v162;
  uint64_t v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  int v167;
  __int16 v168;
  unsigned int v169;
  __int16 v170;
  id v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v158 = VRTraceErrorLogLevelToCSTR();
      v159 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.1(v158, v159);
    }
    goto LABEL_245;
  }
  v8 = +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:](VCMediaNegotiationBlobV2VideoPayload, "rtpPayloadWithPayload:", -[VCMediaNegotiationBlobV2VideoPayload videoPayload](self, "videoPayload"));
  if ((_DWORD)v8 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v160 = VRTraceErrorLogLevelToCSTR();
      v161 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.2(v160, self, v161);
    }
    goto LABEL_245;
  }
  v9 = v8;
  if ((a3 & 1) != 0)
  {
    v10 = [VCVideoRule alloc];
    LODWORD(v11) = 15.0;
    v12 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v10, "initWithFrameWidth:frameHeight:frameRate:payload:", 192, 112, v9, v11);
    if (!v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.31();
      }
      goto LABEL_245;
    }
    v14 = v12;
    if ((a4 & 1) != 0)
    {
      LODWORD(v13) = 1.0;
      -[VCVideoRule setFPref:](v12, "setFPref:", v13);
    }
    objc_msgSend(v7, "addObject:", v14);

  }
  if ((a3 & 2) != 0)
  {
    v15 = [VCVideoRule alloc];
    LODWORD(v16) = 15.0;
    v17 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v15, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, v9, v16);
    if (!v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.30();
      }
      goto LABEL_245;
    }
    v19 = v17;
    if ((a4 & 2) != 0)
    {
      LODWORD(v18) = 1.0;
      -[VCVideoRule setFPref:](v17, "setFPref:", v18);
    }
    objc_msgSend(v7, "addObject:", v19);

  }
  if ((a3 & 4) != 0)
  {
    v20 = [VCVideoRule alloc];
    LODWORD(v21) = 30.0;
    v22 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v20, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, v9, v21);
    if (!v22)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.29();
      }
      goto LABEL_245;
    }
    v24 = v22;
    if ((a4 & 4) != 0)
    {
      LODWORD(v23) = 1.0;
      -[VCVideoRule setFPref:](v22, "setFPref:", v23);
    }
    objc_msgSend(v7, "addObject:", v24);

  }
  if ((a3 & 8) != 0)
  {
    v25 = [VCVideoRule alloc];
    LODWORD(v26) = 15.0;
    v27 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v25, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, v9, v26);
    if (!v27)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.28();
      }
      goto LABEL_245;
    }
    v29 = v27;
    if ((a4 & 8) != 0)
    {
      LODWORD(v28) = 1.0;
      -[VCVideoRule setFPref:](v27, "setFPref:", v28);
    }
    objc_msgSend(v7, "addObject:", v29);

  }
  if ((a3 & 0x10) != 0)
  {
    v30 = [VCVideoRule alloc];
    LODWORD(v31) = 30.0;
    v32 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v30, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, v9, v31);
    if (!v32)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.27();
      }
      goto LABEL_245;
    }
    v34 = v32;
    if ((a4 & 0x10) != 0)
    {
      LODWORD(v33) = 1.0;
      -[VCVideoRule setFPref:](v32, "setFPref:", v33);
    }
    objc_msgSend(v7, "addObject:", v34);

  }
  if ((a3 & 0x20) != 0)
  {
    v35 = [VCVideoRule alloc];
    LODWORD(v36) = 15.0;
    v37 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v35, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, v9, v36);
    if (!v37)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.26();
      }
      goto LABEL_245;
    }
    v39 = v37;
    if ((a4 & 0x20) != 0)
    {
      LODWORD(v38) = 1.0;
      -[VCVideoRule setFPref:](v37, "setFPref:", v38);
    }
    objc_msgSend(v7, "addObject:", v39);

  }
  if ((a3 & 0x40) != 0)
  {
    v40 = [VCVideoRule alloc];
    LODWORD(v41) = 30.0;
    v42 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v40, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, v9, v41);
    if (!v42)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.25();
      }
      goto LABEL_245;
    }
    v44 = v42;
    if ((a4 & 0x40) != 0)
    {
      LODWORD(v43) = 1.0;
      -[VCVideoRule setFPref:](v42, "setFPref:", v43);
    }
    objc_msgSend(v7, "addObject:", v44);

  }
  if ((a3 & 0x80) != 0)
  {
    v45 = [VCVideoRule alloc];
    LODWORD(v46) = 15.0;
    v47 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v45, "initWithFrameWidth:frameHeight:frameRate:payload:", 640, 480, v9, v46);
    if (!v47)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.24();
      }
      goto LABEL_245;
    }
    v49 = v47;
    if ((a4 & 0x80) != 0)
    {
      LODWORD(v48) = 1.0;
      -[VCVideoRule setFPref:](v47, "setFPref:", v48);
    }
    objc_msgSend(v7, "addObject:", v49);

  }
  if ((a3 & 0x100) != 0)
  {
    v50 = [VCVideoRule alloc];
    LODWORD(v51) = 30.0;
    v52 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v50, "initWithFrameWidth:frameHeight:frameRate:payload:", 640, 480, v9, v51);
    if (!v52)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.23();
      }
      goto LABEL_245;
    }
    v54 = v52;
    if ((a4 & 0x100) != 0)
    {
      LODWORD(v53) = 1.0;
      -[VCVideoRule setFPref:](v52, "setFPref:", v53);
    }
    objc_msgSend(v7, "addObject:", v54);

  }
  if ((a3 & 0x200) != 0)
  {
    v55 = [VCVideoRule alloc];
    LODWORD(v56) = 15.0;
    v57 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v55, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, v9, v56);
    if (!v57)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.22();
      }
      goto LABEL_245;
    }
    v59 = v57;
    if ((a4 & 0x200) != 0)
    {
      LODWORD(v58) = 1.0;
      -[VCVideoRule setFPref:](v57, "setFPref:", v58);
    }
    objc_msgSend(v7, "addObject:", v59);

  }
  if ((a3 & 0x400) != 0)
  {
    v60 = [VCVideoRule alloc];
    LODWORD(v61) = 30.0;
    v62 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v60, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, v9, v61);
    if (!v62)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.21();
      }
      goto LABEL_245;
    }
    v64 = v62;
    if ((a4 & 0x400) != 0)
    {
      LODWORD(v63) = 1.0;
      -[VCVideoRule setFPref:](v62, "setFPref:", v63);
    }
    objc_msgSend(v7, "addObject:", v64);

  }
  if ((a3 & 0x800) != 0)
  {
    v65 = [VCVideoRule alloc];
    LODWORD(v66) = 15.0;
    v67 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v65, "initWithFrameWidth:frameHeight:frameRate:payload:", 896, 672, v9, v66);
    if (!v67)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.20();
      }
      goto LABEL_245;
    }
    v69 = v67;
    if ((a4 & 0x800) != 0)
    {
      LODWORD(v68) = 1.0;
      -[VCVideoRule setFPref:](v67, "setFPref:", v68);
    }
    objc_msgSend(v7, "addObject:", v69);

  }
  if ((a3 & 0x1000) != 0)
  {
    v70 = [VCVideoRule alloc];
    LODWORD(v71) = 30.0;
    v72 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v70, "initWithFrameWidth:frameHeight:frameRate:payload:", 896, 672, v9, v71);
    if (!v72)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.19();
      }
      goto LABEL_245;
    }
    v74 = v72;
    if ((a4 & 0x1000) != 0)
    {
      LODWORD(v73) = 1.0;
      -[VCVideoRule setFPref:](v72, "setFPref:", v73);
    }
    objc_msgSend(v7, "addObject:", v74);

  }
  if ((a3 & 0x2000) != 0)
  {
    v75 = [VCVideoRule alloc];
    LODWORD(v76) = 1114636288;
    v77 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v75, "initWithFrameWidth:frameHeight:frameRate:payload:", 896, 672, v9, v76);
    if (!v77)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.18();
      }
      goto LABEL_245;
    }
    v79 = v77;
    if ((a4 & 0x2000) != 0)
    {
      LODWORD(v78) = 1.0;
      -[VCVideoRule setFPref:](v77, "setFPref:", v78);
    }
    objc_msgSend(v7, "addObject:", v79);

  }
  if ((a3 & 0x4000) != 0)
  {
    v80 = [VCVideoRule alloc];
    LODWORD(v81) = 15.0;
    v82 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v80, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 576, v9, v81);
    if (!v82)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.17();
      }
      goto LABEL_245;
    }
    v84 = v82;
    if ((a4 & 0x4000) != 0)
    {
      LODWORD(v83) = 1.0;
      -[VCVideoRule setFPref:](v82, "setFPref:", v83);
    }
    objc_msgSend(v7, "addObject:", v84);

  }
  if ((a3 & 0x8000) != 0)
  {
    v85 = [VCVideoRule alloc];
    LODWORD(v86) = 15.0;
    v87 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v85, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, v9, v86);
    if (!v87)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.16();
      }
      goto LABEL_245;
    }
    v89 = v87;
    if ((a4 & 0x8000) != 0)
    {
      LODWORD(v88) = 1.0;
      -[VCVideoRule setFPref:](v87, "setFPref:", v88);
    }
    objc_msgSend(v7, "addObject:", v89);

  }
  if ((a3 & 0x10000) != 0)
  {
    v90 = [VCVideoRule alloc];
    LODWORD(v91) = 30.0;
    v92 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v90, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, v9, v91);
    if (!v92)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.15();
      }
      goto LABEL_245;
    }
    v94 = v92;
    if ((a4 & 0x10000) != 0)
    {
      LODWORD(v93) = 1.0;
      -[VCVideoRule setFPref:](v92, "setFPref:", v93);
    }
    objc_msgSend(v7, "addObject:", v94);

  }
  if ((a3 & 0x20000) != 0)
  {
    v95 = [VCVideoRule alloc];
    LODWORD(v96) = 1114636288;
    v97 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v95, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, v9, v96);
    if (!v97)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.14();
      }
      goto LABEL_245;
    }
    v99 = v97;
    if ((a4 & 0x20000) != 0)
    {
      LODWORD(v98) = 1.0;
      -[VCVideoRule setFPref:](v97, "setFPref:", v98);
    }
    objc_msgSend(v7, "addObject:", v99);

  }
  if ((a3 & 0x40000) != 0)
  {
    v100 = [VCVideoRule alloc];
    LODWORD(v101) = 15.0;
    v102 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v100, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, v9, v101);
    if (!v102)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.13();
      }
      goto LABEL_245;
    }
    v104 = v102;
    if ((a4 & 0x40000) != 0)
    {
      LODWORD(v103) = 1.0;
      -[VCVideoRule setFPref:](v102, "setFPref:", v103);
    }
    objc_msgSend(v7, "addObject:", v104);

  }
  if ((a3 & 0x80000) != 0)
  {
    v105 = [VCVideoRule alloc];
    LODWORD(v106) = 30.0;
    v107 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v105, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 576, v9, v106);
    if (!v107)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.12();
      }
      goto LABEL_245;
    }
    v109 = v107;
    if ((a4 & 0x80000) != 0)
    {
      LODWORD(v108) = 1.0;
      -[VCVideoRule setFPref:](v107, "setFPref:", v108);
    }
    objc_msgSend(v7, "addObject:", v109);

  }
  if ((a3 & 0x100000) != 0)
  {
    v110 = [VCVideoRule alloc];
    LODWORD(v111) = 30.0;
    v112 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v110, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, v9, v111);
    if (!v112)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.11();
      }
      goto LABEL_245;
    }
    v114 = v112;
    if ((a4 & 0x100000) != 0)
    {
      LODWORD(v113) = 1.0;
      -[VCVideoRule setFPref:](v112, "setFPref:", v113);
    }
    objc_msgSend(v7, "addObject:", v114);

  }
  if ((a3 & 0x200000) != 0)
  {
    v115 = [VCVideoRule alloc];
    LODWORD(v116) = 1114636288;
    v117 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v115, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, v9, v116);
    if (!v117)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.10();
      }
      goto LABEL_245;
    }
    v119 = v117;
    if ((a4 & 0x200000) != 0)
    {
      LODWORD(v118) = 1.0;
      -[VCVideoRule setFPref:](v117, "setFPref:", v118);
    }
    objc_msgSend(v7, "addObject:", v119);

  }
  if ((a3 & 0x400000) != 0)
  {
    v120 = [VCVideoRule alloc];
    LODWORD(v121) = 30.0;
    v122 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v120, "initWithFrameWidth:frameHeight:frameRate:payload:", 1440, 1080, v9, v121);
    if (!v122)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.9();
      }
      goto LABEL_245;
    }
    v124 = v122;
    if ((a4 & 0x400000) != 0)
    {
      LODWORD(v123) = 1.0;
      -[VCVideoRule setFPref:](v122, "setFPref:", v123);
    }
    objc_msgSend(v7, "addObject:", v124);

  }
  if ((a3 & 0x800000) != 0)
  {
    v125 = [VCVideoRule alloc];
    LODWORD(v126) = 30.0;
    v127 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v125, "initWithFrameWidth:frameHeight:frameRate:payload:", 1664, 1248, v9, v126);
    if (!v127)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.8();
      }
      goto LABEL_245;
    }
    v129 = v127;
    if ((a4 & 0x800000) != 0)
    {
      LODWORD(v128) = 1.0;
      -[VCVideoRule setFPref:](v127, "setFPref:", v128);
    }
    objc_msgSend(v7, "addObject:", v129);

  }
  if ((a3 & 0x1000000) != 0)
  {
    v130 = [VCVideoRule alloc];
    LODWORD(v131) = 1114636288;
    v132 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v130, "initWithFrameWidth:frameHeight:frameRate:payload:", 1664, 1248, v9, v131);
    if (!v132)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.7();
      }
      goto LABEL_245;
    }
    v134 = v132;
    if ((a4 & 0x1000000) != 0)
    {
      LODWORD(v133) = 1.0;
      -[VCVideoRule setFPref:](v132, "setFPref:", v133);
    }
    objc_msgSend(v7, "addObject:", v134);

  }
  if ((a3 & 0x2000000) != 0)
  {
    v135 = [VCVideoRule alloc];
    LODWORD(v136) = 30.0;
    v137 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v135, "initWithFrameWidth:frameHeight:frameRate:payload:", 1920, 1080, v9, v136);
    if (!v137)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.6();
      }
      goto LABEL_245;
    }
    v139 = v137;
    if ((a4 & 0x2000000) != 0)
    {
      LODWORD(v138) = 1.0;
      -[VCVideoRule setFPref:](v137, "setFPref:", v138);
    }
    objc_msgSend(v7, "addObject:", v139);

  }
  if ((a3 & 0x4000000) != 0)
  {
    v140 = [VCVideoRule alloc];
    LODWORD(v141) = 1114636288;
    v142 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v140, "initWithFrameWidth:frameHeight:frameRate:payload:", 1920, 1080, v9, v141);
    if (!v142)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.5();
      }
      goto LABEL_245;
    }
    v144 = v142;
    if ((a4 & 0x4000000) != 0)
    {
      LODWORD(v143) = 1.0;
      -[VCVideoRule setFPref:](v142, "setFPref:", v143);
    }
    objc_msgSend(v7, "addObject:", v144);

  }
  if ((a3 & 0x10000000) != 0)
  {
    v145 = [VCVideoRule alloc];
    LODWORD(v146) = 30.0;
    v147 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v145, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v9, v146);
    if (!v147)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.4();
      }
      goto LABEL_245;
    }
    v149 = v147;
    if ((a4 & 0x10000000) != 0)
    {
      LODWORD(v148) = 1.0;
      -[VCVideoRule setFPref:](v147, "setFPref:", v148);
    }
    objc_msgSend(v7, "addObject:", v149);

  }
  if ((a3 & 0x8000000) == 0)
    goto LABEL_148;
  v150 = [VCVideoRule alloc];
  LODWORD(v151) = 1114636288;
  v152 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v150, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v9, v151);
  if (!v152)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.3();
    }
LABEL_245:

    v7 = 0;
    goto LABEL_148;
  }
  v154 = v152;
  if ((a4 & 0x8000000) != 0)
  {
    LODWORD(v153) = 1.0;
    -[VCVideoRule setFPref:](v152, "setFPref:", v153);
  }
  objc_msgSend(v7, "addObject:", v154);

LABEL_148:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v155 = VRTraceErrorLogLevelToCSTR();
    v156 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v162 = 136316162;
      v163 = v155;
      v164 = 2080;
      v165 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]";
      v166 = 1024;
      v167 = 131;
      v168 = 1024;
      v169 = a4;
      v170 = 2112;
      v171 = v7;
      _os_log_impl(&dword_1D8A54000, v156, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preferredBitmap=0x%x, videoRules=%@", (uint8_t *)&v162, 0x2Cu);
    }
  }
  return v7;
}

- (unsigned)videoParameterSupport
{
  return -[VCMediaNegotiationBlobV2VideoPayload parameterSet](self, "parameterSet") & 0xF;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  double v18;
  const char *v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  double v30;
  const char *v31;
  float v32;
  unsigned int v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  VCMediaNegotiationBlobV2VideoPayload *v47;
  NSArray *obj;
  NSArray *obja;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2VideoPayload data](self, "data"), "length"), a4);
  v6 = -[VCMediaNegotiationBlobV2VideoPayload videoPayload](self, "videoPayload");
  if ((v6 - 1) >= 3)
    v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
  else
    v7 = off_1E9E56278[(int)v6 - 1];
  objc_msgSend(v5, "appendFormat:", CFSTR("Payload=%@"), v7);
  if (-[VCMediaNegotiationBlobV2VideoPayload hasEncodeDecodeFeatures](self, "hasEncodeDecodeFeatures"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" encodeDecodeFeatures=%@"), -[VCMediaNegotiationBlobV2VideoPayload encodeDecodeFeatures](self, "encodeDecodeFeatures"));
  objc_msgSend(v5, "appendFormat:", CFSTR(" Encode=["));
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v47 = self;
  obj = -[VCMediaNegotiationBlobV2VideoPayload encodeVideoRules](self, "encodeVideoRules");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
  v9 = v5;
  if (v8)
  {
    v10 = v8;
    v11 = &stru_1E9E58EE0;
    v12 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v65 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "iWidth");
        v16 = objc_msgSend(v14, "iHeight");
        objc_msgSend(v14, "fRate");
        v18 = v17;
        objc_msgSend(v14, "fPref");
        v19 = "";
        if (v20 == 1.0)
          v19 = "(Pref)";
        v5 = v9;
        objc_msgSend(v9, "appendFormat:", CFSTR("%@%dx%d@%.0f%s"), v11, v15, v16, *(_QWORD *)&v18, v19);
        v11 = CFSTR(", ");
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
      v11 = CFSTR(", ");
    }
    while (v10);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("] Decode=["));
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = -[VCMediaNegotiationBlobV2VideoPayload decodeVideoRules](v47, "decodeVideoRules");
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
  if (v21)
  {
    v22 = v21;
    v23 = &stru_1E9E58EE0;
    v24 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v60 != v24)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        v27 = objc_msgSend(v26, "iWidth");
        v28 = objc_msgSend(v26, "iHeight");
        objc_msgSend(v26, "fRate");
        v30 = v29;
        objc_msgSend(v26, "fPref");
        v31 = "";
        if (v32 == 1.0)
          v31 = "(Pref)";
        v5 = v9;
        objc_msgSend(v9, "appendFormat:", CFSTR("%@%dx%d@%.0f%s"), v23, v27, v28, *(_QWORD *)&v30, v31);
        v23 = CFSTR(", ");
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      v23 = CFSTR(", ");
    }
    while (v22);
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("]"));
  v33 = -[VCMediaNegotiationBlobV2VideoPayload parameterSet](v47, "parameterSet");
  objc_msgSend(v5, "appendFormat:", CFSTR(" paramSet=["));
  if ((v33 & 0xF) != 0)
  {
    v34 = &stru_1E9E58EE0;
    v35 = 1;
    do
    {
      if ((v35 & v33) != 0)
      {
        v36 = CFSTR("ImageDescription");
        switch((int)v35)
        {
          case 1:
            break;
          case 2:
            v36 = CFSTR("SPS");
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_31;
          case 4:
            v36 = CFSTR("PPS");
            break;
          case 8:
            v36 = CFSTR("VPS");
            break;
          default:
            if ((_DWORD)v35 == 15)
              v36 = CFSTR("SupportedMask");
            else
LABEL_31:
              v36 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
            break;
        }
        objc_msgSend(v9, "appendFormat:", CFSTR("%@%@"), v34, v36);
        v34 = CFSTR(", ");
      }
      v33 &= ~(_DWORD)v35;
      v35 = (2 * v35);
    }
    while ((v33 & 0xF) != 0);
  }
  objc_msgSend(v9, "appendString:", CFSTR("]"));
  v37 = objc_msgSend(v9, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v38, v39, v40, v41, v42, v43, v37);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v51 = v44;
      v52 = 2080;
      v53 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) printWithLogFile:prefix:]";
      v54 = 1024;
      v55 = 187;
      v56 = 2112;
      v57 = v9;
      _os_log_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (int)payloadWithRTPPayload:(int)a3
{
  int result;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 123)
    return 1;
  if (a3 == 100)
    return 2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v8 = 136315906;
    v9 = v5;
    v10 = 2080;
    v11 = "+[VCMediaNegotiationBlobV2VideoPayload(Utils) payloadWithRTPPayload:]";
    v12 = 1024;
    v13 = 199;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown video payload (payload=%d)", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (int)rtpPayloadWithPayload:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
    return 100;
  if (a3 == 1)
    return 123;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "+[VCMediaNegotiationBlobV2VideoPayload(Utils) rtpPayloadWithPayload:]";
      v11 = 1024;
      v12 = 211;
      v13 = 1024;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown video payload (%d)", (uint8_t *)&v7, 0x22u);
    }
  }
  return 128;
}

- (BOOL)setupEncode:(BOOL)a3 videoRules:(id)a4
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  _BOOL4 v72;
  uint64_t v73;
  NSObject *v74;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v5 = a3;
  v81 = *MEMORY[0x1E0C80C00];
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
  if (v7)
  {
    v8 = v7;
    LODWORD(v9) = 0;
    v10 = 0;
    v11 = *(_QWORD *)v78;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v78 != v11)
        objc_enumerationMutation(a4);
      v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v12);
      if (objc_msgSend(v13, "iWidth") == 192
        && objc_msgSend(v13, "iHeight") == 112
        && (objc_msgSend(v13, "fRate"), v14 == 15.0))
      {
        v9 = v9 | 1;
        objc_msgSend(v13, "fPref");
        if (v15 == 1.0)
          v10 = v10 | 1;
      }
      else if (objc_msgSend(v13, "iWidth") == 320
             && objc_msgSend(v13, "iHeight") == 240
             && (objc_msgSend(v13, "fRate"), v16 == 15.0))
      {
        v9 = v9 | 2;
        objc_msgSend(v13, "fPref");
        if (v17 == 1.0)
          v10 = v10 | 2;
      }
      else if (objc_msgSend(v13, "iWidth") == 320
             && objc_msgSend(v13, "iHeight") == 240
             && (objc_msgSend(v13, "fRate"), v18 == 30.0))
      {
        v9 = v9 | 4;
        objc_msgSend(v13, "fPref");
        if (v19 == 1.0)
          v10 = v10 | 4;
      }
      else if (objc_msgSend(v13, "iWidth") == 480
             && objc_msgSend(v13, "iHeight") == 272
             && (objc_msgSend(v13, "fRate"), v20 == 15.0))
      {
        v9 = v9 | 8;
        objc_msgSend(v13, "fPref");
        if (v21 == 1.0)
          v10 = v10 | 8;
      }
      else if (objc_msgSend(v13, "iWidth") == 480
             && objc_msgSend(v13, "iHeight") == 272
             && (objc_msgSend(v13, "fRate"), v22 == 30.0))
      {
        v9 = v9 | 0x10;
        objc_msgSend(v13, "fPref");
        if (v23 == 1.0)
          v10 = v10 | 0x10;
      }
      else if (objc_msgSend(v13, "iWidth") == 480
             && objc_msgSend(v13, "iHeight") == 368
             && (objc_msgSend(v13, "fRate"), v24 == 15.0))
      {
        v9 = v9 | 0x20;
        objc_msgSend(v13, "fPref");
        if (v25 == 1.0)
          v10 = v10 | 0x20;
      }
      else if (objc_msgSend(v13, "iWidth") == 480
             && objc_msgSend(v13, "iHeight") == 368
             && (objc_msgSend(v13, "fRate"), v26 == 30.0))
      {
        v9 = v9 | 0x40;
        objc_msgSend(v13, "fPref");
        if (v27 == 1.0)
          v10 = v10 | 0x40;
      }
      else if (objc_msgSend(v13, "iWidth") == 640
             && objc_msgSend(v13, "iHeight") == 480
             && (objc_msgSend(v13, "fRate"), v28 == 15.0))
      {
        v9 = v9 | 0x80;
        objc_msgSend(v13, "fPref");
        if (v29 == 1.0)
          v10 = v10 | 0x80;
      }
      else if (objc_msgSend(v13, "iWidth") == 640
             && objc_msgSend(v13, "iHeight") == 480
             && (objc_msgSend(v13, "fRate"), v30 == 30.0))
      {
        v9 = v9 | 0x100;
        objc_msgSend(v13, "fPref");
        if (v31 == 1.0)
          v10 = v10 | 0x100;
      }
      else if (objc_msgSend(v13, "iWidth") == 848
             && objc_msgSend(v13, "iHeight") == 480
             && (objc_msgSend(v13, "fRate"), v32 == 15.0))
      {
        v9 = v9 | 0x200;
        objc_msgSend(v13, "fPref");
        if (v33 == 1.0)
          v10 = v10 | 0x200;
      }
      else if (objc_msgSend(v13, "iWidth") == 848
             && objc_msgSend(v13, "iHeight") == 480
             && (objc_msgSend(v13, "fRate"), v34 == 30.0))
      {
        v9 = v9 | 0x400;
        objc_msgSend(v13, "fPref");
        if (v35 == 1.0)
          v10 = v10 | 0x400;
      }
      else if (objc_msgSend(v13, "iWidth") == 896
             && objc_msgSend(v13, "iHeight") == 672
             && (objc_msgSend(v13, "fRate"), v36 == 15.0))
      {
        v9 = v9 | 0x800;
        objc_msgSend(v13, "fPref");
        if (v37 == 1.0)
          v10 = v10 | 0x800;
      }
      else if (objc_msgSend(v13, "iWidth") == 896
             && objc_msgSend(v13, "iHeight") == 672
             && (objc_msgSend(v13, "fRate"), v38 == 30.0))
      {
        v9 = v9 | 0x1000;
        objc_msgSend(v13, "fPref");
        if (v39 == 1.0)
          v10 = v10 | 0x1000;
      }
      else if (objc_msgSend(v13, "iWidth") == 896
             && objc_msgSend(v13, "iHeight") == 672
             && (objc_msgSend(v13, "fRate"), v40 == 60.0))
      {
        v9 = v9 | 0x2000;
        objc_msgSend(v13, "fPref");
        if (v41 == 1.0)
          v10 = v10 | 0x2000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1024
             && objc_msgSend(v13, "iHeight") == 576
             && (objc_msgSend(v13, "fRate"), v42 == 15.0))
      {
        v9 = v9 | 0x4000;
        objc_msgSend(v13, "fPref");
        if (v43 == 1.0)
          v10 = v10 | 0x4000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1024
             && objc_msgSend(v13, "iHeight") == 768
             && (objc_msgSend(v13, "fRate"), v44 == 15.0))
      {
        v9 = v9 | 0x8000;
        objc_msgSend(v13, "fPref");
        if (v45 == 1.0)
          v10 = v10 | 0x8000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1024
             && objc_msgSend(v13, "iHeight") == 768
             && (objc_msgSend(v13, "fRate"), v46 == 30.0))
      {
        v9 = v9 | 0x10000;
        objc_msgSend(v13, "fPref");
        if (v47 == 1.0)
          v10 = v10 | 0x10000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1024
             && objc_msgSend(v13, "iHeight") == 768
             && (objc_msgSend(v13, "fRate"), v48 == 60.0))
      {
        v9 = v9 | 0x20000;
        objc_msgSend(v13, "fPref");
        if (v49 == 1.0)
          v10 = v10 | 0x20000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1280
             && objc_msgSend(v13, "iHeight") == 720
             && (objc_msgSend(v13, "fRate"), v50 == 15.0))
      {
        v9 = v9 | 0x40000;
        objc_msgSend(v13, "fPref");
        if (v51 == 1.0)
          v10 = v10 | 0x40000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1024
             && objc_msgSend(v13, "iHeight") == 576
             && (objc_msgSend(v13, "fRate"), v52 == 30.0))
      {
        v9 = v9 | 0x80000;
        objc_msgSend(v13, "fPref");
        if (v53 == 1.0)
          v10 = v10 | 0x80000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1280
             && objc_msgSend(v13, "iHeight") == 720
             && (objc_msgSend(v13, "fRate"), v54 == 30.0))
      {
        v9 = v9 | 0x100000;
        objc_msgSend(v13, "fPref");
        if (v55 == 1.0)
          v10 = v10 | 0x100000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1280
             && objc_msgSend(v13, "iHeight") == 720
             && (objc_msgSend(v13, "fRate"), v56 == 60.0))
      {
        v9 = v9 | 0x200000;
        objc_msgSend(v13, "fPref");
        if (v57 == 1.0)
          v10 = v10 | 0x200000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1440
             && objc_msgSend(v13, "iHeight") == 1080
             && (objc_msgSend(v13, "fRate"), v58 == 30.0))
      {
        v9 = v9 | 0x400000;
        objc_msgSend(v13, "fPref");
        if (v59 == 1.0)
          v10 = v10 | 0x400000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1664
             && objc_msgSend(v13, "iHeight") == 1248
             && (objc_msgSend(v13, "fRate"), v60 == 30.0))
      {
        v9 = v9 | 0x800000;
        objc_msgSend(v13, "fPref");
        if (v61 == 1.0)
          v10 = v10 | 0x800000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1664
             && objc_msgSend(v13, "iHeight") == 1248
             && (objc_msgSend(v13, "fRate"), v62 == 60.0))
      {
        v9 = v9 | 0x1000000;
        objc_msgSend(v13, "fPref");
        if (v63 == 1.0)
          v10 = v10 | 0x1000000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1920
             && objc_msgSend(v13, "iHeight") == 1080
             && (objc_msgSend(v13, "fRate"), v64 == 30.0))
      {
        v9 = v9 | 0x2000000;
        objc_msgSend(v13, "fPref");
        if (v65 == 1.0)
          v10 = v10 | 0x2000000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1920
             && objc_msgSend(v13, "iHeight") == 1080
             && (objc_msgSend(v13, "fRate"), v66 == 60.0))
      {
        v9 = v9 | 0x4000000;
        objc_msgSend(v13, "fPref");
        if (v67 == 1.0)
          v10 = v10 | 0x4000000;
      }
      else if (objc_msgSend(v13, "iWidth") == 1088
             && objc_msgSend(v13, "iHeight") == 1088
             && (objc_msgSend(v13, "fRate"), v68 == 30.0))
      {
        v9 = v9 | 0x10000000;
        objc_msgSend(v13, "fPref");
        if (v69 == 1.0)
          v10 = v10 | 0x10000000;
      }
      else
      {
        if (objc_msgSend(v13, "iWidth") != 1088
          || objc_msgSend(v13, "iHeight") != 1088
          || (objc_msgSend(v13, "fRate"), v70 != 60.0))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v73 = VRTraceErrorLogLevelToCSTR();
            v74 = *MEMORY[0x1E0CF2758];
            v72 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v72)
              return v72;
            -[VCMediaNegotiationBlobV2VideoPayload(Utils) setupEncode:videoRules:].cold.1(v73, v13, v74);
          }
          LOBYTE(v72) = 0;
          return v72;
        }
        v9 = v9 | 0x8000000;
        objc_msgSend(v13, "fPref");
        if (v71 == 1.0)
          v10 = v10 | 0x8000000;
      }
      if (v8 == ++v12)
      {
        v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_155;
      }
    }
  }
  v9 = 0;
  v10 = 0;
LABEL_155:
  if (v5)
  {
    if (-[VCMediaNegotiationBlobV2VideoPayload encodeFormats](self, "encodeFormats") != (_DWORD)v9)
      -[VCMediaNegotiationBlobV2VideoPayload setEncodeFormats:](self, "setEncodeFormats:", v9);
  }
  else
  {
    if (-[VCMediaNegotiationBlobV2VideoPayload decodeFormats](self, "decodeFormats") != (_DWORD)v9)
      -[VCMediaNegotiationBlobV2VideoPayload setDecodeFormats:](self, "setDecodeFormats:", v9);
    -[VCMediaNegotiationBlobV2VideoPayload setPreferredDecodeFormat:](self, "setPreferredDecodeFormat:", v10);
  }
  LOBYTE(v72) = 1;
  return v72;
}

- (void)setupVideoParameterSupport:(unsigned int)a3
{
  uint64_t v4;

  v4 = a3 & 0xF;
  if ((_DWORD)v4 != -[VCMediaNegotiationBlobV2VideoPayload parameterSet](self, "parameterSet"))
    -[VCMediaNegotiationBlobV2VideoPayload setParameterSet:](self, "setParameterSet:", v4);
}

@end
