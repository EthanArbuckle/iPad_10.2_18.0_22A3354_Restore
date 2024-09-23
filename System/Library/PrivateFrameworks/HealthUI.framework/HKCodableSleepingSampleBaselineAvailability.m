@implementation HKCodableSleepingSampleBaselineAvailability

- (BOOL)hasAnalyzedRange
{
  return self->_analyzedRange != 0;
}

- (void)setCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRequiredCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiredCount = a3;
}

- (void)setHasRequiredCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiredCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HKCodableSleepingSampleBaselineAvailability;
  -[HKCodableSleepingSampleBaselineAvailability description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepingSampleBaselineAvailability dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableDayIndexRange *analyzedRange;
  void *v5;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  analyzedRange = self->_analyzedRange;
  if (analyzedRange)
  {
    -[HKCodableDayIndexRange dictionaryRepresentation](analyzedRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("analyzedRange"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_count);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("count"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_requiredCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("requiredCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineAvailabilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_analyzedRange)
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
  if (self->_analyzedRange)
  {
    v6 = v4;
    objc_msgSend(v4, "setAnalyzedRange:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_count;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_requiredCount;
    *((_BYTE *)v4 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDayIndexRange copyWithZone:](self->_analyzedRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_count;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_requiredCount;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDayIndexRange *analyzedRange;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  analyzedRange = self->_analyzedRange;
  if ((unint64_t)analyzedRange | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableDayIndexRange isEqual:](analyzedRange, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_requiredCount != *((_QWORD *)v4 + 2))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[HKCodableDayIndexRange hash](self->_analyzedRange, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_count;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_requiredCount;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableDayIndexRange *analyzedRange;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  analyzedRange = self->_analyzedRange;
  v6 = v4[3];
  if (analyzedRange)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HKCodableDayIndexRange mergeFrom:](analyzedRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HKCodableSleepingSampleBaselineAvailability setAnalyzedRange:](self, "setAnalyzedRange:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 1) != 0)
  {
    self->_count = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 32);
  }
  if ((v7 & 2) != 0)
  {
    self->_requiredCount = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (HKCodableDayIndexRange)analyzedRange
{
  return self->_analyzedRange;
}

- (void)setAnalyzedRange:(id)a3
{
  objc_storeStrong((id *)&self->_analyzedRange, a3);
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)requiredCount
{
  return self->_requiredCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzedRange, 0);
}

@end
