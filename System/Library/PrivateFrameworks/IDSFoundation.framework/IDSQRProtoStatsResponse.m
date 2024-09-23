@implementation IDSQRProtoStatsResponse

- (void)setServerTimestampMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serverTimestampMs = a3;
}

- (void)setHasServerTimestampMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerTimestampMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSentPackets:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sentPackets = a3;
}

- (void)setHasSentPackets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSentPackets
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReceivedPackets:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_receivedPackets = a3;
}

- (void)setHasReceivedPackets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReceivedPackets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUplinkBandwidth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_uplinkBandwidth = a3;
}

- (void)setHasUplinkBandwidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUplinkBandwidth
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoStatsResponse;
  -[IDSQRProtoStatsResponse description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  char has;
  void *v14;
  const char *v15;
  double v16;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_clientTimestampNtp, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("client_timestamp_ntp"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v11, self->_serverTimestampMs, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, CFSTR("server_timestamp_ms"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_receivedPackets, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v25, (uint64_t)v24, v26, CFSTR("received_packets"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_sentPackets, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, v23, CFSTR("sent_packets"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_uplinkBandwidth, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("uplink_bandwidth"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoStatsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[4] = self->_clientTimestampNtp;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_serverTimestampMs;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v4[5] = self->_receivedPackets;
      *((_BYTE *)v4 + 32) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sentPackets;
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    v4[7] = self->_uplinkBandwidth;
    *((_BYTE *)v4 + 32) |= 8u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  id result;
  char has;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_DWORD *)result + 4) = self->_clientTimestampNtp;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_serverTimestampMs;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_sentPackets;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_receivedPackets;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 7) = self->_uplinkBandwidth;
  *((_BYTE *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_clientTimestampNtp != *((_DWORD *)v4 + 4))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_serverTimestampMs != *((_QWORD *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_sentPackets != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_receivedPackets != *((_DWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }
  v8 = (*((_BYTE *)v4 + 32) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_uplinkBandwidth != *((_DWORD *)v4 + 7))
      goto LABEL_22;
    v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_serverTimestampMs;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_sentPackets;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_receivedPackets;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_11:
    v5 = 0;
    return v2 ^ v3 ^ v4 ^ v5 ^ (2654435761 * self->_clientTimestampNtp);
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_9:
  v5 = 2654435761 * self->_uplinkBandwidth;
  return v2 ^ v3 ^ v4 ^ v5 ^ (2654435761 * self->_clientTimestampNtp);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_clientTimestampNtp = *((_DWORD *)v4 + 4);
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_serverTimestampMs = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_receivedPackets = *((_DWORD *)v4 + 5);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 32) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sentPackets = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    self->_uplinkBandwidth = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:

}

- (unsigned)clientTimestampNtp
{
  return self->_clientTimestampNtp;
}

- (void)setClientTimestampNtp:(unsigned int)a3
{
  self->_clientTimestampNtp = a3;
}

- (unint64_t)serverTimestampMs
{
  return self->_serverTimestampMs;
}

- (unsigned)sentPackets
{
  return self->_sentPackets;
}

- (unsigned)receivedPackets
{
  return self->_receivedPackets;
}

- (unsigned)uplinkBandwidth
{
  return self->_uplinkBandwidth;
}

@end
