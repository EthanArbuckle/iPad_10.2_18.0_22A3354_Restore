@implementation NbrEutra

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_pcis, a2);
  v3.receiver = self;
  v3.super_class = (Class)NbrEutra;
  -[NbrEutra dealloc](&v3, "dealloc");
}

- (void)setEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_earfcn = a3;
}

- (void)setHasEarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setQRxlevMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_qRxlevMin = a3;
}

- (void)setHasQRxlevMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasQRxlevMin
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQQualMin
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setQOffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qOffset = a3;
}

- (void)setHasQOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPmax:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pmax = a3;
}

- (void)setHasPmax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPmax
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlBw
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setThresXHighP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_thresXHighP = a3;
}

- (void)setHasThresXHighP:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasThresXHighP
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setThresXLowP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_thresXLowP = a3;
}

- (void)setHasThresXLowP:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasThresXLowP
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setThresXHighQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_thresXHighQ = a3;
}

- (void)setHasThresXHighQ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasThresXHighQ
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setThresXLowQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_thresXLowQ = a3;
}

- (void)setHasThresXLowQ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasThresXLowQ
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)frameType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_frameType;
  else
    return 0;
}

- (void)setFrameType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_frameType = a3;
}

- (void)setHasFrameType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFrameType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)frameTypeAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F3F0 + a3);
}

- (int)StringAsFrameType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FDD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TDD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBand
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTReselection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_tReselection = a3;
}

- (void)setHasTReselection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTReselection
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSfMedium:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sfMedium = a3;
}

- (void)setHasSfMedium:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSfMedium
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSfHigh:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sfHigh = a3;
}

- (void)setHasSfHigh:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSfHigh
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (unint64_t)pcisCount
{
  return self->_pcis.count;
}

- (unsigned)pcis
{
  return self->_pcis.list;
}

- (void)clearPcis
{
  PBRepeatedUInt32Clear(&self->_pcis, a2);
}

- (void)addPci:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_pcis, *(_QWORD *)&a3);
}

- (unsigned)pciAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_pcis;
  unint64_t count;
  void *v6;
  void *v7;

  p_pcis = &self->_pcis;
  count = self->_pcis.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_pcis->list[a3];
}

- (void)setPcis:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_pcis, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NbrEutra;
  v3 = -[NbrEutra description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NbrEutra dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  uint64_t v6;
  void *v7;
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
  uint64_t frameType;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_earfcn));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("earfcn"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qRxlevMin));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("Q_rxlev_min"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qQualMin));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("Q_qual_min"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qOffset));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("Q_offset"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pmax));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Pmax"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dl_bw"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_thresXHighP));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("Thres_X_highP"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_thresXLowP));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("Thres_X_lowP"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_thresXHighQ));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("Thres_X_highQ"));

  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_thresXLowQ));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("Thres_X_lowQ"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_priority));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("priority"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_30:
  frameType = self->_frameType;
  if (frameType >= 3)
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_frameType));
  else
    v21 = *(&off_10025F3F0 + frameType);
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("frame_type"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_band));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("band"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_16;
LABEL_36:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sfMedium));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("sf_medium"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_35:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tReselection));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("t_reselection"));

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_36;
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sfHigh));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sf_high"));

  }
LABEL_18:
  v6 = PBRepeatedUInt32NSArray(&self->_pcis);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("pci"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CA770((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_pcis;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_earfcn, 1);
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field(v5, self->_qRxlevMin, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteSint32Field(v5, self->_qQualMin, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteSint32Field(v5, self->_qOffset, 4);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteSint32Field(v5, self->_pmax, 5);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_dlBw, 6);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v5, self->_thresXHighP, 7);
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v5, self->_thresXLowP, 8);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v5, self->_thresXHighQ, 9);
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v5, self->_thresXLowQ, 10);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v5, self->_priority, 11);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field(v5, self->_frameType, 12);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v5, self->_band, 13);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v5, self->_tReselection, 14);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v5, self->_sfMedium, 15);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_sfHigh, 16);
LABEL_18:
  p_pcis = &self->_pcis;
  if (p_pcis->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 17);
    if (p_pcis->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_pcis->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_pcis->count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_earfcn;
    *((_WORD *)v4 + 48) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = self->_qRxlevMin;
  *((_WORD *)v4 + 48) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  v4[15] = self->_qQualMin;
  *((_WORD *)v4 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  v4[14] = self->_qOffset;
  *((_WORD *)v4 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  v4[12] = self->_pmax;
  *((_WORD *)v4 + 48) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  v4[9] = self->_dlBw;
  *((_WORD *)v4 + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  v4[20] = self->_thresXHighP;
  *((_WORD *)v4 + 48) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v4[22] = self->_thresXLowP;
  *((_WORD *)v4 + 48) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v4[21] = self->_thresXHighQ;
  *((_WORD *)v4 + 48) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v4[23] = self->_thresXLowQ;
  *((_WORD *)v4 + 48) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v4[13] = self->_priority;
  *((_WORD *)v4 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v4[11] = self->_frameType;
  *((_WORD *)v4 + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v4[8] = self->_band;
  *((_WORD *)v4 + 48) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_16;
LABEL_37:
    v4[18] = self->_sfMedium;
    *((_WORD *)v4 + 48) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_36:
  v4[19] = self->_tReselection;
  *((_WORD *)v4 + 48) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_37;
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    v4[17] = self->_sfHigh;
    *((_WORD *)v4 + 48) |= 0x200u;
  }
LABEL_18:
  v9 = v4;
  if (-[NbrEutra pcisCount](self, "pcisCount"))
  {
    objc_msgSend(v9, "clearPcis");
    v6 = -[NbrEutra pcisCount](self, "pcisCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addPci:", -[NbrEutra pciAtIndex:](self, "pciAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  void *v5;
  __int16 has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_earfcn;
    *((_WORD *)v4 + 48) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 16) = self->_qRxlevMin;
  *((_WORD *)v4 + 48) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 15) = self->_qQualMin;
  *((_WORD *)v4 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_qOffset;
  *((_WORD *)v4 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 12) = self->_pmax;
  *((_WORD *)v4 + 48) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_dlBw;
  *((_WORD *)v4 + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 20) = self->_thresXHighP;
  *((_WORD *)v4 + 48) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 22) = self->_thresXLowP;
  *((_WORD *)v4 + 48) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 21) = self->_thresXHighQ;
  *((_WORD *)v4 + 48) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 23) = self->_thresXLowQ;
  *((_WORD *)v4 + 48) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 13) = self->_priority;
  *((_WORD *)v4 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 11) = self->_frameType;
  *((_WORD *)v4 + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 8) = self->_band;
  *((_WORD *)v4 + 48) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_16;
LABEL_33:
    *((_DWORD *)v4 + 18) = self->_sfMedium;
    *((_WORD *)v4 + 48) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  *((_DWORD *)v4 + 19) = self->_tReselection;
  *((_WORD *)v4 + 48) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 17) = self->_sfHigh;
    *((_WORD *)v4 + 48) |= 0x200u;
  }
LABEL_18:
  PBRepeatedUInt32Copy(v4 + 8, &self->_pcis);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_83;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 48);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_earfcn != *((_DWORD *)v4 + 10))
      goto LABEL_83;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x100) == 0 || self->_qRxlevMin != *((_DWORD *)v4 + 16))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_qQualMin != *((_DWORD *)v4 + 15))
      goto LABEL_83;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_qOffset != *((_DWORD *)v4 + 14))
      goto LABEL_83;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_pmax != *((_DWORD *)v4 + 12))
      goto LABEL_83;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_dlBw != *((_DWORD *)v4 + 9))
      goto LABEL_83;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x1000) == 0 || self->_thresXHighP != *((_DWORD *)v4 + 20))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x1000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x4000) == 0 || self->_thresXLowP != *((_DWORD *)v4 + 22))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x4000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x2000) == 0 || self->_thresXHighQ != *((_DWORD *)v4 + 21))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x8000) == 0 || self->_thresXLowQ != *((_DWORD *)v4 + 23))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x8000) != 0)
  {
LABEL_83:
    IsEqual = 0;
    goto LABEL_84;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_priority != *((_DWORD *)v4 + 13))
      goto LABEL_83;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_frameType != *((_DWORD *)v4 + 11))
      goto LABEL_83;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_band != *((_DWORD *)v4 + 8))
      goto LABEL_83;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x800) == 0 || self->_tReselection != *((_DWORD *)v4 + 19))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x400) == 0 || self->_sfMedium != *((_DWORD *)v4 + 18))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x200) == 0 || self->_sfHigh != *((_DWORD *)v4 + 17))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 48) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_pcis, v4 + 8);
LABEL_84:

  return IsEqual;
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
  uint64_t v17;
  uint64_t v18;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v3 = 2654435761 * self->_earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_qRxlevMin;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_qQualMin;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_qOffset;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_pmax;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_dlBw;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_thresXHighP;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_thresXLowP;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_thresXHighQ;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_thresXLowQ;
    if ((has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_priority;
    if ((has & 8) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_frameType;
    if ((has & 1) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v14 = 0;
  if ((has & 1) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_band;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_tReselection;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_16;
LABEL_32:
    v17 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_17;
LABEL_33:
    v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ PBRepeatedUInt32Hash(&self->_pcis);
  }
LABEL_31:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_32;
LABEL_16:
  v17 = 2654435761 * self->_sfMedium;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_33;
LABEL_17:
  v18 = 2654435761 * self->_sfHigh;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ PBRepeatedUInt32Hash(&self->_pcis);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  char *v6;
  char *v7;
  char *i;
  id v9;

  v4 = a3;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_earfcn = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 4u;
    v5 = *((_WORD *)v4 + 48);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_qRxlevMin = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_qQualMin = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_qOffset = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_pmax = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_dlBw = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_thresXHighP = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_thresXLowP = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x2000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_thresXHighQ = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x8000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_thresXLowQ = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_has |= 0x8000u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_priority = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_frameType = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_band = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_tReselection = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_36:
  self->_sfMedium = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 48) & 0x200) != 0)
  {
LABEL_17:
    self->_sfHigh = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_18:
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "pcisCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[NbrEutra addPci:](self, "addPci:", objc_msgSend(v9, "pciAtIndex:", i));
  }

}

- (unsigned)earfcn
{
  return self->_earfcn;
}

- (int)qRxlevMin
{
  return self->_qRxlevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (int)qOffset
{
  return self->_qOffset;
}

- (int)pmax
{
  return self->_pmax;
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)thresXHighP
{
  return self->_thresXHighP;
}

- (unsigned)thresXLowP
{
  return self->_thresXLowP;
}

- (unsigned)thresXHighQ
{
  return self->_thresXHighQ;
}

- (unsigned)thresXLowQ
{
  return self->_thresXLowQ;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)tReselection
{
  return self->_tReselection;
}

- (unsigned)sfMedium
{
  return self->_sfMedium;
}

- (unsigned)sfHigh
{
  return self->_sfHigh;
}

@end
