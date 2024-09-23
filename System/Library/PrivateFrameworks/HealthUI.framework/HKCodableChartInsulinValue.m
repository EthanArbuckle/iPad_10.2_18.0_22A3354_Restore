@implementation HKCodableChartInsulinValue

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

- (BOOL)hasInsulinQuantity
{
  return self->_insulinQuantity != 0;
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
  v8.super_class = (Class)HKCodableChartInsulinValue;
  -[HKCodableChartInsulinValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartInsulinValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  HKCodableQuantity *insulinQuantity;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("endDate"));

  }
  insulinQuantity = self->_insulinQuantity;
  if (insulinQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](insulinQuantity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("insulinQuantity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartInsulinValueReadFrom((uint64_t)self, (uint64_t)a3);
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
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_insulinQuantity)
  {
    PBDataWriterWriteSubmessage();
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
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_insulinQuantity)
  {
    v6 = v4;
    objc_msgSend(v4, "setInsulinQuantity:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_startDate;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_endDate;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_insulinQuantity, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *insulinQuantity;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_startDate != *((double *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_14;
  }
  insulinQuantity = self->_insulinQuantity;
  if ((unint64_t)insulinQuantity | *((_QWORD *)v4 + 3))
    v6 = -[HKCodableQuantity isEqual:](insulinQuantity, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
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
  return v9 ^ v4 ^ -[HKCodableQuantity hash](self->_insulinQuantity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  HKCodableQuantity *insulinQuantity;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_startDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((v6 & 1) != 0)
  {
    self->_endDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  insulinQuantity = self->_insulinQuantity;
  v8 = v5[3];
  if (insulinQuantity)
  {
    if (v8)
    {
      v9 = v5;
      -[HKCodableQuantity mergeFrom:](insulinQuantity, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[HKCodableChartInsulinValue setInsulinQuantity:](self, "setInsulinQuantity:");
    goto LABEL_10;
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

- (HKCodableQuantity)insulinQuantity
{
  return self->_insulinQuantity;
}

- (void)setInsulinQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_insulinQuantity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insulinQuantity, 0);
}

@end
