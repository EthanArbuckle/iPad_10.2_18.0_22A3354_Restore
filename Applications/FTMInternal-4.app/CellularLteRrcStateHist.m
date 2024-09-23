@implementation CellularLteRrcStateHist

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

- (void)setTotalDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalDurationMs = a3;
}

- (void)setHasTotalDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalDurationMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearStateHists
{
  -[NSMutableArray removeAllObjects](self->_stateHists, "removeAllObjects");
}

- (void)addStateHist:(id)a3
{
  id v4;
  NSMutableArray *stateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stateHists = self->_stateHists;
  v8 = v4;
  if (!stateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stateHists;
    self->_stateHists = v6;

    v4 = v8;
    stateHists = self->_stateHists;
  }
  -[NSMutableArray addObject:](stateHists, "addObject:", v4);

}

- (unint64_t)stateHistsCount
{
  return (unint64_t)-[NSMutableArray count](self->_stateHists, "count");
}

- (id)stateHistAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_stateHists, "objectAtIndex:", a3);
}

+ (Class)stateHistType
{
  return (Class)objc_opt_class(StateHist, a2);
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

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)CellularLteRrcStateHist;
  v3 = -[CellularLteRrcStateHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRrcStateHist dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  char v14;
  void *v15;
  NSData *plmn;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalDurationMs));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("total_duration_ms"));

  }
  if (-[NSMutableArray count](self->_stateHists, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_stateHists, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = self->_stateHists;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v20));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("state_hist"));
  }
  v14 = (char)self->_has;
  if ((v14 & 2) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("num_subs"));

    v14 = (char)self->_has;
    if ((v14 & 8) == 0)
    {
LABEL_16:
      if ((v14 & 4) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_16;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (_QWORD)v20));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("subs_id"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_17:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v20));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ps_pref"));

  }
LABEL_18:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100083700((uint64_t)self, (uint64_t)a3);
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
  char v12;
  NSData *plmn;
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
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteUint32Field(v5, self->_totalDurationMs, 2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_stateHists;
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
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 5);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 6);
    v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_14:
      if ((v12 & 4) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field(v5, self->_subsId, 7);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 8);
LABEL_16:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 9);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_totalDurationMs;
    *((_BYTE *)v4 + 56) |= 0x10u;
  }
  v12 = v4;
  if (-[CellularLteRrcStateHist stateHistsCount](self, "stateHistsCount"))
  {
    objc_msgSend(v12, "clearStateHists");
    v6 = -[CellularLteRrcStateHist stateHistsCount](self, "stateHistsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRrcStateHist stateHistAtIndex:](self, "stateHistAtIndex:", i));
        objc_msgSend(v12, "addStateHist:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  v11 = v12;
  if ((v10 & 2) != 0)
  {
    *((_DWORD *)v12 + 4) = self->_numSubs;
    *((_BYTE *)v12 + 56) |= 2u;
    v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_11:
      if ((v10 & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v12 + 12) = self->_subsId;
  *((_BYTE *)v12 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v12 + 8) = self->_psPref;
    *((_BYTE *)v12 + 56) |= 4u;
  }
LABEL_13:
  if (self->_plmn)
  {
    objc_msgSend(v12, "setPlmn:");
    v11 = v12;
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
  char v14;
  id v15;
  void *v16;
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
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_totalDurationMs;
    *((_BYTE *)v5 + 56) |= 0x10u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_stateHists;
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
        objc_msgSend(v6, "addStateHist:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = (char)self->_has;
  if ((v14 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((_BYTE *)v6 + 56) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 4) = self->_numSubs;
  *((_BYTE *)v6 + 56) |= 2u;
  v14 = (char)self->_has;
  if ((v14 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v14 & 4) != 0)
  {
LABEL_15:
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_BYTE *)v6 + 56) |= 4u;
  }
LABEL_16:
  v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v18);
  v16 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSMutableArray *stateHists;
  NSData *plmn;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_32;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_totalDurationMs != *((_DWORD *)v4 + 13))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  stateHists = self->_stateHists;
  if ((unint64_t)stateHists | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stateHists, "isEqual:"))
    {
LABEL_32:
      v9 = 0;
      goto LABEL_33;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 12))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_32;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v9 = 1;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_totalDurationMs;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = (unint64_t)-[NSMutableArray hash](self->_stateHists, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v6 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
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
  }
  if ((v6 & 0x10) != 0)
  {
    self->_totalDurationMs = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 5);
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
        -[CellularLteRrcStateHist addStateHist:](self, "addStateHist:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 56);
  if ((v12 & 2) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v12 = *((_BYTE *)v5 + 56);
    if ((v12 & 8) == 0)
    {
LABEL_14:
      if ((v12 & 4) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v5 + 56) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_subsId = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v5 + 56) & 4) != 0)
  {
LABEL_15:
    self->_psPref = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_16:
  if (*((_QWORD *)v5 + 3))
    -[CellularLteRrcStateHist setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDurationMs
{
  return self->_totalDurationMs;
}

- (NSMutableArray)stateHists
{
  return self->_stateHists;
}

- (void)setStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_stateHists, a3);
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
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
  objc_storeStrong((id *)&self->_stateHists, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
