@implementation RxInfo

- (void)setRssi:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRssi
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRscp:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRscp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEcno:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ecno = a3;
}

- (void)setHasEcno:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEcno
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFrameIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_frameIndex = a3;
}

- (void)setHasFrameIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFrameIndex
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
  v8.super_class = (Class)RxInfo;
  v3 = -[RxInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RxInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rssi));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rssi"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_ecno));
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ecno"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rscp));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rscp"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_frameIndex));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("frame_index"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000362DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint32Field(v5, self->_rssi, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteSint32Field(v5, self->_ecno, 3);
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field(v5, self->_rscp, 2);
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field(v5, self->_frameIndex, 4);
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_rssi;
    *((_BYTE *)v4 + 24) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v4[2] = self->_ecno;
      *((_BYTE *)v4 + 24) |= 1u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_rscp;
  *((_BYTE *)v4 + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    v4[3] = self->_frameIndex;
    *((_BYTE *)v4 + 24) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_rssi;
    *((_BYTE *)result + 24) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_rscp;
  *((_BYTE *)result + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = self->_ecno;
  *((_BYTE *)result + 24) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 3) = self->_frameIndex;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_rssi != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_rscp != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_ecno != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_21;
  }
  v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_frameIndex != *((_DWORD *)v4 + 3))
      goto LABEL_21;
    v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_rssi;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_rscp;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_ecno;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_frameIndex;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 8) != 0)
  {
    self->_rssi = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_ecno = *((_DWORD *)v4 + 2);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 24) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_rscp = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    self->_frameIndex = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:

}

- (int)rssi
{
  return self->_rssi;
}

- (int)rscp
{
  return self->_rscp;
}

- (int)ecno
{
  return self->_ecno;
}

- (unsigned)frameIndex
{
  return self->_frameIndex;
}

@end
