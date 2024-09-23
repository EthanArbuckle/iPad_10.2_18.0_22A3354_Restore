@implementation HKCodableElectrocardiogramSample

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
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

- (void)setSymptomsStatusRawValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_symptomsStatusRawValue = a3;
}

- (void)setHasSymptomsStatusRawValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSymptomsStatusRawValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPrivateSymptoms:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_privateSymptoms = a3;
}

- (void)setHasPrivateSymptoms:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrivateSymptoms
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReadingData
{
  return self->_readingData != 0;
}

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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableElectrocardiogramSample;
  -[HKCodableElectrocardiogramSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableElectrocardiogramSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableDateInterval *dateInterval;
  void *v5;
  void *v6;
  HKCodableQuantity *averageHeartRate;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSData *readingData;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](dateInterval, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dateInterval"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
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
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_symptomsStatusRawValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("symptomsStatusRawValue"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_privateSymptoms);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("privateSymptoms"));

  }
  readingData = self->_readingData;
  if (readingData)
    objc_msgSend(v3, "setObject:forKey:", readingData, CFSTR("readingData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_algorithmVersionRawValue);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("algorithmVersionRawValue"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableElectrocardiogramSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_averageHeartRate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_readingData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_dateInterval)
  {
    objc_msgSend(v4, "setDateInterval:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_classificationRawValue;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_averageHeartRate)
  {
    objc_msgSend(v6, "setAverageHeartRate:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_symptomsStatusRawValue;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_privateSymptoms;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  if (self->_readingData)
  {
    objc_msgSend(v6, "setReadingData:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_algorithmVersionRawValue;
    *((_BYTE *)v4 + 64) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDateInterval copyWithZone:](self->_dateInterval, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_classificationRawValue;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_averageHeartRate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_symptomsStatusRawValue;
    *(_BYTE *)(v5 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_privateSymptoms;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
  v11 = -[NSData copyWithZone:](self->_readingData, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_algorithmVersionRawValue;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDateInterval *dateInterval;
  char has;
  HKCodableQuantity *averageHeartRate;
  NSData *readingData;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:"))
      goto LABEL_29;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_classificationRawValue != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_29;
  }
  averageHeartRate = self->_averageHeartRate;
  if ((unint64_t)averageHeartRate | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](averageHeartRate, "isEqual:"))
      goto LABEL_29;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_symptomsStatusRawValue != *((_QWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_privateSymptoms != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_29;
  }
  readingData = self->_readingData;
  if ((unint64_t)readingData | *((_QWORD *)v4 + 7))
  {
    if (-[NSData isEqual:](readingData, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_25;
    }
LABEL_29:
    v9 = 0;
    goto LABEL_30;
  }
LABEL_25:
  v9 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_algorithmVersionRawValue != *((_QWORD *)v4 + 1))
      goto LABEL_29;
    v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[HKCodableDateInterval hash](self->_dateInterval, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_classificationRawValue;
  else
    v4 = 0;
  v5 = -[HKCodableQuantity hash](self->_averageHeartRate, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_symptomsStatusRawValue;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_privateSymptoms;
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_9:
  v8 = -[NSData hash](self->_readingData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_algorithmVersionRawValue;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableDateInterval *dateInterval;
  uint64_t v6;
  HKCodableQuantity *averageHeartRate;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = a3;
  dateInterval = self->_dateInterval;
  v6 = v4[6];
  v10 = v4;
  if (dateInterval)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableElectrocardiogramSample setDateInterval:](self, "setDateInterval:");
  }
  v4 = v10;
LABEL_7:
  if ((v4[8] & 2) != 0)
  {
    self->_classificationRawValue = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  averageHeartRate = self->_averageHeartRate;
  v8 = v4[5];
  if (averageHeartRate)
  {
    if (!v8)
      goto LABEL_15;
    -[HKCodableQuantity mergeFrom:](averageHeartRate, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[HKCodableElectrocardiogramSample setAverageHeartRate:](self, "setAverageHeartRate:");
  }
  v4 = v10;
LABEL_15:
  v9 = *((_BYTE *)v4 + 64);
  if ((v9 & 8) != 0)
  {
    self->_symptomsStatusRawValue = v4[4];
    *(_BYTE *)&self->_has |= 8u;
    v9 = *((_BYTE *)v4 + 64);
  }
  if ((v9 & 4) != 0)
  {
    self->_privateSymptoms = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (v4[7])
  {
    -[HKCodableElectrocardiogramSample setReadingData:](self, "setReadingData:");
    v4 = v10;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_algorithmVersionRawValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
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

- (int64_t)symptomsStatusRawValue
{
  return self->_symptomsStatusRawValue;
}

- (int64_t)privateSymptoms
{
  return self->_privateSymptoms;
}

- (NSData)readingData
{
  return self->_readingData;
}

- (void)setReadingData:(id)a3
{
  objc_storeStrong((id *)&self->_readingData, a3);
}

- (int64_t)algorithmVersionRawValue
{
  return self->_algorithmVersionRawValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingData, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
}

@end
