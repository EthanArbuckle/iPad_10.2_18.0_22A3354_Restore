@implementation CellularUmtsRrcStateHist

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

- (void)setWcdma:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_wcdma = a3;
}

- (void)setHasWcdma:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWcdma
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularUmtsRrcStateHist;
  v3 = -[CellularUmtsRrcStateHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularUmtsRrcStateHist dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalDurationMs));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("total_duration_ms"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_wcdma));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wcdma"));

  }
LABEL_5:
  if (-[NSMutableArray count](self->_stateHists, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_stateHists, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_stateHists;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v21));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("state_hist"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("num_subs"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("subs_id"));

    v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100069810((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSData *plmn;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
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
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_totalDurationMs, 2);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField(v5, self->_wcdma, 3);
LABEL_5:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_stateHists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 5);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = (char)self->_has;
  if ((v13 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_16;
LABEL_23:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 7);
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 6);
  v13 = (char)self->_has;
  if ((v13 & 8) != 0)
    goto LABEL_23;
LABEL_16:
  if ((v13 & 4) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 8);
LABEL_18:

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
  id v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_totalDurationMs;
  *((_BYTE *)v4 + 60) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 56) = self->_wcdma;
    *((_BYTE *)v4 + 60) |= 0x20u;
  }
LABEL_5:
  v11 = v4;
  if (self->_plmn)
    objc_msgSend(v4, "setPlmn:");
  if (-[CellularUmtsRrcStateHist stateHistsCount](self, "stateHistsCount"))
  {
    objc_msgSend(v11, "clearStateHists");
    v6 = -[CellularUmtsRrcStateHist stateHistsCount](self, "stateHistsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularUmtsRrcStateHist stateHistAtIndex:](self, "stateHistAtIndex:", i));
        objc_msgSend(v11, "addStateHist:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_13;
LABEL_20:
    *((_DWORD *)v11 + 12) = self->_subsId;
    *((_BYTE *)v11 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 4) = self->_numSubs;
  *((_BYTE *)v11 + 60) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v10 & 4) != 0)
  {
LABEL_14:
    *((_DWORD *)v11 + 8) = self->_psPref;
    *((_BYTE *)v11 + 60) |= 4u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
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
    *((_BYTE *)v5 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_totalDurationMs;
  *((_BYTE *)v5 + 60) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 56) = self->_wcdma;
    *((_BYTE *)v5 + 60) |= 0x20u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_stateHists;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addStateHist:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (char)self->_has;
  if ((v16 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_21:
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((_BYTE *)v6 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v6;
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 4) = self->_numSubs;
  *((_BYTE *)v6 + 60) |= 2u;
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
    goto LABEL_21;
LABEL_14:
  if ((v16 & 4) != 0)
  {
LABEL_15:
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_BYTE *)v6 + 60) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *plmn;
  NSMutableArray *stateHists;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_totalDurationMs != *((_DWORD *)v4 + 13))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    {
      if (self->_wcdma)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_38;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_20;
    }
LABEL_38:
    v8 = 0;
    goto LABEL_39;
  }
  if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
    goto LABEL_38;
LABEL_20:
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](plmn, "isEqual:"))
    goto LABEL_38;
  stateHists = self->_stateHists;
  if ((unint64_t)stateHists | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stateHists, "isEqual:"))
      goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 12))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_38;
  }
  v8 = (*((_BYTE *)v4 + 60) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_38;
    v8 = 1;
  }
LABEL_39:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_totalDurationMs;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_wcdma;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v7 = (unint64_t)-[NSMutableArray hash](self->_stateHists, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v9 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_psPref;
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
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 60);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_totalDurationMs = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
  {
LABEL_4:
    self->_wcdma = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 3))
    -[CellularUmtsRrcStateHist setPlmn:](self, "setPlmn:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v5 + 5);
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
        -[CellularUmtsRrcStateHist addStateHist:](self, "addStateHist:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 60);
  if ((v12 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 60) & 8) == 0)
      goto LABEL_16;
LABEL_23:
    self->_subsId = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v5 + 60) & 4) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  self->_numSubs = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v12 = *((_BYTE *)v5 + 60);
  if ((v12 & 8) != 0)
    goto LABEL_23;
LABEL_16:
  if ((v12 & 4) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_18:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDurationMs
{
  return self->_totalDurationMs;
}

- (BOOL)wcdma
{
  return self->_wcdma;
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
  objc_storeStrong((id *)&self->_stateHists, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
