@implementation HKCodableTimePeriodData

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setTotal:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotal
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
  v8.super_class = (Class)HKCodableTimePeriodData;
  -[HKCodableTimePeriodData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableTimePeriodData dictionaryRepresentation](self, "dictionaryRepresentation");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_total);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("total"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableTimePeriodDataReadFrom((uint64_t)self, (uint64_t)a3);
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
    *((_QWORD *)v4 + 1) = self->_total;
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
    *(_QWORD *)(v5 + 8) = self->_total;
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
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_total == *((_QWORD *)v4 + 1))
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
    v4 = 2654435761 * self->_total;
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
    -[HKCodableTimePeriodData setDateInterval:](self, "setDateInterval:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[3] & 1) != 0)
  {
    self->_total = v4[1];
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

- (int64_t)total
{
  return self->_total;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

+ (id)timePeriodDataWithCodableData:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "total", (_QWORD)v17));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3588];
        objc_msgSend(v10, "dateInterval");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

@end
