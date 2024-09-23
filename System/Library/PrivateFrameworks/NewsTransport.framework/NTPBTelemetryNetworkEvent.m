@implementation NTPBTelemetryNetworkEvent

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDnsDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dnsDuration = a3;
}

- (void)setHasDnsDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDnsDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setConnectDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRequestDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestDuration = a3;
}

- (void)setHasRequestDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setResponseDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_responseDuration = a3;
}

- (void)setHasResponseDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResponseDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResponseSize:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_responseSize = a3;
}

- (void)setHasResponseSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResponseSize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)cacheState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_cacheState;
  else
    return 0;
}

- (void)setCacheState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_cacheState = a3;
}

- (void)setHasCacheState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCacheState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHttpStatusCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_httpStatusCode = a3;
}

- (void)setHasHttpStatusCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHttpStatusCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBTelemetryNetworkEvent;
  -[NTPBTelemetryNetworkEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTelemetryNetworkEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("start_time"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dnsDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dns_duration"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_connectDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("connect_duration"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_requestDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("request_duration"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_responseDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("response_duration"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_responseSize);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("response_size"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_httpStatusCode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("http_status_code"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cacheState);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cache_state"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_errorCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("error_code"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryNetworkEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteInt64Field();
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 4) != 0)
LABEL_10:
    PBDataWriterWriteInt64Field();
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_QWORD *)result + 8) = self->_startTime;
    *((_WORD *)result + 38) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_dnsDuration;
  *((_WORD *)result + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 1) = self->_connectDuration;
  *((_WORD *)result + 38) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 5) = self->_requestDuration;
  *((_WORD *)result + 38) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 6) = self->_responseDuration;
  *((_WORD *)result + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 7) = self->_responseSize;
  *((_WORD *)result + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 18) = self->_cacheState;
  *((_WORD *)result + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_QWORD *)result + 4) = self->_httpStatusCode;
  *((_WORD *)result + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_10:
  *((_QWORD *)result + 3) = self->_errorCode;
  *((_WORD *)result + 38) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 38);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_startTime != *((_QWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((v6 & 0x80) != 0)
  {
LABEL_47:
    v7 = 0;
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dnsDuration != *((_QWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_connectDuration != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_requestDuration != *((_QWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_responseDuration != *((_QWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_responseSize != *((_QWORD *)v4 + 7))
      goto LABEL_47;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_cacheState != *((_DWORD *)v4 + 18))
      goto LABEL_47;
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_httpStatusCode != *((_QWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_errorCode != *((_QWORD *)v4 + 3))
      goto LABEL_47;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 4) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v3 = 2654435761 * self->_startTime;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dnsDuration;
      if ((has & 1) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_connectDuration;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_requestDuration;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_responseDuration;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_responseSize;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_cacheState;
    if ((has & 8) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 4) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 8) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_httpStatusCode;
  if ((has & 4) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x80) != 0)
  {
    self->_startTime = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    v5 = *((_WORD *)v4 + 38);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dnsDuration = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_connectDuration = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_requestDuration = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_responseDuration = *((_QWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_responseSize = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
LABEL_19:
    self->_httpStatusCode = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 38) & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_cacheState = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 4) != 0)
  {
LABEL_10:
    self->_errorCode = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_11:

}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)dnsDuration
{
  return self->_dnsDuration;
}

- (int64_t)connectDuration
{
  return self->_connectDuration;
}

- (int64_t)requestDuration
{
  return self->_requestDuration;
}

- (int64_t)responseDuration
{
  return self->_responseDuration;
}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (int64_t)httpStatusCode
{
  return self->_httpStatusCode;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end
