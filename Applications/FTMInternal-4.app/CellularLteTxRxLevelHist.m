@implementation CellularLteTxRxLevelHist

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

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearTxHists
{
  -[NSMutableArray removeAllObjects](self->_txHists, "removeAllObjects");
}

- (void)addTxHist:(id)a3
{
  id v4;
  NSMutableArray *txHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txHists = self->_txHists;
  v8 = v4;
  if (!txHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_txHists;
    self->_txHists = v6;

    v4 = v8;
    txHists = self->_txHists;
  }
  -[NSMutableArray addObject:](txHists, "addObject:", v4);

}

- (unint64_t)txHistsCount
{
  return (unint64_t)-[NSMutableArray count](self->_txHists, "count");
}

- (id)txHistAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_txHists, "objectAtIndex:", a3);
}

+ (Class)txHistType
{
  return (Class)objc_opt_class(TxHist, a2);
}

- (void)clearRxHists
{
  -[NSMutableArray removeAllObjects](self->_rxHists, "removeAllObjects");
}

- (void)addRxHist:(id)a3
{
  id v4;
  NSMutableArray *rxHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rxHists = self->_rxHists;
  v8 = v4;
  if (!rxHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rxHists;
    self->_rxHists = v6;

    v4 = v8;
    rxHists = self->_rxHists;
  }
  -[NSMutableArray addObject:](rxHists, "addObject:", v4);

}

- (unint64_t)rxHistsCount
{
  return (unint64_t)-[NSMutableArray count](self->_rxHists, "count");
}

- (id)rxHistAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_rxHists, "objectAtIndex:", a3);
}

+ (Class)rxHistType
{
  return (Class)objc_opt_class(RxHist, a2);
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
  *(_BYTE *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteTxRxLevelHist;
  v3 = -[CellularLteTxRxLevelHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteTxRxLevelHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSData *plmn;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  if (-[NSMutableArray count](self->_txHists, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_txHists, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = self->_txHists;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tx_hist"));
  }
  if (-[NSMutableArray count](self->_rxHists, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_rxHists, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = self->_rxHists;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation", (_QWORD)v27));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rx_hist"));
  }
  v21 = (char)self->_has;
  if ((v21 & 4) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("num_subs"));

    v21 = (char)self->_has;
  }
  if ((v21 & 8) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("ps_pref"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100121D2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  char v17;
  NSData *plmn;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_txHists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), 5);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_rxHists;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), 7);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 12);
    v17 = (char)self->_has;
  }
  if ((v17 & 8) != 0)
    PBDataWriterWriteUint32Field(v5, self->_psPref, 13);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  _DWORD *v15;
  id v16;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_duration;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  v16 = v4;
  if (-[CellularLteTxRxLevelHist txHistsCount](self, "txHistsCount"))
  {
    objc_msgSend(v16, "clearTxHists");
    v6 = -[CellularLteTxRxLevelHist txHistsCount](self, "txHistsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteTxRxLevelHist txHistAtIndex:](self, "txHistAtIndex:", i));
        objc_msgSend(v16, "addTxHist:", v9);

      }
    }
  }
  if (-[CellularLteTxRxLevelHist rxHistsCount](self, "rxHistsCount"))
  {
    objc_msgSend(v16, "clearRxHists");
    v10 = -[CellularLteTxRxLevelHist rxHistsCount](self, "rxHistsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteTxRxLevelHist rxHistAtIndex:](self, "rxHistAtIndex:", j));
        objc_msgSend(v16, "addRxHist:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  v15 = v16;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v16 + 5) = self->_numSubs;
    *((_BYTE *)v16 + 64) |= 4u;
    v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *((_DWORD *)v16 + 8) = self->_psPref;
    *((_BYTE *)v16 + 64) |= 8u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v16, "setPlmn:");
    v15 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15[12] = self->_subsId;
    *((_BYTE *)v15 + 64) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  char has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  char v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_duration;
    *((_BYTE *)v5 + 64) |= 2u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_txHists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addTxHist:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_rxHists;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addRxHist:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  v20 = (char)self->_has;
  if ((v20 & 4) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_numSubs;
    *((_BYTE *)v6 + 64) |= 4u;
    v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_BYTE *)v6 + 64) |= 8u;
  }
  v21 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v24);
  v22 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v21;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((_BYTE *)v6 + 64) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *txHists;
  NSMutableArray *rxHists;
  char has;
  NSData *plmn;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 4))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_33;
  }
  txHists = self->_txHists;
  if ((unint64_t)txHists | *((_QWORD *)v4 + 7) && !-[NSMutableArray isEqual:](txHists, "isEqual:"))
    goto LABEL_33;
  rxHists = self->_rxHists;
  if ((unint64_t)rxHists | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](rxHists, "isEqual:"))
      goto LABEL_33;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_33;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_33:
      v10 = 0;
      goto LABEL_34;
    }
    has = (char)self->_has;
  }
  v10 = (*((_BYTE *)v4 + 64) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 12))
      goto LABEL_33;
    v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_duration;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = (unint64_t)-[NSMutableArray hash](self->_txHists, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_rxHists, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = 2654435761 * self->_numSubs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_psPref;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:
  v9 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v10 = 2654435761 * self->_subsId;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((v6 & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[CellularLteTxRxLevelHist addTxHist:](self, "addTxHist:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v5 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[CellularLteTxRxLevelHist addRxHist:](self, "addRxHist:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = *((_BYTE *)v5 + 64);
  if ((v17 & 4) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v17 = *((_BYTE *)v5 + 64);
  }
  if ((v17 & 8) != 0)
  {
    self->_psPref = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v5 + 3))
    -[CellularLteTxRxLevelHist setPlmn:](self, "setPlmn:");
  if ((*((_BYTE *)v5 + 64) & 0x10) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)txHists
{
  return self->_txHists;
}

- (void)setTxHists:(id)a3
{
  objc_storeStrong((id *)&self->_txHists, a3);
}

- (NSMutableArray)rxHists
{
  return self->_rxHists;
}

- (void)setRxHists:(id)a3
{
  objc_storeStrong((id *)&self->_rxHists, a3);
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
  objc_storeStrong((id *)&self->_txHists, 0);
  objc_storeStrong((id *)&self->_rxHists, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
