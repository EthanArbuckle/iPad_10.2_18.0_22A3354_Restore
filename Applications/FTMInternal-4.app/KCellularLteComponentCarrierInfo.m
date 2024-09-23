@implementation KCellularLteComponentCarrierInfo

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

- (void)setPccEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_pccEarfcn = a3;
}

- (void)setHasPccEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPccEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScc0Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_scc0Earfcn = a3;
}

- (void)setHasScc0Earfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScc0Earfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScc1Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scc1Earfcn = a3;
}

- (void)setHasScc1Earfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScc1Earfcn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPccBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pccBandwidth = a3;
}

- (void)setHasPccBandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPccBandwidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScc0Bandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_scc0Bandwidth = a3;
}

- (void)setHasScc0Bandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScc0Bandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScc1Bandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scc1Bandwidth = a3;
}

- (void)setHasScc1Bandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScc1Bandwidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPccRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pccRfBand = a3;
}

- (void)setHasPccRfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPccRfBand
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScc0RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scc0RfBand = a3;
}

- (void)setHasScc0RfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScc0RfBand
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScc1RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scc1RfBand = a3;
}

- (void)setHasScc1RfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScc1RfBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearCarrierInfos
{
  -[NSMutableArray removeAllObjects](self->_carrierInfos, "removeAllObjects");
}

- (void)addCarrierInfo:(id)a3
{
  id v4;
  NSMutableArray *carrierInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  carrierInfos = self->_carrierInfos;
  v8 = v4;
  if (!carrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_carrierInfos;
    self->_carrierInfos = v6;

    v4 = v8;
    carrierInfos = self->_carrierInfos;
  }
  -[NSMutableArray addObject:](carrierInfos, "addObject:", v4);

}

- (unint64_t)carrierInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_carrierInfos, "count");
}

- (id)carrierInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_carrierInfos, "objectAtIndex:", a3);
}

+ (Class)carrierInfoType
{
  return (Class)objc_opt_class(ComponentCarrierInfo, a2);
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteComponentCarrierInfo;
  v3 = -[KCellularLteComponentCarrierInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteComponentCarrierInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v13;
  void *v15;
  void *v16;
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
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pccEarfcn));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("pcc_earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc0Earfcn));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("scc0_earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc1Earfcn));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("scc1_earfcn"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pccBandwidth));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("pcc_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc0Bandwidth));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("scc0_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc1Bandwidth));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("scc1_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pccRfBand));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("pcc_rf_band"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_32:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc0RfBand));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("scc0_rf_band"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scc1RfBand));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scc1_rf_band"));

  }
LABEL_12:
  if (-[NSMutableArray count](self->_carrierInfos, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_carrierInfos, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_carrierInfos;
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

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("carrier_info"));
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A4258((uint64_t)self, (uint64_t)a3);
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
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_pccEarfcn, 2);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_scc0Earfcn, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v5, self->_scc1Earfcn, 4);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v5, self->_pccBandwidth, 5);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v5, self->_scc0Bandwidth, 6);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v5, self->_scc1Bandwidth, 7);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_pccRfBand, 8);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v5, self->_scc0RfBand, 9);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field(v5, self->_scc1RfBand, 10);
LABEL_12:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_carrierInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 11);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
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
  id v10;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_pccEarfcn;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 10) = self->_scc0Earfcn;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 13) = self->_scc1Earfcn;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 6) = self->_pccBandwidth;
  *((_WORD *)v4 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_27:
    *((_DWORD *)v4 + 11) = self->_scc0RfBand;
    *((_WORD *)v4 + 32) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  *((_DWORD *)v4 + 8) = self->_pccRfBand;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_27;
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_scc1RfBand;
    *((_WORD *)v4 + 32) |= 0x200u;
  }
LABEL_12:
  v10 = v4;
  if (-[KCellularLteComponentCarrierInfo carrierInfosCount](self, "carrierInfosCount"))
  {
    objc_msgSend(v10, "clearCarrierInfos");
    v6 = -[KCellularLteComponentCarrierInfo carrierInfosCount](self, "carrierInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteComponentCarrierInfo carrierInfoAtIndex:](self, "carrierInfoAtIndex:", i));
        objc_msgSend(v10, "addCarrierInfo:", v9);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v10 + 15) = self->_subsId;
    *((_WORD *)v10 + 32) |= 0x400u;
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
  void *i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_pccEarfcn;
  *((_WORD *)v5 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 10) = self->_scc0Earfcn;
  *((_WORD *)v5 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 13) = self->_scc1Earfcn;
  *((_WORD *)v5 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 6) = self->_pccBandwidth;
  *((_WORD *)v5 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v5 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v5 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 8) = self->_pccRfBand;
  *((_WORD *)v5 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  *((_DWORD *)v5 + 11) = self->_scc0RfBand;
  *((_WORD *)v5 + 32) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 14) = self->_scc1RfBand;
    *((_WORD *)v5 + 32) |= 0x200u;
  }
LABEL_12:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_carrierInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addCarrierInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_subsId;
    *((_WORD *)v6 + 32) |= 0x400u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *carrierInfos;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_60;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_60;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_pccEarfcn != *((_DWORD *)v4 + 7))
      goto LABEL_60;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_scc0Earfcn != *((_DWORD *)v4 + 10))
      goto LABEL_60;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_scc1Earfcn != *((_DWORD *)v4 + 13))
      goto LABEL_60;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_pccBandwidth != *((_DWORD *)v4 + 6))
      goto LABEL_60;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_scc0Bandwidth != *((_DWORD *)v4 + 9))
      goto LABEL_60;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_scc1Bandwidth != *((_DWORD *)v4 + 12))
      goto LABEL_60;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_pccRfBand != *((_DWORD *)v4 + 8))
      goto LABEL_60;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_scc0RfBand != *((_DWORD *)v4 + 11))
      goto LABEL_60;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_scc1RfBand != *((_DWORD *)v4 + 14))
      goto LABEL_60;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_60;
  }
  carrierInfos = self->_carrierInfos;
  if ((unint64_t)carrierInfos | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](carrierInfos, "isEqual:"))
    {
LABEL_60:
      v9 = 0;
      goto LABEL_61;
    }
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 15))
      goto LABEL_60;
    v9 = 1;
  }
  else
  {
    v9 = (*((_WORD *)v4 + 32) & 0x400) == 0;
  }
LABEL_61:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_pccEarfcn;
      if ((has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v14 = 2654435761 * self->_scc0Earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_scc1Earfcn;
    if ((has & 2) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_pccBandwidth;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_scc0Bandwidth;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_scc1Bandwidth;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_pccRfBand;
    if ((has & 0x40) != 0)
      goto LABEL_10;
LABEL_20:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_20;
LABEL_10:
  v9 = 2654435761 * self->_scc0RfBand;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_scc1RfBand;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  v11 = (unint64_t)-[NSMutableArray hash](self->_carrierInfos, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v12 = 2654435761 * self->_subsId;
  else
    v12 = 0;
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _DWORD *v5;
  __int16 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pccEarfcn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_scc0Earfcn = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_5:
    if ((v6 & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_scc1Earfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_pccBandwidth = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_scc0Bandwidth = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_scc1Bandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_pccRfBand = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_30:
  self->_scc0RfBand = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_11:
    self->_scc1RfBand = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_12:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[KCellularLteComponentCarrierInfo addCarrierInfo:](self, "addCarrierInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((v5[16] & 0x400) != 0)
  {
    self->_subsId = v5[15];
    *(_WORD *)&self->_has |= 0x400u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pccEarfcn
{
  return self->_pccEarfcn;
}

- (unsigned)scc0Earfcn
{
  return self->_scc0Earfcn;
}

- (unsigned)scc1Earfcn
{
  return self->_scc1Earfcn;
}

- (unsigned)pccBandwidth
{
  return self->_pccBandwidth;
}

- (unsigned)scc0Bandwidth
{
  return self->_scc0Bandwidth;
}

- (unsigned)scc1Bandwidth
{
  return self->_scc1Bandwidth;
}

- (unsigned)pccRfBand
{
  return self->_pccRfBand;
}

- (unsigned)scc0RfBand
{
  return self->_scc0RfBand;
}

- (unsigned)scc1RfBand
{
  return self->_scc1RfBand;
}

- (NSMutableArray)carrierInfos
{
  return self->_carrierInfos;
}

- (void)setCarrierInfos:(id)a3
{
  objc_storeStrong((id *)&self->_carrierInfos, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierInfos, 0);
}

@end
