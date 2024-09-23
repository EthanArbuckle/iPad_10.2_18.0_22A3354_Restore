@implementation HDCodableHighlightDay

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsPaddedDay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPaddedDay = a3;
}

- (void)setHasIsPaddedDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPaddedDay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HDCodableHighlightDay;
  -[HDCodableHighlightDay description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHighlightDay dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_status);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("status"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("date"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPaddedDay);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isPaddedDay"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableHighlightDayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[17] = self->_status;
    v4[20] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
  v4[20] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[16] = self->_isPaddedDay;
    v4[20] |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_date;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 17) = self->_status;
  *((_BYTE *)result + 20) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 16) = self->_isPaddedDay;
  *((_BYTE *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_17;
    if (self->_status)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) != 0)
    {
      if (self->_isPaddedDay)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_17;
      }
      v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    date = self->_date;
    v6 = -date;
    if (date >= 0.0)
      v6 = self->_date;
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
  if ((has & 4) != 0)
  {
    v9 = 2654435761 * self->_status;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v10 = 0;
    return v9 ^ v4 ^ v10;
  }
  v9 = 0;
  if ((has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v10 = 2654435761 * self->_isPaddedDay;
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_status = *((_BYTE *)v4 + 17);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_date = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_isPaddedDay = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (double)date
{
  return self->_date;
}

- (BOOL)status
{
  return self->_status;
}

- (BOOL)isPaddedDay
{
  return self->_isPaddedDay;
}

@end
