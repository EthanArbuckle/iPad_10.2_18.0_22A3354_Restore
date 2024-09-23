@implementation HKCodableChartDataSourceQueryData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_queryDataObject, 0);
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (void)setQueryDataObject:(id)a3
{
  objc_storeStrong((id *)&self->_queryDataObject, a3);
}

- (void)setFirstWeekday:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_firstWeekday = a3;
}

- (NSData)queryDataObject
{
  return self->_queryDataObject;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_type;
  else
    return 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_queryDataObject)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_statisticsInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }

}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (BOOL)hasQueryDataObject
{
  return self->_queryDataObject != 0;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0xF)
    return off_1E9C47710[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("quantity")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("distribution")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sampleTypeCount")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bloodPressure")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("insulin")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("handwashing")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("horizontalTimePeriod")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("timePeriodSeries")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sample")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sleep")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activitySummary")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("notification")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cardioFitness")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("electrocardiogram")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("stateOfMind")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasFirstWeekday:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstWeekday
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
  v8.super_class = (Class)HKCodableChartDataSourceQueryData;
  -[HKCodableChartDataSourceQueryData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartDataSourceQueryData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *timeZoneName;
  NSData *queryDataObject;
  char has;
  void *v8;
  void *v9;
  HKCodableDateComponents *statisticsInterval;
  void *v11;
  char v12;
  uint64_t type;
  __CFString *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  timeZoneName = self->_timeZoneName;
  if (timeZoneName)
    objc_msgSend(v3, "setObject:forKey:", timeZoneName, CFSTR("timeZoneName"));
  queryDataObject = self->_queryDataObject;
  if (queryDataObject)
    objc_msgSend(v4, "setObject:forKey:", queryDataObject, CFSTR("queryDataObject"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("endDate"));

  }
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    -[HKCodableDateComponents dictionaryRepresentation](statisticsInterval, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("statisticsInterval"));

  }
  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    type = self->_type;
    if (type >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E9C47710[type];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("type"));

    v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_firstWeekday);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("firstWeekday"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_timeZoneName)
  {
    objc_msgSend(v4, "setTimeZoneName:");
    v4 = v7;
  }
  if (self->_queryDataObject)
  {
    objc_msgSend(v7, "setQueryDataObject:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 60) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_statisticsInterval)
  {
    objc_msgSend(v7, "setStatisticsInterval:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((_BYTE *)v4 + 60) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_firstWeekday;
    *((_BYTE *)v4 + 60) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  char v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSData copyWithZone:](self->_queryDataObject, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_startDate;
    *(_BYTE *)(v5 + 60) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_endDate;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v11 = -[HKCodableDateComponents copyWithZone:](self->_statisticsInterval, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = (char)self->_has;
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 60) |= 8u;
    v13 = (char)self->_has;
  }
  if ((v13 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_firstWeekday;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *timeZoneName;
  NSData *queryDataObject;
  char has;
  HKCodableDateComponents *statisticsInterval;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:"))
      goto LABEL_28;
  }
  queryDataObject = self->_queryDataObject;
  if ((unint64_t)queryDataObject | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](queryDataObject, "isEqual:"))
      goto LABEL_28;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_startDate != *((double *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  statisticsInterval = self->_statisticsInterval;
  if ((unint64_t)statisticsInterval | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    {
LABEL_28:
      v9 = 0;
      goto LABEL_29;
    }
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  v9 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_firstWeekday != *((_QWORD *)v4 + 2))
      goto LABEL_28;
    v9 = 1;
  }
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  char has;
  unint64_t v6;
  double startDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double endDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = -[NSString hash](self->_timeZoneName, "hash");
  v4 = -[NSData hash](self->_queryDataObject, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    startDate = self->_startDate;
    v8 = -startDate;
    if (startDate >= 0.0)
      v8 = self->_startDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 1) != 0)
  {
    endDate = self->_endDate;
    v13 = -endDate;
    if (endDate >= 0.0)
      v13 = self->_endDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = -[HKCodableDateComponents hash](self->_statisticsInterval, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v17 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_19;
LABEL_21:
    v18 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18;
  }
  v17 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_21;
LABEL_19:
  v18 = 2654435761 * self->_firstWeekday;
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  HKCodableDateComponents *statisticsInterval;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[HKCodableChartDataSourceQueryData setTimeZoneName:](self, "setTimeZoneName:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HKCodableChartDataSourceQueryData setQueryDataObject:](self, "setQueryDataObject:");
    v4 = v9;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_startDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 1) != 0)
  {
    self->_endDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  statisticsInterval = self->_statisticsInterval;
  v7 = *((_QWORD *)v4 + 5);
  if (statisticsInterval)
  {
    if (!v7)
      goto LABEL_15;
    -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[HKCodableChartDataSourceQueryData setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  v4 = v9;
LABEL_15:
  v8 = *((_BYTE *)v4 + 60);
  if ((v8 & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v8 = *((_BYTE *)v4 + 60);
  }
  if ((v8 & 2) != 0)
  {
    self->_firstWeekday = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

@end
