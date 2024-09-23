@implementation HKCodableQuantityDistributionData

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableQuantityDistributionData;
  -[HKCodableQuantityDistributionData dealloc](&v3, sel_dealloc);
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasMinimumBucketValue
{
  return self->_minimumBucketValue != 0;
}

- (BOOL)hasMinimumValue
{
  return self->_minimumValue != 0;
}

- (BOOL)hasMaximumValue
{
  return self->_maximumValue != 0;
}

- (BOOL)hasAverageValue
{
  return self->_averageValue != 0;
}

- (BOOL)hasDuration
{
  return self->_duration != 0;
}

- (unint64_t)histogramCountsCount
{
  return self->_histogramCounts.count;
}

- (double)histogramCounts
{
  return self->_histogramCounts.list;
}

- (void)clearHistogramCounts
{
  PBRepeatedDoubleClear();
}

- (void)addHistogramCounts:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)histogramCountsAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_histogramCounts;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_histogramCounts = &self->_histogramCounts;
  count = self->_histogramCounts.count;
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
  return p_histogramCounts->list[a3];
}

- (void)setHistogramCounts:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)clearContextIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_contextIdentifiers, "removeAllObjects");
}

- (void)addContextIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *contextIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contextIdentifiers = self->_contextIdentifiers;
  v8 = v4;
  if (!contextIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contextIdentifiers;
    self->_contextIdentifiers = v6;

    v4 = v8;
    contextIdentifiers = self->_contextIdentifiers;
  }
  -[NSMutableArray addObject:](contextIdentifiers, "addObject:", v4);

}

- (unint64_t)contextIdentifiersCount
{
  return -[NSMutableArray count](self->_contextIdentifiers, "count");
}

- (id)contextIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contextIdentifiers, "objectAtIndex:", a3);
}

+ (Class)contextIdentifiersType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HKCodableQuantityDistributionData;
  -[HKCodableQuantityDistributionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantityDistributionData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  HKCodableQuantity *minimumBucketValue;
  void *v8;
  HKCodableQuantity *minimumValue;
  void *v10;
  HKCodableQuantity *maximumValue;
  void *v12;
  HKCodableQuantity *averageValue;
  void *v14;
  HKCodableQuantity *duration;
  void *v16;
  void *v17;
  NSMutableArray *contextIdentifiers;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("endDate"));

  }
  minimumBucketValue = self->_minimumBucketValue;
  if (minimumBucketValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](minimumBucketValue, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("minimumBucketValue"));

  }
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](minimumValue, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("minimumValue"));

  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](maximumValue, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("maximumValue"));

  }
  averageValue = self->_averageValue;
  if (averageValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageValue, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("averageValue"));

  }
  duration = self->_duration;
  if (duration)
  {
    -[HKCodableQuantity dictionaryRepresentation](duration, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("duration"));

  }
  PBRepeatedDoubleNSArray();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("histogramCounts"));

  contextIdentifiers = self->_contextIdentifiers;
  if (contextIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", contextIdentifiers, CFSTR("contextIdentifiers"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantityDistributionDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_minimumBucketValue)
    PBDataWriterWriteSubmessage();
  if (self->_minimumValue)
    PBDataWriterWriteSubmessage();
  if (self->_maximumValue)
    PBDataWriterWriteSubmessage();
  if (self->_averageValue)
    PBDataWriterWriteSubmessage();
  if (self->_duration)
    PBDataWriterWriteSubmessage();
  if (self->_histogramCounts.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v6;
    }
    while (v6 < self->_histogramCounts.count);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_contextIdentifiers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  v13 = v4;
  if (self->_minimumBucketValue)
    objc_msgSend(v4, "setMinimumBucketValue:");
  if (self->_minimumValue)
    objc_msgSend(v13, "setMinimumValue:");
  if (self->_maximumValue)
    objc_msgSend(v13, "setMaximumValue:");
  if (self->_averageValue)
    objc_msgSend(v13, "setAverageValue:");
  if (self->_duration)
    objc_msgSend(v13, "setDuration:");
  if (-[HKCodableQuantityDistributionData histogramCountsCount](self, "histogramCountsCount"))
  {
    objc_msgSend(v13, "clearHistogramCounts");
    v6 = -[HKCodableQuantityDistributionData histogramCountsCount](self, "histogramCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HKCodableQuantityDistributionData histogramCountsAtIndex:](self, "histogramCountsAtIndex:", i);
        objc_msgSend(v13, "addHistogramCounts:");
      }
    }
  }
  if (-[HKCodableQuantityDistributionData contextIdentifiersCount](self, "contextIdentifiersCount"))
  {
    objc_msgSend(v13, "clearContextIdentifiers");
    v9 = -[HKCodableQuantityDistributionData contextIdentifiersCount](self, "contextIdentifiersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HKCodableQuantityDistributionData contextIdentifiersAtIndex:](self, "contextIdentifiersAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addContextIdentifiers:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_startDate;
    *(_BYTE *)(v5 + 96) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_endDate;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_minimumBucketValue, "copyWithZone:", a3);
  v9 = (void *)v6[10];
  v6[10] = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_minimumValue, "copyWithZone:", a3);
  v11 = (void *)v6[11];
  v6[11] = v10;

  v12 = -[HKCodableQuantity copyWithZone:](self->_maximumValue, "copyWithZone:", a3);
  v13 = (void *)v6[9];
  v6[9] = v12;

  v14 = -[HKCodableQuantity copyWithZone:](self->_averageValue, "copyWithZone:", a3);
  v15 = (void *)v6[6];
  v6[6] = v14;

  v16 = -[HKCodableQuantity copyWithZone:](self->_duration, "copyWithZone:", a3);
  v17 = (void *)v6[8];
  v6[8] = v16;

  PBRepeatedDoubleCopy();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_contextIdentifiers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v6, "addContextIdentifiers:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *minimumBucketValue;
  HKCodableQuantity *minimumValue;
  HKCodableQuantity *maximumValue;
  HKCodableQuantity *averageValue;
  HKCodableQuantity *duration;
  NSMutableArray *contextIdentifiers;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_startDate != *((double *)v4 + 5))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_endDate != *((double *)v4 + 4))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_25;
  }
  minimumBucketValue = self->_minimumBucketValue;
  if ((unint64_t)minimumBucketValue | *((_QWORD *)v4 + 10)
    && !-[HKCodableQuantity isEqual:](minimumBucketValue, "isEqual:"))
  {
    goto LABEL_25;
  }
  minimumValue = self->_minimumValue;
  if ((unint64_t)minimumValue | *((_QWORD *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](minimumValue, "isEqual:"))
      goto LABEL_25;
  }
  maximumValue = self->_maximumValue;
  if ((unint64_t)maximumValue | *((_QWORD *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](maximumValue, "isEqual:"))
      goto LABEL_25;
  }
  averageValue = self->_averageValue;
  if ((unint64_t)averageValue | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableQuantity isEqual:](averageValue, "isEqual:"))
      goto LABEL_25;
  }
  duration = self->_duration;
  if ((unint64_t)duration | *((_QWORD *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](duration, "isEqual:"))
      goto LABEL_25;
  }
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_25;
  contextIdentifiers = self->_contextIdentifiers;
  if ((unint64_t)contextIdentifiers | *((_QWORD *)v4 + 7))
    v11 = -[NSMutableArray isEqual:](contextIdentifiers, "isEqual:");
  else
    v11 = 1;
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
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

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    startDate = self->_startDate;
    v6 = -startDate;
    if (startDate >= 0.0)
      v6 = self->_startDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
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
  v14 = v9 ^ v4 ^ -[HKCodableQuantity hash](self->_minimumBucketValue, "hash");
  v15 = -[HKCodableQuantity hash](self->_minimumValue, "hash");
  v16 = v14 ^ v15 ^ -[HKCodableQuantity hash](self->_maximumValue, "hash");
  v17 = -[HKCodableQuantity hash](self->_averageValue, "hash");
  v18 = v17 ^ -[HKCodableQuantity hash](self->_duration, "hash");
  v19 = v16 ^ v18 ^ PBRepeatedDoubleHash();
  return v19 ^ -[NSMutableArray hash](self->_contextIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  HKCodableQuantity *minimumBucketValue;
  uint64_t v8;
  HKCodableQuantity *minimumValue;
  uint64_t v10;
  HKCodableQuantity *maximumValue;
  uint64_t v12;
  HKCodableQuantity *averageValue;
  uint64_t v14;
  HKCodableQuantity *duration;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 96);
  if ((v6 & 2) != 0)
  {
    self->_startDate = v4[5];
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 96);
  }
  if ((v6 & 1) != 0)
  {
    self->_endDate = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  minimumBucketValue = self->_minimumBucketValue;
  v8 = *((_QWORD *)v5 + 10);
  if (minimumBucketValue)
  {
    if (v8)
      -[HKCodableQuantity mergeFrom:](minimumBucketValue, "mergeFrom:");
  }
  else if (v8)
  {
    -[HKCodableQuantityDistributionData setMinimumBucketValue:](self, "setMinimumBucketValue:");
  }
  minimumValue = self->_minimumValue;
  v10 = *((_QWORD *)v5 + 11);
  if (minimumValue)
  {
    if (v10)
      -[HKCodableQuantity mergeFrom:](minimumValue, "mergeFrom:");
  }
  else if (v10)
  {
    -[HKCodableQuantityDistributionData setMinimumValue:](self, "setMinimumValue:");
  }
  maximumValue = self->_maximumValue;
  v12 = *((_QWORD *)v5 + 9);
  if (maximumValue)
  {
    if (v12)
      -[HKCodableQuantity mergeFrom:](maximumValue, "mergeFrom:");
  }
  else if (v12)
  {
    -[HKCodableQuantityDistributionData setMaximumValue:](self, "setMaximumValue:");
  }
  averageValue = self->_averageValue;
  v14 = *((_QWORD *)v5 + 6);
  if (averageValue)
  {
    if (v14)
      -[HKCodableQuantity mergeFrom:](averageValue, "mergeFrom:");
  }
  else if (v14)
  {
    -[HKCodableQuantityDistributionData setAverageValue:](self, "setAverageValue:");
  }
  duration = self->_duration;
  v16 = *((_QWORD *)v5 + 8);
  if (duration)
  {
    if (v16)
      -[HKCodableQuantity mergeFrom:](duration, "mergeFrom:");
  }
  else if (v16)
  {
    -[HKCodableQuantityDistributionData setDuration:](self, "setDuration:");
  }
  v17 = objc_msgSend(v5, "histogramCountsCount");
  if (v17)
  {
    v18 = v17;
    for (i = 0; i != v18; ++i)
    {
      objc_msgSend(v5, "histogramCountsAtIndex:", i);
      -[HKCodableQuantityDistributionData addHistogramCounts:](self, "addHistogramCounts:");
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *((id *)v5 + 7);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[HKCodableQuantityDistributionData addContextIdentifiers:](self, "addContextIdentifiers:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableQuantity)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (void)setMinimumBucketValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumBucketValue, a3);
}

- (HKCodableQuantity)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (HKCodableQuantity)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
}

- (HKCodableQuantity)averageValue
{
  return self->_averageValue;
}

- (void)setAverageValue:(id)a3
{
  objc_storeStrong((id *)&self->_averageValue, a3);
}

- (HKCodableQuantity)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSMutableArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (void)setContextIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_minimumBucketValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
}

@end
