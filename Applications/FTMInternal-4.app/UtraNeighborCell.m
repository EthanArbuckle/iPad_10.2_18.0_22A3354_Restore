@implementation UtraNeighborCell

- (void)setUarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUarfcn
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setQRxlevMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_qRxlevMin = a3;
}

- (void)setHasQRxlevMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasQRxlevMin
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasQQualMin
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPMax:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pMax = a3;
}

- (void)setHasPMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPMax
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setThreshXHighP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_threshXHighP = a3;
}

- (void)setHasThreshXHighP:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasThreshXHighP
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setThreshXLowP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_threshXLowP = a3;
}

- (void)setHasThreshXLowP:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasThreshXLowP
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setThreshXHighQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_threshXHighQ = a3;
}

- (void)setHasThreshXHighQ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasThreshXHighQ
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setThreshXLowQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_threshXLowQ = a3;
}

- (void)setHasThreshXLowQ:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasThreshXLowQ
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)duplexMode
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_duplexMode;
  else
    return 0;
}

- (void)setDuplexMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duplexMode = a3;
}

- (void)setHasDuplexMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuplexMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)duplexModeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("KCELLULAR_FREQ_DIVISION_DUPLEX");
  if (a3 == 1)
    v3 = CFSTR("KCELLULAR_TIME_DIVISION_DUPLEX");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDuplexMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KCELLULAR_FREQ_DIVISION_DUPLEX")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("KCELLULAR_TIME_DIVISION_DUPLEX"));

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UtraNeighborCell;
  v3 = -[UtraNeighborCell description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UtraNeighborCell dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int duplexMode;
  __CFString *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_uarfcn));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uarfcn"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qRxlevMin));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("q_rxlev_min"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qQualMin));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("q_qual_min"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pMax));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("p_max"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshXHighP));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("thresh_x_high_p"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshXLowP));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("thresh_x_low_p"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshXHighQ));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("thresh_x_high_q"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
LABEL_20:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_priority));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("priority"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_21;
  }
LABEL_19:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshXLowQ));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("thresh_x_low_q"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_20;
LABEL_10:
  if ((has & 1) == 0)
    return v3;
LABEL_21:
  duplexMode = self->_duplexMode;
  if (duplexMode)
  {
    if (duplexMode == 1)
      v15 = CFSTR("KCELLULAR_TIME_DIVISION_DUPLEX");
    else
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_duplexMode));
  }
  else
  {
    v15 = CFSTR("KCELLULAR_FREQ_DIVISION_DUPLEX");
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("duplex_mode"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013E18C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_uarfcn, 1);
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field(v5, self->_qRxlevMin, 2);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteSint32Field(v5, self->_qQualMin, 3);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteSint32Field(v5, self->_pMax, 4);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_threshXHighP, 5);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(v5, self->_threshXLowP, 6);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_threshXHighQ, 7);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
LABEL_21:
    PBDataWriterWriteUint32Field(v5, self->_priority, 9);
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_threshXLowQ, 8);
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 1) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field(v5, self->_duplexMode, 10);
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_uarfcn;
    *((_WORD *)v4 + 24) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_qRxlevMin;
  *((_WORD *)v4 + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v4[5] = self->_qQualMin;
  *((_WORD *)v4 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = self->_pMax;
  *((_WORD *)v4 + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v4[7] = self->_threshXHighP;
  *((_WORD *)v4 + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v4[9] = self->_threshXLowP;
  *((_WORD *)v4 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v4[8] = self->_threshXHighQ;
  *((_WORD *)v4 + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
LABEL_21:
    v4[4] = self->_priority;
    *((_WORD *)v4 + 24) |= 4u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  v4[10] = self->_threshXLowQ;
  *((_WORD *)v4 + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 1) != 0)
  {
LABEL_11:
    v4[2] = self->_duplexMode;
    *((_WORD *)v4 + 24) |= 1u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_uarfcn;
    *((_WORD *)result + 24) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_qRxlevMin;
  *((_WORD *)result + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_qQualMin;
  *((_WORD *)result + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 3) = self->_pMax;
  *((_WORD *)result + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_threshXHighP;
  *((_WORD *)result + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_threshXLowP;
  *((_WORD *)result + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 8) = self->_threshXHighQ;
  *((_WORD *)result + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 10) = self->_threshXLowQ;
  *((_WORD *)result + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_priority;
  *((_WORD *)result + 24) |= 4u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 2) = self->_duplexMode;
  *((_WORD *)result + 24) |= 1u;
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
    goto LABEL_52;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 24);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) == 0 || self->_uarfcn != *((_DWORD *)v4 + 11))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
LABEL_52:
    v8 = 0;
    goto LABEL_53;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_qRxlevMin != *((_DWORD *)v4 + 6))
      goto LABEL_52;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_qQualMin != *((_DWORD *)v4 + 5))
      goto LABEL_52;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_pMax != *((_DWORD *)v4 + 3))
      goto LABEL_52;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_threshXHighP != *((_DWORD *)v4 + 7))
      goto LABEL_52;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_threshXLowP != *((_DWORD *)v4 + 9))
      goto LABEL_52;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_threshXHighQ != *((_DWORD *)v4 + 8))
      goto LABEL_52;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_threshXLowQ != *((_DWORD *)v4 + 10))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_priority != *((_DWORD *)v4 + 4))
      goto LABEL_52;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_duplexMode != *((_DWORD *)v4 + 2))
      goto LABEL_52;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 1) == 0;
  }
LABEL_53:

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

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v3 = 2654435761 * self->_uarfcn;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_qRxlevMin;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_qQualMin;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_pMax;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_threshXHighP;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_threshXLowP;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_threshXHighQ;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_threshXLowQ;
    if ((has & 4) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 4) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_priority;
  if ((has & 1) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_duplexMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) != 0)
  {
    self->_uarfcn = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_qRxlevMin = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  self->_qQualMin = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  self->_pMax = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_threshXHighP = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_threshXLowP = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_threshXHighQ = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
LABEL_21:
    self->_priority = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 24) & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  self->_threshXLowQ = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_21;
LABEL_10:
  if ((v5 & 1) != 0)
  {
LABEL_11:
    self->_duplexMode = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_12:

}

- (unsigned)uarfcn
{
  return self->_uarfcn;
}

- (int)qRxlevMin
{
  return self->_qRxlevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (int)pMax
{
  return self->_pMax;
}

- (unsigned)threshXHighP
{
  return self->_threshXHighP;
}

- (unsigned)threshXLowP
{
  return self->_threshXLowP;
}

- (unsigned)threshXHighQ
{
  return self->_threshXHighQ;
}

- (unsigned)threshXLowQ
{
  return self->_threshXLowQ;
}

- (unsigned)priority
{
  return self->_priority;
}

@end
