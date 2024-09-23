@implementation RachConnInfo

- (void)setFailRachAttempts:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_failRachAttempts = a3;
}

- (void)setHasFailRachAttempts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailRachAttempts
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalRachAttempts:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalRachAttempts = a3;
}

- (void)setHasTotalRachAttempts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalRachAttempts
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalMoRrcConn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalMoRrcConn = a3;
}

- (void)setHasTotalMoRrcConn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalMoRrcConn
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalMtRrcConn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalMtRrcConn = a3;
}

- (void)setHasTotalMtRrcConn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalMtRrcConn
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalSigRrcConn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_totalSigRrcConn = a3;
}

- (void)setHasTotalSigRrcConn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalSigRrcConn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAvgInterRrcConnDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_avgInterRrcConnDuration = a3;
}

- (void)setHasAvgInterRrcConnDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvgInterRrcConnDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RachConnInfo;
  v3 = -[RachConnInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RachConnInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_failRachAttempts));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("fail_rach_attempts"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalRachAttempts));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("total_rach_attempts"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalMoRrcConn));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("total_mo_rrc_conn"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalSigRrcConn));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("total_sig_rrc_conn"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalMtRrcConn));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("total_mt_rrc_conn"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_avgInterRrcConnDuration));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("avg_inter_rrc_conn_duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000074A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_failRachAttempts, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_totalRachAttempts, 2);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field(v5, self->_totalMoRrcConn, 3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field(v5, self->_totalSigRrcConn, 5);
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field(v5, self->_totalMtRrcConn, 4);
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field(v5, self->_avgInterRrcConnDuration, 6);
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_failRachAttempts;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_totalRachAttempts;
  *((_BYTE *)v4 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4[4] = self->_totalMoRrcConn;
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    v4[7] = self->_totalSigRrcConn;
    *((_BYTE *)v4 + 32) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v4[5] = self->_totalMtRrcConn;
  *((_BYTE *)v4 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    v4[2] = self->_avgInterRrcConnDuration;
    *((_BYTE *)v4 + 32) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_failRachAttempts;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_totalRachAttempts;
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_totalMoRrcConn;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_totalMtRrcConn;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_totalSigRrcConn;
  *((_BYTE *)result + 32) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 2) = self->_avgInterRrcConnDuration;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_failRachAttempts != *((_DWORD *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_31:
    v6 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_totalRachAttempts != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_totalMoRrcConn != *((_DWORD *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_totalMtRrcConn != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0 || self->_totalSigRrcConn != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_avgInterRrcConnDuration != *((_DWORD *)v4 + 2))
      goto LABEL_31;
    v6 = 1;
  }
LABEL_32:

  return v6;
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
    v2 = 2654435761 * self->_failRachAttempts;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_totalRachAttempts;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_totalMoRrcConn;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_totalMtRrcConn;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_totalSigRrcConn;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_avgInterRrcConnDuration;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_failRachAttempts = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_totalRachAttempts = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_totalMoRrcConn = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_totalSigRrcConn = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 32) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_totalMtRrcConn = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    self->_avgInterRrcConnDuration = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:

}

- (unsigned)failRachAttempts
{
  return self->_failRachAttempts;
}

- (unsigned)totalRachAttempts
{
  return self->_totalRachAttempts;
}

- (unsigned)totalMoRrcConn
{
  return self->_totalMoRrcConn;
}

- (unsigned)totalMtRrcConn
{
  return self->_totalMtRrcConn;
}

- (unsigned)totalSigRrcConn
{
  return self->_totalSigRrcConn;
}

- (unsigned)avgInterRrcConnDuration
{
  return self->_avgInterRrcConnDuration;
}

@end
