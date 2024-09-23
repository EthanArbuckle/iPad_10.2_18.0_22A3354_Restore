@implementation HKCodableSleepingSampleAggregate

- (void)setMorningIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_morningIndex = a3;
}

- (void)setHasMorningIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMorningIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (void)setLatestSampleEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSampleEndDate = a3;
}

- (void)setHasLatestSampleEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSampleEndDate
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
  v8.super_class = (Class)HKCodableSleepingSampleAggregate;
  -[HKCodableSleepingSampleAggregate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepingSampleAggregate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HKCodableQuantity *quantity;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_morningIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("morningIndex"));

  }
  quantity = self->_quantity;
  if (quantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](quantity, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("quantity"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latestSampleEndDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("latestSampleEndDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleAggregateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_quantity)
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
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_morningIndex;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_quantity)
  {
    v5 = v4;
    objc_msgSend(v4, "setQuantity:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_latestSampleEndDate;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_morningIndex;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v7 = -[HKCodableQuantity copyWithZone:](self->_quantity, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_latestSampleEndDate;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodableQuantity *quantity;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_morningIndex != *((_QWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  quantity = self->_quantity;
  if ((unint64_t)quantity | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](quantity, "isEqual:"))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_latestSampleEndDate != *((double *)v4 + 1))
      goto LABEL_14;
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double latestSampleEndDate;
  double v7;
  long double v8;
  double v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_morningIndex;
  else
    v3 = 0;
  v4 = -[HKCodableQuantity hash](self->_quantity, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    latestSampleEndDate = self->_latestSampleEndDate;
    v7 = -latestSampleEndDate;
    if (latestSampleEndDate >= 0.0)
      v7 = self->_latestSampleEndDate;
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
  _QWORD *v4;
  id v5;
  HKCodableQuantity *quantity;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if ((v4[4] & 2) != 0)
  {
    self->_morningIndex = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  quantity = self->_quantity;
  v7 = *((_QWORD *)v5 + 3);
  if (quantity)
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[HKCodableQuantity mergeFrom:](quantity, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[HKCodableSleepingSampleAggregate setQuantity:](self, "setQuantity:");
  }
  v5 = v8;
LABEL_9:
  if ((*((_BYTE *)v5 + 32) & 1) != 0)
  {
    self->_latestSampleEndDate = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (HKCodableQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_quantity, a3);
}

- (double)latestSampleEndDate
{
  return self->_latestSampleEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
