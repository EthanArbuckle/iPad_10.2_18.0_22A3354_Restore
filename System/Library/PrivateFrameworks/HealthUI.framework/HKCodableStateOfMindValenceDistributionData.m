@implementation HKCodableStateOfMindValenceDistributionData

- (void)setMinimumValence:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumValence = a3;
}

- (void)setHasMinimumValence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumValence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaximumValence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maximumValence = a3;
}

- (void)setHasMaximumValence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumValence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSampleCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sampleCount = a3;
}

- (void)setHasSampleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSampleCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)reflectiveInterval
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_reflectiveInterval;
  else
    return 1;
}

- (void)setReflectiveInterval:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReflectiveInterval
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)reflectiveIntervalAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("momentary");
  if (a3 == 2)
  {
    v3 = CFSTR("daily");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReflectiveInterval:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("momentary")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("daily")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)HKCodableStateOfMindValenceDistributionData;
  -[HKCodableStateOfMindValenceDistributionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStateOfMindValenceDistributionData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  int reflectiveInterval;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumValence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("minimumValence"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sampleCount);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sampleCount"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumValence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("maximumValence"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_8;
LABEL_4:
  if ((has & 8) == 0)
    return v3;
LABEL_9:
  reflectiveInterval = self->_reflectiveInterval;
  if (reflectiveInterval == 1)
  {
    v9 = CFSTR("momentary");
  }
  else if (reflectiveInterval == 2)
  {
    v9 = CFSTR("daily");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reflectiveInterval);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("reflectiveInterval"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableStateOfMindValenceDistributionDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt64Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_minimumValence;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v4[3] = self->_sampleCount;
      *((_BYTE *)v4 + 36) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_maximumValence;
  *((_BYTE *)v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 8) = self->_reflectiveInterval;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_minimumValence;
    *((_BYTE *)result + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_maximumValence;
  *((_BYTE *)result + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 3) = self->_sampleCount;
  *((_BYTE *)result + 36) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 8) = self->_reflectiveInterval;
  *((_BYTE *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_minimumValence != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_maximumValence != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_sampleCount != *((_QWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_reflectiveInterval != *((_DWORD *)v4 + 8))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double minimumValence;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double maximumValence;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    minimumValence = self->_minimumValence;
    v6 = -minimumValence;
    if (minimumValence >= 0.0)
      v6 = self->_minimumValence;
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
    maximumValence = self->_maximumValence;
    v11 = -maximumValence;
    if (maximumValence >= 0.0)
      v11 = self->_maximumValence;
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
  {
    v14 = 2654435761 * self->_sampleCount;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v15 = 0;
    return v9 ^ v4 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((has & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v15 = 2654435761 * self->_reflectiveInterval;
  return v9 ^ v4 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_minimumValence = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      self->_sampleCount = *((_QWORD *)v4 + 3);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 36) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_maximumValence = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    self->_reflectiveInterval = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:

}

- (double)minimumValence
{
  return self->_minimumValence;
}

- (double)maximumValence
{
  return self->_maximumValence;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

@end
