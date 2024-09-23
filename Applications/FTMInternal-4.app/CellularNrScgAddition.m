@implementation CellularNrScgAddition

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

- (void)setReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResult
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsSrb3Configured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSrb3Configured = a3;
}

- (void)setHasIsSrb3Configured:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSrb3Configured
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearDrbConfigs
{
  -[NSMutableArray removeAllObjects](self->_drbConfigs, "removeAllObjects");
}

- (void)addDrbConfig:(id)a3
{
  id v4;
  NSMutableArray *drbConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  drbConfigs = self->_drbConfigs;
  v8 = v4;
  if (!drbConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_drbConfigs;
    self->_drbConfigs = v6;

    v4 = v8;
    drbConfigs = self->_drbConfigs;
  }
  -[NSMutableArray addObject:](drbConfigs, "addObject:", v4);

}

- (unint64_t)drbConfigsCount
{
  return (unint64_t)-[NSMutableArray count](self->_drbConfigs, "count");
}

- (id)drbConfigAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_drbConfigs, "objectAtIndex:", a3);
}

+ (Class)drbConfigType
{
  return (Class)objc_opt_class(DrbConfig, a2);
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFreqRange
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFreqBandInd
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)CellularNrScgAddition;
  v3 = -[CellularNrScgAddition description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrScgAddition dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int16 v13;
  void *v14;
  NSData *plmn;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reason));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("reason"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_26:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_result));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("result"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isSrb3Configured));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("is_srb3_configured"));

  }
LABEL_6:
  if (-[NSMutableArray count](self->_drbConfigs, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_drbConfigs, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_drbConfigs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v24));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("drb_config"));
  }
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqRange));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("freq_range"));

    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_17:
      if ((v13 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_30;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_17;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd, (_QWORD)v24));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("freq_band_ind"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_18:
    if ((v13 & 8) == 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (_QWORD)v24));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("subs_id"));

  v13 = (__int16)self->_has;
  if ((v13 & 8) == 0)
  {
LABEL_19:
    if ((v13 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_31:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (_QWORD)v24));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v24));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ps_pref"));

  }
LABEL_21:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100038730((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  NSData *plmn;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_reason, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v5, self->_result, 4);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField(v5, self->_isSrb3Configured, 5);
LABEL_6:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_drbConfigs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), 6);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (__int16)self->_has;
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_freqRange, 7);
    v12 = (__int16)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0)
        goto LABEL_16;
      goto LABEL_29;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field(v5, self->_freqBandInd, 8);
  v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 12);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 13);
LABEL_18:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 14);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  _DWORD *v11;
  id v12;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 34) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
LABEL_22:
      *((_DWORD *)v4 + 14) = self->_result;
      *((_WORD *)v4 + 34) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x100) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_22;
LABEL_4:
  if ((has & 0x100) != 0)
  {
LABEL_5:
    *((_BYTE *)v4 + 64) = self->_isSrb3Configured;
    *((_WORD *)v4 + 34) |= 0x100u;
  }
LABEL_6:
  v12 = v4;
  if (-[CellularNrScgAddition drbConfigsCount](self, "drbConfigsCount"))
  {
    objc_msgSend(v12, "clearDrbConfigs");
    v6 = -[CellularNrScgAddition drbConfigsCount](self, "drbConfigsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrScgAddition drbConfigAtIndex:](self, "drbConfigAtIndex:", i));
        objc_msgSend(v12, "addDrbConfig:", v9);

      }
    }
  }
  v10 = (__int16)self->_has;
  v11 = v12;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v12 + 7) = self->_freqRange;
    *((_WORD *)v12 + 34) |= 4u;
    v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_12:
      if ((v10 & 8) == 0)
        goto LABEL_13;
      goto LABEL_26;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v12 + 6) = self->_freqBandInd;
  *((_WORD *)v12 + 34) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_13:
    if ((v10 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  *((_DWORD *)v12 + 8) = self->_numSubs;
  *((_WORD *)v12 + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v12 + 12) = self->_psPref;
    *((_WORD *)v12 + 34) |= 0x10u;
  }
LABEL_15:
  if (self->_plmn)
  {
    objc_msgSend(v12, "setPlmn:");
    v11 = v12;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v11[15] = self->_subsId;
    *((_WORD *)v11 + 34) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  __int16 has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int16 v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 34) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  *((_DWORD *)v5 + 14) = self->_result;
  *((_WORD *)v5 + 34) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    *((_BYTE *)v5 + 64) = self->_isSrb3Configured;
    *((_WORD *)v5 + 34) |= 0x100u;
  }
LABEL_6:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_drbConfigs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addDrbConfig:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_freqRange;
    *((_WORD *)v6 + 34) |= 4u;
    v14 = (__int16)self->_has;
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 8) == 0)
        goto LABEL_16;
      goto LABEL_27;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 6) = self->_freqBandInd;
  *((_WORD *)v6 + 34) |= 2u;
  v14 = (__int16)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_16:
    if ((v14 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_27:
  *((_DWORD *)v6 + 8) = self->_numSubs;
  *((_WORD *)v6 + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_WORD *)v6 + 34) |= 0x10u;
  }
LABEL_18:
  v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v18);
  v16 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v15;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_subsId;
    *((_WORD *)v6 + 34) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *drbConfigs;
  __int16 v9;
  NSData *plmn;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_56;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 34);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_56;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_reason != *((_DWORD *)v4 + 13))
      goto LABEL_56;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_result != *((_DWORD *)v4 + 14))
      goto LABEL_56;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) == 0)
      goto LABEL_56;
    if (self->_isSrb3Configured)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  drbConfigs = self->_drbConfigs;
  if ((unint64_t)drbConfigs | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](drbConfigs, "isEqual:"))
      goto LABEL_56;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 34);
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_freqRange != *((_DWORD *)v4 + 7))
      goto LABEL_56;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 6))
      goto LABEL_56;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 8))
      goto LABEL_56;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_56;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (__int16)self->_has;
      goto LABEL_51;
    }
LABEL_56:
    v12 = 0;
    goto LABEL_57;
  }
LABEL_51:
  v11 = *((_WORD *)v4 + 34);
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 15))
      goto LABEL_56;
    v12 = 1;
  }
  else
  {
    v12 = (v11 & 0x80) == 0;
  }
LABEL_57:

  return v12;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v17 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_reason;
      if ((has & 0x40) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v17 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_result;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isSrb3Configured;
    goto LABEL_10;
  }
LABEL_9:
  v5 = 0;
LABEL_10:
  v6 = (unint64_t)-[NSMutableArray hash](self->_drbConfigs, "hash", v15);
  v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    v8 = 2654435761 * self->_freqRange;
    if ((v7 & 2) != 0)
    {
LABEL_12:
      v9 = 2654435761 * self->_freqBandInd;
      if ((v7 & 8) != 0)
        goto LABEL_13;
LABEL_17:
      v10 = 0;
      if ((v7 & 0x10) != 0)
        goto LABEL_14;
      goto LABEL_18;
    }
  }
  else
  {
    v8 = 0;
    if ((v7 & 2) != 0)
      goto LABEL_12;
  }
  v9 = 0;
  if ((v7 & 8) == 0)
    goto LABEL_17;
LABEL_13:
  v10 = 2654435761 * self->_numSubs;
  if ((v7 & 0x10) != 0)
  {
LABEL_14:
    v11 = 2654435761 * self->_psPref;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
LABEL_19:
  v12 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v13 = 2654435761 * self->_subsId;
  else
    v13 = 0;
  return v16 ^ v17 ^ v4 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 34);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 34);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 34);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  self->_result = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
LABEL_5:
    self->_isSrb3Configured = *((_BYTE *)v4 + 64);
    *(_WORD *)&self->_has |= 0x100u;
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
        -[CellularNrScgAddition addDrbConfig:](self, "addDrbConfig:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_WORD *)v5 + 34);
  if ((v12 & 4) != 0)
  {
    self->_freqRange = *((_DWORD *)v5 + 7);
    *(_WORD *)&self->_has |= 4u;
    v12 = *((_WORD *)v5 + 34);
    if ((v12 & 2) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0)
        goto LABEL_16;
      goto LABEL_29;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_freqBandInd = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  v12 = *((_WORD *)v5 + 34);
  if ((v12 & 8) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  self->_numSubs = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 34) & 0x10) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 12);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((_QWORD *)v5 + 5))
    -[CellularNrScgAddition setPlmn:](self, "setPlmn:");
  if ((*((_WORD *)v5 + 34) & 0x80) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 15);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)result
{
  return self->_result;
}

- (BOOL)isSrb3Configured
{
  return self->_isSrb3Configured;
}

- (NSMutableArray)drbConfigs
{
  return self->_drbConfigs;
}

- (void)setDrbConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_drbConfigs, a3);
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
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
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_drbConfigs, 0);
}

@end
