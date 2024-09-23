@implementation VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures

- (VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures)initWithPayload:(id)a3 encodeDecodeFeatures:(id)a4
{
  VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *v6;
  VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *v7;

  v6 = -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures init](self, "init");
  v7 = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:].cold.1();
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:].cold.2();
    }
    goto LABEL_15;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:].cold.3();
    }
LABEL_15:

    return 0;
  }
  -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setEncodeDecodeFeatures:](v6, "setEncodeDecodeFeatures:", a4);
  -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setRtpPayload:](v7, "setRtpPayload:", objc_msgSend(a3, "intValue"));
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures;
  -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures dealloc](&v3, sel_dealloc);
}

- (void)setRtpPayload:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rtpPayload = a3;
}

- (void)setHasRtpPayload:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRtpPayload
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncodeDecodeFeatures
{
  return self->_encodeDecodeFeatures != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *encodeDecodeFeatures;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpPayload), CFSTR("rtpPayload"));
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures)
    objc_msgSend(v3, "setObject:forKey:", encodeDecodeFeatures, CFSTR("encodeDecodeFeatures"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_encodeDecodeFeatures)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  NSData *encodeDecodeFeatures;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_rtpPayload;
    *((_BYTE *)a3 + 20) |= 1u;
  }
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures)
    objc_msgSend(a3, "setEncodeDecodeFeatures:", encodeDecodeFeatures);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_rtpPayload;
    *(_BYTE *)(v5 + 20) |= 1u;
  }

  v6[1] = -[NSData copyWithZone:](self->_encodeDecodeFeatures, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *encodeDecodeFeatures;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_rtpPayload != *((_DWORD *)a3 + 4))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    if ((unint64_t)encodeDecodeFeatures | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSData isEqual:](encodeDecodeFeatures, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_rtpPayload;
  else
    v2 = 0;
  return -[NSData hash](self->_encodeDecodeFeatures, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_rtpPayload = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 1))
    -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:");
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (NSData)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
