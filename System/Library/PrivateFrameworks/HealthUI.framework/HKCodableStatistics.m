@implementation HKCodableStatistics

- (HKCodableQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (double)startDate
{
  return self->_startDate;
}

- (BOOL)hasSumQuantity
{
  return self->_sumQuantity != 0;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasMostRecentQuantity
{
  return self->_mostRecentQuantity != 0;
}

- (BOOL)hasMinQuantity
{
  return self->_minQuantity != 0;
}

- (BOOL)hasMaxQuantity
{
  return self->_maxQuantity != 0;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDurationQuantity
{
  return self->_durationQuantity != 0;
}

- (BOOL)hasDataType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasDataCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAverageQuantity
{
  return self->_averageQuantity != 0;
}

- (double)endDate
{
  return self->_endDate;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sumQuantity, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_minQuantity, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_maxQuantity, 0);
  objc_storeStrong((id *)&self->_durationQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
}

- (void)setDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setDataCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataCount = a3;
}

- (void)setHasDataCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)setBaselineRelativeValueState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_baselineRelativeValueState = a3;
}

- (void)setHasBaselineRelativeValueState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBaselineRelativeValueState
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)HKCodableStatistics;
  -[HKCodableStatistics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  HKCodableQuantity *averageQuantity;
  void *v7;
  HKCodableQuantity *minQuantity;
  void *v9;
  HKCodableQuantity *maxQuantity;
  void *v11;
  HKCodableQuantity *mostRecentQuantity;
  void *v13;
  HKCodableQuantity *sumQuantity;
  void *v15;
  HKCodableQuantity *durationQuantity;
  void *v17;
  void *v18;
  HKCodableDateComponents *statisticsInterval;
  void *v20;
  void *v21;
  HKCodableMetadataDictionary *metadata;
  void *v23;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataType);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("dataType"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("startDate"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endDate"));

  }
LABEL_5:
  averageQuantity = self->_averageQuantity;
  if (averageQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageQuantity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("averageQuantity"));

  }
  minQuantity = self->_minQuantity;
  if (minQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](minQuantity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("minQuantity"));

  }
  maxQuantity = self->_maxQuantity;
  if (maxQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](maxQuantity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("maxQuantity"));

  }
  mostRecentQuantity = self->_mostRecentQuantity;
  if (mostRecentQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](mostRecentQuantity, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mostRecentQuantity"));

  }
  sumQuantity = self->_sumQuantity;
  if (sumQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](sumQuantity, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sumQuantity"));

  }
  durationQuantity = self->_durationQuantity;
  if (durationQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](durationQuantity, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("durationQuantity"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataCount);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("dataCount"));

  }
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    -[HKCodableDateComponents dictionaryRepresentation](statisticsInterval, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("statisticsInterval"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_baselineRelativeValueState);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("baselineRelativeValueState"));

  }
  metadata = self->_metadata;
  if (metadata)
  {
    -[HKCodableMetadataDictionary dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_averageQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_minQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_maxQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_mostRecentQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sumQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_durationQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_statisticsInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_dataType;
    *((_BYTE *)v4 + 112) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(_QWORD *)&self->_startDate;
  *((_BYTE *)v4 + 112) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4[4] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 112) |= 8u;
  }
LABEL_5:
  v6 = v4;
  if (self->_averageQuantity)
  {
    objc_msgSend(v4, "setAverageQuantity:");
    v4 = v6;
  }
  if (self->_minQuantity)
  {
    objc_msgSend(v6, "setMinQuantity:");
    v4 = v6;
  }
  if (self->_maxQuantity)
  {
    objc_msgSend(v6, "setMaxQuantity:");
    v4 = v6;
  }
  if (self->_mostRecentQuantity)
  {
    objc_msgSend(v6, "setMostRecentQuantity:");
    v4 = v6;
  }
  if (self->_sumQuantity)
  {
    objc_msgSend(v6, "setSumQuantity:");
    v4 = v6;
  }
  if (self->_durationQuantity)
  {
    objc_msgSend(v6, "setDurationQuantity:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_dataCount;
    *((_BYTE *)v4 + 112) |= 2u;
  }
  if (self->_statisticsInterval)
  {
    objc_msgSend(v6, "setStatisticsInterval:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_baselineRelativeValueState;
    *((_BYTE *)v4 + 112) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_dataType;
    *(_BYTE *)(v5 + 112) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_startDate;
  *(_BYTE *)(v5 + 112) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(double *)(v5 + 32) = self->_endDate;
    *(_BYTE *)(v5 + 112) |= 8u;
  }
LABEL_5:
  v8 = -[HKCodableQuantity copyWithZone:](self->_averageQuantity, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_minQuantity, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v10;

  v12 = -[HKCodableQuantity copyWithZone:](self->_maxQuantity, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v12;

  v14 = -[HKCodableQuantity copyWithZone:](self->_mostRecentQuantity, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v14;

  v16 = -[HKCodableQuantity copyWithZone:](self->_sumQuantity, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v16;

  v18 = -[HKCodableQuantity copyWithZone:](self->_durationQuantity, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v18;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_dataCount;
    *(_BYTE *)(v6 + 112) |= 2u;
  }
  v20 = -[HKCodableDateComponents copyWithZone:](self->_statisticsInterval, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_baselineRelativeValueState;
    *(_BYTE *)(v6 + 112) |= 1u;
  }
  v22 = -[HKCodableMetadataDictionary copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *averageQuantity;
  HKCodableQuantity *minQuantity;
  HKCodableQuantity *maxQuantity;
  HKCodableQuantity *mostRecentQuantity;
  HKCodableQuantity *sumQuantity;
  HKCodableQuantity *durationQuantity;
  char has;
  HKCodableDateComponents *statisticsInterval;
  HKCodableMetadataDictionary *metadata;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 4) == 0 || self->_dataType != *((_QWORD *)v4 + 3))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 112) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x10) == 0 || self->_startDate != *((double *)v4 + 5))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 8) == 0 || self->_endDate != *((double *)v4 + 4))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 112) & 8) != 0)
  {
    goto LABEL_44;
  }
  averageQuantity = self->_averageQuantity;
  if ((unint64_t)averageQuantity | *((_QWORD *)v4 + 6)
    && !-[HKCodableQuantity isEqual:](averageQuantity, "isEqual:"))
  {
    goto LABEL_44;
  }
  minQuantity = self->_minQuantity;
  if ((unint64_t)minQuantity | *((_QWORD *)v4 + 10))
  {
    if (!-[HKCodableQuantity isEqual:](minQuantity, "isEqual:"))
      goto LABEL_44;
  }
  maxQuantity = self->_maxQuantity;
  if ((unint64_t)maxQuantity | *((_QWORD *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](maxQuantity, "isEqual:"))
      goto LABEL_44;
  }
  mostRecentQuantity = self->_mostRecentQuantity;
  if ((unint64_t)mostRecentQuantity | *((_QWORD *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](mostRecentQuantity, "isEqual:"))
      goto LABEL_44;
  }
  sumQuantity = self->_sumQuantity;
  if ((unint64_t)sumQuantity | *((_QWORD *)v4 + 13))
  {
    if (!-[HKCodableQuantity isEqual:](sumQuantity, "isEqual:"))
      goto LABEL_44;
  }
  durationQuantity = self->_durationQuantity;
  if ((unint64_t)durationQuantity | *((_QWORD *)v4 + 7))
  {
    if (!-[HKCodableQuantity isEqual:](durationQuantity, "isEqual:"))
      goto LABEL_44;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 2) == 0 || self->_dataCount != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    goto LABEL_44;
  }
  statisticsInterval = self->_statisticsInterval;
  if ((unint64_t)statisticsInterval | *((_QWORD *)v4 + 12))
  {
    if (!-[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    {
LABEL_44:
      v14 = 0;
      goto LABEL_45;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_baselineRelativeValueState != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    goto LABEL_44;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 9))
    v14 = -[HKCodableMetadataDictionary isEqual:](metadata, "isEqual:");
  else
    v14 = 1;
LABEL_45:

  return v14;
}

- (unint64_t)hash
{
  char has;
  double startDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double endDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v25 = 2654435761 * self->_dataType;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v25 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_8;
LABEL_3:
  startDate = self->_startDate;
  v5 = -startDate;
  if (startDate >= 0.0)
    v5 = self->_startDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  v24 = v8;
  if ((has & 8) != 0)
  {
    endDate = self->_endDate;
    v11 = -endDate;
    if (endDate >= 0.0)
      v11 = self->_endDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v23 = -[HKCodableQuantity hash](self->_averageQuantity, "hash");
  v14 = -[HKCodableQuantity hash](self->_minQuantity, "hash");
  v15 = -[HKCodableQuantity hash](self->_maxQuantity, "hash");
  v16 = -[HKCodableQuantity hash](self->_mostRecentQuantity, "hash");
  v17 = -[HKCodableQuantity hash](self->_sumQuantity, "hash");
  v18 = -[HKCodableQuantity hash](self->_durationQuantity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v19 = 2654435761 * self->_dataCount;
  else
    v19 = 0;
  v20 = -[HKCodableDateComponents hash](self->_statisticsInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v21 = 2654435761 * self->_baselineRelativeValueState;
  else
    v21 = 0;
  return v24 ^ v25 ^ v9 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[HKCodableMetadataDictionary hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  HKCodableQuantity *averageQuantity;
  uint64_t v8;
  HKCodableQuantity *minQuantity;
  uint64_t v10;
  HKCodableQuantity *maxQuantity;
  uint64_t v12;
  HKCodableQuantity *mostRecentQuantity;
  uint64_t v14;
  HKCodableQuantity *sumQuantity;
  uint64_t v16;
  HKCodableQuantity *durationQuantity;
  uint64_t v18;
  HKCodableDateComponents *statisticsInterval;
  uint64_t v20;
  HKCodableMetadataDictionary *metadata;
  uint64_t v22;
  _QWORD *v23;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 112);
  if ((v6 & 4) != 0)
  {
    self->_dataType = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 112);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_startDate = *((double *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 112) & 8) != 0)
  {
LABEL_4:
    self->_endDate = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  averageQuantity = self->_averageQuantity;
  v8 = v5[6];
  v23 = v5;
  if (averageQuantity)
  {
    if (!v8)
      goto LABEL_14;
    -[HKCodableQuantity mergeFrom:](averageQuantity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[HKCodableStatistics setAverageQuantity:](self, "setAverageQuantity:");
  }
  v5 = v23;
LABEL_14:
  minQuantity = self->_minQuantity;
  v10 = v5[10];
  if (minQuantity)
  {
    if (!v10)
      goto LABEL_20;
    -[HKCodableQuantity mergeFrom:](minQuantity, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_20;
    -[HKCodableStatistics setMinQuantity:](self, "setMinQuantity:");
  }
  v5 = v23;
LABEL_20:
  maxQuantity = self->_maxQuantity;
  v12 = v5[8];
  if (maxQuantity)
  {
    if (!v12)
      goto LABEL_26;
    -[HKCodableQuantity mergeFrom:](maxQuantity, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_26;
    -[HKCodableStatistics setMaxQuantity:](self, "setMaxQuantity:");
  }
  v5 = v23;
LABEL_26:
  mostRecentQuantity = self->_mostRecentQuantity;
  v14 = v5[11];
  if (mostRecentQuantity)
  {
    if (!v14)
      goto LABEL_32;
    -[HKCodableQuantity mergeFrom:](mostRecentQuantity, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_32;
    -[HKCodableStatistics setMostRecentQuantity:](self, "setMostRecentQuantity:");
  }
  v5 = v23;
LABEL_32:
  sumQuantity = self->_sumQuantity;
  v16 = v5[13];
  if (sumQuantity)
  {
    if (!v16)
      goto LABEL_38;
    -[HKCodableQuantity mergeFrom:](sumQuantity, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_38;
    -[HKCodableStatistics setSumQuantity:](self, "setSumQuantity:");
  }
  v5 = v23;
LABEL_38:
  durationQuantity = self->_durationQuantity;
  v18 = v5[7];
  if (durationQuantity)
  {
    if (!v18)
      goto LABEL_44;
    -[HKCodableQuantity mergeFrom:](durationQuantity, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_44;
    -[HKCodableStatistics setDurationQuantity:](self, "setDurationQuantity:");
  }
  v5 = v23;
LABEL_44:
  if ((v5[14] & 2) != 0)
  {
    self->_dataCount = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  statisticsInterval = self->_statisticsInterval;
  v20 = v5[12];
  if (statisticsInterval)
  {
    if (!v20)
      goto LABEL_52;
    -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_52;
    -[HKCodableStatistics setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  v5 = v23;
LABEL_52:
  if ((v5[14] & 1) != 0)
  {
    self->_baselineRelativeValueState = v5[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  metadata = self->_metadata;
  v22 = v5[9];
  if (metadata)
  {
    if (v22)
    {
      -[HKCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
LABEL_59:
      v5 = v23;
    }
  }
  else if (v22)
  {
    -[HKCodableStatistics setMetadata:](self, "setMetadata:");
    goto LABEL_59;
  }

}

- (HKCodableQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (void)setAverageQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_averageQuantity, a3);
}

- (HKCodableQuantity)minQuantity
{
  return self->_minQuantity;
}

- (void)setMinQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_minQuantity, a3);
}

- (HKCodableQuantity)maxQuantity
{
  return self->_maxQuantity;
}

- (void)setMaxQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_maxQuantity, a3);
}

- (HKCodableQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (void)setMostRecentQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentQuantity, a3);
}

- (void)setSumQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_sumQuantity, a3);
}

- (HKCodableQuantity)durationQuantity
{
  return self->_durationQuantity;
}

- (void)setDurationQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_durationQuantity, a3);
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (int64_t)baselineRelativeValueState
{
  return self->_baselineRelativeValueState;
}

- (HKCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

@end
