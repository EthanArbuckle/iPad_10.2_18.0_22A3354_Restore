@implementation CellularNrRrcResume

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setResumeSuccessDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_resumeSuccessDuration = a3;
}

- (void)setHasResumeSuccessDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResumeSuccessDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setResumeRequestReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resumeRequestReason = a3;
}

- (void)setHasResumeRequestReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResumeRequestReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setResumeSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_resumeSuccess = a3;
}

- (void)setHasResumeSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasResumeSuccess
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrRrcResume;
  v3 = -[CellularNrRrcResume description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRrcResume dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *plmn;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_resumeSuccessDuration));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("resume_success_duration"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_resumeRequestReason));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("resume_request_reason"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_resumeSuccess));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("resume_success"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("subs_id"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_9:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100134FBC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *plmn;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v6, self->_resumeSuccessDuration, 3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(v6, self->_resumeRequestReason, 4);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField(v6, self->_resumeSuccess, 5);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v6, self->_numSubs, 12);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field(v6, self->_psPref, 13);
LABEL_8:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v6, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field(v6, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_resumeSuccessDuration;
  *((_BYTE *)v4 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 9) = self->_resumeRequestReason;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v4 + 48) = self->_resumeSuccess;
  *((_BYTE *)v4 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v4 + 4) = self->_numSubs;
  *((_BYTE *)v4 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_BYTE *)v4 + 52) |= 4u;
  }
LABEL_8:
  if (self->_plmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_resumeSuccessDuration;
  *((_BYTE *)v5 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 9) = self->_resumeRequestReason;
  *((_BYTE *)v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)v5 + 48) = self->_resumeSuccess;
  *((_BYTE *)v5 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v5 + 4) = self->_numSubs;
  *((_BYTE *)v5 + 52) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_psPref;
    *((_BYTE *)v5 + 52) |= 4u;
  }
LABEL_8:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((_BYTE *)v6 + 52) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *plmn;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0 || self->_resumeSuccessDuration != *((_DWORD *)v4 + 10))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_resumeRequestReason != *((_DWORD *)v4 + 9))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x40) == 0)
      goto LABEL_42;
    if (self->_resumeSuccess)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_38;
    }
LABEL_42:
    v8 = 0;
    goto LABEL_43;
  }
LABEL_38:
  v8 = (*((_BYTE *)v4 + 52) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_42;
    v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_resumeSuccessDuration;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_resumeRequestReason;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_resumeSuccess;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_psPref;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  v9 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v10 = 2654435761 * self->_subsId;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_resumeSuccessDuration = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_resumeRequestReason = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_resumeSuccess = *((_BYTE *)v4 + 48);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  self->_numSubs = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
LABEL_7:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[CellularNrRrcResume setPlmn:](self, "setPlmn:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)resumeSuccessDuration
{
  return self->_resumeSuccessDuration;
}

- (unsigned)resumeRequestReason
{
  return self->_resumeRequestReason;
}

- (BOOL)resumeSuccess
{
  return self->_resumeSuccess;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
