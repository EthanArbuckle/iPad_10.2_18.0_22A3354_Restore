@implementation RxHist

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_numRxLevels, a2);
  v3.receiver = self;
  v3.super_class = (Class)RxHist;
  -[RxHist dealloc](&v3, "dealloc");
}

- (int)agcMode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_agcMode;
  else
    return 0;
}

- (void)setAgcMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_agcMode = a3;
}

- (void)setHasAgcMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgcMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)agcModeAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x807Fu >> a3) & 1) != 0)
    v3 = *(&off_10025F358 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsAgcMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREQ_SCAN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INIT_ACQ")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTER_FREQ")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONLINE_DRX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_DRX")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)antenna
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_antenna;
  else
    return 0;
}

- (void)setAntenna:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAntenna
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F3D8 + a3);
}

- (int)StringAsAntenna:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RX_0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RX_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RX_BOTH")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWorkMode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_workMode = a3;
}

- (void)setHasWorkMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWorkMode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMinRxLevel:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minRxLevel = a3;
}

- (void)setHasMinRxLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinRxLevel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)numRxLevelsCount
{
  return self->_numRxLevels.count;
}

- (unsigned)numRxLevels
{
  return self->_numRxLevels.list;
}

- (void)clearNumRxLevels
{
  PBRepeatedUInt32Clear(&self->_numRxLevels, a2);
}

- (void)addNumRxLevel:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_numRxLevels, *(_QWORD *)&a3);
}

- (unsigned)numRxLevelAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numRxLevels;
  unint64_t count;
  void *v6;
  void *v7;

  p_numRxLevels = &self->_numRxLevels;
  count = self->_numRxLevels.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_numRxLevels->list[a3];
}

- (void)setNumRxLevels:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_numRxLevels, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RxHist;
  v3 = -[RxHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RxHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t agcMode;
  void *v6;
  uint64_t antenna;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    agcMode = self->_agcMode;
    if (agcMode < 0x10 && ((0x807Fu >> agcMode) & 1) != 0)
      v6 = *(&off_10025F358 + agcMode);
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_agcMode));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("agc_mode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    antenna = self->_antenna;
    if (antenna >= 3)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_antenna));
    else
      v8 = *(&off_10025F3D8 + antenna);
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("antenna"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_workMode));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("work_mode"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minRxLevel));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("min_rx_level"));

  }
  v11 = PBRepeatedUInt32NSArray(&self->_numRxLevels);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("num_rx_level"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B829C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numRxLevels;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_agcMode, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_antenna, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_14:
  PBDataWriterWriteUint32Field(v5, self->_workMode, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteSint32Field(v5, self->_minRxLevel, 4);
LABEL_6:
  p_numRxLevels = &self->_numRxLevels;
  if (p_numRxLevels->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (p_numRxLevels->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_numRxLevels->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_numRxLevels->count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_agcMode;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_13:
      v4[11] = self->_workMode;
      *((_BYTE *)v4 + 48) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_antenna;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    v4[10] = self->_minRxLevel;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_6:
  v9 = v4;
  if (-[RxHist numRxLevelsCount](self, "numRxLevelsCount"))
  {
    objc_msgSend(v9, "clearNumRxLevels");
    v6 = -[RxHist numRxLevelsCount](self, "numRxLevelsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addNumRxLevel:", -[RxHist numRxLevelAtIndex:](self, "numRxLevelAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  void *v5;
  char has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_agcMode;
    v4[48] |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v4 + 11) = self->_workMode;
      v4[48] |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_antenna;
  v4[48] |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 10) = self->_minRxLevel;
    v4[48] |= 4u;
  }
LABEL_6:
  PBRepeatedUInt32Copy(v4 + 8, &self->_numRxLevels);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[48] & 1) == 0 || self->_agcMode != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((v4[48] & 1) != 0)
  {
LABEL_23:
    IsEqual = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[48] & 2) == 0 || self->_antenna != *((_DWORD *)v4 + 9))
      goto LABEL_23;
  }
  else if ((v4[48] & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[48] & 8) == 0 || self->_workMode != *((_DWORD *)v4 + 11))
      goto LABEL_23;
  }
  else if ((v4[48] & 8) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[48] & 4) == 0 || self->_minRxLevel != *((_DWORD *)v4 + 10))
      goto LABEL_23;
  }
  else if ((v4[48] & 4) != 0)
  {
    goto LABEL_23;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_numRxLevels, v4 + 8);
LABEL_24:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_agcMode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_antenna;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash(&self->_numRxLevels);
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_workMode;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_minRxLevel;
  return v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash(&self->_numRxLevels);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  id v9;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_agcMode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_antenna = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_12:
  self->_workMode = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_5:
    self->_minRxLevel = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "numRxLevelsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[RxHist addNumRxLevel:](self, "addNumRxLevel:", objc_msgSend(v9, "numRxLevelAtIndex:", i));
  }

}

- (unsigned)workMode
{
  return self->_workMode;
}

- (int)minRxLevel
{
  return self->_minRxLevel;
}

@end
