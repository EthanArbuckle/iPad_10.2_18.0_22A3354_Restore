@implementation KCellularGsmCsRfMeasurement

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear(&self->_csTxPwrs, a2);
  v3.receiver = self;
  v3.super_class = (Class)KCellularGsmCsRfMeasurement;
  -[KCellularGsmCsRfMeasurement dealloc](&v3, "dealloc");
}

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

- (void)setScellArfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_scellArfcn = a3;
}

- (void)setHasScellArfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScellArfcn
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSimplifiedL1State:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_simplifiedL1State = a3;
}

- (void)setHasSimplifiedL1State:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSimplifiedL1State
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCurrentAntenna:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_currentAntenna = a3;
}

- (void)setHasCurrentAntenna:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCurrentAntenna
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (unint64_t)csTxPwrsCount
{
  return self->_csTxPwrs.count;
}

- (int)csTxPwrs
{
  return self->_csTxPwrs.list;
}

- (void)clearCsTxPwrs
{
  PBRepeatedInt32Clear(&self->_csTxPwrs, a2);
}

- (void)addCsTxPwr:(int)a3
{
  PBRepeatedInt32Add(&self->_csTxPwrs, *(_QWORD *)&a3);
}

- (int)csTxPwrAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_csTxPwrs;
  unint64_t count;
  void *v6;
  void *v7;

  p_csTxPwrs = &self->_csTxPwrs;
  count = self->_csTxPwrs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_csTxPwrs->list[a3];
}

- (void)setCsTxPwrs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_csTxPwrs, a3, a4);
}

- (void)setCsRxlevSub:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_csRxlevSub = a3;
}

- (void)setHasCsRxlevSub:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCsRxlevSub
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCsRxqualSub:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_csRxqualSub = a3;
}

- (void)setHasCsRxqualSub:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCsRxqualSub
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setScellBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_scellBand = a3;
}

- (void)setHasScellBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScellBand
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)KCellularGsmCsRfMeasurement;
  v3 = -[KCellularGsmCsRfMeasurement description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularGsmCsRfMeasurement dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scellArfcn));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("scell_arfcn"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_simplifiedL1State));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("simplified_l1_state"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_currentAntenna));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("current_antenna"));

  }
LABEL_6:
  v6 = PBRepeatedInt32NSArray(&self->_csTxPwrs);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cs_tx_pwr"));

  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_csRxlevSub));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cs_rxlev_sub"));

    v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_8:
      if ((v8 & 0x20) == 0)
        goto LABEL_9;
LABEL_17:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scellBand));
      objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("scell_band"));

      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return v3;
LABEL_18:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("subs_id"));

      return v3;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_csRxqualSub));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cs_rxqual_sub"));

  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
    goto LABEL_17;
LABEL_9:
  if (v8 < 0)
    goto LABEL_18;
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000117D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_scellArfcn, 2);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(v5, self->_simplifiedL1State, 3);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field(v5, self->_currentAntenna, 4);
LABEL_6:
  if (self->_csTxPwrs.count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (self->_csTxPwrs.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteSint32Field(v5, self->_csTxPwrs.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_csTxPwrs.count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_csRxlevSub, 6);
    v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_13:
      if ((v8 & 0x20) == 0)
        goto LABEL_14;
LABEL_22:
      PBDataWriterWriteUint32Field(v5, self->_scellBand, 8);
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_15;
LABEL_23:
      PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field(v5, self->_csRxqualSub, 7);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
    goto LABEL_22;
LABEL_14:
  if (v8 < 0)
    goto LABEL_23;
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  char v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_timestamp;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
LABEL_17:
      *((_DWORD *)v4 + 15) = self->_simplifiedL1State;
      *((_BYTE *)v4 + 68) |= 0x40u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_scellArfcn;
  *((_BYTE *)v4 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_17;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 12) = self->_currentAntenna;
    *((_BYTE *)v4 + 68) |= 8u;
  }
LABEL_6:
  v10 = v4;
  if (-[KCellularGsmCsRfMeasurement csTxPwrsCount](self, "csTxPwrsCount"))
  {
    objc_msgSend(v10, "clearCsTxPwrs");
    v6 = -[KCellularGsmCsRfMeasurement csTxPwrsCount](self, "csTxPwrsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v10, "addCsTxPwr:", -[KCellularGsmCsRfMeasurement csTxPwrAtIndex:](self, "csTxPwrAtIndex:", i));
    }
  }
  v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v10 + 10) = self->_csRxlevSub;
    *((_BYTE *)v10 + 68) |= 2u;
    v9 = (char)self->_has;
    if ((v9 & 4) == 0)
    {
LABEL_12:
      if ((v9 & 0x20) == 0)
        goto LABEL_13;
LABEL_21:
      *((_DWORD *)v10 + 14) = self->_scellBand;
      *((_BYTE *)v10 + 68) |= 0x20u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_14;
LABEL_22:
      *((_DWORD *)v10 + 16) = self->_subsId;
      *((_BYTE *)v10 + 68) |= 0x80u;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v10 + 11) = self->_csRxqualSub;
  *((_BYTE *)v10 + 68) |= 4u;
  v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
    goto LABEL_21;
LABEL_13:
  if (v9 < 0)
    goto LABEL_22;
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _DWORD *v5;
  char has;
  char v7;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_timestamp;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_scellArfcn;
  *((_BYTE *)v4 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v4 + 15) = self->_simplifiedL1State;
  *((_BYTE *)v4 + 68) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 12) = self->_currentAntenna;
    *((_BYTE *)v4 + 68) |= 8u;
  }
LABEL_6:
  PBRepeatedInt32Copy(v4 + 1, &self->_csTxPwrs);
  v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    v5[10] = self->_csRxlevSub;
    *((_BYTE *)v5 + 68) |= 2u;
    v7 = (char)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x20) == 0)
        goto LABEL_9;
LABEL_17:
      v5[14] = self->_scellBand;
      *((_BYTE *)v5 + 68) |= 0x20u;
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        return v5;
LABEL_18:
      v5[16] = self->_subsId;
      *((_BYTE *)v5 + 68) |= 0x80u;
      return v5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  v5[11] = self->_csRxqualSub;
  *((_BYTE *)v5 + 68) |= 4u;
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
    goto LABEL_17;
LABEL_9:
  if (v7 < 0)
    goto LABEL_18;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_42;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[68] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_42;
  }
  else if ((v4[68] & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[68] & 0x10) == 0 || self->_scellArfcn != *((_DWORD *)v4 + 13))
      goto LABEL_42;
  }
  else if ((v4[68] & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[68] & 0x40) == 0 || self->_simplifiedL1State != *((_DWORD *)v4 + 15))
      goto LABEL_42;
  }
  else if ((v4[68] & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[68] & 8) == 0 || self->_currentAntenna != *((_DWORD *)v4 + 12))
      goto LABEL_42;
  }
  else if ((v4[68] & 8) != 0)
  {
    goto LABEL_42;
  }
  if (!PBRepeatedInt32IsEqual(&self->_csTxPwrs, v4 + 8))
  {
LABEL_42:
    v6 = 0;
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[68] & 2) == 0 || self->_csRxlevSub != *((_DWORD *)v4 + 10))
      goto LABEL_42;
  }
  else if ((v4[68] & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[68] & 4) == 0 || self->_csRxqualSub != *((_DWORD *)v4 + 11))
      goto LABEL_42;
  }
  else if ((v4[68] & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[68] & 0x20) == 0 || self->_scellBand != *((_DWORD *)v4 + 14))
      goto LABEL_42;
  }
  else if ((v4[68] & 0x20) != 0)
  {
    goto LABEL_42;
  }
  v6 = v4[68] >= 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v4[68] & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 16))
      goto LABEL_42;
    v6 = 1;
  }
LABEL_43:

  return v6;
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
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_scellArfcn;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_simplifiedL1State;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_currentAntenna;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = PBRepeatedInt32Hash(&self->_csTxPwrs, a2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_csRxlevSub;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_12:
      v9 = 2654435761 * self->_csRxqualSub;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_13;
LABEL_17:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 0x80) != 0)
        goto LABEL_14;
LABEL_18:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_12;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_13:
  v10 = 2654435761 * self->_scellBand;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_18;
LABEL_14:
  v11 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  char v9;
  unsigned int *v10;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_scellArfcn = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  self->_simplifiedL1State = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
LABEL_5:
    self->_currentAntenna = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  v10 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "csTxPwrsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[KCellularGsmCsRfMeasurement addCsTxPwr:](self, "addCsTxPwr:", objc_msgSend(v10, "csTxPwrAtIndex:", i));
  }
  v9 = *((_BYTE *)v10 + 68);
  if ((v9 & 2) != 0)
  {
    self->_csRxlevSub = v10[10];
    *(_BYTE *)&self->_has |= 2u;
    v9 = *((_BYTE *)v10 + 68);
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x20) == 0)
        goto LABEL_12;
LABEL_20:
      self->_scellBand = v10[14];
      *(_BYTE *)&self->_has |= 0x20u;
      if ((v10[17] & 0x80) == 0)
        goto LABEL_13;
LABEL_21:
      self->_subsId = v10[16];
      *(_BYTE *)&self->_has |= 0x80u;
      goto LABEL_13;
    }
  }
  else if ((v10[17] & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_csRxqualSub = v10[11];
  *(_BYTE *)&self->_has |= 4u;
  v9 = *((_BYTE *)v10 + 68);
  if ((v9 & 0x20) != 0)
    goto LABEL_20;
LABEL_12:
  if (v9 < 0)
    goto LABEL_21;
LABEL_13:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)scellArfcn
{
  return self->_scellArfcn;
}

- (unsigned)simplifiedL1State
{
  return self->_simplifiedL1State;
}

- (unsigned)currentAntenna
{
  return self->_currentAntenna;
}

- (unsigned)csRxlevSub
{
  return self->_csRxlevSub;
}

- (unsigned)csRxqualSub
{
  return self->_csRxqualSub;
}

- (unsigned)scellBand
{
  return self->_scellBand;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
