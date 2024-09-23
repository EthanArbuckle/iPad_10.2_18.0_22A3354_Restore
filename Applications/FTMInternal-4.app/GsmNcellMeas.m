@implementation GsmNcellMeas

- (void)setMcc:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMnc
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLac
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCi:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ci = a3;
}

- (void)setHasCi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCi
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBsic
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setArfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRxlev:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rxlev = a3;
}

- (void)setHasRxlev:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRxlev
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GsmNcellMeas;
  v3 = -[GsmNcellMeas description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GsmNcellMeas dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mcc"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mnc"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("lac"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ci));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ci"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_arfcn));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("arfcn"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bsic));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("bsic"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rxlev));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rxlev"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011A8DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_mcc, 1);
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_mnc, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field(v5, self->_lac, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(v5, self->_ci, 4);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteUint32Field(v5, self->_arfcn, 6);
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteUint32Field(v5, self->_bsic, 5);
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field(v5, self->_rxlev, 7);
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_mcc;
    *((_BYTE *)v4 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[7] = self->_mnc;
  *((_BYTE *)v4 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[5] = self->_lac;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[4] = self->_ci;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    v4[2] = self->_arfcn;
    *((_BYTE *)v4 + 36) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[3] = self->_bsic;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v4[8] = self->_rxlev;
    *((_BYTE *)v4 + 36) |= 0x40u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_mcc;
    *((_BYTE *)result + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_mnc;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_lac;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_ci;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_bsic;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 2) = self->_arfcn;
  *((_BYTE *)result + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 8) = self->_rxlev;
  *((_BYTE *)result + 36) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_mcc != *((_DWORD *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
LABEL_36:
    v6 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_mnc != *((_DWORD *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_lac != *((_DWORD *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_ci != *((_DWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_bsic != *((_DWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_36;
  }
  v6 = (*((_BYTE *)v4 + 36) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x40) == 0 || self->_rxlev != *((_DWORD *)v4 + 8))
      goto LABEL_36;
    v6 = 1;
  }
LABEL_37:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761 * self->_mcc;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_mnc;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_lac;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_ci;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_bsic;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_arfcn;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_rxlev;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_mcc = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_mnc = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_lac = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_ci = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
LABEL_15:
    self->_arfcn = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 36) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_bsic = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 0x40) != 0)
  {
LABEL_8:
    self->_rxlev = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_9:

}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)ci
{
  return self->_ci;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)arfcn
{
  return self->_arfcn;
}

- (unsigned)rxlev
{
  return self->_rxlev;
}

@end
