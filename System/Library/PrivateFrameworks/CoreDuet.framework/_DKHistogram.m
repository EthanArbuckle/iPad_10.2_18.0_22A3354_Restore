@implementation _DKHistogram

- (_DKHistogram)init
{
  _DKHistogram *v2;
  uint64_t v3;
  NSMutableDictionary *histogram;
  uint64_t v5;
  NSUUID *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKHistogram;
  v2 = -[_DKHistogram init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    histogram = v2->_histogram;
    v2->_histogram = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v5;

    v2->_countOverAllValues = 0;
  }
  return v2;
}

- (_DKHistogram)initWithValues:(id)a3
{
  id v4;
  _DKHistogram *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_DKHistogram init](self, "init");
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_histogram, "objectForKeyedSubscript:", v11, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 + 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_histogram, "setObject:forKeyedSubscript:", v14, v11);

          ++v5->_countOverAllValues;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (_DKHistogram)initWithHistogram:(id)a3
{
  id v4;
  _DKHistogram *v5;
  _DKHistogram *v6;
  NSMutableDictionary *v7;
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
  v4 = a3;
  v5 = -[_DKHistogram init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_histogram, "addEntriesFromDictionary:", v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6->_histogram;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          -[NSMutableDictionary objectForKeyedSubscript:](v6->_histogram, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6->_countOverAllValues += objc_msgSend(v12, "unsignedIntegerValue");

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (unint64_t)countForValue:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)countForValueDouble:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)relativeFrequencyForValue:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5 / (double)self->_countOverAllValues;

  return v6;
}

- (id)countDictionary
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_histogram);
}

- (BOOL)isEqual:(id)a3
{
  _DKHistogram *v4;
  _DKHistogram *v5;
  _DKHistogram *v6;
  NSMutableDictionary *histogram;
  void *v8;
  NSUUID *identifier;
  void *v10;
  NSArray *deviceIdentifiers;
  void *v12;
  NSDateInterval *interval;
  void *v14;
  _DKEventStream *stream;
  void *v16;
  char v17;

  v4 = (_DKHistogram *)a3;
  v5 = v4;
  if (self == v4)
  {
    v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    histogram = self->_histogram;
    -[_DKHistogram histogram](v6, "histogram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableDictionary isEqualToDictionary:](histogram, "isEqualToDictionary:", v8))
    {
      identifier = self->_identifier;
      -[_DKHistogram identifier](v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSUUID isEqual:](identifier, "isEqual:", v10))
      {
        deviceIdentifiers = self->_deviceIdentifiers;
        -[_DKHistogram deviceIdentifiers](v6, "deviceIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSArray isEqualToArray:](deviceIdentifiers, "isEqualToArray:", v12))
        {
          interval = self->_interval;
          -[_DKHistogram interval](v6, "interval");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSDateInterval isEqualToDateInterval:](interval, "isEqualToDateInterval:", v14))
          {
            stream = self->_stream;
            -[_DKHistogram stream](v6, "stream");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[_DKEventStream isEqual:](stream, "isEqual:", v16);

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)addValue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v7, v8);

  ++self->_countOverAllValues;
  objc_autoreleasePoolPop(v4);

}

- (void)addValue:(id)a3 withCount:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void *)MEMORY[0x193FEE914]();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v10, v11);

  ++self->_countOverAllValues;
  objc_autoreleasePoolPop(v6);

}

- (void)subtractValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if (v7 == 1)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_histogram, "removeObjectForKey:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v8, v9);

    }
    --self->_countOverAllValues;
  }
  objc_autoreleasePoolPop(v4);

}

- (void)_addPropertiesFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateInterval *v14;
  void *v15;
  void *v16;
  NSDateInterval *interval;
  NSUUID *v18;
  NSUUID *identifier;
  NSString *v20;
  NSString *customIdentifier;
  NSArray *deviceIdentifiers;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  _DKEventStream *v26;
  _DKEventStream *stream;
  id v28;

  v28 = a3;
  -[_DKHistogram interval](self, "interval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "interval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "interval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram interval](self, "interval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "laterDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v13)
  {
    v14 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v13);
LABEL_6:
    interval = self->_interval;
    self->_interval = v14;

    v16 = v28;
    goto LABEL_7;
  }
  objc_msgSend(v28, "interval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v28;
  if (v15)
  {
    objc_msgSend(v28, "interval");
    v14 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v16, "identifier");
  v18 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v18;

  objc_msgSend(v28, "customIdentifier");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  customIdentifier = self->_customIdentifier;
  self->_customIdentifier = v20;

  deviceIdentifiers = self->_deviceIdentifiers;
  objc_msgSend(v28, "deviceIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](deviceIdentifiers, "arrayByAddingObjectsFromArray:", v23);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v25 = self->_deviceIdentifiers;
  self->_deviceIdentifiers = v24;

  objc_msgSend(v28, "stream");
  v26 = (_DKEventStream *)objc_claimAutoreleasedReturnValue();
  stream = self->_stream;
  self->_stream = v26;

}

- (void)addHistogram:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x193FEE914]();
  -[_DKHistogram _addPropertiesFrom:](self, "_addPropertiesFrom:", v4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "histogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        objc_msgSend(v4, "histogram");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 + v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v18, v10);

        self->_countOverAllValues = (unint64_t)(v17 + (double)self->_countOverAllValues);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
}

- (void)addHistogram:(id)a3 decayingExistingCounts:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _DKHistogram *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  _DKHistogram *v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = (void *)MEMORY[0x193FEE914]();
  -[_DKHistogram _addPropertiesFrom:](self, "_addPropertiesFrom:", v6);
  v8 = (void *)-[NSMutableDictionary copy](self->_histogram, "copy");
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke;
  v17[3] = &unk_1E26E4EB8;
  v10 = v6;
  v21 = a4;
  v18 = v10;
  v19 = self;
  v20 = &v22;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v10, "histogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __52___DKHistogram_addHistogram_decayingExistingCounts___block_invoke_2;
  v13[3] = &unk_1E26E4EE0;
  v12 = v8;
  v14 = v12;
  v15 = self;
  v16 = &v22;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

  self->_countOverAllValues = llround(v23[3]);
  _Block_object_dispose(&v22, 8);

  objc_autoreleasePoolPop(v7);
}

- (void)subtractHistogram:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *deviceIdentifiers;
  NSArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *context;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_deviceIdentifiers);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  deviceIdentifiers = self->_deviceIdentifiers;
  self->_deviceIdentifiers = v5;

  v7 = self->_deviceIdentifiers;
  objc_msgSend(v4, "deviceIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray removeObjectsInArray:](v7, "removeObjectsInArray:", v8);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "histogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        v17 = objc_msgSend(v4, "countForValue:", v14);
        if (v16 <= v17)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_histogram, "removeObjectForKey:", v14);
        }
        else
        {
          v18 = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 - v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v19, v14);

          v16 = v18;
        }
        self->_countOverAllValues -= v16;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram customIdentifier](self, "customIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram interval](self, "interval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram deviceIdentifiers](self, "deviceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram histogram](self, "histogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKHistogram countOverAllValues](self, "countOverAllValues"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:{stream=%@; identifier=%@; customIdentifier=%@, interval=%@; deviceIdentifiers=%@; histogram=%@; countOverAllValues=%@}"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKHistogram)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _DKHistogram *v17;
  _DKHistogram *v18;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9, v20[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("histogram"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stream"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_DKHistogram initWithHistogram:](self, "initWithHistogram:", v11);
  v18 = v17;
  if (v17)
  {
    -[_DKHistogram setDeviceIdentifiers:](v17, "setDeviceIdentifiers:", v12);
    -[_DKHistogram setInterval:](v18, "setInterval:", v13);
    -[_DKHistogram setStream:](v18, "setStream:", v14);
    -[_DKHistogram setIdentifier:](v18, "setIdentifier:", v15);
    -[_DKHistogram setCustomIdentifier:](v18, "setCustomIdentifier:", v16);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *histogram;
  id v5;

  histogram = self->_histogram;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", histogram, CFSTR("histogram"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifiers, CFSTR("deviceIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interval, CFSTR("interval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stream, CFSTR("stream"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customIdentifier, CFSTR("customIdentifier"));

}

- (NSDictionary)histogram
{
  return &self->_histogram->super;
}

- (void)setHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_histogram, a3);
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
  objc_storeStrong((id *)&self->_interval, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_customIdentifier, a3);
}

- (unint64_t)countOverAllValues
{
  return self->_countOverAllValues;
}

- (void)setCountOverAllValues:(unint64_t)a3
{
  self->_countOverAllValues = a3;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (NSArray)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
}

- (_DKHistogram)initWithManagedObject:(id)a3
{
  id v4;
  _DKHistogram *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _DKHistogram *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)_DKHistogram;
  v5 = -[_DKHistogram init](&v58, sel_init);
  if (!v5)
    goto LABEL_22;
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53 = v4;
  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_19;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v55;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v55 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v15, "stringValue");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v15, "integerValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v19 = objc_claimAutoreleasedReturnValue();
          v4 = v53;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[_DKHistogram(CoreData) initWithManagedObject:].cold.1((uint64_t)v53, v19, v46, v47, v48, v49, v50, v51);
          goto LABEL_25;
        }
        objc_msgSend(v15, "integerValue");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v19 = v17;
      objc_msgSend(v15, "count");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        v4 = v53;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[_DKHistogram(CoreData) initWithManagedObject:].cold.2((uint64_t)v53, v23, v24, v25, v26, v27, v28, v29);

LABEL_25:
        v45 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v15, "count");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v19);

      objc_msgSend(v15, "count");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += objc_msgSend(v22, "unsignedIntegerValue");

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v11)
      continue;
    break;
  }
LABEL_19:

  v4 = v53;
  objc_msgSend(v53, "streamTypeCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKObjectType objectTypeWithTypeCode:](_DKObjectType, "objectTypeWithTypeCode:", objc_msgSend(v30, "integerValue"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "streamName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v32, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v53, "startDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "endDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v34, "initWithStartDate:endDate:", v35, v36);
  -[_DKHistogram setInterval:](v5, "setInterval:", v37);

  -[_DKHistogram setHistogram:](v5, "setHistogram:", v8);
  objc_msgSend(v53, "deviceIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v53, "deviceIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKHistogram setDeviceIdentifiers:](v5, "setDeviceIdentifiers:", v40);

  }
  -[_DKHistogram setStream:](v5, "setStream:", v33);
  v41 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v53, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithUUIDString:", v42);
  -[_DKHistogram setIdentifier:](v5, "setIdentifier:", v43);

  objc_msgSend(v53, "customIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogram setCustomIdentifier:](v5, "setCustomIdentifier:", v44);

  -[_DKHistogram setCountOverAllValues:](v5, "setCountOverAllValues:", v12);
LABEL_22:
  v45 = v5;
LABEL_26:

  return v45;
}

+ (id)entityName
{
  return CFSTR("Histogram");
}

- (id)insertInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  _DKHistogram *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B20];
  +[_DKHistogram entityName](_DKHistogram, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKHistogram interval](self, "interval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartDate:", v9);

  -[_DKHistogram interval](self, "interval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndDate:", v11);

  -[_DKHistogram identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v13);

  -[_DKHistogram customIdentifier](self, "customIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomIdentifier:", v14);

  -[_DKHistogram stream](self, "stream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStreamName:", v16);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[_DKHistogram stream](self, "stream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "eventValueType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "typeCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStreamTypeCode:", v20);

  -[_DKHistogram deviceIdentifiers](self, "deviceIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 <= 1)
  {
    -[_DKHistogram deviceIdentifiers](self, "deviceIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceIdentifier:", v25);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = self;
    -[_DKHistogram histogram](self, "histogram");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v40;
      v30 = v4;
      v31 = v7;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(obj);
          v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v32);
          objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("HistogramValue"), v4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v34, "setIntegerValue:", v33);
          else
            objc_msgSend(v34, "setStringValue:", v33);
          -[_DKHistogram histogram](v26, "histogram");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setCount:", v36);

          v7 = v31;
          objc_msgSend(v31, "addValueObject:", v34);

          ++v32;
          v4 = v30;
        }
        while (v28 != v32);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "insertObject:", v7);
    v23 = v7;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
