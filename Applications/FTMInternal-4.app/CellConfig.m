@implementation CellConfig

- (void)setBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBand
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDlFreq
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUlState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_ulState = a3;
}

- (void)setHasUlState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUlState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDlBw
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
  v8.super_class = (Class)CellConfig;
  v3 = -[CellConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_band));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("band"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlFreq));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dl_freq"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulState));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ul_state"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_state));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("state"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_bw"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006AEF0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_band, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_dlFreq, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field(v5, self->_ulState, 4);
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field(v5, self->_state, 3);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v5, self->_dlBw, 6);
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
    v4[2] = self->_band;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_dlFreq;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    v4[6] = self->_ulState;
    *((_BYTE *)v4 + 28) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[5] = self->_state;
  *((_BYTE *)v4 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_dlBw;
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
    *((_DWORD *)result + 2) = self->_band;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_dlFreq;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_state;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_ulState;
  *((_BYTE *)result + 28) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_dlBw;
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
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_band != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_26:
    v6 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_dlFreq != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_state != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0 || self->_ulState != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_dlBw != *((_DWORD *)v4 + 3))
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
    v2 = 2654435761 * self->_band;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_dlFreq;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_state;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
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
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_ulState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_dlBw;
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
    self->_band = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_dlFreq = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    self->_ulState = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_state = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_dlBw = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)dlFreq
{
  return self->_dlFreq;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)ulState
{
  return self->_ulState;
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

@end
