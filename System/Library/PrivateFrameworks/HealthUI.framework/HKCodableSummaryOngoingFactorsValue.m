@implementation HKCodableSummaryOngoingFactorsValue

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableSummaryOngoingFactorsValue;
  -[HKCodableSummaryOngoingFactorsValue dealloc](&v3, sel_dealloc);
}

- (unint64_t)categoryValueRawValuesCount
{
  return self->_categoryValueRawValues.count;
}

- (int64_t)categoryValueRawValues
{
  return self->_categoryValueRawValues.list;
}

- (void)clearCategoryValueRawValues
{
  PBRepeatedInt64Clear();
}

- (void)addCategoryValueRawValues:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)categoryValueRawValuesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_categoryValueRawValues;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_categoryValueRawValues = &self->_categoryValueRawValues;
  count = self->_categoryValueRawValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_categoryValueRawValues->list[a3];
}

- (void)setCategoryValueRawValues:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)setEarliestStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_earliestStartDate = a3;
}

- (void)setHasEarliestStartDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEarliestStartDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLatestEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_latestEndDate = a3;
}

- (void)setHasLatestEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatestEndDate
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
  v8.super_class = (Class)HKCodableSummaryOngoingFactorsValue;
  -[HKCodableSummaryOngoingFactorsValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryOngoingFactorsValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt64NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("categoryValueRawValues"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_earliestStartDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("earliestStartDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latestEndDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("latestEndDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryOngoingFactorsValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_categoryValueRawValues.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_categoryValueRawValues.count);
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char has;
  id v8;

  v8 = a3;
  if (-[HKCodableSummaryOngoingFactorsValue categoryValueRawValuesCount](self, "categoryValueRawValuesCount"))
  {
    objc_msgSend(v8, "clearCategoryValueRawValues");
    v4 = -[HKCodableSummaryOngoingFactorsValue categoryValueRawValuesCount](self, "categoryValueRawValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addCategoryValueRawValues:", -[HKCodableSummaryOngoingFactorsValue categoryValueRawValuesAtIndex:](self, "categoryValueRawValuesAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v8 + 4) = *(_QWORD *)&self->_earliestStartDate;
    *((_BYTE *)v8 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v8 + 5) = *(_QWORD *)&self->_latestEndDate;
    *((_BYTE *)v8 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt64Copy();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v4 + 32) = self->_earliestStartDate;
    *(_BYTE *)(v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v4 + 40) = self->_latestEndDate;
    *(_BYTE *)(v4 + 48) |= 2u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedInt64IsEqual())
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_earliestStartDate != *((double *)v4 + 4))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_latestEndDate != *((double *)v4 + 5))
      goto LABEL_12;
    v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  double earliestStartDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double latestEndDate;
  double v12;
  long double v13;
  double v14;

  v3 = PBRepeatedInt64Hash();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    earliestStartDate = self->_earliestStartDate;
    v7 = -earliestStartDate;
    if (earliestStartDate >= 0.0)
      v7 = self->_earliestStartDate;
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
  if ((has & 2) != 0)
  {
    latestEndDate = self->_latestEndDate;
    v12 = -latestEndDate;
    if (latestEndDate >= 0.0)
      v12 = self->_latestEndDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  double *v8;

  v8 = (double *)a3;
  v4 = objc_msgSend(v8, "categoryValueRawValuesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[HKCodableSummaryOngoingFactorsValue addCategoryValueRawValues:](self, "addCategoryValueRawValues:", objc_msgSend(v8, "categoryValueRawValuesAtIndex:", i));
  }
  v7 = *((_BYTE *)v8 + 48);
  if ((v7 & 1) != 0)
  {
    self->_earliestStartDate = v8[4];
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v8 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_latestEndDate = v8[5];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (double)earliestStartDate
{
  return self->_earliestStartDate;
}

- (double)latestEndDate
{
  return self->_latestEndDate;
}

@end
