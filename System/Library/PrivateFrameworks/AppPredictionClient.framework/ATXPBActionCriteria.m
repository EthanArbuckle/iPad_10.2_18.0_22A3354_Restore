@implementation ATXPBActionCriteria

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsLockScreenEligible:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isLockScreenEligible = a3;
}

- (void)setHasIsLockScreenEligible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsLockScreenEligible
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasPredicate
{
  return self->_predicate != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBActionCriteria;
  -[ATXPBActionCriteria description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActionCriteria dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *predicate;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("startDate"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("endDate"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLockScreenEligible);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isLockScreenEligible"));

  }
LABEL_5:
  predicate = self->_predicate;
  if (predicate)
    objc_msgSend(v3, "setObject:forKey:", predicate, CFSTR("predicate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActionCriteriaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:
  if (self->_predicate)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_endDate;
  *((_BYTE *)v4 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 32) = self->_isLockScreenEligible;
    *((_BYTE *)v4 + 36) |= 4u;
  }
LABEL_5:
  if (self->_predicate)
  {
    v6 = v4;
    objc_msgSend(v4, "setPredicate:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 8) = self->_endDate;
    *(_BYTE *)(v5 + 36) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 16) = self->_startDate;
  *(_BYTE *)(v5 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 32) = self->_isLockScreenEligible;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSData *predicate;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_startDate != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_22;
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 36) & 4) == 0)
    goto LABEL_16;
  if (!self->_isLockScreenEligible)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_16;
LABEL_22:
  predicate = self->_predicate;
  if ((unint64_t)predicate | *((_QWORD *)v4 + 3))
    v5 = -[NSData isEqual:](predicate, "isEqual:");
  else
    v5 = 1;
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double endDate;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    startDate = self->_startDate;
    v6 = -startDate;
    if (startDate >= 0.0)
      v6 = self->_startDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
  {
    endDate = self->_endDate;
    v11 = -endDate;
    if (endDate >= 0.0)
      v11 = self->_endDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
    v14 = 2654435761 * self->_isLockScreenEligible;
  else
    v14 = 0;
  return v9 ^ v4 ^ v14 ^ -[NSData hash](self->_predicate, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_startDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_endDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_4:
    self->_isLockScreenEligible = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[ATXPBActionCriteria setPredicate:](self, "setPredicate:");
    v4 = v6;
  }

}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (BOOL)isLockScreenEligible
{
  return self->_isLockScreenEligible;
}

- (NSData)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
