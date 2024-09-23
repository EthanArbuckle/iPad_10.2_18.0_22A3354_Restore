@implementation VCMediaNegotiationBlobV2CodecFeatures

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2CodecFeatures setVideoFeatures:](self, "setVideoFeatures:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CodecFeatures;
  -[VCMediaNegotiationBlobV2CodecFeatures dealloc](&v3, sel_dealloc);
}

- (unsigned)audioFeatures
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_audioFeatures;
  else
    return 0;
}

- (void)setAudioFeatures:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioFeatures = a3;
}

- (void)setHasAudioFeatures:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioFeatures
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasVideoFeatures
{
  return self->_videoFeatures != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CodecFeatures;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2CodecFeatures description](&v3, sel_description), -[VCMediaNegotiationBlobV2CodecFeatures dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *videoFeatures;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_audioFeatures), CFSTR("audioFeatures"));
  videoFeatures = self->_videoFeatures;
  if (videoFeatures)
    objc_msgSend(v3, "setObject:forKey:", videoFeatures, CFSTR("videoFeatures"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2CodecFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_videoFeatures)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  NSData *videoFeatures;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_audioFeatures;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  videoFeatures = self->_videoFeatures;
  if (videoFeatures)
    objc_msgSend(a3, "setVideoFeatures:", videoFeatures);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_audioFeatures;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  v6[2] = -[NSData copyWithZone:](self->_videoFeatures, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *videoFeatures;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_audioFeatures != *((_DWORD *)a3 + 2))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    videoFeatures = self->_videoFeatures;
    if ((unint64_t)videoFeatures | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSData isEqual:](videoFeatures, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_audioFeatures;
  else
    v2 = 0;
  return -[NSData hash](self->_videoFeatures, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_audioFeatures = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[VCMediaNegotiationBlobV2CodecFeatures setVideoFeatures:](self, "setVideoFeatures:");
}

- (NSData)videoFeatures
{
  return self->_videoFeatures;
}

- (void)setVideoFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCMediaNegotiationBlobV2CodecFeatures)initWithAllowAudioRecording:(BOOL)a3 videoFeatures:(id)a4
{
  _BOOL8 v5;
  VCMediaNegotiationBlobV2CodecFeatures *v6;
  VCMediaNegotiationBlobV2CodecFeatures *v7;

  v5 = a3;
  v6 = -[VCMediaNegotiationBlobV2CodecFeatures init](self, "init");
  v7 = v6;
  if (v6)
  {
    if (-[VCMediaNegotiationBlobV2CodecFeatures audioFeatures](v6, "audioFeatures") != v5)
      -[VCMediaNegotiationBlobV2CodecFeatures setAudioFeatures:](v7, "setAudioFeatures:", v5);
    if (!-[VCMediaNegotiationBlobV2CodecFeatures videoFeatures](v7, "videoFeatures")
      || (objc_msgSend(a4, "isEqualToData:", -[VCMediaNegotiationBlobV2CodecFeatures videoFeatures](v7, "videoFeatures")) & 1) == 0)
    {
      -[VCMediaNegotiationBlobV2CodecFeatures setVideoFeatures:](v7, "setVideoFeatures:", a4);
    }
  }
  return v7;
}

- (BOOL)allowAudioRecording
{
  return -[VCMediaNegotiationBlobV2CodecFeatures audioFeatures](self, "audioFeatures") & 1;
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
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2CodecFeatures data](self, "data"), "length"), a4);
  objc_msgSend(v6, "appendFormat:", CFSTR("Codec Featues: allowAudioRecording=%d videoFeatures=%@"), -[VCMediaNegotiationBlobV2CodecFeatures allowAudioRecording](self, "allowAudioRecording"), -[VCMediaNegotiationBlobV2CodecFeatures videoFeatures](self, "videoFeatures"));
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
      v19 = "-[VCMediaNegotiationBlobV2CodecFeatures(Utils) printWithLogFile:prefix:]";
      v20 = 1024;
      v21 = 36;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

@end
