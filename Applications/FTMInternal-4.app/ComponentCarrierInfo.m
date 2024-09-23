@implementation ComponentCarrierInfo

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDlEarfcn
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)dlBandwidth
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_dlBandwidth;
  else
    return 0;
}

- (void)setDlBandwidth:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDlBandwidth
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dlBandwidthAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F060 + a3);
}

- (int)StringAsDlBandwidth:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_1M4")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_3M")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_5M")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_10M")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_15M")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_BW_20M")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDlRfBand
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
  v8.super_class = (Class)ComponentCarrierInfo;
  v3 = -[ComponentCarrierInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCarrierInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  uint64_t dlBandwidth;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    dlBandwidth = self->_dlBandwidth;
    if (dlBandwidth >= 6)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dlBandwidth));
    else
      v9 = *(&off_10025F060 + dlBandwidth);
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dl_bandwidth"));

    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    return v3;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlEarfcn));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dl_earfcn"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlRfBand));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_rf_band"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008056C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field(v6, self->_dlBandwidth, 2);
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field(v4, self->_dlEarfcn, 1);
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field(v6, self->_dlRfBand, 3);
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[2] = self->_dlBandwidth;
    *((_BYTE *)v4 + 20) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[3] = self->_dlEarfcn;
  *((_BYTE *)v4 + 20) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[4] = self->_dlRfBand;
    *((_BYTE *)v4 + 20) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_dlEarfcn;
    *((_BYTE *)result + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_dlBandwidth;
  *((_BYTE *)result + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 4) = self->_dlRfBand;
  *((_BYTE *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_16;
  }
  v6 = (*((_BYTE *)v4 + 20) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 4))
      goto LABEL_16;
    v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_dlEarfcn;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_dlBandwidth;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_dlRfBand;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_dlBandwidth = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_dlEarfcn = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_dlRfBand = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

@end
