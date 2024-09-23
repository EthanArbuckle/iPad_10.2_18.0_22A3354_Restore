@implementation CellularSysOprtMode

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

- (int)mode
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_mode;
  else
    return -1;
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)modeAsString:(int)a3
{
  if ((a3 + 1) >= 0xD)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ECB8 + a3 + 1);
}

- (int)StringAsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_PWROFF")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_FTM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_OFFLINE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_OFFLINE_AMPS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_OFFLINE_CDMA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_ONLINE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_LPM")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_RESET")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_NET_TEST_GW")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_OFFLINE_IF_NOT_FTM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_PSEUDO_ONLINE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_OPRT_MODE_RESET_MODEM")))
  {
    v4 = 11;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
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
  *(_BYTE *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)CellularSysOprtMode;
  v3 = -[CellularSysOprtMode description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularSysOprtMode dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *simHplmn;
  char v7;
  void *v8;
  NSData *plmn;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v12 = self->_mode + 1;
  if (v12 >= 0xD)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mode));
  else
    v13 = *(&off_10025ECB8 + v12);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mode"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationMs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("duration_ms"));

  }
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("subs_id"));

    v7 = (char)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

  }
LABEL_11:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004CFD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSData *simHplmn;
  char v7;
  NSData *plmn;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  v9 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v9;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v9, self->_mode, 2);
  v4 = v9;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v9, self->_durationMs, 5);
    v4 = v9;
  }
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn)
  {
    PBDataWriterWriteDataField(v9, simHplmn, 6);
    v4 = v9;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_subsId, 7);
    v4 = v9;
    v7 = (char)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field(v9, self->_numSubs, 8);
  v4 = v9;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint32Field(v9, self->_psPref, 9);
    v4 = v9;
  }
LABEL_11:
  plmn = self->_plmn;
  if (plmn)
  {
    PBDataWriterWriteDataField(v9, plmn, 10);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_mode;
  *((_BYTE *)v4 + 60) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_durationMs;
    *((_BYTE *)v4 + 60) |= 2u;
  }
LABEL_5:
  v7 = v4;
  if (self->_simHplmn)
  {
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_subsId;
    *((_BYTE *)v4 + 60) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 6) = self->_numSubs;
  *((_BYTE *)v4 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 10) = self->_psPref;
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
LABEL_11:
  if (self->_plmn)
  {
    objc_msgSend(v7, "setPlmn:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_mode;
  *((_BYTE *)v5 + 60) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_durationMs;
    *((_BYTE *)v5 + 60) |= 2u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[6];
  v6[6] = v8;

  v10 = (char)self->_has;
  if ((v10 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_14:
    *((_DWORD *)v6 + 6) = self->_numSubs;
    *((_BYTE *)v6 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((_BYTE *)v6 + 60) |= 0x20u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 10) = self->_psPref;
    *((_BYTE *)v6 + 60) |= 0x10u;
  }
LABEL_9:
  v11 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *simHplmn;
  NSData *plmn;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_37;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_mode != *((_DWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_37;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_37:
      v9 = 0;
      goto LABEL_38;
    }
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 6))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 10))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 4))
    v9 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v9 = 1;
LABEL_38:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_mode;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_durationMs;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v7 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v8 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_11:
  v9 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mode = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_4:
    self->_durationMs = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[CellularSysOprtMode setSimHplmn:](self, "setSimHplmn:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 60);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_numSubs = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
LABEL_10:
    self->_psPref = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 4))
  {
    -[CellularSysOprtMode setPlmn:](self, "setPlmn:");
    v4 = v7;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
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
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
