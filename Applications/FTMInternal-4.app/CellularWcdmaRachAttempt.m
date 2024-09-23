@implementation CellularWcdmaRachAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMsgLengthMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_msgLengthMs = a3;
}

- (void)setHasMsgLengthMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMsgLengthMs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumPreambles:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numPreambles = a3;
}

- (void)setHasNumPreambles:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumPreambles
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAichStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_aichStatus = a3;
}

- (void)setHasAichStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAichStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxPwrDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txPwrDbm = a3;
}

- (void)setHasTxPwrDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxPwrDbm
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAntenna:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAntenna
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAccbState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accbState = a3;
}

- (void)setHasAccbState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccbState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularWcdmaRachAttempt;
  v3 = -[CellularWcdmaRachAttempt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaRachAttempt dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSData *plmn;
  __int16 v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msgLengthMs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("msg_length_ms"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numPreambles));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("num_preambles"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_aichStatus));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("aich_status"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_txPwrDbm));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("tx_pwr_dbm"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_antenna));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("antenna"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accbState));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("accb_state"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_10:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subs_id"));

    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C848C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSData *plmn;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_msgLengthMs, 2);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v7, self->_numPreambles, 3);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v7, self->_aichStatus, 4);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteSint32Field(v7, self->_txPwrDbm, 6);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v7, self->_antenna, 7);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v7, self->_accbState, 8);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 9);
LABEL_10:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v7, plmn, 10);
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_subsId, 11);
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
    PBDataWriterWriteUint32Field(v7, self->_psPref, 12);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  _QWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_msgLengthMs;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = self->_numPreambles;
  *((_WORD *)v4 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 5) = self->_aichStatus;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 14) = self->_txPwrDbm;
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 6) = self->_antenna;
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_WORD *)v4 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 9) = self->_numSubs;
    *((_WORD *)v4 + 30) |= 0x40u;
  }
LABEL_10:
  if (self->_plmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 30) |= 0x100u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 30) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_msgLengthMs;
  *((_WORD *)v5 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 8) = self->_numPreambles;
  *((_WORD *)v5 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 5) = self->_aichStatus;
  *((_WORD *)v5 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 14) = self->_txPwrDbm;
  *((_WORD *)v5 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 6) = self->_antenna;
  *((_WORD *)v5 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_WORD *)v5 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 9) = self->_numSubs;
    *((_WORD *)v5 + 30) |= 0x40u;
  }
LABEL_10:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_subsId;
    *((_WORD *)v6 + 30) |= 0x100u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_WORD *)v6 + 30) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSData *plmn;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_55;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_55;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_msgLengthMs != *((_DWORD *)v4 + 7))
      goto LABEL_55;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numPreambles != *((_DWORD *)v4 + 8))
      goto LABEL_55;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_aichStatus != *((_DWORD *)v4 + 5))
      goto LABEL_55;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_txPwrDbm != *((_DWORD *)v4 + 14))
      goto LABEL_55;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_antenna != *((_DWORD *)v4 + 6))
      goto LABEL_55;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4))
      goto LABEL_55;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numSubs != *((_DWORD *)v4 + 9))
      goto LABEL_55;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_55;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_55:
      v10 = 0;
      goto LABEL_56;
    }
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 13))
      goto LABEL_55;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_55;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x80) == 0;
  }
LABEL_56:

  return v10;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_msgLengthMs;
      if ((has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numPreambles;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_aichStatus;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_txPwrDbm;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_antenna;
    if ((has & 2) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v8 = 0;
  if ((has & 2) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_accbState;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_numSubs;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
LABEL_18:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v13 = 2654435761 * self->_subsId;
    if ((v12 & 0x80) != 0)
      goto LABEL_20;
LABEL_22:
    v14 = 0;
    return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  v13 = 0;
  if ((v12 & 0x80) == 0)
    goto LABEL_22;
LABEL_20:
  v14 = 2654435761 * self->_psPref;
  return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_msgLengthMs = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_numPreambles = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_aichStatus = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_txPwrDbm = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_antenna = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 30) & 0x40) != 0)
  {
LABEL_9:
    self->_numSubs = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 5))
  {
    v7 = v4;
    -[CellularWcdmaRachAttempt setPlmn:](self, "setPlmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 30);
  if ((v6 & 0x100) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    v6 = *((_WORD *)v4 + 30);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)msgLengthMs
{
  return self->_msgLengthMs;
}

- (unsigned)numPreambles
{
  return self->_numPreambles;
}

- (unsigned)aichStatus
{
  return self->_aichStatus;
}

- (int)txPwrDbm
{
  return self->_txPwrDbm;
}

- (unsigned)antenna
{
  return self->_antenna;
}

- (unsigned)accbState
{
  return self->_accbState;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
