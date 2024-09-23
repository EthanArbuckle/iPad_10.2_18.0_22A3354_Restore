@implementation HKCodableSummaryMostRecentRangeValue

- (BOOL)hasMinimumValue
{
  return self->_minimumValue != 0;
}

- (BOOL)hasMaximumValue
{
  return self->_maximumValue != 0;
}

- (void)setDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateData
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
  v8.super_class = (Class)HKCodableSummaryMostRecentRangeValue;
  -[HKCodableSummaryMostRecentRangeValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryMostRecentRangeValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *minimumValue;
  void *v5;
  HKCodableQuantity *maximumValue;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](minimumValue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("minimumValue"));

  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](maximumValue, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("maximumValue"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dateData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryMostRecentRangeValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_minimumValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_maximumValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_minimumValue)
  {
    objc_msgSend(v4, "setMinimumValue:");
    v4 = v5;
  }
  if (self->_maximumValue)
  {
    objc_msgSend(v5, "setMaximumValue:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_dateData;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableQuantity copyWithZone:](self->_minimumValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[HKCodableQuantity copyWithZone:](self->_maximumValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateData;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *minimumValue;
  HKCodableQuantity *maximumValue;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  minimumValue = self->_minimumValue;
  if ((unint64_t)minimumValue | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](minimumValue, "isEqual:"))
      goto LABEL_10;
  }
  maximumValue = self->_maximumValue;
  if ((unint64_t)maximumValue | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](maximumValue, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_dateData == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double dateData;
  double v7;
  long double v8;
  double v9;

  v3 = -[HKCodableQuantity hash](self->_minimumValue, "hash");
  v4 = -[HKCodableQuantity hash](self->_maximumValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dateData = self->_dateData;
    v7 = -dateData;
    if (dateData >= 0.0)
      v7 = self->_dateData;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableQuantity *minimumValue;
  uint64_t v6;
  HKCodableQuantity *maximumValue;
  uint64_t v8;
  id v9;

  v4 = a3;
  minimumValue = self->_minimumValue;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (minimumValue)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableQuantity mergeFrom:](minimumValue, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSummaryMostRecentRangeValue setMinimumValue:](self, "setMinimumValue:");
  }
  v4 = v9;
LABEL_7:
  maximumValue = self->_maximumValue;
  v8 = *((_QWORD *)v4 + 2);
  if (maximumValue)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableQuantity mergeFrom:](maximumValue, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableSummaryMostRecentRangeValue setMaximumValue:](self, "setMaximumValue:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_dateData = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (HKCodableQuantity)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (HKCodableQuantity)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
}

- (double)dateData
{
  return self->_dateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
}

@end
