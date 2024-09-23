@implementation VCMediaNegotiationBlobMultiwayAudioStream

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

- (void)setSupportedPayloads:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_supportedPayloads = a3;
}

- (void)setHasSupportedPayloads:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportedPayloads
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (void)setMaxPacketsPerSecond:(float)a3
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
  *(_BYTE *)&self->_has |= 0x10u;
  self->_repairedStreamID = a3;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRepairedStreamID
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMultiwayAudioStream;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobMultiwayAudioStream description](&v3, sel_description), -[VCMediaNegotiationBlobMultiwayAudioStream dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  double v5;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ssrc), CFSTR("ssrc"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxNetworkBitrate), CFSTR("maxNetworkBitrate"));
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedPayloads), CFSTR("supportedPayloads"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_streamID), CFSTR("streamID"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qualityIndex), CFSTR("qualityIndex"));
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxMediaBitrate), CFSTR("maxMediaBitrate"));
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedStreamID), CFSTR("repairedStreamID"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&v5 = self->_maxPacketsPerSecond;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("maxPacketsPerSecond"));
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v6 & 8) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), CFSTR("repairedMaxNetworkBitrate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMultiwayAudioStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;
  char v4;

  *((_DWORD *)a3 + 8) = self->_ssrc;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_maxNetworkBitrate;
    *((_BYTE *)a3 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_supportedPayloads;
    *((_BYTE *)a3 + 44) |= 0x20u;
  }
  *((_DWORD *)a3 + 9) = self->_streamID;
  *((_DWORD *)a3 + 5) = self->_qualityIndex;
  v4 = (char)self->_has;
  if ((v4 & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_maxMediaBitrate;
    *((_BYTE *)a3 + 44) |= 1u;
    v4 = (char)self->_has;
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = LODWORD(self->_maxPacketsPerSecond);
  *((_BYTE *)a3 + 44) |= 4u;
  v4 = (char)self->_has;
  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_repairedMaxNetworkBitrate;
    *((_BYTE *)a3 + 44) |= 8u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 7) = self->_repairedStreamID;
  *((_BYTE *)a3 + 44) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;
  char v6;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 8) = self->_ssrc;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_maxNetworkBitrate;
    *((_BYTE *)result + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)result + 10) = self->_supportedPayloads;
    *((_BYTE *)result + 44) |= 0x20u;
  }
  *((_DWORD *)result + 9) = self->_streamID;
  *((_DWORD *)result + 5) = self->_qualityIndex;
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_maxMediaBitrate;
    *((_BYTE *)result + 44) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 4) = LODWORD(self->_maxPacketsPerSecond);
  *((_BYTE *)result + 44) |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_repairedStreamID;
  *((_BYTE *)result + 44) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 6) = self->_repairedMaxNetworkBitrate;
  *((_BYTE *)result + 44) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_ssrc != *((_DWORD *)a3 + 8))
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 3))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x20) == 0 || self->_supportedPayloads != *((_DWORD *)a3 + 10))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
    {
      goto LABEL_34;
    }
    if (self->_streamID != *((_DWORD *)a3 + 9) || self->_qualityIndex != *((_DWORD *)a3 + 5))
      goto LABEL_34;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_maxMediaBitrate != *((_DWORD *)a3 + 2))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_maxPacketsPerSecond != *((float *)a3 + 4))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_repairedStreamID != *((_DWORD *)a3 + 7))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 6))
        goto LABEL_34;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int ssrc;
  unsigned int streamID;
  unsigned int qualityIndex;
  unint64_t v10;
  float maxPacketsPerSecond;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;

  has = (char)self->_has;
  if ((has & 2) != 0)
    v4 = 2654435761 * self->_maxNetworkBitrate;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v5 = 2654435761 * self->_supportedPayloads;
  else
    v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_maxMediaBitrate;
  else
    v6 = 0;
  ssrc = self->_ssrc;
  streamID = self->_streamID;
  qualityIndex = self->_qualityIndex;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    maxPacketsPerSecond = self->_maxPacketsPerSecond;
    v12 = -maxPacketsPerSecond;
    if (maxPacketsPerSecond >= 0.0)
      v12 = self->_maxPacketsPerSecond;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v15 = 2654435761 * self->_repairedStreamID;
    if ((has & 8) != 0)
      goto LABEL_20;
LABEL_22:
    v16 = 0;
    return v4 ^ v5 ^ (2654435761 * ssrc) ^ (2654435761 * streamID) ^ (2654435761 * qualityIndex) ^ v6 ^ v10 ^ v15 ^ v16;
  }
  v15 = 0;
  if ((has & 8) == 0)
    goto LABEL_22;
LABEL_20:
  v16 = 2654435761 * self->_repairedMaxNetworkBitrate;
  return v4 ^ v5 ^ (2654435761 * ssrc) ^ (2654435761 * streamID) ^ (2654435761 * qualityIndex) ^ v6 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  char v3;
  char v4;

  self->_ssrc = *((_DWORD *)a3 + 8);
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 2) != 0)
  {
    self->_maxNetworkBitrate = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 44);
  }
  if ((v3 & 0x20) != 0)
  {
    self->_supportedPayloads = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  self->_streamID = *((_DWORD *)a3 + 9);
  self->_qualityIndex = *((_DWORD *)a3 + 5);
  v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 1) != 0)
  {
    self->_maxMediaBitrate = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v4 = *((_BYTE *)a3 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_maxPacketsPerSecond = *((float *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0)
      return;
LABEL_13:
    self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_12:
  self->_repairedStreamID = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 44) & 8) != 0)
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

- (unsigned)supportedPayloads
{
  return self->_supportedPayloads;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned int)a3
{
  self->_streamID = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (float)maxPacketsPerSecond
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

- (VCMediaNegotiationBlobMultiwayAudioStream)initWithStreamConfig:(id)a3
{
  VCMediaNegotiationBlobMultiwayAudioStream *v5;
  char v6;

  if (objc_msgSend(a3, "isSubstream"))
  {

    return 0;
  }
  else
  {
    v5 = -[VCMediaNegotiationBlobMultiwayAudioStream init](self, "init");
    if (v5)
    {
      v5->_ssrc = objc_msgSend(a3, "ssrc");
      v5->_maxNetworkBitrate = objc_msgSend(a3, "maxNetworkBitrate");
      *(_BYTE *)&v5->_has |= 2u;
      v5->_maxMediaBitrate = objc_msgSend(a3, "maxMediaBitrate");
      *(_BYTE *)&v5->_has |= 1u;
      v5->_maxPacketsPerSecond = (float)objc_msgSend(a3, "maxPacketsPerSecond");
      *(_BYTE *)&v5->_has |= 4u;
      v5->_streamID = objc_msgSend(a3, "streamID");
      v5->_qualityIndex = objc_msgSend(a3, "qualityIndex");
      if (objc_msgSend(a3, "hasRepairedStreamID"))
        v6 = 16;
      else
        v6 = 0;
      *(_BYTE *)&v5->_has = *(_BYTE *)&v5->_has & 0xEF | v6;
      v5->_repairedStreamID = objc_msgSend(a3, "repairedStreamID");
      v5->_repairedMaxNetworkBitrate = objc_msgSend(a3, "repairedMaxNetworkBitrate");
      *(_BYTE *)&v5->_has = (*(_BYTE *)&v5->_has >> 1) & 8 | *(_BYTE *)&v5->_has & 0xF7;
      -[VCMediaNegotiationBlobMultiwayAudioStream setPayloadFlagsWithPayloads:](v5, "setPayloadFlagsWithPayloads:", objc_msgSend(a3, "supportedAudioPayloads"));
    }
  }
  return v5;
}

- (void)setPayloadFlagsWithPayloads:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_has |= 0x20u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:](VCMediaNegotiationBlobAudioSettings, "negotiationPayloadFromPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue"));
        if (v9 != -1)
          self->_supportedPayloads |= v9;
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (id)newMultiwayAudioStream
{
  VCMediaNegotiatorMultiwayAudioStream *v3;
  unsigned int supportedPayloads;
  uint64_t v5;

  v3 = objc_alloc_init(VCMediaNegotiatorMultiwayAudioStream);
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v3, "setStreamID:", LOWORD(self->_streamID));
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v3, "setSsrc:", self->_ssrc);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v3, "setMaxMediaBitrate:", self->_maxMediaBitrate);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v3, "setMaxNetworkBitrate:", self->_maxNetworkBitrate);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxPacketsPerSecond:](v3, "setMaxPacketsPerSecond:", self->_maxPacketsPerSecond);
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v3, "setQualityIndex:", self->_qualityIndex);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v3, "setHasRepairedStreamID:", 1);
    -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v3, "setRepairedStreamID:", LOWORD(self->_repairedStreamID));
    -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v3, "setRepairedMaxNetworkBitrate:", self->_repairedMaxNetworkBitrate);
  }
  supportedPayloads = self->_supportedPayloads;
  if (supportedPayloads)
  {
    v5 = 1;
    do
    {
      if ((v5 & supportedPayloads) != 0)
      {
        supportedPayloads &= ~(_DWORD)v5;
        -[VCMediaNegotiatorMultiwayAudioStream addPayload:](v3, "addPayload:", +[VCMediaNegotiationBlobAudioSettings payloadFromNegotiationPayload:](VCMediaNegotiationBlobAudioSettings, "payloadFromNegotiationPayload:", v5));
      }
      v5 = (2 * v5);
    }
    while (supportedPayloads);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
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
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Multiway Audio Stream Settings: SSRC=%x maxNetworkBitrate=%d maxMediaBitrate=%d maxPacketsPerSecond=%f supportedPayloads=0x%08x streamID=%d qualityIndex=%d hasRepaired:%u repairedMaxNetworkBitrate=%d repairedStreamID=%d"), self->_ssrc, self->_maxNetworkBitrate, self->_maxMediaBitrate, self->_maxPacketsPerSecond, self->_supportedPayloads, self->_streamID, self->_qualityIndex, -[VCMediaNegotiationBlobMultiwayAudioStream hasRepairedStreamID](self, "hasRepairedStreamID"), self->_repairedMaxNetworkBitrate, self->_repairedStreamID);
  v5 = objc_msgSend(v4, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v6, v7, v8, v9, v10, v11, v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCMediaNegotiationBlobMultiwayAudioStream(MultiwayAudioStream) printWithLogFile:]";
      v18 = 1024;
      v19 = 1308;
      v20 = 2080;
      v21 = objc_msgSend(v4, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s\n", buf, 0x26u);
    }
  }
}

@end
