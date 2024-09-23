@implementation CellularCdmaTxRxHistV2

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

- (void)clearPerBands
{
  -[NSMutableArray removeAllObjects](self->_perBands, "removeAllObjects");
}

- (void)addPerBand:(id)a3
{
  id v4;
  NSMutableArray *perBands;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  perBands = self->_perBands;
  v8 = v4;
  if (!perBands)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_perBands;
    self->_perBands = v6;

    v4 = v8;
    perBands = self->_perBands;
  }
  -[NSMutableArray addObject:](perBands, "addObject:", v4);

}

- (unint64_t)perBandsCount
{
  return (unint64_t)-[NSMutableArray count](self->_perBands, "count");
}

- (id)perBandAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_perBands, "objectAtIndex:", a3);
}

+ (Class)perBandType
{
  return (Class)objc_opt_class(CellularCdmaTxRxHist, a2);
}

- (void)setSid:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSid
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNid:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNid
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)CellularCdmaTxRxHistV2;
  v3 = -[CellularCdmaTxRxHistV2 description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCdmaTxRxHistV2 dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  if (-[NSMutableArray count](self->_perBands, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_perBands, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_perBands;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v22));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("per_band"));
  }
  v14 = (char)self->_has;
  if ((v14 & 0x20) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sid));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sid"));

    v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_16:
      if ((v14 & 8) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nid, (_QWORD)v22));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("nid"));

  v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_17:
    if ((v14 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (_QWORD)v22));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("num_subs"));

  v14 = (char)self->_has;
  if ((v14 & 0x40) == 0)
  {
LABEL_18:
    if ((v14 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_26:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (_QWORD)v22));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("subs_id"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v22));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ps_pref"));

  }
LABEL_20:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000F3FC((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_perBands;
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
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_sid, 4);
    v12 = (char)self->_has;
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0)
        goto LABEL_15;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field(v5, self->_nid, 5);
  v12 = (char)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 6);
  v12 = (char)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_subsId, 7);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 8);
LABEL_18:
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
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_duration;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  v12 = v4;
  if (-[CellularCdmaTxRxHistV2 perBandsCount](self, "perBandsCount"))
  {
    objc_msgSend(v12, "clearPerBands");
    v6 = -[CellularCdmaTxRxHistV2 perBandsCount](self, "perBandsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCdmaTxRxHistV2 perBandAtIndex:](self, "perBandAtIndex:", i));
        objc_msgSend(v12, "addPerBand:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  v11 = v12;
  if ((v10 & 0x20) != 0)
  {
    *((_DWORD *)v12 + 13) = self->_sid;
    *((_BYTE *)v12 + 60) |= 0x20u;
    v10 = (char)self->_has;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v12 + 5) = self->_nid;
  *((_BYTE *)v12 + 60) |= 4u;
  v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v12 + 6) = self->_numSubs;
  *((_BYTE *)v12 + 60) |= 8u;
  v10 = (char)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_13:
    if ((v10 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  *((_DWORD *)v12 + 14) = self->_subsId;
  *((_BYTE *)v12 + 60) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v12 + 12) = self->_psPref;
    *((_BYTE *)v12 + 60) |= 0x10u;
  }
LABEL_15:
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
    *((_BYTE *)v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_duration;
    *((_BYTE *)v5 + 60) |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_perBands;
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
        objc_msgSend(v6, "addPerBand:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = (char)self->_has;
  if ((v14 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_sid;
    *((_BYTE *)v6 + 60) |= 0x20u;
    v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_14:
      if ((v14 & 8) == 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v6 + 5) = self->_nid;
  *((_BYTE *)v6 + 60) |= 4u;
  v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_15:
    if ((v14 & 0x40) == 0)
      goto LABEL_16;
LABEL_22:
    *((_DWORD *)v6 + 14) = self->_subsId;
    *((_BYTE *)v6 + 60) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_21:
  *((_DWORD *)v6 + 6) = self->_numSubs;
  *((_BYTE *)v6 + 60) |= 8u;
  v14 = (char)self->_has;
  if ((v14 & 0x40) != 0)
    goto LABEL_22;
LABEL_16:
  if ((v14 & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_BYTE *)v6 + 60) |= 0x10u;
  }
LABEL_18:
  v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v18);
  v16 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSMutableArray *perBands;
  NSData *plmn;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 4))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_42;
  }
  perBands = self->_perBands;
  if ((unint64_t)perBands | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](perBands, "isEqual:"))
    {
LABEL_42:
      v9 = 0;
      goto LABEL_43;
    }
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_sid != *((_DWORD *)v4 + 13))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_nid != *((_DWORD *)v4 + 5))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
    v9 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v9 = 1;
LABEL_43:

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
  uint64_t v9;
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
  v5 = (unint64_t)-[NSMutableArray hash](self->_perBands, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v6 = 2654435761 * self->_sid;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_nid;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_numSubs;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_10:
  v9 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_11:
  v10 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
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
  }
  if ((v6 & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 4);
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
        -[CellularCdmaTxRxHistV2 addPerBand:](self, "addPerBand:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 60);
  if ((v12 & 0x20) != 0)
  {
    self->_sid = *((_DWORD *)v5 + 13);
    *(_BYTE *)&self->_has |= 0x20u;
    v12 = *((_BYTE *)v5 + 60);
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0)
        goto LABEL_15;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v5 + 60) & 4) == 0)
  {
    goto LABEL_14;
  }
  self->_nid = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v12 = *((_BYTE *)v5 + 60);
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  self->_numSubs = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v12 = *((_BYTE *)v5 + 60);
  if ((v12 & 0x40) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_24:
  self->_subsId = *((_DWORD *)v5 + 14);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)v5 + 60) & 0x10) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((_QWORD *)v5 + 5))
    -[CellularCdmaTxRxHistV2 setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)perBands
{
  return self->_perBands;
}

- (void)setPerBands:(id)a3
{
  objc_storeStrong((id *)&self->_perBands, a3);
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)nid
{
  return self->_nid;
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
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_perBands, 0);
}

@end
