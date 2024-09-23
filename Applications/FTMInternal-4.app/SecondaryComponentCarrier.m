@implementation SecondaryComponentCarrier

- (void)setIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_index = a3;
}

- (void)setHasIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIndex
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_state;
  else
    return 0;
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F1E8 + a3);
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCC_STATE_DECONFIGURED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCC_STATE_CONFIGURED_DEACTIVATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SCC_STATE_ACTIVATED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPci:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pci = a3;
}

- (void)setHasPci:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPci
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlEarfcn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDlRfBand
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDlBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDlBandwidth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasUplink:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_hasUplink = a3;
}

- (void)setHasHasUplink:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasHasUplink
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setUlEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_ulEarfcn = a3;
}

- (void)setHasUlEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUlEarfcn
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUlRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_ulRfBand = a3;
}

- (void)setHasUlRfBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasUlRfBand
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setUlBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_ulBandwidth = a3;
}

- (void)setHasUlBandwidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUlBandwidth
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rsrp = a3;
}

- (void)setHasRsrp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRsrp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRsrq:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rsrq = a3;
}

- (void)setHasRsrq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRsrq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSnr:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSnr
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRssi
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
  v8.super_class = (Class)SecondaryComponentCarrier;
  v3 = -[SecondaryComponentCarrier description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecondaryComponentCarrier dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  uint64_t state;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_index));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("index"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  state = self->_state;
  if (state >= 3)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state));
  else
    v9 = *(&off_10025F1E8 + state);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("state"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pci));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("pci"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlEarfcn));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dl_earfcn"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlRfBand));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("dl_rf_band"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBandwidth));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dl_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasUplink));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("has_uplink"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulEarfcn));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ul_earfcn"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulRfBand));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ul_rf_band"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulBandwidth));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ul_bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rsrp));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rsrp"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
LABEL_32:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_snr));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("snr"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_31:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rsrq));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rsrq"));

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_32;
LABEL_14:
  if ((has & 0x80) != 0)
  {
LABEL_15:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rssi));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rssi"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AE77C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_index, 1);
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_state, 2);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_pci, 3);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_dlEarfcn, 4);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v5, self->_dlRfBand, 5);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v5, self->_dlBandwidth, 6);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField(v5, self->_hasUplink, 7);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_ulEarfcn, 8);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v5, self->_ulRfBand, 9);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v5, self->_ulBandwidth, 10);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteSint32Field(v5, self->_rsrp, 11);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteSint32Field(v5, self->_snr, 13);
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteSint32Field(v5, self->_rsrq, 12);
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x80) != 0)
LABEL_15:
    PBDataWriterWriteSint32Field(v5, self->_rssi, 14);
LABEL_16:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_index;
    *((_WORD *)v4 + 32) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = self->_state;
  *((_WORD *)v4 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v4[6] = self->_pci;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v4[3] = self->_dlEarfcn;
  *((_WORD *)v4 + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v4[4] = self->_dlRfBand;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v4[2] = self->_dlBandwidth;
  *((_WORD *)v4 + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 60) = self->_hasUplink;
  *((_WORD *)v4 + 32) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v4[13] = self->_ulEarfcn;
  *((_WORD *)v4 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v4[14] = self->_ulRfBand;
  *((_WORD *)v4 + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v4[12] = self->_ulBandwidth;
  *((_WORD *)v4 + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v4[7] = self->_rsrp;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
LABEL_29:
    v4[10] = self->_snr;
    *((_WORD *)v4 + 32) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  v4[8] = self->_rsrq;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x80) != 0)
  {
LABEL_15:
    v4[9] = self->_rssi;
    *((_WORD *)v4 + 32) |= 0x80u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_index;
    *((_WORD *)result + 32) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 11) = self->_state;
  *((_WORD *)result + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_pci;
  *((_WORD *)result + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 3) = self->_dlEarfcn;
  *((_WORD *)result + 32) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_dlRfBand;
  *((_WORD *)result + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 2) = self->_dlBandwidth;
  *((_WORD *)result + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)result + 60) = self->_hasUplink;
  *((_WORD *)result + 32) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 13) = self->_ulEarfcn;
  *((_WORD *)result + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_ulRfBand;
  *((_WORD *)result + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_ulBandwidth;
  *((_WORD *)result + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_rsrp;
  *((_WORD *)result + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 8) = self->_rsrq;
  *((_WORD *)result + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 10) = self->_snr;
  *((_WORD *)result + 32) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0)
    return result;
LABEL_15:
  *((_DWORD *)result + 9) = self->_rssi;
  *((_WORD *)result + 32) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_75;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 32);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_index != *((_DWORD *)v4 + 5))
      goto LABEL_75;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_state != *((_DWORD *)v4 + 11))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_pci != *((_DWORD *)v4 + 6))
      goto LABEL_75;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 3))
      goto LABEL_75;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 4))
      goto LABEL_75;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 2))
      goto LABEL_75;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x2000) != 0)
    {
      if (self->_hasUplink)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_75;
        goto LABEL_40;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_40;
    }
LABEL_75:
    v8 = 0;
    goto LABEL_76;
  }
  if ((*((_WORD *)v4 + 32) & 0x2000) != 0)
    goto LABEL_75;
LABEL_40:
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0 || self->_ulEarfcn != *((_DWORD *)v4 + 13))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0 || self->_ulRfBand != *((_DWORD *)v4 + 14))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_ulBandwidth != *((_DWORD *)v4 + 12))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rsrp != *((_DWORD *)v4 + 7))
      goto LABEL_75;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rsrq != *((_DWORD *)v4 + 8))
      goto LABEL_75;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_snr != *((_DWORD *)v4 + 10))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rssi != *((_DWORD *)v4 + 9))
      goto LABEL_75;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 0x80) == 0;
  }
LABEL_76:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v3 = 2654435761 * self->_index;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_state;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_pci;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_dlEarfcn;
    if ((has & 4) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_dlRfBand;
    if ((has & 1) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_dlBandwidth;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_hasUplink;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_ulEarfcn;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_ulRfBand;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_ulBandwidth;
    if ((has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_rsrp;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_rsrq;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761 * self->_snr;
  if ((has & 0x80) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761 * self->_rssi;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_index = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_pci = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_dlEarfcn = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_dlRfBand = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_dlBandwidth = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_hasUplink = *((_BYTE *)v4 + 60);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_ulEarfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_ulRfBand = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_ulBandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_rsrp = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
LABEL_29:
    self->_snr = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v4 + 32) & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  self->_rsrq = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v5 & 0x80) != 0)
  {
LABEL_15:
    self->_rssi = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_16:

}

- (unsigned)index
{
  return self->_index;
}

- (unsigned)pci
{
  return self->_pci;
}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

- (unsigned)dlBandwidth
{
  return self->_dlBandwidth;
}

- (BOOL)hasUplink
{
  return self->_hasUplink;
}

- (unsigned)ulEarfcn
{
  return self->_ulEarfcn;
}

- (unsigned)ulRfBand
{
  return self->_ulRfBand;
}

- (unsigned)ulBandwidth
{
  return self->_ulBandwidth;
}

- (int)rsrp
{
  return self->_rsrp;
}

- (int)rsrq
{
  return self->_rsrq;
}

- (int)snr
{
  return self->_snr;
}

- (int)rssi
{
  return self->_rssi;
}

@end
