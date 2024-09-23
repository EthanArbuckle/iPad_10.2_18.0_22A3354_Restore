@implementation TxHist

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_numTxLevels, a2);
  v3.receiver = self;
  v3.super_class = (Class)TxHist;
  -[TxHist dealloc](&v3, "dealloc");
}

- (int)chanType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_chanType;
  else
    return 0;
}

- (void)setChanType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_chanType = a3;
}

- (void)setHasChanType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChanType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)chanTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PUCCH");
  if (a3 == 1)
    v3 = CFSTR("PUSCH");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsChanType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUCCH")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PUSCH"));

  return v4;
}

- (void)setWorkMode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_workMode = a3;
}

- (void)setHasWorkMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWorkMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinTxLevel:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minTxLevel = a3;
}

- (void)setHasMinTxLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinTxLevel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)numTxLevelsCount
{
  return self->_numTxLevels.count;
}

- (unsigned)numTxLevels
{
  return self->_numTxLevels.list;
}

- (void)clearNumTxLevels
{
  PBRepeatedUInt32Clear(&self->_numTxLevels, a2);
}

- (void)addNumTxLevel:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_numTxLevels, *(_QWORD *)&a3);
}

- (unsigned)numTxLevelAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numTxLevels;
  unint64_t count;
  void *v6;
  void *v7;

  p_numTxLevels = &self->_numTxLevels;
  count = self->_numTxLevels.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_numTxLevels->list[a3];
}

- (void)setNumTxLevels:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_numTxLevels, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TxHist;
  v3 = -[TxHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TxHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int chanType;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    chanType = self->_chanType;
    if (chanType)
    {
      if (chanType == 1)
        v6 = CFSTR("PUSCH");
      else
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_chanType));
    }
    else
    {
      v6 = CFSTR("PUCCH");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("chan_type"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_workMode));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("work_mode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minTxLevel));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("min_tx_level"));

  }
  v9 = PBRepeatedUInt32NSArray(&self->_numTxLevels);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("num_tx_level"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100021764((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numTxLevels;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_chanType, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_workMode, 3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteSint32Field(v5, self->_minTxLevel, 4);
LABEL_5:
  p_numTxLevels = &self->_numTxLevels;
  if (p_numTxLevels->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (p_numTxLevels->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_numTxLevels->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_numTxLevels->count);
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_11:
    v4[10] = self->_workMode;
    *((_BYTE *)v4 + 44) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[8] = self->_chanType;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[9] = self->_minTxLevel;
    *((_BYTE *)v4 + 44) |= 2u;
  }
LABEL_5:
  v9 = v4;
  if (-[TxHist numTxLevelsCount](self, "numTxLevelsCount"))
  {
    objc_msgSend(v9, "clearNumTxLevels");
    v6 = -[TxHist numTxLevelsCount](self, "numTxLevelsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addNumTxLevel:", -[TxHist numTxLevelAtIndex:](self, "numTxLevelAtIndex:", i));
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v4 + 10) = self->_workMode;
    v4[44] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 8) = self->_chanType;
  v4[44] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 9) = self->_minTxLevel;
    v4[44] |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy(v4 + 8, &self->_numTxLevels);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[44] & 1) == 0 || self->_chanType != *((_DWORD *)v4 + 8))
      goto LABEL_18;
  }
  else if ((v4[44] & 1) != 0)
  {
LABEL_18:
    IsEqual = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[44] & 4) == 0 || self->_workMode != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((v4[44] & 4) != 0)
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[44] & 2) == 0 || self->_minTxLevel != *((_DWORD *)v4 + 9))
      goto LABEL_18;
  }
  else if ((v4[44] & 2) != 0)
  {
    goto LABEL_18;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_numTxLevels, v4 + 8);
LABEL_19:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ PBRepeatedUInt32Hash(&self->_numTxLevels);
  }
  v2 = 2654435761 * self->_chanType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_workMode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_minTxLevel;
  return v3 ^ v2 ^ v4 ^ PBRepeatedUInt32Hash(&self->_numTxLevels);
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
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_chanType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_workMode = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_4:
    self->_minTxLevel = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "numTxLevelsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[TxHist addNumTxLevel:](self, "addNumTxLevel:", objc_msgSend(v9, "numTxLevelAtIndex:", i));
  }

}

- (unsigned)workMode
{
  return self->_workMode;
}

- (int)minTxLevel
{
  return self->_minTxLevel;
}

@end
