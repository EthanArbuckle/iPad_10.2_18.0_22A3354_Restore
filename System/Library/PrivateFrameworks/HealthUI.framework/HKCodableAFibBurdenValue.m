@implementation HKCodableAFibBurdenValue

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasDayIndexRange
{
  return self->_dayIndexRange != 0;
}

- (void)setValueClamped:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_valueClamped = a3;
}

- (void)setHasValueClamped:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueClamped
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
  v8.super_class = (Class)HKCodableAFibBurdenValue;
  -[HKCodableAFibBurdenValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableAFibBurdenValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableDayIndexRange *dayIndexRange;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    -[HKCodableQuantity dictionaryRepresentation](value, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value"));

  }
  dayIndexRange = self->_dayIndexRange;
  if (dayIndexRange)
  {
    -[HKCodableDayIndexRange dictionaryRepresentation](dayIndexRange, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dayIndexRange"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_valueClamped);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("valueClamped"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAFibBurdenValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_dayIndexRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    v4 = v5;
  }
  if (self->_dayIndexRange)
  {
    objc_msgSend(v5, "setDayIndexRange:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_valueClamped;
    v4[28] |= 1u;
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
  v6 = -[HKCodableQuantity copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[HKCodableDayIndexRange copyWithZone:](self->_dayIndexRange, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_valueClamped;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *value;
  HKCodableDayIndexRange *dayIndexRange;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](value, "isEqual:"))
      goto LABEL_8;
  }
  dayIndexRange = self->_dayIndexRange;
  if ((unint64_t)dayIndexRange | *((_QWORD *)v4 + 1))
  {
    if (!-[HKCodableDayIndexRange isEqual:](dayIndexRange, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_valueClamped)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[HKCodableQuantity hash](self->_value, "hash");
  v4 = -[HKCodableDayIndexRange hash](self->_dayIndexRange, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_valueClamped;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableQuantity *value;
  uint64_t v6;
  HKCodableDayIndexRange *dayIndexRange;
  uint64_t v8;
  id v9;

  v4 = a3;
  value = self->_value;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
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
    -[HKCodableAFibBurdenValue setValue:](self, "setValue:");
  }
  v4 = v9;
LABEL_7:
  dayIndexRange = self->_dayIndexRange;
  v8 = *((_QWORD *)v4 + 1);
  if (dayIndexRange)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableDayIndexRange mergeFrom:](dayIndexRange, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableAFibBurdenValue setDayIndexRange:](self, "setDayIndexRange:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_valueClamped = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
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

- (HKCodableDayIndexRange)dayIndexRange
{
  return self->_dayIndexRange;
}

- (void)setDayIndexRange:(id)a3
{
  objc_storeStrong((id *)&self->_dayIndexRange, a3);
}

- (BOOL)valueClamped
{
  return self->_valueClamped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_dayIndexRange, 0);
}

@end
