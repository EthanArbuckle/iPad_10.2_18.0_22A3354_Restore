@implementation CellularWcdmaRrcState

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

- (int)rrcState
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_rrcState;
  else
    return 0;
}

- (void)setRrcState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRrcState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FEF0[a3];
}

- (int)StringAsRrcState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_DISCONNECTED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CONNECTING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_FACH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_DCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_PCH")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_URA_PCH")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)newRrcState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_newRrcState;
  else
    return 0;
}

- (void)setNewRrcState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_newRrcState = a3;
}

- (void)setHasNewRrcState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewRrcState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)newRrcStateAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FEF0[a3];
}

- (int)StringAsNewRrcState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_DISCONNECTED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CONNECTING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_FACH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_DCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_CELL_PCH")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_RRC_STATE_URA_PCH")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularWcdmaRrcState;
  v3 = -[CellularWcdmaRrcState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaRrcState dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t rrcState;
  __CFString *v11;
  uint64_t newRrcState;
  __CFString *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  rrcState = self->_rrcState;
  if (rrcState >= 6)
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rrcState));
  else
    v11 = off_10025FEF0[rrcState];
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rrc_state"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_18:
  newRrcState = self->_newRrcState;
  if (newRrcState >= 6)
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newRrcState));
  else
    v13 = off_10025FEF0[newRrcState];
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("new_rrc_state"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_prevStateDurMs));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("prev_state_dur_ms"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_23:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_8:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011DF18((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v6, self->_rrcState, 2);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field(v6, self->_newRrcState, 3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v6, self->_prevStateDurMs, 4);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v6, self->_numSubs, 12);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field(v6, self->_psPref, 13);
LABEL_8:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v6, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
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
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_rrcState;
  *((_BYTE *)v4 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_newRrcState;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_prevStateDurMs;
  *((_BYTE *)v4 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((_BYTE *)v4 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_psPref;
    *((_BYTE *)v4 + 48) |= 0x10u;
  }
LABEL_8:
  if (self->_plmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_BYTE *)v4 + 48) |= 0x40u;
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
    *((_BYTE *)v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_rrcState;
  *((_BYTE *)v5 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 4) = self->_newRrcState;
  *((_BYTE *)v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 8) = self->_prevStateDurMs;
  *((_BYTE *)v5 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v5 + 5) = self->_numSubs;
  *((_BYTE *)v5 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 9) = self->_psPref;
    *((_BYTE *)v5 + 48) |= 0x10u;
  }
LABEL_8:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((_BYTE *)v6 + 48) |= 0x40u;
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
    goto LABEL_39;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0 || self->_rrcState != *((_DWORD *)v4 + 10))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_newRrcState != *((_DWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 8))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 9))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_39:
      v8 = 0;
      goto LABEL_40;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 48) & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_39;
    v8 = 1;
  }
LABEL_40:

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
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rrcState;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_newRrcState;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_prevStateDurMs;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_psPref;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
LABEL_14:
  v9 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
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
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_rrcState = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_newRrcState = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_prevStateDurMs = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
LABEL_7:
    self->_psPref = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[CellularWcdmaRrcState setPlmn:](self, "setPlmn:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 48) & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x40u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
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
