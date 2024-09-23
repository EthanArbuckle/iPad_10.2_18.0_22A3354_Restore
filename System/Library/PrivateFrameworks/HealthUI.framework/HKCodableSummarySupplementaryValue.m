@implementation HKCodableSummarySupplementaryValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (BOOL)hasDataCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setDataCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataCount = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)setHasDataCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
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
  v8.super_class = (Class)HKCodableSummarySupplementaryValue;
  -[HKCodableSummarySupplementaryValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummarySupplementaryValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](dateInterval, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dateInterval"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dataCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummarySupplementaryValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_dateInterval)
  {
    v5 = v4;
    objc_msgSend(v4, "setDateInterval:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_dataCount;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDateInterval copyWithZone:](self->_dateInterval, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_dataCount;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDateInterval *dateInterval;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_dataCount == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[HKCodableDateInterval hash](self->_dateInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_dataCount;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableDateInterval *dateInterval;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  dateInterval = self->_dateInterval;
  v6 = v4[2];
  if (dateInterval)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[HKCodableSummarySupplementaryValue setDateInterval:](self, "setDateInterval:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[3] & 1) != 0)
  {
    self->_dataCount = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
