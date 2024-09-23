@implementation HKCodableSummaryElectrocardiogramValue

- (void)setAlgorithmVersionRawValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_algorithmVersionRawValue = a3;
}

- (void)setHasAlgorithmVersionRawValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithmVersionRawValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setClassificationRawValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_classificationRawValue = a3;
}

- (void)setHasClassificationRawValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClassificationRawValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAverageHeartRate
{
  return self->_averageHeartRate != 0;
}

- (void)setTimestampData:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestampData
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HKCodableSummaryElectrocardiogramValue;
  -[HKCodableSummaryElectrocardiogramValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryElectrocardiogramValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableQuantity *averageHeartRate;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_algorithmVersionRawValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("algorithmVersionRawValue"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_classificationRawValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("classificationRawValue"));

  }
  averageHeartRate = self->_averageHeartRate;
  if (averageHeartRate)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageHeartRate, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("averageHeartRate"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestampData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryElectrocardiogramValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_averageHeartRate)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_algorithmVersionRawValue;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_classificationRawValue;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_averageHeartRate)
  {
    v6 = v4;
    objc_msgSend(v4, "setAverageHeartRate:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_timestampData;
    *((_BYTE *)v4 + 40) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_algorithmVersionRawValue;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_classificationRawValue;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_averageHeartRate, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v6 + 24) = self->_timestampData;
    *(_BYTE *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodableQuantity *averageHeartRate;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_algorithmVersionRawValue != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_classificationRawValue != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  averageHeartRate = self->_averageHeartRate;
  if ((unint64_t)averageHeartRate | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](averageHeartRate, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_timestampData != *((double *)v4 + 3))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double timestampData;
  double v8;
  long double v9;
  double v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_algorithmVersionRawValue;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_classificationRawValue;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[HKCodableQuantity hash](self->_averageHeartRate, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    timestampData = self->_timestampData;
    v8 = -timestampData;
    if (timestampData >= 0.0)
      v8 = self->_timestampData;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;
  char v6;
  HKCodableQuantity *averageHeartRate;
  uint64_t v8;
  int64_t *v9;

  v4 = (int64_t *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 1) != 0)
  {
    self->_algorithmVersionRawValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((v6 & 2) != 0)
  {
    self->_classificationRawValue = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  averageHeartRate = self->_averageHeartRate;
  v8 = v5[4];
  if (averageHeartRate)
  {
    if (!v8)
      goto LABEL_11;
    v9 = v5;
    -[HKCodableQuantity mergeFrom:](averageHeartRate, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v9 = v5;
    -[HKCodableSummaryElectrocardiogramValue setAverageHeartRate:](self, "setAverageHeartRate:");
  }
  v5 = v9;
LABEL_11:
  if ((v5[5] & 4) != 0)
  {
    *(_QWORD *)&self->_timestampData = v5[3];
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (int64_t)algorithmVersionRawValue
{
  return self->_algorithmVersionRawValue;
}

- (int64_t)classificationRawValue
{
  return self->_classificationRawValue;
}

- (HKCodableQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (void)setAverageHeartRate:(id)a3
{
  objc_storeStrong((id *)&self->_averageHeartRate, a3);
}

- (double)timestampData
{
  return self->_timestampData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
}

@end
