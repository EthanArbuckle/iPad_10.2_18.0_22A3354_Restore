@implementation RecoverHist

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_recoverCountStateBreaks, a2);
  v3.receiver = self;
  v3.super_class = (Class)RecoverHist;
  -[RecoverHist dealloc](&v3, "dealloc");
}

- (int)recoverDurationEnum
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_recoverDurationEnum;
  else
    return 0;
}

- (void)setRecoverDurationEnum:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recoverDurationEnum = a3;
}

- (void)setHasRecoverDurationEnum:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecoverDurationEnum
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)recoverDurationEnumAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F200 + a3);
}

- (int)StringAsRecoverDurationEnum:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LT_5S")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GE_5S_LT_20S")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GE_20S_LT_5M")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GE_5M_LT_15M")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GE_15M_LT_30M")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GE_30M")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRecoverCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recoverCount = a3;
}

- (void)setHasRecoverCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecoverCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)recoverCountStateBreaksCount
{
  return self->_recoverCountStateBreaks.count;
}

- (unsigned)recoverCountStateBreaks
{
  return self->_recoverCountStateBreaks.list;
}

- (void)clearRecoverCountStateBreaks
{
  PBRepeatedUInt32Clear(&self->_recoverCountStateBreaks, a2);
}

- (void)addRecoverCountStateBreak:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_recoverCountStateBreaks, *(_QWORD *)&a3);
}

- (unsigned)recoverCountStateBreakAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_recoverCountStateBreaks;
  unint64_t count;
  void *v6;
  void *v7;

  p_recoverCountStateBreaks = &self->_recoverCountStateBreaks;
  count = self->_recoverCountStateBreaks.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_recoverCountStateBreaks->list[a3];
}

- (void)setRecoverCountStateBreaks:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_recoverCountStateBreaks, a3, a4);
}

- (void)setRecoverDurationEnum2:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recoverDurationEnum2 = a3;
}

- (void)setHasRecoverDurationEnum2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecoverDurationEnum2
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
  v8.super_class = (Class)RecoverHist;
  v3 = -[RecoverHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t recoverDurationEnum;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    recoverDurationEnum = self->_recoverDurationEnum;
    if (recoverDurationEnum >= 6)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recoverDurationEnum));
    else
      v6 = *(&off_10025F200 + recoverDurationEnum);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("recover_duration_enum"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_recoverCount));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("recover_count"));

  }
  v8 = PBRepeatedUInt32NSArray(&self->_recoverCountStateBreaks);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("recover_count_state_break"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_recoverDurationEnum2));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("recover_duration_enum_2"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B1534((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_recoverDurationEnum, 1);
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_recoverCount, 2);
    v4 = v7;
  }
  if (self->_recoverCountStateBreaks.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v7, self->_recoverCountStateBreaks.list[v6], 3);
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_recoverCountStateBreaks.count);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_recoverDurationEnum2, 4);
    v4 = v7;
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
  if ((has & 2) != 0)
  {
    v4[9] = self->_recoverDurationEnum;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[8] = self->_recoverCount;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v9 = v4;
  if (-[RecoverHist recoverCountStateBreaksCount](self, "recoverCountStateBreaksCount"))
  {
    objc_msgSend(v9, "clearRecoverCountStateBreaks");
    v6 = -[RecoverHist recoverCountStateBreaksCount](self, "recoverCountStateBreaksCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addRecoverCountStateBreak:", -[RecoverHist recoverCountStateBreakAtIndex:](self, "recoverCountStateBreakAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_recoverDurationEnum2;
    *((_BYTE *)v9 + 44) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;
  char has;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_recoverDurationEnum;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[8] = self->_recoverCount;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  PBRepeatedUInt32Copy(v4 + 2, &self->_recoverCountStateBreaks);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[10] = self->_recoverDurationEnum2;
    *((_BYTE *)v5 + 44) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[44] & 2) == 0 || self->_recoverDurationEnum != *((_DWORD *)v4 + 9))
      goto LABEL_17;
  }
  else if ((v4[44] & 2) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[44] & 1) == 0 || self->_recoverCount != *((_DWORD *)v4 + 8))
      goto LABEL_17;
  }
  else if ((v4[44] & 1) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_recoverCountStateBreaks, v4 + 8))
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  v6 = (v4[44] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[44] & 4) == 0 || self->_recoverDurationEnum2 != *((_DWORD *)v4 + 10))
      goto LABEL_17;
    v6 = 1;
  }
LABEL_18:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_recoverDurationEnum;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_recoverCount;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash(&self->_recoverCountStateBreaks);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_recoverDurationEnum2;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  unsigned int *v9;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_recoverDurationEnum = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_recoverCount = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "recoverCountStateBreaksCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[RecoverHist addRecoverCountStateBreak:](self, "addRecoverCountStateBreak:", objc_msgSend(v9, "recoverCountStateBreakAtIndex:", i));
  }
  if ((v9[11] & 4) != 0)
  {
    self->_recoverDurationEnum2 = v9[10];
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unsigned)recoverCount
{
  return self->_recoverCount;
}

- (unsigned)recoverDurationEnum2
{
  return self->_recoverDurationEnum2;
}

@end
