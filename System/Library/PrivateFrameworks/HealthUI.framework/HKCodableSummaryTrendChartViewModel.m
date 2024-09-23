@implementation HKCodableSummaryTrendChartViewModel

- (BOOL)hasChartString
{
  return self->_chartString != 0;
}

- (BOOL)hasChangeTypeRawValue
{
  return self->_changeTypeRawValue != 0;
}

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (void)setCoveredTimeScopeRawValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coveredTimeScopeRawValue = a3;
}

- (void)setHasCoveredTimeScopeRawValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoveredTimeScopeRawValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaselineDateInterval
{
  return self->_baselineDateInterval != 0;
}

- (BOOL)hasBaselineQuantity
{
  return self->_baselineQuantity != 0;
}

- (BOOL)hasChangeDateInterval
{
  return self->_changeDateInterval != 0;
}

- (BOOL)hasChangeQuantity
{
  return self->_changeQuantity != 0;
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
  v8.super_class = (Class)HKCodableSummaryTrendChartViewModel;
  -[HKCodableSummaryTrendChartViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryTrendChartViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *chartString;
  NSString *changeTypeRawValue;
  NSString *objectTypeIdentifier;
  void *v8;
  HKCodableDateInterval *baselineDateInterval;
  void *v10;
  HKCodableQuantity *baselineQuantity;
  void *v12;
  HKCodableDateInterval *changeDateInterval;
  void *v14;
  HKCodableQuantity *changeQuantity;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  chartString = self->_chartString;
  if (chartString)
    objc_msgSend(v3, "setObject:forKey:", chartString, CFSTR("chartString"));
  changeTypeRawValue = self->_changeTypeRawValue;
  if (changeTypeRawValue)
    objc_msgSend(v4, "setObject:forKey:", changeTypeRawValue, CFSTR("changeTypeRawValue"));
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", objectTypeIdentifier, CFSTR("objectTypeIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_coveredTimeScopeRawValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("coveredTimeScopeRawValue"));

  }
  baselineDateInterval = self->_baselineDateInterval;
  if (baselineDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](baselineDateInterval, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("baselineDateInterval"));

  }
  baselineQuantity = self->_baselineQuantity;
  if (baselineQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](baselineQuantity, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("baselineQuantity"));

  }
  changeDateInterval = self->_changeDateInterval;
  if (changeDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](changeDateInterval, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("changeDateInterval"));

  }
  changeQuantity = self->_changeQuantity;
  if (changeQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](changeQuantity, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("changeQuantity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendChartViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_chartString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_changeTypeRawValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_baselineDateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_baselineQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_changeDateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_changeQuantity)
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
  if (self->_chartString)
  {
    objc_msgSend(v4, "setChartString:");
    v4 = v5;
  }
  if (self->_changeTypeRawValue)
  {
    objc_msgSend(v5, "setChangeTypeRawValue:");
    v4 = v5;
  }
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v5, "setObjectTypeIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_coveredTimeScopeRawValue;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_baselineDateInterval)
  {
    objc_msgSend(v5, "setBaselineDateInterval:");
    v4 = v5;
  }
  if (self->_baselineQuantity)
  {
    objc_msgSend(v5, "setBaselineQuantity:");
    v4 = v5;
  }
  if (self->_changeDateInterval)
  {
    objc_msgSend(v5, "setChangeDateInterval:");
    v4 = v5;
  }
  if (self->_changeQuantity)
  {
    objc_msgSend(v5, "setChangeQuantity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_chartString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_changeTypeRawValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_objectTypeIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_coveredTimeScopeRawValue;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v12 = -[HKCodableDateInterval copyWithZone:](self->_baselineDateInterval, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[HKCodableQuantity copyWithZone:](self->_baselineQuantity, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[HKCodableDateInterval copyWithZone:](self->_changeDateInterval, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[HKCodableQuantity copyWithZone:](self->_changeQuantity, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *chartString;
  NSString *changeTypeRawValue;
  NSString *objectTypeIdentifier;
  HKCodableDateInterval *baselineDateInterval;
  HKCodableQuantity *baselineQuantity;
  HKCodableDateInterval *changeDateInterval;
  HKCodableQuantity *changeQuantity;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  chartString = self->_chartString;
  if ((unint64_t)chartString | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](chartString, "isEqual:"))
      goto LABEL_21;
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if ((unint64_t)changeTypeRawValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](changeTypeRawValue, "isEqual:"))
      goto LABEL_21;
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectTypeIdentifier, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_coveredTimeScopeRawValue != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  baselineDateInterval = self->_baselineDateInterval;
  if ((unint64_t)baselineDateInterval | *((_QWORD *)v4 + 2)
    && !-[HKCodableDateInterval isEqual:](baselineDateInterval, "isEqual:"))
  {
    goto LABEL_21;
  }
  baselineQuantity = self->_baselineQuantity;
  if ((unint64_t)baselineQuantity | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](baselineQuantity, "isEqual:"))
      goto LABEL_21;
  }
  changeDateInterval = self->_changeDateInterval;
  if ((unint64_t)changeDateInterval | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableDateInterval isEqual:](changeDateInterval, "isEqual:"))
      goto LABEL_21;
  }
  changeQuantity = self->_changeQuantity;
  if ((unint64_t)changeQuantity | *((_QWORD *)v4 + 5))
    v12 = -[HKCodableQuantity isEqual:](changeQuantity, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_chartString, "hash");
  v4 = -[NSString hash](self->_changeTypeRawValue, "hash");
  v5 = -[NSString hash](self->_objectTypeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_coveredTimeScopeRawValue;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[HKCodableDateInterval hash](self->_baselineDateInterval, "hash");
  v9 = v8 ^ -[HKCodableQuantity hash](self->_baselineQuantity, "hash");
  v10 = v7 ^ v9 ^ -[HKCodableDateInterval hash](self->_changeDateInterval, "hash");
  return v10 ^ -[HKCodableQuantity hash](self->_changeQuantity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableDateInterval *baselineDateInterval;
  uint64_t v6;
  HKCodableQuantity *baselineQuantity;
  uint64_t v8;
  HKCodableDateInterval *changeDateInterval;
  uint64_t v10;
  HKCodableQuantity *changeQuantity;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  v13 = v4;
  if (v4[7])
  {
    -[HKCodableSummaryTrendChartViewModel setChartString:](self, "setChartString:");
    v4 = v13;
  }
  if (v4[6])
  {
    -[HKCodableSummaryTrendChartViewModel setChangeTypeRawValue:](self, "setChangeTypeRawValue:");
    v4 = v13;
  }
  if (v4[8])
  {
    -[HKCodableSummaryTrendChartViewModel setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    v4 = v13;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_coveredTimeScopeRawValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  baselineDateInterval = self->_baselineDateInterval;
  v6 = v4[2];
  if (baselineDateInterval)
  {
    if (!v6)
      goto LABEL_15;
    -[HKCodableDateInterval mergeFrom:](baselineDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    -[HKCodableSummaryTrendChartViewModel setBaselineDateInterval:](self, "setBaselineDateInterval:");
  }
  v4 = v13;
LABEL_15:
  baselineQuantity = self->_baselineQuantity;
  v8 = v4[3];
  if (baselineQuantity)
  {
    if (!v8)
      goto LABEL_21;
    -[HKCodableQuantity mergeFrom:](baselineQuantity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_21;
    -[HKCodableSummaryTrendChartViewModel setBaselineQuantity:](self, "setBaselineQuantity:");
  }
  v4 = v13;
LABEL_21:
  changeDateInterval = self->_changeDateInterval;
  v10 = v4[4];
  if (changeDateInterval)
  {
    if (!v10)
      goto LABEL_27;
    -[HKCodableDateInterval mergeFrom:](changeDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_27;
    -[HKCodableSummaryTrendChartViewModel setChangeDateInterval:](self, "setChangeDateInterval:");
  }
  v4 = v13;
LABEL_27:
  changeQuantity = self->_changeQuantity;
  v12 = v4[5];
  if (changeQuantity)
  {
    if (v12)
    {
      -[HKCodableQuantity mergeFrom:](changeQuantity, "mergeFrom:");
LABEL_32:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[HKCodableSummaryTrendChartViewModel setChangeQuantity:](self, "setChangeQuantity:");
    goto LABEL_32;
  }

}

- (NSString)chartString
{
  return self->_chartString;
}

- (void)setChartString:(id)a3
{
  objc_storeStrong((id *)&self->_chartString, a3);
}

- (NSString)changeTypeRawValue
{
  return self->_changeTypeRawValue;
}

- (void)setChangeTypeRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_changeTypeRawValue, a3);
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, a3);
}

- (int64_t)coveredTimeScopeRawValue
{
  return self->_coveredTimeScopeRawValue;
}

- (HKCodableDateInterval)baselineDateInterval
{
  return self->_baselineDateInterval;
}

- (void)setBaselineDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_baselineDateInterval, a3);
}

- (HKCodableQuantity)baselineQuantity
{
  return self->_baselineQuantity;
}

- (void)setBaselineQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_baselineQuantity, a3);
}

- (HKCodableDateInterval)changeDateInterval
{
  return self->_changeDateInterval;
}

- (void)setChangeDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_changeDateInterval, a3);
}

- (HKCodableQuantity)changeQuantity
{
  return self->_changeQuantity;
}

- (void)setChangeQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_changeQuantity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_chartString, 0);
  objc_storeStrong((id *)&self->_changeTypeRawValue, 0);
  objc_storeStrong((id *)&self->_changeQuantity, 0);
  objc_storeStrong((id *)&self->_changeDateInterval, 0);
  objc_storeStrong((id *)&self->_baselineQuantity, 0);
  objc_storeStrong((id *)&self->_baselineDateInterval, 0);
}

@end
