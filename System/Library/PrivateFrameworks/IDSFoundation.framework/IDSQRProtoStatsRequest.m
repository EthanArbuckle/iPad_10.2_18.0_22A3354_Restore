@implementation IDSQRProtoStatsRequest

- (void)setClientLatencyMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientLatencyMs = a3;
}

- (void)setHasClientLatencyMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientLatencyMs
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
  v13.super_class = (Class)IDSQRProtoStatsRequest;
  -[IDSQRProtoStatsRequest description](&v13, sel_description);
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

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_clientTimestampNtp, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("client_timestamp_ntp"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_sentPackets, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, v23, CFSTR("sent_packets"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v5;
    goto LABEL_4;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_clientLatencyMs, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, CFSTR("client_latency_ms"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_receivedPackets, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("received_packets"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoStatsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[3] = self->_clientTimestampNtp;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[5] = self->_sentPackets;
    *((_BYTE *)v4 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[2] = self->_clientLatencyMs;
  *((_BYTE *)v4 + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[4] = self->_receivedPackets;
    *((_BYTE *)v4 + 24) |= 2u;
  }
LABEL_5:

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
  *((_DWORD *)result + 3) = self->_clientTimestampNtp;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_clientLatencyMs;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_sentPackets;
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 4) = self->_receivedPackets;
  *((_BYTE *)result + 24) |= 2u;
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
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || self->_clientTimestampNtp != *((_DWORD *)v4 + 3))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_clientLatencyMs != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_sentPackets != *((_DWORD *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_receivedPackets != *((_DWORD *)v4 + 4))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_clientLatencyMs;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_sentPackets;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v4 = 0;
    return v2 ^ v3 ^ v4 ^ (2654435761 * self->_clientTimestampNtp);
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v4 = 2654435761 * self->_receivedPackets;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_clientTimestampNtp);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;

  v4 = a3;
  self->_clientTimestampNtp = v4[3];
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) == 0)
  {
    if ((v4[6] & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_sentPackets = v4[5];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[6] & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_clientLatencyMs = v4[2];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_receivedPackets = v4[4];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (unsigned)clientTimestampNtp
{
  return self->_clientTimestampNtp;
}

- (void)setClientTimestampNtp:(unsigned int)a3
{
  self->_clientTimestampNtp = a3;
}

- (unsigned)clientLatencyMs
{
  return self->_clientLatencyMs;
}

- (unsigned)sentPackets
{
  return self->_sentPackets;
}

- (unsigned)receivedPackets
{
  return self->_receivedPackets;
}

@end
