@implementation KCellularLteTxPower

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

- (void)clearTxPowerInfos
{
  -[NSMutableArray removeAllObjects](self->_txPowerInfos, "removeAllObjects");
}

- (void)addTxPowerInfo:(id)a3
{
  id v4;
  NSMutableArray *txPowerInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txPowerInfos = self->_txPowerInfos;
  v8 = v4;
  if (!txPowerInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_txPowerInfos;
    self->_txPowerInfos = v6;

    v4 = v8;
    txPowerInfos = self->_txPowerInfos;
  }
  -[NSMutableArray addObject:](txPowerInfos, "addObject:", v4);

}

- (unint64_t)txPowerInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_txPowerInfos, "count");
}

- (id)txPowerInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_txPowerInfos, "objectAtIndex:", a3);
}

+ (Class)txPowerInfoType
{
  return (Class)objc_opt_class(TxPowerInfo, a2);
}

- (BOOL)hasVolteCallId
{
  return self->_volteCallId != 0;
}

- (void)setLastPcellDlBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastPcellDlBand = a3;
}

- (void)setHasLastPcellDlBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastPcellDlBand
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)lastPcellDlBw
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_lastPcellDlBw;
  else
    return 0;
}

- (void)setLastPcellDlBw:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lastPcellDlBw = a3;
}

- (void)setHasLastPcellDlBw:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastPcellDlBw
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)lastPcellDlBwAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ED20 + a3);
}

- (int)StringAsLastPcellDlBw:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("N100")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLastScellUlBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lastScellUlBand = a3;
}

- (void)setHasLastScellUlBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastScellUlBand
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)lastScellUlBw
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_lastScellUlBw;
  else
    return 0;
}

- (void)setLastScellUlBw:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_lastScellUlBw = a3;
}

- (void)setHasLastScellUlBw:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLastScellUlBw
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)lastScellUlBwAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ED20 + a3);
}

- (int)StringAsLastScellUlBw:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("N100")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteTxPower;
  v3 = -[KCellularLteTxPower description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteTxPower dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSString *volteCallId;
  char has;
  void *v14;
  void *v16;
  uint64_t lastPcellDlBw;
  void *v18;
  void *v19;
  uint64_t lastScellUlBw;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_txPowerInfos, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_txPowerInfos, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = self->_txPowerInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tx_power_info"));
  }
  volteCallId = self->_volteCallId;
  if (volteCallId)
    objc_msgSend(v3, "setObject:forKey:", volteCallId, CFSTR("volte_call_id"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastPcellDlBand));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("last_pcell_dl_band"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  lastPcellDlBw = self->_lastPcellDlBw;
  if (lastPcellDlBw >= 6)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastPcellDlBw));
  else
    v18 = *(&off_10025ED20 + lastPcellDlBw);
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("last_pcell_dl_bw"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0)
      goto LABEL_18;
LABEL_27:
    lastScellUlBw = self->_lastScellUlBw;
    if (lastScellUlBw >= 6)
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastScellUlBw));
    else
      v21 = *(&off_10025ED20 + lastScellUlBw);
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("last_scell_ul_bw"));

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_19;
    return v3;
  }
LABEL_26:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastScellUlBand));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("last_scell_ul_band"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_18:
  if ((has & 0x20) != 0)
  {
LABEL_19:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005CBBC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSString *volteCallId;
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_txPowerInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), 2);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  volteCallId = self->_volteCallId;
  if (volteCallId)
    PBDataWriterWriteStringField(v5, volteCallId, 3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_lastPcellDlBand, 8);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field(v5, self->_lastScellUlBand, 9);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
LABEL_22:
    PBDataWriterWriteInt32Field(v5, self->_lastScellUlBw, 11);
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(v5, self->_lastPcellDlBw, 10);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_22;
LABEL_16:
  if ((has & 0x20) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v10 = v4;
  if (-[KCellularLteTxPower txPowerInfosCount](self, "txPowerInfosCount"))
  {
    objc_msgSend(v10, "clearTxPowerInfos");
    v5 = -[KCellularLteTxPower txPowerInfosCount](self, "txPowerInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteTxPower txPowerInfoAtIndex:](self, "txPowerInfoAtIndex:", i));
        objc_msgSend(v10, "addTxPowerInfo:", v8);

      }
    }
  }
  if (self->_volteCallId)
    objc_msgSend(v10, "setVolteCallId:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 4) = self->_lastPcellDlBand;
    *((_BYTE *)v10 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v10 + 6) = self->_lastScellUlBand;
  *((_BYTE *)v10 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_19:
    *((_DWORD *)v10 + 7) = self->_lastScellUlBw;
    *((_BYTE *)v10 + 56) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  *((_DWORD *)v10 + 5) = self->_lastPcellDlBw;
  *((_BYTE *)v10 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_13:
  if ((has & 0x20) != 0)
  {
LABEL_14:
    *((_DWORD *)v10 + 8) = self->_subsId;
    *((_BYTE *)v10 + 56) |= 0x20u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  void *v14;
  char has;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_txPowerInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v6, "addTxPowerInfo:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_volteCallId, "copyWithZone:", a3);
  v14 = (void *)*((_QWORD *)v6 + 6);
  *((_QWORD *)v6 + 6) = v13;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_lastPcellDlBand;
    *((_BYTE *)v6 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 6) = self->_lastScellUlBand;
  *((_BYTE *)v6 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
LABEL_20:
    *((_DWORD *)v6 + 7) = self->_lastScellUlBw;
    *((_BYTE *)v6 + 56) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v6;
    goto LABEL_15;
  }
LABEL_19:
  *((_DWORD *)v6 + 5) = self->_lastPcellDlBw;
  *((_BYTE *)v6 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_20;
LABEL_14:
  if ((has & 0x20) != 0)
  {
LABEL_15:
    *((_DWORD *)v6 + 8) = self->_subsId;
    *((_BYTE *)v6 + 56) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *txPowerInfos;
  NSString *volteCallId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_35:
    v8 = 0;
    goto LABEL_36;
  }
  txPowerInfos = self->_txPowerInfos;
  if ((unint64_t)txPowerInfos | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](txPowerInfos, "isEqual:"))
  {
    goto LABEL_35;
  }
  volteCallId = self->_volteCallId;
  if ((unint64_t)volteCallId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](volteCallId, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_lastPcellDlBand != *((_DWORD *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_lastScellUlBand != *((_DWORD *)v4 + 6))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_lastPcellDlBw != *((_DWORD *)v4 + 5))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_lastScellUlBw != *((_DWORD *)v4 + 7))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  v8 = (*((_BYTE *)v4 + 56) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_35;
    v8 = 1;
  }
LABEL_36:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSMutableArray hash](self->_txPowerInfos, "hash");
  v5 = -[NSString hash](self->_volteCallId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_lastPcellDlBand;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_lastScellUlBand;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_lastPcellDlBw;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v9 = 2654435761 * self->_lastScellUlBw;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v10 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[KCellularLteTxPower addTxPowerInfo:](self, "addTxPowerInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 6))
    -[KCellularLteTxPower setVolteCallId:](self, "setVolteCallId:");
  v11 = *((_BYTE *)v5 + 56);
  if ((v11 & 2) != 0)
  {
    self->_lastPcellDlBand = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v11 = *((_BYTE *)v5 + 56);
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v5 + 56) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_lastScellUlBand = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v11 = *((_BYTE *)v5 + 56);
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 0x10) == 0)
      goto LABEL_16;
LABEL_22:
    self->_lastScellUlBw = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v5 + 56) & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_21:
  self->_lastPcellDlBw = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v11 = *((_BYTE *)v5 + 56);
  if ((v11 & 0x10) != 0)
    goto LABEL_22;
LABEL_16:
  if ((v11 & 0x20) != 0)
  {
LABEL_17:
    self->_subsId = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_18:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)txPowerInfos
{
  return self->_txPowerInfos;
}

- (void)setTxPowerInfos:(id)a3
{
  objc_storeStrong((id *)&self->_txPowerInfos, a3);
}

- (NSString)volteCallId
{
  return self->_volteCallId;
}

- (void)setVolteCallId:(id)a3
{
  objc_storeStrong((id *)&self->_volteCallId, a3);
}

- (unsigned)lastPcellDlBand
{
  return self->_lastPcellDlBand;
}

- (unsigned)lastScellUlBand
{
  return self->_lastScellUlBand;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volteCallId, 0);
  objc_storeStrong((id *)&self->_txPowerInfos, 0);
}

@end
