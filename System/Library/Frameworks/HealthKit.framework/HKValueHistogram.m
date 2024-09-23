@implementation HKValueHistogram

- (HKValueHistogram)initWithSegments:(id)a3 dateInterval:(id)a4
{
  id v6;
  id v7;
  HKValueHistogram *v8;
  uint64_t v9;
  NSArray *segments;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKValueHistogram;
  v8 = -[HKValueHistogram init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    segments = v8->_segments;
    v8->_segments = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dateInterval, a4);
  }

  return v8;
}

- (int64_t)totalSampleCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
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
  v2 = self->_segments;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)fractionOfValuesInSegmentAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  -[NSArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[HKValueHistogram totalSampleCount](self, "totalSampleCount");
  if (v7 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKValueHistogramCollection.m"), 95, CFSTR("Cannot compute fraction of values in segment of histogram with zero total samples"));

  }
  return (double)v6 / (double)v7;
}

- (BOOL)isEqual:(id)a3
{
  HKValueHistogram *v4;
  HKValueHistogram *v5;
  NSArray *segments;
  void *v7;
  NSDateInterval *dateInterval;
  void *v9;
  char v10;

  v4 = (HKValueHistogram *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[HKValueHistogram isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    segments = self->_segments;
    -[HKValueHistogram segments](v5, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqual:](segments, "isEqual:", v7))
    {
      dateInterval = self->_dateInterval;
      -[HKValueHistogram dateInterval](v5, "dateInterval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSDateInterval isEqual:](dateInterval, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p segments=%@ dateInterval=%@>"), objc_opt_class(), self, self->_segments, self->_dateInterval);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogram)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKValueHistogram *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("segments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKValueHistogram initWithSegments:dateInterval:](self, "initWithSegments:dateInterval:", v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *segments;
  id v5;

  segments = self->_segments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", segments, CFSTR("segments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));

}

- (NSArray)segments
{
  return self->_segments;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
