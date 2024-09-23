@implementation HKCodableSummaryBloodPressureValue

- (BOOL)hasSystolicValue
{
  return self->_systolicValue != 0;
}

- (BOOL)hasDiastolicValue
{
  return self->_diastolicValue != 0;
}

- (void)setTimestampData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
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
  v8.super_class = (Class)HKCodableSummaryBloodPressureValue;
  -[HKCodableSummaryBloodPressureValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryBloodPressureValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *systolicValue;
  void *v5;
  HKCodableQuantity *diastolicValue;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systolicValue = self->_systolicValue;
  if (systolicValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](systolicValue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("systolicValue"));

  }
  diastolicValue = self->_diastolicValue;
  if (diastolicValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](diastolicValue, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("diastolicValue"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestampData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryBloodPressureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_systolicValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_diastolicValue)
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
  if (self->_systolicValue)
  {
    objc_msgSend(v4, "setSystolicValue:");
    v4 = v5;
  }
  if (self->_diastolicValue)
  {
    objc_msgSend(v5, "setDiastolicValue:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestampData;
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
  v6 = -[HKCodableQuantity copyWithZone:](self->_systolicValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[HKCodableQuantity copyWithZone:](self->_diastolicValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *systolicValue;
  HKCodableQuantity *diastolicValue;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  systolicValue = self->_systolicValue;
  if ((unint64_t)systolicValue | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](systolicValue, "isEqual:"))
      goto LABEL_10;
  }
  diastolicValue = self->_diastolicValue;
  if ((unint64_t)diastolicValue | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](diastolicValue, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_timestampData == *((double *)v4 + 1))
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
  double timestampData;
  double v7;
  long double v8;
  double v9;

  v3 = -[HKCodableQuantity hash](self->_systolicValue, "hash");
  v4 = -[HKCodableQuantity hash](self->_diastolicValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestampData = self->_timestampData;
    v7 = -timestampData;
    if (timestampData >= 0.0)
      v7 = self->_timestampData;
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
  HKCodableQuantity *systolicValue;
  uint64_t v6;
  HKCodableQuantity *diastolicValue;
  uint64_t v8;
  id v9;

  v4 = a3;
  systolicValue = self->_systolicValue;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (systolicValue)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableQuantity mergeFrom:](systolicValue, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSummaryBloodPressureValue setSystolicValue:](self, "setSystolicValue:");
  }
  v4 = v9;
LABEL_7:
  diastolicValue = self->_diastolicValue;
  v8 = *((_QWORD *)v4 + 2);
  if (diastolicValue)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableQuantity mergeFrom:](diastolicValue, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableSummaryBloodPressureValue setDiastolicValue:](self, "setDiastolicValue:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_timestampData = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (HKCodableQuantity)systolicValue
{
  return self->_systolicValue;
}

- (void)setSystolicValue:(id)a3
{
  objc_storeStrong((id *)&self->_systolicValue, a3);
}

- (HKCodableQuantity)diastolicValue
{
  return self->_diastolicValue;
}

- (void)setDiastolicValue:(id)a3
{
  objc_storeStrong((id *)&self->_diastolicValue, a3);
}

- (double)timestampData
{
  return self->_timestampData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systolicValue, 0);
  objc_storeStrong((id *)&self->_diastolicValue, 0);
}

@end
