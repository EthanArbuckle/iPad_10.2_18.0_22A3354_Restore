@implementation VCMediaNegotiationBlobMultiwayVideoStream

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxNetworkBitrate = a3;
}

- (void)setHasMaxNetworkBitrate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxNetworkBitrate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMetadata:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_metadata = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetadata
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxMediaBitrate = a3;
}

- (void)setHasMaxMediaBitrate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxMediaBitrate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMaxPacketsPerSecond:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxPacketsPerSecond = a3;
}

- (void)setHasMaxPacketsPerSecond:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxPacketsPerSecond
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRepairedStreamID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_repairedStreamID = a3;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRepairedStreamID
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMultiwayVideoStream;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobMultiwayVideoStream description](&v3, sel_description), -[VCMediaNegotiationBlobMultiwayVideoStream dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssrc), CFSTR("ssrc"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxNetworkBitrate), CFSTR("maxNetworkBitrate"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payload), CFSTR("payload"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_streamID), CFSTR("streamID"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metadata), CFSTR("metadata"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qualityIndex), CFSTR("qualityIndex"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedVideoFormats), CFSTR("supportedVideoFormats"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_frameRate), CFSTR("frameRate"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_keyFrameInterval), CFSTR("keyFrameInterval"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxMediaBitrate), CFSTR("maxMediaBitrate"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedStreamID), CFSTR("repairedStreamID"));
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxPacketsPerSecond), CFSTR("maxPacketsPerSecond"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 0x10) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), CFSTR("repairedMaxNetworkBitrate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMultiwayVideoStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 12) = self->_ssrc;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_maxNetworkBitrate;
    *((_BYTE *)a3 + 60) |= 2u;
  }
  *((_DWORD *)a3 + 8) = self->_payload;
  *((_DWORD *)a3 + 13) = self->_streamID;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_metadata;
    *((_BYTE *)a3 + 60) |= 8u;
  }
  *((_DWORD *)a3 + 9) = self->_qualityIndex;
  *((_DWORD *)a3 + 14) = self->_supportedVideoFormats;
  *((_DWORD *)a3 + 2) = self->_frameRate;
  *((_DWORD *)a3 + 3) = self->_keyFrameInterval;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_maxMediaBitrate;
    *((_BYTE *)a3 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 6) = self->_maxPacketsPerSecond;
  *((_BYTE *)a3 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_repairedMaxNetworkBitrate;
    *((_BYTE *)a3 + 60) |= 0x10u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 11) = self->_repairedStreamID;
  *((_BYTE *)a3 + 60) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 12) = self->_ssrc;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_maxNetworkBitrate;
    *((_BYTE *)result + 60) |= 2u;
  }
  *((_DWORD *)result + 8) = self->_payload;
  *((_DWORD *)result + 13) = self->_streamID;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)result + 7) = self->_metadata;
    *((_BYTE *)result + 60) |= 8u;
  }
  *((_DWORD *)result + 9) = self->_qualityIndex;
  *((_DWORD *)result + 14) = self->_supportedVideoFormats;
  *((_DWORD *)result + 2) = self->_frameRate;
  *((_DWORD *)result + 3) = self->_keyFrameInterval;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 4) = self->_maxMediaBitrate;
    *((_BYTE *)result + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 6) = self->_maxPacketsPerSecond;
  *((_BYTE *)result + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)result + 11) = self->_repairedStreamID;
  *((_BYTE *)result + 60) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 10) = self->_repairedMaxNetworkBitrate;
  *((_BYTE *)result + 60) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_ssrc != *((_DWORD *)a3 + 12))
    {
LABEL_38:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 2) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 5))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 60) & 2) != 0)
    {
      goto LABEL_38;
    }
    if (self->_payload != *((_DWORD *)a3 + 8) || self->_streamID != *((_DWORD *)a3 + 13))
      goto LABEL_38;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 8) == 0 || self->_metadata != *((_DWORD *)a3 + 7))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 60) & 8) != 0)
    {
      goto LABEL_38;
    }
    if (self->_qualityIndex != *((_DWORD *)a3 + 9)
      || self->_supportedVideoFormats != *((_DWORD *)a3 + 14)
      || self->_frameRate != *((_DWORD *)a3 + 2)
      || self->_keyFrameInterval != *((_DWORD *)a3 + 3))
    {
      goto LABEL_38;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 1) == 0 || self->_maxMediaBitrate != *((_DWORD *)a3 + 4))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 60) & 1) != 0)
    {
      goto LABEL_38;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 4) == 0 || self->_maxPacketsPerSecond != *((_DWORD *)a3 + 6))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 60) & 4) != 0)
    {
      goto LABEL_38;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 0x20) == 0 || self->_repairedStreamID != *((_DWORD *)a3 + 11))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 60) & 0x20) != 0)
    {
      goto LABEL_38;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 60) & 0x10) == 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 0x10) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 10))
        goto LABEL_38;
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_maxNetworkBitrate;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_metadata;
      goto LABEL_6;
    }
  }
  v3 = 0;
LABEL_6:
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_maxMediaBitrate;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v5 = 2654435761 * self->_maxPacketsPerSecond;
  else
    v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v6 = 2654435761 * self->_repairedStreamID;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_14;
LABEL_16:
    v7 = 0;
    return v2 ^ (2654435761 * self->_ssrc) ^ (2654435761 * self->_payload) ^ (2654435761 * self->_streamID) ^ v3 ^ (2654435761 * self->_qualityIndex) ^ (2654435761 * self->_supportedVideoFormats) ^ (2654435761 * self->_frameRate) ^ (2654435761 * self->_keyFrameInterval) ^ v4 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_14:
  v7 = 2654435761 * self->_repairedMaxNetworkBitrate;
  return v2 ^ (2654435761 * self->_ssrc) ^ (2654435761 * self->_payload) ^ (2654435761 * self->_streamID) ^ v3 ^ (2654435761 * self->_qualityIndex) ^ (2654435761 * self->_supportedVideoFormats) ^ (2654435761 * self->_frameRate) ^ (2654435761 * self->_keyFrameInterval) ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_ssrc = *((_DWORD *)a3 + 12);
  if ((*((_BYTE *)a3 + 60) & 2) != 0)
  {
    self->_maxNetworkBitrate = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  self->_payload = *((_DWORD *)a3 + 8);
  self->_streamID = *((_DWORD *)a3 + 13);
  if ((*((_BYTE *)a3 + 60) & 8) != 0)
  {
    self->_metadata = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
  self->_qualityIndex = *((_DWORD *)a3 + 9);
  self->_supportedVideoFormats = *((_DWORD *)a3 + 14);
  self->_frameRate = *((_DWORD *)a3 + 2);
  self->_keyFrameInterval = *((_DWORD *)a3 + 3);
  v3 = *((_BYTE *)a3 + 60);
  if ((v3 & 1) != 0)
  {
    self->_maxMediaBitrate = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 60);
    if ((v3 & 4) == 0)
    {
LABEL_7:
      if ((v3 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 60) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_maxPacketsPerSecond = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0)
      return;
LABEL_13:
    self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_repairedStreamID = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 60) & 0x10) != 0)
    goto LABEL_13;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)payload
{
  return self->_payload;
}

- (void)setPayload:(unsigned int)a3
{
  self->_payload = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned int)a3
{
  self->_streamID = a3;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)supportedVideoFormats
{
  return self->_supportedVideoFormats;
}

- (void)setSupportedVideoFormats:(unsigned int)a3
{
  self->_supportedVideoFormats = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (unsigned)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (VCMediaNegotiationBlobMultiwayVideoStream)initWithStreamConfig:(id)a3
{
  VCMediaNegotiationBlobMultiwayVideoStream *v4;
  double v5;
  uint64_t v6;
  double v7;
  char v8;

  v4 = -[VCMediaNegotiationBlobMultiwayVideoStream init](self, "init");
  if (v4)
  {
    v4->_ssrc = objc_msgSend(a3, "ssrc");
    v4->_maxNetworkBitrate = objc_msgSend(a3, "maxNetworkBitrate");
    *(_BYTE *)&v4->_has = *(_BYTE *)&v4->_has & 0xF8 | 2;
    if (objc_msgSend(a3, "isSubstream"))
      v4->_metadata |= 1u;
    *(_BYTE *)&v4->_has |= 8u;
    v4->_streamID = objc_msgSend(a3, "streamID");
    v4->_qualityIndex = objc_msgSend(a3, "qualityIndex");
    objc_msgSend(a3, "size");
    v6 = (int)v5;
    objc_msgSend(a3, "size");
    v4->_supportedVideoFormats = +[VCMediaNegotiationBlobMultiwayVideoStream videoFormatForWidth:height:](VCMediaNegotiationBlobMultiwayVideoStream, "videoFormatForWidth:height:", v6, (int)v7);
    v4->_frameRate = objc_msgSend(a3, "frameRate");
    v4->_keyFrameInterval = objc_msgSend(a3, "keyFrameInterval");
    if (objc_msgSend(a3, "hasRepairedStreamID"))
      v8 = 32;
    else
      v8 = 0;
    *(_BYTE *)&v4->_has = *(_BYTE *)&v4->_has & 0xDF | v8;
    v4->_repairedStreamID = objc_msgSend(a3, "repairedStreamID");
    v4->_repairedMaxNetworkBitrate = objc_msgSend(a3, "repairedMaxNetworkBitrate");
    *(_BYTE *)&v4->_has = (*(_BYTE *)&v4->_has >> 1) & 0x10 | *(_BYTE *)&v4->_has & 0xEF;
    v4->_payload = +[VCMediaNegotiationBlobMultiwayVideoStream videoPayloadForPayload:](VCMediaNegotiationBlobMultiwayVideoStream, "videoPayloadForPayload:", objc_msgSend(a3, "payload"));
  }
  return v4;
}

- (id)newMultiwayVideoStream
{
  VCMediaNegotiatorMultiwayVideoStream *v3;
  unsigned int supportedVideoFormats;
  int v5;
  int v6;

  v3 = objc_alloc_init(VCMediaNegotiatorMultiwayVideoStream);
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v3, "setSsrc:", self->_ssrc);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v3, "setMaxMediaBitrate:", self->_maxMediaBitrate);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v3, "setMaxNetworkBitrate:", self->_maxNetworkBitrate);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxPacketsPerSecond:](v3, "setMaxPacketsPerSecond:", self->_maxPacketsPerSecond);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    -[VCMediaNegotiatorMultiwayMediaStream setIsSubstream:](v3, "setIsSubstream:", self->_metadata & 1);
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v3, "setStreamID:", LOWORD(self->_streamID));
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v3, "setQualityIndex:", self->_qualityIndex);
  supportedVideoFormats = self->_supportedVideoFormats;
  if (supportedVideoFormats)
  {
    v5 = 1;
    do
    {
      v6 = v5;
      v5 *= 2;
    }
    while ((supportedVideoFormats & v6) == 0);
    +[VCMediaNegotiationBlobMultiwayVideoStream convertVideoFormat:width:height:](VCMediaNegotiationBlobMultiwayVideoStream, "convertVideoFormat:width:height:");
    -[VCMediaNegotiatorMultiwayVideoStream setSize:](v3, "setSize:", (double)-1431655766, (double)-1431655766);
  }
  -[VCMediaNegotiatorMultiwayVideoStream setPayload:](v3, "setPayload:", +[VCMediaNegotiationBlobMultiwayVideoStream payloadForVideoPayload:](VCMediaNegotiationBlobMultiwayVideoStream, "payloadForVideoPayload:", self->_payload));
  -[VCMediaNegotiatorMultiwayVideoStream setFrameRate:](v3, "setFrameRate:", self->_frameRate);
  -[VCMediaNegotiatorMultiwayVideoStream setKeyFrameInterval:](v3, "setKeyFrameInterval:", self->_keyFrameInterval);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v3, "setHasRepairedStreamID:", 1);
    -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v3, "setRepairedStreamID:", LOWORD(self->_repairedStreamID));
    -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v3, "setRepairedMaxNetworkBitrate:", self->_repairedMaxNetworkBitrate);
  }
  return v3;
}

- (BOOL)isSubStream
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_metadata & 1;
  else
    return 0;
}

- (void)printWithLogFile:(void *)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multiway Video Stream Settings: SSRC=%x maxNetworkBitrate=%d maxMediaBitrate=%d maxPacketsPerSecond=%d payload=%d streamID=%d qualityIndex=%d supportedvideoFormats=%d frameRate=%d keyFrameInterval=%u metadata=%u hasRepaired:%u repairedMaxNetworkBitrate=%d repairedStreamID=%d"), self->_ssrc, self->_maxNetworkBitrate, self->_maxMediaBitrate, self->_maxPacketsPerSecond, self->_payload, self->_streamID, self->_qualityIndex, self->_supportedVideoFormats, self->_frameRate, self->_keyFrameInterval, self->_metadata, -[VCMediaNegotiationBlobMultiwayVideoStream hasRepairedStreamID](self, "hasRepairedStreamID"), self->_repairedMaxNetworkBitrate, self->_repairedStreamID);
  v4 = objc_msgSend(v3, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v5, v6, v7, v8, v9, v10, v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCMediaNegotiationBlobMultiwayVideoStream(MultiwayVideoStream) printWithLogFile:]";
      v18 = 1024;
      v19 = 1394;
      v20 = 2080;
      v21 = objc_msgSend(v3, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s\n", buf, 0x26u);
    }
  }
}

+ (int)videoFormatForWidth:(int)a3 height:(int)a4
{
  if (a3 == 192 && a4 == 112)
    return 256;
  if (a3 == 320 && a4 == 176)
    return 1;
  if (a3 == 320 && a4 == 240)
    return 2;
  if (a3 == 480 && a4 == 272)
    return 4;
  if (a3 == 480 && a4 == 368)
    return 8;
  if (a3 == 640 && a4 == 368)
    return 16;
  if (a3 == 640 && a4 == 480)
    return 32;
  if (a3 == 1024 && a4 == 768)
    return 64;
  if (a3 == 1280 && a4 == 720)
    return 128;
  if (a3 == 192 && a4 == 192)
    return 512;
  if (a3 == 240 && a4 == 240)
    return 1024;
  if (a3 == 320 && a4 == 320)
    return 2048;
  if (a3 == 480 && a4 == 480)
    return 4096;
  if (a3 == 640 && a4 == 640)
    return 0x2000;
  if (a4 == 720 && a3 == 720)
    return 0x8000;
  else
    return 0;
}

+ (BOOL)convertVideoFormat:(int)a3 width:(int *)a4 height:(int *)a5
{
  BOOL result;
  int v6;
  int v7;

  result = 0;
  if (a3 > 255)
  {
    if (a3 <= 2047)
    {
      switch(a3)
      {
        case 256:
          v6 = 112;
          v7 = 192;
          break;
        case 512:
          v7 = 192;
          v6 = 192;
          break;
        case 1024:
          v7 = 240;
          v6 = 240;
          break;
        default:
          return result;
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000)
      {
        v7 = 640;
        v6 = 640;
      }
      else
      {
        if (a3 != 0x8000)
          return result;
        v7 = 720;
        v6 = 720;
      }
    }
    else if (a3 == 2048)
    {
      v7 = 320;
      v6 = 320;
    }
    else
    {
      if (a3 != 4096)
        return result;
      v7 = 480;
      v6 = 480;
    }
  }
  else
  {
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 1:
          v6 = 176;
          goto LABEL_25;
        case 2:
          v6 = 240;
LABEL_25:
          v7 = 320;
          goto LABEL_36;
        case 4:
          v6 = 272;
          goto LABEL_28;
        case 8:
          v6 = 368;
LABEL_28:
          v7 = 480;
          goto LABEL_36;
        default:
          return result;
      }
    }
    if (a3 > 63)
    {
      if (a3 == 64)
      {
        v6 = 768;
        v7 = 1024;
      }
      else
      {
        if (a3 != 128)
          return result;
        v6 = 720;
        v7 = 1280;
      }
    }
    else
    {
      if (a3 == 16)
      {
        v6 = 368;
      }
      else
      {
        if (a3 != 32)
          return result;
        v6 = 480;
      }
      v7 = 640;
    }
  }
LABEL_36:
  *a4 = v7;
  *a5 = v6;
  return 1;
}

+ (int)videoPayloadForPayload:(int)a3
{
  int v3;

  if (a3 == 123)
    v3 = 1;
  else
    v3 = -1;
  if (a3 == 100)
    return 2;
  else
    return v3;
}

+ (int)payloadForVideoPayload:(int)a3
{
  int v3;

  if (a3 == 1)
    v3 = 123;
  else
    v3 = 128;
  if (a3 == 2)
    return 100;
  else
    return v3;
}

@end
