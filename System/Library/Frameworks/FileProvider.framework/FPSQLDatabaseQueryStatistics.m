@implementation FPSQLDatabaseQueryStatistics

- (FPSQLDatabaseQueryStatistics)initWithMinTime:(double)a3 maxTime:(double)a4 cumulatedTime:(double)a5 cumulatedSquareDiffFromMean:(double)a6 count:(int64_t)a7 queryPlan:(id)a8
{
  id v15;
  FPSQLDatabaseQueryStatistics *v16;
  FPSQLDatabaseQueryStatistics *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)FPSQLDatabaseQueryStatistics;
  v16 = -[FPSQLDatabaseQueryStatistics init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_minTime = a3;
    v16->_maxTime = a4;
    v16->_cumulatedTime = a5;
    v16->_cumulatedSquareDiffFromMean = a6;
    v16->_count = a7;
    objc_storeStrong((id *)&v16->_queryPlan, a8);
  }

  return v17;
}

- (id)description
{
  const __CFString *queryPlan;

  queryPlan = (const __CFString *)self->_queryPlan;
  if (!queryPlan)
    queryPlan = &stru_1E4450B40;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" minTime %fs, maxTime %fs, totalTime %fs, mean %fs, stdDev %fs, count %llu, _queryPlan %@"), *(_QWORD *)&self->_minTime, *(_QWORD *)&self->_maxTime, *(_QWORD *)&self->_cumulatedTime, self->_cumulatedTime / (double)self->_count, sqrt(self->_cumulatedSquareDiffFromMean / (double)self->_count), self->_count, queryPlan);
}

- (FPSQLDatabaseQueryStatistics)initWithCoder:(id)a3
{
  id v4;
  FPSQLDatabaseQueryStatistics *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  NSString *queryPlan;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPSQLDatabaseQueryStatistics;
  v5 = -[FPSQLDatabaseQueryStatistics init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minTime"));
    v5->_minTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxTime"));
    v5->_maxTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cumulatedTime"));
    v5->_cumulatedTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cumulatedSquareDiffFromMean"));
    v5->_cumulatedSquareDiffFromMean = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("count"));
    v5->_count = (uint64_t)v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryPlan"));
    v11 = objc_claimAutoreleasedReturnValue();
    queryPlan = v5->_queryPlan;
    v5->_queryPlan = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *queryPlan;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minTime"), self->_minTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxTime"), self->_maxTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cumulatedTime"), self->_cumulatedTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cumulatedSquareDiffFromMean"), self->_cumulatedSquareDiffFromMean);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("count"), (double)self->_count);
  queryPlan = self->_queryPlan;
  if (queryPlan)
    objc_msgSend(v5, "encodeObject:forKey:", queryPlan, CFSTR("queryPlan"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinTime:maxTime:cumulatedTime:cumulatedSquareDiffFromMean:count:queryPlan:", self->_count, self->_queryPlan, self->_minTime, self->_maxTime, self->_cumulatedTime, self->_cumulatedSquareDiffFromMean);
}

- (double)minTime
{
  return self->_minTime;
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (double)cumulatedTime
{
  return self->_cumulatedTime;
}

- (void)setCumulatedTime:(double)a3
{
  self->_cumulatedTime = a3;
}

- (double)cumulatedSquareDiffFromMean
{
  return self->_cumulatedSquareDiffFromMean;
}

- (void)setCumulatedSquareDiffFromMean:(double)a3
{
  self->_cumulatedSquareDiffFromMean = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)queryPlan
{
  return self->_queryPlan;
}

- (void)setQueryPlan:(id)a3
{
  objc_storeStrong((id *)&self->_queryPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPlan, 0);
}

@end
