@implementation CellularServiceStatusHist

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

- (void)clearSrvStats
{
  -[NSMutableArray removeAllObjects](self->_srvStats, "removeAllObjects");
}

- (void)addSrvStat:(id)a3
{
  id v4;
  NSMutableArray *srvStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  srvStats = self->_srvStats;
  v8 = v4;
  if (!srvStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_srvStats;
    self->_srvStats = v6;

    v4 = v8;
    srvStats = self->_srvStats;
  }
  -[NSMutableArray addObject:](srvStats, "addObject:", v4);

}

- (unint64_t)srvStatsCount
{
  return (unint64_t)-[NSMutableArray count](self->_srvStats, "count");
}

- (id)srvStatAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_srvStats, "objectAtIndex:", a3);
}

+ (Class)srvStatType
{
  return (Class)objc_opt_class(SrvStatDuration, a2);
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

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
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
  v8.super_class = (Class)CellularServiceStatusHist;
  v3 = -[CellularServiceStatusHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularServiceStatusHist dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v14;
  NSData *simHplmn;
  char v16;
  void *v17;
  void *v18;
  NSData *plmn;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

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
  if (-[NSMutableArray count](self->_srvStats, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_srvStats, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = self->_srvStats;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v21));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("srv_stat"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("num_subs"));

  }
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("subs_id"));

    v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ps_pref"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009CDD4((uint64_t)self, (uint64_t)a3);
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
  NSData *simHplmn;
  char v13;
  NSData *plmn;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

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
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_srvStats;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), 4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 5);
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v5, simHplmn, 6);
  v13 = (char)self->_has;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 7);
    v13 = (char)self->_has;
  }
  if ((v13 & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_psPref, 8);
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
  _DWORD *v10;
  char v11;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_totalDurationMs;
    *((_BYTE *)v4 + 64) |= 0x10u;
  }
  v12 = v4;
  if (-[CellularServiceStatusHist srvStatsCount](self, "srvStatsCount"))
  {
    objc_msgSend(v12, "clearSrvStats");
    v6 = -[CellularServiceStatusHist srvStatsCount](self, "srvStatsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularServiceStatusHist srvStatAtIndex:](self, "srvStatAtIndex:", i));
        objc_msgSend(v12, "addSrvStat:", v9);

      }
    }
  }
  v10 = v12;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v12 + 4) = self->_numSubs;
    *((_BYTE *)v12 + 64) |= 2u;
  }
  if (self->_simHplmn)
  {
    objc_msgSend(v12, "setSimHplmn:");
    v10 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    v10[14] = self->_subsId;
    *((_BYTE *)v10 + 64) |= 8u;
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    v10[8] = self->_psPref;
    *((_BYTE *)v10 + 64) |= 4u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v12, "setPlmn:");
    v10 = v12;
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
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_totalDurationMs;
    *((_BYTE *)v5 + 64) |= 0x10u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_srvStats;
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
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addSrvStat:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_numSubs;
    *((_BYTE *)v6 + 64) |= 2u;
  }
  v14 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3, (_QWORD)v20);
  v15 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v14;

  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_subsId;
    *((_BYTE *)v6 + 64) |= 8u;
    v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_BYTE *)v6 + 64) |= 4u;
  }
  v17 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v18 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSMutableArray *srvStats;
  NSData *simHplmn;
  NSData *plmn;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_35;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_totalDurationMs != *((_DWORD *)v4 + 15))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  srvStats = self->_srvStats;
  if ((unint64_t)srvStats | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](srvStats, "isEqual:"))
      goto LABEL_35;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_35;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 5))
  {
    if (-[NSData isEqual:](simHplmn, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_35:
    v10 = 0;
    goto LABEL_36;
  }
LABEL_23:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_35;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
    v10 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v10 = 1;
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  v5 = (unint64_t)-[NSMutableArray hash](self->_srvStats, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_numSubs;
  else
    v6 = 0;
  v7 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v8 = 2654435761 * self->_subsId;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v9 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
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
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_totalDurationMs = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 6);
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
        -[CellularServiceStatusHist addSrvStat:](self, "addSrvStat:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((v5[16] & 2) != 0)
  {
    self->_numSubs = v5[4];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 5))
    -[CellularServiceStatusHist setSimHplmn:](self, "setSimHplmn:");
  v12 = *((_BYTE *)v5 + 64);
  if ((v12 & 8) != 0)
  {
    self->_subsId = v5[14];
    *(_BYTE *)&self->_has |= 8u;
    v12 = *((_BYTE *)v5 + 64);
  }
  if ((v12 & 4) != 0)
  {
    self->_psPref = v5[8];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 3))
    -[CellularServiceStatusHist setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDurationMs
{
  return self->_totalDurationMs;
}

- (NSMutableArray)srvStats
{
  return self->_srvStats;
}

- (void)setSrvStats:(id)a3
{
  objc_storeStrong((id *)&self->_srvStats, a3);
}

- (unsigned)numSubs
{
  return self->_numSubs;
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
  objc_storeStrong((id *)&self->_srvStats, 0);
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
