@implementation CellularLteRachAttempt

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

- (void)setRetxCounter:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_retxCounter = a3;
}

- (void)setHasRetxCounter:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRetxCounter
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)rachResult
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_rachResult;
  else
    return 0;
}

- (void)setRachResult:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rachResult = a3;
}

- (void)setHasRachResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRachResult
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)rachResultAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F0A8 + a3);
}

- (int)StringAsRachResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_RACH_RESULT_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_RACH_RESULT_FAIL_AT_MESG2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_RACH_RESULT_FAIL_AT_MESG4_CTT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_RACH_RESULT_FAIL_AT_MESG4")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_RACH_RESULT_ABORTED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setContentionBased:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_contentionBased = a3;
}

- (void)setHasContentionBased:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasContentionBased
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPMax:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pMax = a3;
}

- (void)setHasPMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPMax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rsrp = a3;
}

- (void)setHasRsrp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRsrp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_earfcn = a3;
}

- (void)setHasEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEarfcn
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTac
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCellIsApo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_cellIsApo = a3;
}

- (void)setHasCellIsApo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCellIsApo
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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
  *(_WORD *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setScellIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scellIndex = a3;
}

- (void)setHasScellIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScellIndex
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxPowerLimited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_txPowerLimited = a3;
}

- (void)setHasTxPowerLimited:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTxPowerLimited
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteRachAttempt;
  v3 = -[CellularLteRachAttempt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRachAttempt dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v10;
  void *v11;
  uint64_t rachResult;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_retxCounter));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("retx_counter"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_23:
  rachResult = self->_rachResult;
  if (rachResult >= 5)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rachResult));
  else
    v13 = *(&off_10025F0A8 + rachResult);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("rach_result"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_contentionBased));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("contention_based"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pMax));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("p_max"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rsrp));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rsrp"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_earfcn));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tac));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("tac"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("cell_id"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_cellIsApo));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("cell_is_apo"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_37:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accbState));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("accb_state"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
LABEL_26:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scellIndex));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("scell_index"));

    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      return v3;
    goto LABEL_19;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("subs_id"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
    goto LABEL_26;
LABEL_18:
  if ((v7 & 0x4000) != 0)
  {
LABEL_19:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_txPowerLimited));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("tx_power_limited"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000877AC((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_retxCounter, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field(v7, self->_rachResult, 5);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField(v7, self->_contentionBased, 7);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field(v7, self->_pMax, 8);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteSint32Field(v7, self->_rsrp, 9);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v7, self->_earfcn, 10);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v7, self->_tac, 11);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v7, self->_cellId, 12);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField(v7, self->_cellIsApo, 13);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v7, self->_accbState, 14);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 15);
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v7, plmn, 16);
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
LABEL_34:
    PBDataWriterWriteUint32Field(v7, self->_scellIndex, 18);
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field(v7, self->_subsId, 17);
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x4000) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField(v7, self->_txPowerLimited, 19);
LABEL_20:

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
    *((_WORD *)v4 + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_retxCounter;
  *((_WORD *)v4 + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 12) = self->_rachResult;
  *((_WORD *)v4 + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)v4 + 73) = self->_contentionBased;
  *((_WORD *)v4 + 38) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 8) = self->_pMax;
  *((_WORD *)v4 + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 14) = self->_rsrp;
  *((_WORD *)v4 + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 6) = self->_earfcn;
  *((_WORD *)v4 + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 17) = self->_tac;
  *((_WORD *)v4 + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_WORD *)v4 + 38) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)v4 + 72) = self->_cellIsApo;
  *((_WORD *)v4 + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_WORD *)v4 + 38) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 7) = self->_numSubs;
    *((_WORD *)v4 + 38) |= 0x10u;
  }
LABEL_14:
  if (self->_plmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
LABEL_34:
    *((_DWORD *)v4 + 15) = self->_scellIndex;
    *((_WORD *)v4 + 38) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 16) = self->_subsId;
  *((_WORD *)v4 + 38) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x4000) != 0)
  {
LABEL_19:
    *((_BYTE *)v4 + 74) = self->_txPowerLimited;
    *((_WORD *)v4 + 38) |= 0x4000u;
  }
LABEL_20:

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
    *((_WORD *)v5 + 38) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_retxCounter;
  *((_WORD *)v5 + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 12) = self->_rachResult;
  *((_WORD *)v5 + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v5 + 73) = self->_contentionBased;
  *((_WORD *)v5 + 38) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 8) = self->_pMax;
  *((_WORD *)v5 + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 14) = self->_rsrp;
  *((_WORD *)v5 + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 6) = self->_earfcn;
  *((_WORD *)v5 + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 17) = self->_tac;
  *((_WORD *)v5 + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_WORD *)v5 + 38) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)v5 + 72) = self->_cellIsApo;
  *((_WORD *)v5 + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_29:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_WORD *)v5 + 38) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 7) = self->_numSubs;
    *((_WORD *)v5 + 38) |= 0x10u;
  }
LABEL_14:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_16;
LABEL_32:
    *((_DWORD *)v6 + 15) = self->_scellIndex;
    *((_WORD *)v6 + 38) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      return v6;
    goto LABEL_17;
  }
  *((_DWORD *)v6 + 16) = self->_subsId;
  *((_WORD *)v6 + 38) |= 0x400u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
    goto LABEL_32;
LABEL_16:
  if ((v10 & 0x4000) != 0)
  {
LABEL_17:
    *((_BYTE *)v6 + 74) = self->_txPowerLimited;
    *((_WORD *)v6 + 38) |= 0x4000u;
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
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_84;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 38);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_84;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_retxCounter != *((_DWORD *)v4 + 13))
      goto LABEL_84;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rachResult != *((_DWORD *)v4 + 12))
      goto LABEL_84;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x2000) == 0)
      goto LABEL_84;
    if (self->_contentionBased)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x2000) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_pMax != *((_DWORD *)v4 + 8))
      goto LABEL_84;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_rsrp != *((_DWORD *)v4 + 14))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_earfcn != *((_DWORD *)v4 + 6))
      goto LABEL_84;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x800) == 0 || self->_tac != *((_DWORD *)v4 + 17))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 38) & 0x800) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5))
      goto LABEL_84;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x1000) == 0)
      goto LABEL_84;
    if (self->_cellIsApo)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x1000) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4))
      goto LABEL_84;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 7))
      goto LABEL_84;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
      goto LABEL_84;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 16))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_scellIndex != *((_DWORD *)v4 + 15))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x4000) != 0)
    {
      if (self->_txPowerLimited)
      {
        if (!*((_BYTE *)v4 + 74))
          goto LABEL_84;
      }
      else if (*((_BYTE *)v4 + 74))
      {
        goto LABEL_84;
      }
      v9 = 1;
      goto LABEL_85;
    }
LABEL_84:
    v9 = 0;
    goto LABEL_85;
  }
  v9 = (*((_WORD *)v4 + 38) & 0x4000) == 0;
LABEL_85:

  return v9;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v20 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v19 = 2654435761 * self->_retxCounter;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v20 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v19 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v18 = 2654435761 * self->_rachResult;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    v17 = 2654435761 * self->_contentionBased;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v17 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v16 = 2654435761 * self->_pMax;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_rsrp;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_earfcn;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_tac;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_cellIsApo;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v9 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v8 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v9 = 2654435761 * self->_accbState;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
LABEL_26:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_28;
LABEL_31:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_29;
LABEL_32:
    v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_31;
LABEL_28:
  v13 = 2654435761 * self->_scellIndex;
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
    goto LABEL_32;
LABEL_29:
  v14 = 2654435761 * self->_txPowerLimited;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 38);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_retxCounter = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_rachResult = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x2000) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_contentionBased = *((_BYTE *)v4 + 73);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_pMax = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_rsrp = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_earfcn = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_tac = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  self->_cellIsApo = *((_BYTE *)v4 + 72);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 38) & 0x10) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 5))
  {
    v7 = v4;
    -[CellularLteRachAttempt setPlmn:](self, "setPlmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x400) == 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0)
      goto LABEL_18;
LABEL_34:
    self->_scellIndex = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x200u;
    if ((*((_WORD *)v4 + 38) & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  self->_subsId = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x200) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x4000) != 0)
  {
LABEL_19:
    self->_txPowerLimited = *((_BYTE *)v4 + 74);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_20:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)retxCounter
{
  return self->_retxCounter;
}

- (BOOL)contentionBased
{
  return self->_contentionBased;
}

- (int)pMax
{
  return self->_pMax;
}

- (int)rsrp
{
  return self->_rsrp;
}

- (unsigned)earfcn
{
  return self->_earfcn;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (BOOL)cellIsApo
{
  return self->_cellIsApo;
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

- (unsigned)scellIndex
{
  return self->_scellIndex;
}

- (BOOL)txPowerLimited
{
  return self->_txPowerLimited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
