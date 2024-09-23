@implementation HKCodableSummaryAFibBurdenValue

- (BOOL)hasBurdenValue
{
  return self->_burdenValue != 0;
}

- (BOOL)hasLastAnalysisDayIndexRange
{
  return self->_lastAnalysisDayIndexRange != 0;
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
  v8.super_class = (Class)HKCodableSummaryAFibBurdenValue;
  -[HKCodableSummaryAFibBurdenValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryAFibBurdenValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableAFibBurdenValue *burdenValue;
  void *v5;
  HKCodableDayIndexRange *lastAnalysisDayIndexRange;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  burdenValue = self->_burdenValue;
  if (burdenValue)
  {
    -[HKCodableAFibBurdenValue dictionaryRepresentation](burdenValue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("burdenValue"));

  }
  lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
  if (lastAnalysisDayIndexRange)
  {
    -[HKCodableDayIndexRange dictionaryRepresentation](lastAnalysisDayIndexRange, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lastAnalysisDayIndexRange"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAFibBurdenValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_burdenValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_lastAnalysisDayIndexRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_burdenValue)
  {
    objc_msgSend(v4, "setBurdenValue:");
    v4 = v5;
  }
  if (self->_lastAnalysisDayIndexRange)
  {
    objc_msgSend(v5, "setLastAnalysisDayIndexRange:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableAFibBurdenValue copyWithZone:](self->_burdenValue, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[HKCodableDayIndexRange copyWithZone:](self->_lastAnalysisDayIndexRange, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableAFibBurdenValue *burdenValue;
  HKCodableDayIndexRange *lastAnalysisDayIndexRange;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((burdenValue = self->_burdenValue, !((unint64_t)burdenValue | v4[1]))
     || -[HKCodableAFibBurdenValue isEqual:](burdenValue, "isEqual:")))
  {
    lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
    if ((unint64_t)lastAnalysisDayIndexRange | v4[2])
      v7 = -[HKCodableDayIndexRange isEqual:](lastAnalysisDayIndexRange, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKCodableAFibBurdenValue hash](self->_burdenValue, "hash");
  return -[HKCodableDayIndexRange hash](self->_lastAnalysisDayIndexRange, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableAFibBurdenValue *burdenValue;
  uint64_t v6;
  HKCodableDayIndexRange *lastAnalysisDayIndexRange;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  burdenValue = self->_burdenValue;
  v6 = v4[1];
  v9 = v4;
  if (burdenValue)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableAFibBurdenValue mergeFrom:](burdenValue, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSummaryAFibBurdenValue setBurdenValue:](self, "setBurdenValue:");
  }
  v4 = v9;
LABEL_7:
  lastAnalysisDayIndexRange = self->_lastAnalysisDayIndexRange;
  v8 = v4[2];
  if (lastAnalysisDayIndexRange)
  {
    if (v8)
    {
      -[HKCodableDayIndexRange mergeFrom:](lastAnalysisDayIndexRange, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HKCodableSummaryAFibBurdenValue setLastAnalysisDayIndexRange:](self, "setLastAnalysisDayIndexRange:");
    goto LABEL_12;
  }

}

- (HKCodableAFibBurdenValue)burdenValue
{
  return self->_burdenValue;
}

- (void)setBurdenValue:(id)a3
{
  objc_storeStrong((id *)&self->_burdenValue, a3);
}

- (HKCodableDayIndexRange)lastAnalysisDayIndexRange
{
  return self->_lastAnalysisDayIndexRange;
}

- (void)setLastAnalysisDayIndexRange:(id)a3
{
  objc_storeStrong((id *)&self->_lastAnalysisDayIndexRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalysisDayIndexRange, 0);
  objc_storeStrong((id *)&self->_burdenValue, 0);
}

@end
