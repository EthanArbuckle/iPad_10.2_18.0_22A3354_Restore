@implementation CellularNrUlPdcpStats

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

- (void)clearDrbs
{
  -[NSMutableArray removeAllObjects](self->_drbs, "removeAllObjects");
}

- (void)addDrb:(id)a3
{
  id v4;
  NSMutableArray *drbs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  drbs = self->_drbs;
  v8 = v4;
  if (!drbs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_drbs;
    self->_drbs = v6;

    v4 = v8;
    drbs = self->_drbs;
  }
  -[NSMutableArray addObject:](drbs, "addObject:", v4);

}

- (unint64_t)drbsCount
{
  return (unint64_t)-[NSMutableArray count](self->_drbs, "count");
}

- (id)drbAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_drbs, "objectAtIndex:", a3);
}

+ (Class)drbType
{
  return (Class)objc_opt_class(RbInfo, a2);
}

- (void)clearSrbs
{
  -[NSMutableArray removeAllObjects](self->_srbs, "removeAllObjects");
}

- (void)addSrb:(id)a3
{
  id v4;
  NSMutableArray *srbs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  srbs = self->_srbs;
  v8 = v4;
  if (!srbs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_srbs;
    self->_srbs = v6;

    v4 = v8;
    srbs = self->_srbs;
  }
  -[NSMutableArray addObject:](srbs, "addObject:", v4);

}

- (unint64_t)srbsCount
{
  return (unint64_t)-[NSMutableArray count](self->_srbs, "count");
}

- (id)srbAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_srbs, "objectAtIndex:", a3);
}

+ (Class)srbType
{
  return (Class)objc_opt_class(RbInfo, a2);
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
  v8.super_class = (Class)CellularNrUlPdcpStats;
  v3 = -[CellularNrUlPdcpStats description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrUlPdcpStats dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  char has;
  void *v20;
  NSData *plmn;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_drbs, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_drbs, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = self->_drbs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("drb"));
  }
  if (-[NSMutableArray count](self->_srbs, "count"))
  {
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_srbs, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = self->_srbs;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation", (_QWORD)v25));
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("srb"));
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("subs_id"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (_QWORD)v25));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_24:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v25));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ps_pref"));

  }
LABEL_25:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E8248((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  char has;
  NSData *plmn;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_drbs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
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
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), 3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_srbs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), 4);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 5);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_19:
      if ((has & 4) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 6);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 7);
LABEL_21:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 8);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  char has;
  void *v14;
  id v15;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v15 = v4;
  if (-[CellularNrUlPdcpStats drbsCount](self, "drbsCount"))
  {
    objc_msgSend(v15, "clearDrbs");
    v5 = -[CellularNrUlPdcpStats drbsCount](self, "drbsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrUlPdcpStats drbAtIndex:](self, "drbAtIndex:", i));
        objc_msgSend(v15, "addDrb:", v8);

      }
    }
  }
  if (-[CellularNrUlPdcpStats srbsCount](self, "srbsCount"))
  {
    objc_msgSend(v15, "clearSrbs");
    v9 = -[CellularNrUlPdcpStats srbsCount](self, "srbsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrUlPdcpStats srbAtIndex:](self, "srbAtIndex:", j));
        objc_msgSend(v15, "addSrb:", v12);

      }
    }
  }
  has = (char)self->_has;
  v14 = v15;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v15 + 14) = self->_subsId;
    *((_BYTE *)v15 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v15 + 6) = self->_numSubs;
  *((_BYTE *)v15 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_14:
    *((_DWORD *)v15 + 10) = self->_psPref;
    *((_BYTE *)v15 + 60) |= 4u;
  }
LABEL_15:
  if (self->_plmn)
  {
    objc_msgSend(v15, "setPlmn:");
    v14 = v15;
  }

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
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  char has;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 60) |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_drbs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addDrb:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_srbs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v6, "addSrb:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_19;
LABEL_23:
    *((_DWORD *)v6 + 6) = self->_numSubs;
    *((_BYTE *)v6 + 60) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((_BYTE *)v6 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_19:
  if ((has & 4) != 0)
  {
LABEL_20:
    *((_DWORD *)v6 + 10) = self->_psPref;
    *((_BYTE *)v6 + 60) |= 4u;
  }
LABEL_21:
  v20 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v23);
  v21 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v20;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *drbs;
  NSMutableArray *srbs;
  NSData *plmn;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_28:
    v9 = 0;
    goto LABEL_29;
  }
  drbs = self->_drbs;
  if ((unint64_t)drbs | *((_QWORD *)v4 + 2) && !-[NSMutableArray isEqual:](drbs, "isEqual:"))
    goto LABEL_28;
  srbs = self->_srbs;
  if ((unint64_t)srbs | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](srbs, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 6))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 10))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 4))
    v9 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v9 = 1;
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSMutableArray hash](self->_drbs, "hash");
  v5 = (unint64_t)-[NSMutableArray hash](self->_srbs, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v6 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
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
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[CellularNrUlPdcpStats addDrb:](self, "addDrb:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v5 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[CellularNrUlPdcpStats addSrb:](self, "addSrb:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = *((_BYTE *)v5 + 60);
  if ((v16 & 8) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v16 = *((_BYTE *)v5 + 60);
    if ((v16 & 2) == 0)
    {
LABEL_19:
      if ((v16 & 4) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v5 + 60) & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_numSubs = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v5 + 60) & 4) != 0)
  {
LABEL_20:
    self->_psPref = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_21:
  if (*((_QWORD *)v5 + 4))
    -[CellularNrUlPdcpStats setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)drbs
{
  return self->_drbs;
}

- (void)setDrbs:(id)a3
{
  objc_storeStrong((id *)&self->_drbs, a3);
}

- (NSMutableArray)srbs
{
  return self->_srbs;
}

- (void)setSrbs:(id)a3
{
  objc_storeStrong((id *)&self->_srbs, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srbs, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_drbs, 0);
}

@end
