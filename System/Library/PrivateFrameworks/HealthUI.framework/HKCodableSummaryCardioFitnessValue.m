@implementation HKCodableSummaryCardioFitnessValue

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setClassificationRawValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_classificationRawValue = a3;
}

- (void)setHasClassificationRawValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassificationRawValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDateData
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLevelViewDataConfiguration
{
  return self->_levelViewDataConfiguration != 0;
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
  v8.super_class = (Class)HKCodableSummaryCardioFitnessValue;
  -[HKCodableSummaryCardioFitnessValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryCardioFitnessValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *value;
  void *v5;
  char has;
  void *v7;
  void *v8;
  HKCodableLevelViewDataConfiguration *levelViewDataConfiguration;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    -[HKCodableQuantity dictionaryRepresentation](value, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_classificationRawValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("classificationRawValue"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dateData"));

  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if (levelViewDataConfiguration)
  {
    -[HKCodableLevelViewDataConfiguration dictionaryRepresentation](levelViewDataConfiguration, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("levelViewDataConfiguration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCardioFitnessValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_levelViewDataConfiguration)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_classificationRawValue;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_dateData;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_levelViewDataConfiguration)
  {
    objc_msgSend(v6, "setLevelViewDataConfiguration:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableQuantity copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_classificationRawValue;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateData;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v9 = -[HKCodableLevelViewDataConfiguration copyWithZone:](self->_levelViewDataConfiguration, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *value;
  HKCodableLevelViewDataConfiguration *levelViewDataConfiguration;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](value, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_classificationRawValue != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_dateData != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  if ((unint64_t)levelViewDataConfiguration | *((_QWORD *)v4 + 3))
    v7 = -[HKCodableLevelViewDataConfiguration isEqual:](levelViewDataConfiguration, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double dateData;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[HKCodableQuantity hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_classificationRawValue;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9 ^ -[HKCodableLevelViewDataConfiguration hash](self->_levelViewDataConfiguration, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  dateData = self->_dateData;
  v6 = -dateData;
  if (dateData >= 0.0)
    v6 = self->_dateData;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ -[HKCodableLevelViewDataConfiguration hash](self->_levelViewDataConfiguration, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableQuantity *value;
  uint64_t v6;
  char v7;
  HKCodableLevelViewDataConfiguration *levelViewDataConfiguration;
  uint64_t v9;
  id v10;

  v4 = a3;
  value = self->_value;
  v6 = *((_QWORD *)v4 + 4);
  v10 = v4;
  if (value)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableQuantity mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSummaryCardioFitnessValue setValue:](self, "setValue:");
  }
  v4 = v10;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) != 0)
  {
    self->_classificationRawValue = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 40);
  }
  if ((v7 & 2) != 0)
  {
    self->_dateData = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  levelViewDataConfiguration = self->_levelViewDataConfiguration;
  v9 = *((_QWORD *)v4 + 3);
  if (levelViewDataConfiguration)
  {
    if (v9)
    {
      -[HKCodableLevelViewDataConfiguration mergeFrom:](levelViewDataConfiguration, "mergeFrom:");
LABEL_16:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[HKCodableSummaryCardioFitnessValue setLevelViewDataConfiguration:](self, "setLevelViewDataConfiguration:");
    goto LABEL_16;
  }

}

- (HKCodableQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int64_t)classificationRawValue
{
  return self->_classificationRawValue;
}

- (double)dateData
{
  return self->_dateData;
}

- (HKCodableLevelViewDataConfiguration)levelViewDataConfiguration
{
  return self->_levelViewDataConfiguration;
}

- (void)setLevelViewDataConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_levelViewDataConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_levelViewDataConfiguration, 0);
}

@end
