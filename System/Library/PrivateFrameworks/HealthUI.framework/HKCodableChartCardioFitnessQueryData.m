@implementation HKCodableChartCardioFitnessQueryData

- (void)setCardioFitnessLevelEnabled:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cardioFitnessLevelEnabled = a3;
}

- (void)setHasCardioFitnessLevelEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCardioFitnessLevelEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBiologicalSex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_biologicalSex = a3;
}

- (void)setHasBiologicalSex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBiologicalSex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAge:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasQuantityData
{
  return self->_quantityData != 0;
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
  v8.super_class = (Class)HKCodableChartCardioFitnessQueryData;
  -[HKCodableChartCardioFitnessQueryData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartCardioFitnessQueryData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableChartQuantityDataSourceQueryData *quantityData;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cardioFitnessLevelEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cardioFitnessLevelEnabled"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_biologicalSex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("biologicalSex"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_age);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("age"));

  }
LABEL_5:
  quantityData = self->_quantityData;
  if (quantityData)
  {
    -[HKCodableChartQuantityDataSourceQueryData dictionaryRepresentation](quantityData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("quantityData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartCardioFitnessQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_quantityData)
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
  if ((has & 4) != 0)
  {
    v4[3] = self->_cardioFitnessLevelEnabled;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_biologicalSex;
  *((_BYTE *)v4 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[1] = self->_age;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_5:
  if (self->_quantityData)
  {
    v6 = v4;
    objc_msgSend(v4, "setQuantityData:");
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_biologicalSex;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 24) = self->_cardioFitnessLevelEnabled;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_age;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
LABEL_5:
  v8 = -[HKCodableChartQuantityDataSourceQueryData copyWithZone:](self->_quantityData, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableChartQuantityDataSourceQueryData *quantityData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_cardioFitnessLevelEnabled != *((_QWORD *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_biologicalSex != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_age != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_19;
  }
  quantityData = self->_quantityData;
  if ((unint64_t)quantityData | *((_QWORD *)v4 + 4))
    v6 = -[HKCodableChartQuantityDataSourceQueryData isEqual:](quantityData, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[HKCodableChartQuantityDataSourceQueryData hash](self->_quantityData, "hash");
  }
  v2 = 2654435761 * self->_cardioFitnessLevelEnabled;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_biologicalSex;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_age;
  return v3 ^ v2 ^ v4 ^ -[HKCodableChartQuantityDataSourceQueryData hash](self->_quantityData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  HKCodableChartQuantityDataSourceQueryData *quantityData;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 4) != 0)
  {
    self->_cardioFitnessLevelEnabled = v4[3];
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4[5] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_biologicalSex = v4[2];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[5] & 1) != 0)
  {
LABEL_4:
    self->_age = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  quantityData = self->_quantityData;
  v8 = v5[4];
  if (quantityData)
  {
    if (v8)
    {
      v9 = v5;
      -[HKCodableChartQuantityDataSourceQueryData mergeFrom:](quantityData, "mergeFrom:");
LABEL_13:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[HKCodableChartCardioFitnessQueryData setQuantityData:](self, "setQuantityData:");
    goto LABEL_13;
  }

}

- (int64_t)cardioFitnessLevelEnabled
{
  return self->_cardioFitnessLevelEnabled;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)age
{
  return self->_age;
}

- (HKCodableChartQuantityDataSourceQueryData)quantityData
{
  return self->_quantityData;
}

- (void)setQuantityData:(id)a3
{
  objc_storeStrong((id *)&self->_quantityData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityData, 0);
}

@end
