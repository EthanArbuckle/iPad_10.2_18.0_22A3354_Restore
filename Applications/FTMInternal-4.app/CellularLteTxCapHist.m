@implementation CellularLteTxCapHist

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

- (void)setHwSku:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hwSku = a3;
}

- (void)setHasHwSku:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHwSku
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHwProductId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hwProductId = a3;
}

- (void)setHasHwProductId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHwProductId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearCapHists
{
  -[NSMutableArray removeAllObjects](self->_capHists, "removeAllObjects");
}

- (void)addCapHist:(id)a3
{
  id v4;
  NSMutableArray *capHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  capHists = self->_capHists;
  v8 = v4;
  if (!capHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_capHists;
    self->_capHists = v6;

    v4 = v8;
    capHists = self->_capHists;
  }
  -[NSMutableArray addObject:](capHists, "addObject:", v4);

}

- (unint64_t)capHistsCount
{
  return (unint64_t)-[NSMutableArray count](self->_capHists, "count");
}

- (id)capHistAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_capHists, "objectAtIndex:", a3);
}

+ (Class)capHistType
{
  return (Class)objc_opt_class(TxCapHist, a2);
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteTxCapHist;
  v3 = -[CellularLteTxCapHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteTxCapHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSData *plmn;
  char v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("duration"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_26:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hwSku));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("hw_sku"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hwProductId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("hw_product_id"));

  }
LABEL_6:
  if (-[NSMutableArray count](self->_capHists, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_capHists, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_capHists;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
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
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v22));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cap_hist"));
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("num_subs"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("subs_id"));

    v15 = (char)self->_has;
  }
  if ((v15 & 0x20) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100112B64((uint64_t)self, (uint64_t)a3);
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
  NSData *plmn;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_hwSku, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field(v5, self->_hwProductId, 4);
LABEL_6:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_capHists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 7);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 8);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 9);
  v13 = (char)self->_has;
  if ((v13 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 10);
    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
    PBDataWriterWriteUint32Field(v5, self->_psPref, 11);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  char v11;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_21:
      *((_DWORD *)v4 + 8) = self->_hwSku;
      *((_BYTE *)v4 + 56) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_duration;
  *((_BYTE *)v4 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 7) = self->_hwProductId;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_6:
  v12 = v4;
  if (-[CellularLteTxCapHist capHistsCount](self, "capHistsCount"))
  {
    objc_msgSend(v12, "clearCapHists");
    v6 = -[CellularLteTxCapHist capHistsCount](self, "capHistsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteTxCapHist capHistAtIndex:](self, "capHistAtIndex:", i));
        objc_msgSend(v12, "addCapHist:", v9);

      }
    }
  }
  v10 = v12;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v12 + 9) = self->_numSubs;
    *((_BYTE *)v12 + 56) |= 0x10u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v12, "setPlmn:");
    v10 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v10[13] = self->_subsId;
    *((_BYTE *)v10 + 56) |= 0x40u;
    v11 = (char)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    v10[12] = self->_psPref;
    *((_BYTE *)v10 + 56) |= 0x20u;
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
  id v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_duration;
  *((_BYTE *)v5 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  *((_DWORD *)v5 + 8) = self->_hwSku;
  *((_BYTE *)v5 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 7) = self->_hwProductId;
    *((_BYTE *)v5 + 56) |= 4u;
  }
LABEL_6:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_capHists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addCapHist:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 9) = self->_numSubs;
    *((_BYTE *)v6 + 56) |= 0x10u;
  }
  v14 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v18);
  v15 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v14;

  v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_subsId;
    *((_BYTE *)v6 + 56) |= 0x40u;
    v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_BYTE *)v6 + 56) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSMutableArray *capHists;
  NSData *plmn;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_hwSku != *((_DWORD *)v4 + 8))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_hwProductId != *((_DWORD *)v4 + 7))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_42;
  }
  capHists = self->_capHists;
  if ((unint64_t)capHists | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](capHists, "isEqual:"))
      goto LABEL_42;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 9))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_33;
    }
LABEL_42:
    v9 = 0;
    goto LABEL_43;
  }
LABEL_33:
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 13))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  v9 = (*((_BYTE *)v4 + 56) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_42;
    v9 = 1;
  }
LABEL_43:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_duration;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_hwSku;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_hwProductId;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = (unint64_t)-[NSMutableArray hash](self->_capHists, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v8 = 2654435761 * self->_numSubs;
  else
    v8 = 0;
  v9 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v10 = 2654435761 * self->_subsId;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_15;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_15:
  v11 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _DWORD *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 56);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_24:
  self->_hwSku = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_5:
    self->_hwProductId = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[CellularLteTxCapHist addCapHist:](self, "addCapHist:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((v5[14] & 0x10) != 0)
  {
    self->_numSubs = v5[9];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 5))
    -[CellularLteTxCapHist setPlmn:](self, "setPlmn:");
  v12 = *((_BYTE *)v5 + 56);
  if ((v12 & 0x40) != 0)
  {
    self->_subsId = v5[13];
    *(_BYTE *)&self->_has |= 0x40u;
    v12 = *((_BYTE *)v5 + 56);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_psPref = v5[12];
    *(_BYTE *)&self->_has |= 0x20u;
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

- (unsigned)hwSku
{
  return self->_hwSku;
}

- (unsigned)hwProductId
{
  return self->_hwProductId;
}

- (NSMutableArray)capHists
{
  return self->_capHists;
}

- (void)setCapHists:(id)a3
{
  objc_storeStrong((id *)&self->_capHists, a3);
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
  objc_storeStrong((id *)&self->_capHists, 0);
}

@end
