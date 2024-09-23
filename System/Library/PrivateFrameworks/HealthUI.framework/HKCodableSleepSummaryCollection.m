@implementation HKCodableSleepSummaryCollection

- (void)clearSleepSummaryEntrys
{
  -[NSMutableArray removeAllObjects](self->_sleepSummaryEntrys, "removeAllObjects");
}

- (void)addSleepSummaryEntry:(id)a3
{
  id v4;
  NSMutableArray *sleepSummaryEntrys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sleepSummaryEntrys = self->_sleepSummaryEntrys;
  v8 = v4;
  if (!sleepSummaryEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sleepSummaryEntrys;
    self->_sleepSummaryEntrys = v6;

    v4 = v8;
    sleepSummaryEntrys = self->_sleepSummaryEntrys;
  }
  -[NSMutableArray addObject:](sleepSummaryEntrys, "addObject:", v4);

}

- (unint64_t)sleepSummaryEntrysCount
{
  return -[NSMutableArray count](self->_sleepSummaryEntrys, "count");
}

- (id)sleepSummaryEntryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sleepSummaryEntrys, "objectAtIndex:", a3);
}

+ (Class)sleepSummaryEntryType
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
  v8.super_class = (Class)HKCodableSleepSummaryCollection;
  -[HKCodableSleepSummaryCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepSummaryCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_sleepSummaryEntrys, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sleepSummaryEntrys, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_sleepSummaryEntrys;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sleepSummaryEntry"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepSummaryCollectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sleepSummaryEntrys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[HKCodableSleepSummaryCollection sleepSummaryEntrysCount](self, "sleepSummaryEntrysCount"))
  {
    objc_msgSend(v8, "clearSleepSummaryEntrys");
    v4 = -[HKCodableSleepSummaryCollection sleepSummaryEntrysCount](self, "sleepSummaryEntrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableSleepSummaryCollection sleepSummaryEntryAtIndex:](self, "sleepSummaryEntryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSleepSummaryEntry:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_sleepSummaryEntrys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addSleepSummaryEntry:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *sleepSummaryEntrys;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    sleepSummaryEntrys = self->_sleepSummaryEntrys;
    if ((unint64_t)sleepSummaryEntrys | v4[1])
      v6 = -[NSMutableArray isEqual:](sleepSummaryEntrys, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_sleepSummaryEntrys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HKCodableSleepSummaryCollection addSleepSummaryEntry:](self, "addSleepSummaryEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)sleepSummaryEntrys
{
  return self->_sleepSummaryEntrys;
}

- (void)setSleepSummaryEntrys:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSummaryEntrys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepSummaryEntrys, 0);
}

+ (id)sleepSummaryCollectionFromDaySummaries:(id)a3
{
  id v4;
  HKCodableSleepSummaryCollection *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HKCodableSleepSummaryCollection);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_sleepEntryFromDaySummary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableSleepSummaryCollection addSleepSummaryEntry:](v5, "addSleepSummaryEntry:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_sleepEntryFromDaySummary:(id)a3
{
  id v4;
  HKCodableSleepSummaryEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HKCodableSleepSummaryEntry);
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_codableDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepSummaryEntry setDateInterval:](v5, "setDateInterval:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "periods", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_codableSleepPeriodFromPeriod:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableSleepSummaryEntry addPeriod:](v5, "addPeriod:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

+ (id)_codableSleepPeriodFromPeriod:(id)a3
{
  id v4;
  HKCodableSleepPeriod *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HKCodableSleepPeriod);
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_codableDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepPeriod setDateInterval:](v5, "setDateInterval:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "segments", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_codableSleepPeriodSegmentFromSegment:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableSleepPeriod addSegment:](v5, "addSegment:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

+ (id)_codableSleepPeriodSegmentFromSegment:(id)a3
{
  id v3;
  HKCodableSleepPeriodSegment *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HKCodableSleepPeriodSegment);
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_codableDateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepPeriodSegment setDateInterval:](v4, "setDateInterval:", v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "sampleIntervals", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "hk_codableDateInterval");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableSleepPeriodSegment addSampleInterval:](v4, "addSampleInterval:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[HKCodableSleepPeriodSegment setCategory:](v4, "setCategory:", objc_msgSend(v3, "category"));
  return v4;
}

- (id)daySummariesWithSourceTimeZone:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKCodableSleepSummaryCollection sleepSummaryEntrys](self, "sleepSummaryEntrys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[HKCodableSleepSummaryCollection _daySummaryFromCodableSummary:sourceTimeZone:](self, "_daySummaryFromCodableSummary:sourceTimeZone:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_daySummaryFromCodableSummary:(id)a3 sourceTimeZone:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasDateInterval");
  v9 = (void *)MEMORY[0x1E0CB3588];
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v10, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3588]);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "periods");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        -[HKCodableSleepSummaryCollection _sleepPeriodFromCodablePeriod:sourceTimeZone:](self, "_sleepPeriodFromCodablePeriod:sourceTimeZone:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17), v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimeZone:", v7);
  objc_msgSend(v11, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hk_morningIndexWithCalendar:", v19);

  v22 = (void *)MEMORY[0x1E0CB6BE0];
  v23 = objc_alloc_init(MEMORY[0x1E0CB3588]);
  objc_msgSend(v22, "daySummaryWithMorningIndex:dateInterval:calendar:periods:schedules:sleepDurationGoal:creationInterval:", v21, v11, v19, v12, MEMORY[0x1E0C9AA60], 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_sleepPeriodFromCodablePeriod:(id)a3 sourceTimeZone:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasDateInterval");
  v9 = (void *)MEMORY[0x1E0CB3588];
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v10, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3588]);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "segments", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        -[HKCodableSleepSummaryCollection _segmentFromCodableSegment:sourceTimeZone:](self, "_segmentFromCodableSegment:sourceTimeZone:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB6BF8], "sleepPeriodWithDateInterval:segments:", v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_segmentFromCodableSegment:(id)a3 sourceTimeZone:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "hasDateInterval");
  v8 = (void *)MEMORY[0x1E0CB3588];
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v9, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3588]);
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "sampleIntervals", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v5, "hasCategory"))
    v18 = objc_msgSend(v5, "category");
  else
    v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB6C00], "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:", v10, v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
