@implementation HKCodableChartSharableModel

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartSharableModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekDateInterval, 0);
  objc_storeStrong((id *)&self->_weekData, 0);
  objc_storeStrong((id *)&self->_sixMonthDateInterval, 0);
  objc_storeStrong((id *)&self->_sixMonthData, 0);
  objc_storeStrong((id *)&self->_monthDateInterval, 0);
  objc_storeStrong((id *)&self->_monthData, 0);
  objc_storeStrong((id *)&self->_dayDateInterval, 0);
  objc_storeStrong((id *)&self->_dayData, 0);
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSixMonthDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_sixMonthDateInterval, a3);
}

- (void)setSixMonthData:(id)a3
{
  objc_storeStrong((id *)&self->_sixMonthData, a3);
}

- (void)setMonthDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_monthDateInterval, a3);
}

- (void)setMonthData:(id)a3
{
  objc_storeStrong((id *)&self->_monthData, a3);
}

- (HKCodableDateInterval)weekDateInterval
{
  return self->_weekDateInterval;
}

- (HKCodableChartDataSourceQueryData)weekData
{
  return self->_weekData;
}

- (BOOL)hasWeekDateInterval
{
  return self->_weekDateInterval != 0;
}

- (BOOL)hasWeekData
{
  return self->_weekData != 0;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_monthData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_monthDateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sixMonthData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sixMonthDateInterval)
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
  if (self->_weekData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_weekDateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_dayData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_dayDateInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (BOOL)hasMonthData
{
  return self->_monthData != 0;
}

- (BOOL)hasMonthDateInterval
{
  return self->_monthDateInterval != 0;
}

- (BOOL)hasSixMonthData
{
  return self->_sixMonthData != 0;
}

- (BOOL)hasSixMonthDateInterval
{
  return self->_sixMonthDateInterval != 0;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDayData
{
  return self->_dayData != 0;
}

- (BOOL)hasDayDateInterval
{
  return self->_dayDateInterval != 0;
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
  v8.super_class = (Class)HKCodableChartSharableModel;
  -[HKCodableChartSharableModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartSharableModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableChartDataSourceQueryData *monthData;
  void *v5;
  HKCodableDateInterval *monthDateInterval;
  void *v7;
  HKCodableChartDataSourceQueryData *sixMonthData;
  void *v9;
  HKCodableDateInterval *sixMonthDateInterval;
  void *v11;
  char has;
  void *v13;
  void *v14;
  HKCodableChartDataSourceQueryData *weekData;
  void *v16;
  HKCodableDateInterval *weekDateInterval;
  void *v18;
  HKCodableChartDataSourceQueryData *dayData;
  void *v20;
  HKCodableDateInterval *dayDateInterval;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  monthData = self->_monthData;
  if (monthData)
  {
    -[HKCodableChartDataSourceQueryData dictionaryRepresentation](monthData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("monthData"));

  }
  monthDateInterval = self->_monthDateInterval;
  if (monthDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](monthDateInterval, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("monthDateInterval"));

  }
  sixMonthData = self->_sixMonthData;
  if (sixMonthData)
  {
    -[HKCodableChartDataSourceQueryData dictionaryRepresentation](sixMonthData, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sixMonthData"));

  }
  sixMonthDateInterval = self->_sixMonthDateInterval;
  if (sixMonthDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](sixMonthDateInterval, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sixMonthDateInterval"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("minimumSupportedVersion"));

  }
  weekData = self->_weekData;
  if (weekData)
  {
    -[HKCodableChartDataSourceQueryData dictionaryRepresentation](weekData, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("weekData"));

  }
  weekDateInterval = self->_weekDateInterval;
  if (weekDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](weekDateInterval, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("weekDateInterval"));

  }
  dayData = self->_dayData;
  if (dayData)
  {
    -[HKCodableChartDataSourceQueryData dictionaryRepresentation](dayData, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("dayData"));

  }
  dayDateInterval = self->_dayDateInterval;
  if (dayDateInterval)
  {
    -[HKCodableDateInterval dictionaryRepresentation](dayDateInterval, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("dayDateInterval"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_monthData)
  {
    objc_msgSend(v4, "setMonthData:");
    v4 = v6;
  }
  if (self->_monthDateInterval)
  {
    objc_msgSend(v6, "setMonthDateInterval:");
    v4 = v6;
  }
  if (self->_sixMonthData)
  {
    objc_msgSend(v6, "setSixMonthData:");
    v4 = v6;
  }
  if (self->_sixMonthDateInterval)
  {
    objc_msgSend(v6, "setSixMonthDateInterval:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  if (self->_weekData)
  {
    objc_msgSend(v6, "setWeekData:");
    v4 = v6;
  }
  if (self->_weekDateInterval)
  {
    objc_msgSend(v6, "setWeekDateInterval:");
    v4 = v6;
  }
  if (self->_dayData)
  {
    objc_msgSend(v6, "setDayData:");
    v4 = v6;
  }
  if (self->_dayDateInterval)
  {
    objc_msgSend(v6, "setDayDateInterval:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char has;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableChartDataSourceQueryData copyWithZone:](self->_monthData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[HKCodableDateInterval copyWithZone:](self->_monthDateInterval, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[HKCodableChartDataSourceQueryData copyWithZone:](self->_sixMonthData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[HKCodableDateInterval copyWithZone:](self->_sixMonthDateInterval, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  v15 = -[HKCodableChartDataSourceQueryData copyWithZone:](self->_weekData, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[HKCodableDateInterval copyWithZone:](self->_weekDateInterval, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v19 = -[HKCodableChartDataSourceQueryData copyWithZone:](self->_dayData, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  v21 = -[HKCodableDateInterval copyWithZone:](self->_dayDateInterval, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableChartDataSourceQueryData *monthData;
  HKCodableDateInterval *monthDateInterval;
  HKCodableChartDataSourceQueryData *sixMonthData;
  HKCodableDateInterval *sixMonthDateInterval;
  HKCodableChartDataSourceQueryData *weekData;
  HKCodableDateInterval *weekDateInterval;
  HKCodableChartDataSourceQueryData *dayData;
  HKCodableDateInterval *dayDateInterval;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  monthData = self->_monthData;
  if ((unint64_t)monthData | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](monthData, "isEqual:"))
      goto LABEL_28;
  }
  monthDateInterval = self->_monthDateInterval;
  if ((unint64_t)monthDateInterval | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableDateInterval isEqual:](monthDateInterval, "isEqual:"))
      goto LABEL_28;
  }
  sixMonthData = self->_sixMonthData;
  if ((unint64_t)sixMonthData | *((_QWORD *)v4 + 7))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](sixMonthData, "isEqual:"))
      goto LABEL_28;
  }
  sixMonthDateInterval = self->_sixMonthDateInterval;
  if ((unint64_t)sixMonthDateInterval | *((_QWORD *)v4 + 8))
  {
    if (!-[HKCodableDateInterval isEqual:](sixMonthDateInterval, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_28;
  }
  weekData = self->_weekData;
  if ((unint64_t)weekData | *((_QWORD *)v4 + 9)
    && !-[HKCodableChartDataSourceQueryData isEqual:](weekData, "isEqual:"))
  {
    goto LABEL_28;
  }
  weekDateInterval = self->_weekDateInterval;
  if ((unint64_t)weekDateInterval | *((_QWORD *)v4 + 10))
  {
    if (!-[HKCodableDateInterval isEqual:](weekDateInterval, "isEqual:"))
      goto LABEL_28;
  }
  dayData = self->_dayData;
  if ((unint64_t)dayData | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableChartDataSourceQueryData isEqual:](dayData, "isEqual:"))
      goto LABEL_28;
  }
  dayDateInterval = self->_dayDateInterval;
  if ((unint64_t)dayDateInterval | *((_QWORD *)v4 + 4))
    v13 = -[HKCodableDateInterval isEqual:](dayDateInterval, "isEqual:");
  else
    v13 = 1;
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[HKCodableChartDataSourceQueryData hash](self->_monthData, "hash");
  v4 = -[HKCodableDateInterval hash](self->_monthDateInterval, "hash");
  v5 = -[HKCodableChartDataSourceQueryData hash](self->_sixMonthData, "hash");
  v6 = -[HKCodableDateInterval hash](self->_sixMonthDateInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_minimumSupportedVersion;
LABEL_6:
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[HKCodableChartDataSourceQueryData hash](self->_weekData, "hash");
  v11 = v9 ^ v10 ^ -[HKCodableDateInterval hash](self->_weekDateInterval, "hash");
  v12 = -[HKCodableChartDataSourceQueryData hash](self->_dayData, "hash");
  return v11 ^ v12 ^ -[HKCodableDateInterval hash](self->_dayDateInterval, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableChartDataSourceQueryData *monthData;
  uint64_t v6;
  HKCodableDateInterval *monthDateInterval;
  uint64_t v8;
  HKCodableChartDataSourceQueryData *sixMonthData;
  uint64_t v10;
  HKCodableDateInterval *sixMonthDateInterval;
  uint64_t v12;
  char v13;
  HKCodableChartDataSourceQueryData *weekData;
  uint64_t v15;
  HKCodableDateInterval *weekDateInterval;
  uint64_t v17;
  HKCodableChartDataSourceQueryData *dayData;
  uint64_t v19;
  HKCodableDateInterval *dayDateInterval;
  uint64_t v21;
  _QWORD *v22;

  v4 = a3;
  monthData = self->_monthData;
  v6 = v4[5];
  v22 = v4;
  if (monthData)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableChartDataSourceQueryData mergeFrom:](monthData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableChartSharableModel setMonthData:](self, "setMonthData:");
  }
  v4 = v22;
LABEL_7:
  monthDateInterval = self->_monthDateInterval;
  v8 = v4[6];
  if (monthDateInterval)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableDateInterval mergeFrom:](monthDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableChartSharableModel setMonthDateInterval:](self, "setMonthDateInterval:");
  }
  v4 = v22;
LABEL_13:
  sixMonthData = self->_sixMonthData;
  v10 = v4[7];
  if (sixMonthData)
  {
    if (!v10)
      goto LABEL_19;
    -[HKCodableChartDataSourceQueryData mergeFrom:](sixMonthData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[HKCodableChartSharableModel setSixMonthData:](self, "setSixMonthData:");
  }
  v4 = v22;
LABEL_19:
  sixMonthDateInterval = self->_sixMonthDateInterval;
  v12 = v4[8];
  if (sixMonthDateInterval)
  {
    if (!v12)
      goto LABEL_25;
    -[HKCodableDateInterval mergeFrom:](sixMonthDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[HKCodableChartSharableModel setSixMonthDateInterval:](self, "setSixMonthDateInterval:");
  }
  v4 = v22;
LABEL_25:
  v13 = *((_BYTE *)v4 + 88);
  if ((v13 & 1) != 0)
  {
    self->_latestSupportedVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v13 = *((_BYTE *)v4 + 88);
  }
  if ((v13 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  weekData = self->_weekData;
  v15 = v4[9];
  if (weekData)
  {
    if (!v15)
      goto LABEL_35;
    -[HKCodableChartDataSourceQueryData mergeFrom:](weekData, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_35;
    -[HKCodableChartSharableModel setWeekData:](self, "setWeekData:");
  }
  v4 = v22;
LABEL_35:
  weekDateInterval = self->_weekDateInterval;
  v17 = v4[10];
  if (weekDateInterval)
  {
    if (!v17)
      goto LABEL_41;
    -[HKCodableDateInterval mergeFrom:](weekDateInterval, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_41;
    -[HKCodableChartSharableModel setWeekDateInterval:](self, "setWeekDateInterval:");
  }
  v4 = v22;
LABEL_41:
  dayData = self->_dayData;
  v19 = v4[3];
  if (dayData)
  {
    if (!v19)
      goto LABEL_47;
    -[HKCodableChartDataSourceQueryData mergeFrom:](dayData, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_47;
    -[HKCodableChartSharableModel setDayData:](self, "setDayData:");
  }
  v4 = v22;
LABEL_47:
  dayDateInterval = self->_dayDateInterval;
  v21 = v4[4];
  if (dayDateInterval)
  {
    if (v21)
    {
      -[HKCodableDateInterval mergeFrom:](dayDateInterval, "mergeFrom:");
LABEL_52:
      v4 = v22;
    }
  }
  else if (v21)
  {
    -[HKCodableChartSharableModel setDayDateInterval:](self, "setDayDateInterval:");
    goto LABEL_52;
  }

}

- (HKCodableChartDataSourceQueryData)monthData
{
  return self->_monthData;
}

- (HKCodableDateInterval)monthDateInterval
{
  return self->_monthDateInterval;
}

- (HKCodableChartDataSourceQueryData)sixMonthData
{
  return self->_sixMonthData;
}

- (HKCodableDateInterval)sixMonthDateInterval
{
  return self->_sixMonthDateInterval;
}

- (void)setWeekData:(id)a3
{
  objc_storeStrong((id *)&self->_weekData, a3);
}

- (void)setWeekDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_weekDateInterval, a3);
}

- (HKCodableChartDataSourceQueryData)dayData
{
  return self->_dayData;
}

- (void)setDayData:(id)a3
{
  objc_storeStrong((id *)&self->_dayData, a3);
}

- (HKCodableDateInterval)dayDateInterval
{
  return self->_dayDateInterval;
}

- (void)setDayDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dayDateInterval, a3);
}

@end
