@implementation CellularNrSysInfoBlocks

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

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_freq = a3;
}

- (void)setHasFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFreq
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPhyCellId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setValueTag:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_valueTag = a3;
}

- (void)setHasValueTag:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasValueTag
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasMib
{
  return self->_mib != 0;
}

- (void)clearSibs
{
  -[NSMutableArray removeAllObjects](self->_sibs, "removeAllObjects");
}

- (void)addSib:(id)a3
{
  id v4;
  NSMutableArray *sibs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sibs = self->_sibs;
  v8 = v4;
  if (!sibs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_sibs;
    self->_sibs = v6;

    v4 = v8;
    sibs = self->_sibs;
  }
  -[NSMutableArray addObject:](sibs, "addObject:", v4);

}

- (unint64_t)sibsCount
{
  return (unint64_t)-[NSMutableArray count](self->_sibs, "count");
}

- (id)sibAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_sibs, "objectAtIndex:", a3);
}

+ (Class)sibType
{
  return (Class)objc_opt_class(Sib, a2);
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFreqBandInd
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTrackingAreaCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSelPlmnMcc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSelPlmnMnc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrSysInfoBlocks;
  v3 = -[CellularNrSysInfoBlocks description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrSysInfoBlocks dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  Mib *mib;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int16 v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cell_id"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freq));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("freq"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_31:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("phy_cell_id"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_valueTag));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value_tag"));

  }
LABEL_7:
  mib = self->_mib;
  if (mib)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Mib dictionaryRepresentation](mib, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mib"));

  }
  if (-[NSMutableArray count](self->_sibs, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_sibs, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = self->_sibs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v29));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sib"));
  }
  v15 = (__int16)self->_has;
  if ((v15 & 8) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("freq_band_ind"));

    v15 = (__int16)self->_has;
    if ((v15 & 0x800) == 0)
    {
LABEL_20:
      if ((v15 & 0x100) == 0)
        goto LABEL_21;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_20;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode, (_QWORD)v29));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("tracking_area_code"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x100) == 0)
  {
LABEL_21:
    if ((v15 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc, (_QWORD)v29));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("sel_plmn_mcc"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x200) == 0)
  {
LABEL_22:
    if ((v15 & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc, (_QWORD)v29));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sel_plmn_mnc"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x10) == 0)
  {
LABEL_23:
    if ((v15 & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits, (_QWORD)v29));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("num_mnc_digits"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x400) == 0)
  {
LABEL_24:
    if ((v15 & 0x20) == 0)
      goto LABEL_25;
LABEL_39:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (_QWORD)v29));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("num_subs"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_26;
  }
LABEL_38:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (_QWORD)v29));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("subs_id"));

  v15 = (__int16)self->_has;
  if ((v15 & 0x20) != 0)
    goto LABEL_39;
LABEL_25:
  if ((v15 & 0x80) != 0)
  {
LABEL_26:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v29));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100139C2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  Mib *mib;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int16 v13;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_cellId, 2);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v5, self->_freq, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_phyCellId, 4);
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v5, self->_valueTag, 5);
LABEL_7:
  mib = self->_mib;
  if (mib)
    PBDataWriterWriteSubmessage(v5, mib, 7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_sibs;
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
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 9);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_freqBandInd, 18);
    v13 = (__int16)self->_has;
    if ((v13 & 0x800) == 0)
    {
LABEL_18:
      if ((v13 & 0x100) == 0)
        goto LABEL_19;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field(v5, self->_trackingAreaCode, 19);
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_19:
    if ((v13 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v5, self->_selPlmnMcc, 20);
  v13 = (__int16)self->_has;
  if ((v13 & 0x200) == 0)
  {
LABEL_20:
    if ((v13 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v5, self->_selPlmnMnc, 21);
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_21:
    if ((v13 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v5, self->_numMncDigits, 22);
  v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_22:
    if ((v13 & 0x20) == 0)
      goto LABEL_23;
LABEL_37:
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 24);
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v5, self->_subsId, 23);
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
    goto LABEL_37;
LABEL_23:
  if ((v13 & 0x80) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 25);
LABEL_25:

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
  id v11;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 42) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_WORD *)v4 + 42) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 5) = self->_freq;
  *((_WORD *)v4 + 42) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_26:
  *((_DWORD *)v4 + 12) = self->_phyCellId;
  *((_WORD *)v4 + 42) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 20) = self->_valueTag;
    *((_WORD *)v4 + 42) |= 0x1000u;
  }
LABEL_7:
  v11 = v4;
  if (self->_mib)
    objc_msgSend(v4, "setMib:");
  if (-[CellularNrSysInfoBlocks sibsCount](self, "sibsCount"))
  {
    objc_msgSend(v11, "clearSibs");
    v6 = -[CellularNrSysInfoBlocks sibsCount](self, "sibsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrSysInfoBlocks sibAtIndex:](self, "sibAtIndex:", i));
        objc_msgSend(v11, "addSib:", v9);

      }
    }
  }
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v11 + 6) = self->_freqBandInd;
    *((_WORD *)v11 + 42) |= 8u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x800) == 0)
    {
LABEL_15:
      if ((v10 & 0x100) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v11 + 19) = self->_trackingAreaCode;
  *((_WORD *)v11 + 42) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_16:
    if ((v10 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v11 + 14) = self->_selPlmnMcc;
  *((_WORD *)v11 + 42) |= 0x100u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_17:
    if ((v10 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v11 + 15) = self->_selPlmnMnc;
  *((_WORD *)v11 + 42) |= 0x200u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_18:
    if ((v10 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v11 + 10) = self->_numMncDigits;
  *((_WORD *)v11 + 42) |= 0x10u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
LABEL_19:
    if ((v10 & 0x20) == 0)
      goto LABEL_20;
LABEL_34:
    *((_DWORD *)v11 + 11) = self->_numSubs;
    *((_WORD *)v11 + 42) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_33:
  *((_DWORD *)v11 + 18) = self->_subsId;
  *((_WORD *)v11 + 42) |= 0x400u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
    goto LABEL_34;
LABEL_20:
  if ((v10 & 0x80) != 0)
  {
LABEL_21:
    *((_DWORD *)v11 + 13) = self->_psPref;
    *((_WORD *)v11 + 42) |= 0x80u;
  }
LABEL_22:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  __int16 v16;
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
    *((_WORD *)v5 + 42) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 4) = self->_cellId;
  *((_WORD *)v5 + 42) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 5) = self->_freq;
  *((_WORD *)v5 + 42) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_27:
  *((_DWORD *)v5 + 12) = self->_phyCellId;
  *((_WORD *)v5 + 42) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 20) = self->_valueTag;
    *((_WORD *)v5 + 42) |= 0x1000u;
  }
LABEL_7:
  v8 = -[Mib copyWithZone:](self->_mib, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_sibs;
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
        objc_msgSend(v6, "addSib:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_freqBandInd;
    *((_WORD *)v6 + 42) |= 8u;
    v16 = (__int16)self->_has;
    if ((v16 & 0x800) == 0)
    {
LABEL_16:
      if ((v16 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 19) = self->_trackingAreaCode;
  *((_WORD *)v6 + 42) |= 0x800u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x100) == 0)
  {
LABEL_17:
    if ((v16 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v6 + 14) = self->_selPlmnMcc;
  *((_WORD *)v6 + 42) |= 0x100u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_18:
    if ((v16 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v6 + 15) = self->_selPlmnMnc;
  *((_WORD *)v6 + 42) |= 0x200u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x10) == 0)
  {
LABEL_19:
    if ((v16 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 10) = self->_numMncDigits;
  *((_WORD *)v6 + 42) |= 0x10u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x400) == 0)
  {
LABEL_20:
    if ((v16 & 0x20) == 0)
      goto LABEL_21;
LABEL_35:
    *((_DWORD *)v6 + 11) = self->_numSubs;
    *((_WORD *)v6 + 42) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v6;
    goto LABEL_22;
  }
LABEL_34:
  *((_DWORD *)v6 + 18) = self->_subsId;
  *((_WORD *)v6 + 42) |= 0x400u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x20) != 0)
    goto LABEL_35;
LABEL_21:
  if ((v16 & 0x80) != 0)
  {
LABEL_22:
    *((_DWORD *)v6 + 13) = self->_psPref;
    *((_WORD *)v6 + 42) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  Mib *mib;
  NSMutableArray *sibs;
  __int16 v10;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_71;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 42);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_71;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_71:
    v12 = 0;
    goto LABEL_72;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_71;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_freq != *((_DWORD *)v4 + 5))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_phyCellId != *((_DWORD *)v4 + 12))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x1000) == 0 || self->_valueTag != *((_DWORD *)v4 + 20))
      goto LABEL_71;
  }
  else if ((*((_WORD *)v4 + 42) & 0x1000) != 0)
  {
    goto LABEL_71;
  }
  mib = self->_mib;
  if ((unint64_t)mib | *((_QWORD *)v4 + 4) && !-[Mib isEqual:](mib, "isEqual:"))
    goto LABEL_71;
  sibs = self->_sibs;
  if ((unint64_t)sibs | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](sibs, "isEqual:"))
      goto LABEL_71;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 42);
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 6))
      goto LABEL_71;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x800) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 19))
      goto LABEL_71;
  }
  else if ((*((_WORD *)v4 + 42) & 0x800) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 14))
      goto LABEL_71;
  }
  else if ((*((_WORD *)v4 + 42) & 0x100) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x200) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 15))
      goto LABEL_71;
  }
  else if ((*((_WORD *)v4 + 42) & 0x200) != 0)
  {
    goto LABEL_71;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10))
      goto LABEL_71;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 18))
      goto LABEL_71;
  }
  else if ((*((_WORD *)v4 + 42) & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 11))
      goto LABEL_71;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_psPref != *((_DWORD *)v4 + 13))
      goto LABEL_71;
    v12 = 1;
  }
  else
  {
    v12 = (v11 & 0x80) == 0;
  }
LABEL_72:

  return v12;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_cellId;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_freq;
    if ((has & 0x40) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_phyCellId;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_valueTag;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[Mib hash](self->_mib, "hash");
  v10 = (unint64_t)-[NSMutableArray hash](self->_sibs, "hash");
  v11 = (__int16)self->_has;
  if ((v11 & 8) != 0)
  {
    v12 = 2654435761 * self->_freqBandInd;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_14:
      v13 = 2654435761 * self->_trackingAreaCode;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_15;
      goto LABEL_23;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_14;
  }
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    v14 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    v15 = 2654435761 * self->_selPlmnMnc;
    if ((v11 & 0x10) != 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_24:
  v15 = 0;
  if ((v11 & 0x10) != 0)
  {
LABEL_17:
    v16 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    v17 = 2654435761 * self->_subsId;
    if ((v11 & 0x20) != 0)
      goto LABEL_19;
LABEL_27:
    v18 = 0;
    if ((v11 & 0x80) != 0)
      goto LABEL_20;
LABEL_28:
    v19 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_26:
  v17 = 0;
  if ((v11 & 0x20) == 0)
    goto LABEL_27;
LABEL_19:
  v18 = 2654435761 * self->_numSubs;
  if ((v11 & 0x80) == 0)
    goto LABEL_28;
LABEL_20:
  v19 = 2654435761 * self->_psPref;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  Mib *mib;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int16 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 42);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_freq = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  self->_phyCellId = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 42) & 0x1000) != 0)
  {
LABEL_6:
    self->_valueTag = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_7:
  mib = self->_mib;
  v8 = *((_QWORD *)v5 + 4);
  if (mib)
  {
    if (v8)
      -[Mib mergeFrom:](mib, "mergeFrom:");
  }
  else if (v8)
  {
    -[CellularNrSysInfoBlocks setMib:](self, "setMib:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *((id *)v5 + 8);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[CellularNrSysInfoBlocks addSib:](self, "addSib:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 8) != 0)
  {
    self->_freqBandInd = *((_DWORD *)v5 + 6);
    *(_WORD *)&self->_has |= 8u;
    v14 = *((_WORD *)v5 + 42);
    if ((v14 & 0x800) == 0)
    {
LABEL_26:
      if ((v14 & 0x100) == 0)
        goto LABEL_27;
      goto LABEL_36;
    }
  }
  else if ((*((_WORD *)v5 + 42) & 0x800) == 0)
  {
    goto LABEL_26;
  }
  self->_trackingAreaCode = *((_DWORD *)v5 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 0x100) == 0)
  {
LABEL_27:
    if ((v14 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_37;
  }
LABEL_36:
  self->_selPlmnMcc = *((_DWORD *)v5 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 0x200) == 0)
  {
LABEL_28:
    if ((v14 & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_38;
  }
LABEL_37:
  self->_selPlmnMnc = *((_DWORD *)v5 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 0x10) == 0)
  {
LABEL_29:
    if ((v14 & 0x400) == 0)
      goto LABEL_30;
    goto LABEL_39;
  }
LABEL_38:
  self->_numMncDigits = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 0x400) == 0)
  {
LABEL_30:
    if ((v14 & 0x20) == 0)
      goto LABEL_31;
LABEL_40:
    self->_numSubs = *((_DWORD *)v5 + 11);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v5 + 42) & 0x80) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_39:
  self->_subsId = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  v14 = *((_WORD *)v5 + 42);
  if ((v14 & 0x20) != 0)
    goto LABEL_40;
LABEL_31:
  if ((v14 & 0x80) != 0)
  {
LABEL_32:
    self->_psPref = *((_DWORD *)v5 + 13);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_33:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)freq
{
  return self->_freq;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)valueTag
{
  return self->_valueTag;
}

- (Mib)mib
{
  return self->_mib;
}

- (void)setMib:(id)a3
{
  objc_storeStrong((id *)&self->_mib, a3);
}

- (NSMutableArray)sibs
{
  return self->_sibs;
}

- (void)setSibs:(id)a3
{
  objc_storeStrong((id *)&self->_sibs, a3);
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sibs, 0);
  objc_storeStrong((id *)&self->_mib, 0);
}

@end
