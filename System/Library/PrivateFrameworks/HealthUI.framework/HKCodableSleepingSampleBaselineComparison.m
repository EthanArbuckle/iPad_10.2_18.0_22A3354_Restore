@implementation HKCodableSleepingSampleBaselineComparison

- (void)setDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaseline
{
  return self->_baseline != 0;
}

- (BOOL)hasAggregate
{
  return self->_aggregate != 0;
}

- (BOOL)hasAvailability
{
  return self->_availability != 0;
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
  v8.super_class = (Class)HKCodableSleepingSampleBaselineComparison;
  -[HKCodableSleepingSampleBaselineComparison description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepingSampleBaselineComparison dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HKCodableSleepingSampleBaseline *baseline;
  void *v6;
  HKCodableSleepingSampleAggregate *aggregate;
  void *v8;
  HKCodableSleepingSampleBaselineAvailability *availability;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("dataType"));

  }
  baseline = self->_baseline;
  if (baseline)
  {
    -[HKCodableSleepingSampleBaseline dictionaryRepresentation](baseline, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("baseline"));

  }
  aggregate = self->_aggregate;
  if (aggregate)
  {
    -[HKCodableSleepingSampleAggregate dictionaryRepresentation](aggregate, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("aggregate"));

  }
  availability = self->_availability;
  if (availability)
  {
    -[HKCodableSleepingSampleBaselineAvailability dictionaryRepresentation](availability, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("availability"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineComparisonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_baseline)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_aggregate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_availability)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_dataType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_baseline)
  {
    objc_msgSend(v4, "setBaseline:");
    v4 = v5;
  }
  if (self->_aggregate)
  {
    objc_msgSend(v5, "setAggregate:");
    v4 = v5;
  }
  if (self->_availability)
  {
    objc_msgSend(v5, "setAvailability:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_dataType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[HKCodableSleepingSampleBaseline copyWithZone:](self->_baseline, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[HKCodableSleepingSampleAggregate copyWithZone:](self->_aggregate, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[HKCodableSleepingSampleBaselineAvailability copyWithZone:](self->_availability, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableSleepingSampleBaseline *baseline;
  HKCodableSleepingSampleAggregate *aggregate;
  HKCodableSleepingSampleBaselineAvailability *availability;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_dataType != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  baseline = self->_baseline;
  if ((unint64_t)baseline | *((_QWORD *)v4 + 4)
    && !-[HKCodableSleepingSampleBaseline isEqual:](baseline, "isEqual:"))
  {
    goto LABEL_13;
  }
  aggregate = self->_aggregate;
  if ((unint64_t)aggregate | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableSleepingSampleAggregate isEqual:](aggregate, "isEqual:"))
      goto LABEL_13;
  }
  availability = self->_availability;
  if ((unint64_t)availability | *((_QWORD *)v4 + 3))
    v8 = -[HKCodableSleepingSampleBaselineAvailability isEqual:](availability, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_dataType;
  else
    v3 = 0;
  v4 = -[HKCodableSleepingSampleBaseline hash](self->_baseline, "hash") ^ v3;
  v5 = -[HKCodableSleepingSampleAggregate hash](self->_aggregate, "hash");
  return v4 ^ v5 ^ -[HKCodableSleepingSampleBaselineAvailability hash](self->_availability, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  HKCodableSleepingSampleBaseline *baseline;
  uint64_t v7;
  HKCodableSleepingSampleAggregate *aggregate;
  uint64_t v9;
  HKCodableSleepingSampleBaselineAvailability *availability;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_dataType = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  baseline = self->_baseline;
  v7 = v5[4];
  v12 = v5;
  if (baseline)
  {
    if (!v7)
      goto LABEL_9;
    -[HKCodableSleepingSampleBaseline mergeFrom:](baseline, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HKCodableSleepingSampleBaselineComparison setBaseline:](self, "setBaseline:");
  }
  v5 = v12;
LABEL_9:
  aggregate = self->_aggregate;
  v9 = v5[2];
  if (aggregate)
  {
    if (!v9)
      goto LABEL_15;
    -[HKCodableSleepingSampleAggregate mergeFrom:](aggregate, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[HKCodableSleepingSampleBaselineComparison setAggregate:](self, "setAggregate:");
  }
  v5 = v12;
LABEL_15:
  availability = self->_availability;
  v11 = v5[3];
  if (availability)
  {
    if (v11)
    {
      -[HKCodableSleepingSampleBaselineAvailability mergeFrom:](availability, "mergeFrom:");
LABEL_20:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[HKCodableSleepingSampleBaselineComparison setAvailability:](self, "setAvailability:");
    goto LABEL_20;
  }

}

- (int64_t)dataType
{
  return self->_dataType;
}

- (HKCodableSleepingSampleBaseline)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_baseline, a3);
}

- (HKCodableSleepingSampleAggregate)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(id)a3
{
  objc_storeStrong((id *)&self->_aggregate, a3);
}

- (HKCodableSleepingSampleBaselineAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_availability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseline, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_aggregate, 0);
}

@end
