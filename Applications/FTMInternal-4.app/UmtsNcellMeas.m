@implementation UmtsNcellMeas

- (void)setCellType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellType = a3;
}

- (void)setHasCellType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCpichSc:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cpichSc = a3;
}

- (void)setHasCpichSc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCpichSc
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDlUarfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_dlUarfcn = a3;
}

- (void)setHasDlUarfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDlUarfcn
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCpichRscp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cpichRscp = a3;
}

- (void)setHasCpichRscp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCpichRscp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCpichEcn0:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cpichEcn0 = a3;
}

- (void)setHasCpichEcn0:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCpichEcn0
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UmtsNcellMeas;
  v3 = -[UmtsNcellMeas description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UmtsNcellMeas dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellType));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cell_type"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cpichSc));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cpich_sc"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cpichRscp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cpich_rscp"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlUarfcn));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dl_uarfcn"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cpichEcn0));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cpich_ecn0"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000FE7E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_cellType, 1);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_cpichSc, 2);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field(v5, self->_cpichRscp, 4);
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field(v5, self->_dlUarfcn, 3);
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v5, self->_cpichEcn0, 5);
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_cellType;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_cpichSc;
  *((_BYTE *)v4 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v4[4] = self->_cpichRscp;
    *((_BYTE *)v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[6] = self->_dlUarfcn;
  *((_BYTE *)v4 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_cpichEcn0;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_cellType;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_cpichSc;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_dlUarfcn;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_cpichRscp;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_cpichEcn0;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_cellType != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_26:
    v6 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_cpichSc != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0 || self->_dlUarfcn != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_cpichRscp != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_cpichEcn0 != *((_DWORD *)v4 + 3))
      goto LABEL_26;
    v6 = 1;
  }
LABEL_27:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_cellType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_cpichSc;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_dlUarfcn;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_cpichRscp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_cpichEcn0;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_cellType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_cpichSc = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_cpichRscp = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_dlUarfcn = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_cpichEcn0 = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (unsigned)cellType
{
  return self->_cellType;
}

- (unsigned)cpichSc
{
  return self->_cpichSc;
}

- (unsigned)dlUarfcn
{
  return self->_dlUarfcn;
}

- (unsigned)cpichRscp
{
  return self->_cpichRscp;
}

- (unsigned)cpichEcn0
{
  return self->_cpichEcn0;
}

@end
