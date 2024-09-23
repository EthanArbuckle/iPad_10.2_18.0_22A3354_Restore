@implementation CellularNrEpsFallbackCallFastReturnStats

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

- (void)setFastReturnState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fastReturnState = a3;
}

- (void)setHasFastReturnState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFastReturnState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFastReturnResult:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fastReturnResult = a3;
}

- (void)setHasFastReturnResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFastReturnResult
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setReturnDelay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_returnDelay = a3;
}

- (void)setHasReturnDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasReturnDelay
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)firstCampedSys
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_firstCampedSys;
  else
    return 0;
}

- (void)setFirstCampedSys:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_firstCampedSys = a3;
}

- (void)setHasFirstCampedSys:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFirstCampedSys
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)firstCampedSysAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025FE08 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsFirstCampedSys:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrEpsFallbackCallFastReturnStats;
  v3 = -[CellularNrEpsFallbackCallFastReturnStats description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrEpsFallbackCallFastReturnStats dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *plmn;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t firstCampedSys;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fastReturnState));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("fast_return_state"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fastReturnResult));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("fast_return_result"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_returnDelay));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("return_delay"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_18:
  firstCampedSys = self->_firstCampedSys;
  if (firstCampedSys < 0x10 && ((0x9FFFu >> firstCampedSys) & 1) != 0)
    v14 = *(&off_10025FE08 + firstCampedSys);
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_firstCampedSys));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("first_camped_sys"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_23:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_9:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100110264((uint64_t)self, (uint64_t)a3);
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v6, self->_fastReturnState, 3);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v6, self->_fastReturnResult, 4);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v6, self->_returnDelay, 5);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field(v6, self->_firstCampedSys, 6);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v6, self->_numSubs, 12);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field(v6, self->_psPref, 13);
LABEL_9:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v6, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_fastReturnState;
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 4) = self->_fastReturnResult;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_returnDelay;
  *((_BYTE *)v4 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 6) = self->_firstCampedSys;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_numSubs;
  *((_BYTE *)v4 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 10) = self->_psPref;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }
LABEL_9:
  if (self->_plmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_subsId;
    *((_BYTE *)v4 + 52) |= 0x80u;
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_fastReturnState;
  *((_BYTE *)v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 4) = self->_fastReturnResult;
  *((_BYTE *)v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 11) = self->_returnDelay;
  *((_BYTE *)v5 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 6) = self->_firstCampedSys;
  *((_BYTE *)v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  *((_DWORD *)v5 + 7) = self->_numSubs;
  *((_BYTE *)v5 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 10) = self->_psPref;
    *((_BYTE *)v5 + 52) |= 0x20u;
  }
LABEL_9:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((_BYTE *)v6 + 52) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char has;
  NSData *plmn;
  int v8;
  BOOL v9;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_45;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((v4[52] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_45;
  }
  else if ((v4[52] & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_fastReturnState != *((_DWORD *)v4 + 5))
      goto LABEL_45;
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_fastReturnResult != *((_DWORD *)v4 + 4))
      goto LABEL_45;
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0 || self->_returnDelay != *((_DWORD *)v4 + 11))
      goto LABEL_45;
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_firstCampedSys != *((_DWORD *)v4 + 6))
      goto LABEL_45;
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 7))
      goto LABEL_45;
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 10))
      goto LABEL_45;
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_45;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_45:
      v9 = 0;
      goto LABEL_46;
    }
    has = (char)self->_has;
  }
  v8 = v4[52];
  if (has < 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 12))
      goto LABEL_45;
    v9 = 1;
  }
  else
  {
    v9 = v8 >= 0;
  }
LABEL_46:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_fastReturnState;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fastReturnResult;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_returnDelay;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_firstCampedSys;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_psPref;
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
LABEL_16:
  v10 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v11 = 2654435761 * self->_subsId;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  char *v6;

  v4 = (char *)a3;
  v5 = v4[52];
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[52];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v4[52] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_fastReturnState = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = v4[52];
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_fastReturnResult = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = v4[52];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_returnDelay = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = v4[52];
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_firstCampedSys = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = v4[52];
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  self->_numSubs = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((v4[52] & 0x20) != 0)
  {
LABEL_8:
    self->_psPref = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[CellularNrEpsFallbackCallFastReturnStats setPlmn:](self, "setPlmn:");
    v4 = v6;
  }
  if (v4[52] < 0)
  {
    self->_subsId = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x80u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)fastReturnState
{
  return self->_fastReturnState;
}

- (unsigned)fastReturnResult
{
  return self->_fastReturnResult;
}

- (unsigned)returnDelay
{
  return self->_returnDelay;
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

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
