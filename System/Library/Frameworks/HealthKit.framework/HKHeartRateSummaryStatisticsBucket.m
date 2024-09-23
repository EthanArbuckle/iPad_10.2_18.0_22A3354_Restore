@implementation HKHeartRateSummaryStatisticsBucket

- (int64_t)bucketIndex
{
  return self->_bucketIndex;
}

- (void)addHeartRateInBeatsPerMinute:(int64_t)a3
{
  -[NSMutableIndexSet addIndex:](self->_heartRatesInBeatsPerMinute, "addIndex:", a3);
}

- (HKHeartRateSummaryStatisticsBucket)initWithBucketIndex:(int64_t)a3
{
  HKHeartRateSummaryStatisticsBucket *v4;
  HKHeartRateSummaryStatisticsBucket *v5;
  uint64_t v6;
  NSMutableIndexSet *heartRatesInBeatsPerMinute;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryStatisticsBucket;
  v4 = -[HKHeartRateSummaryStatisticsBucket init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_bucketIndex = a3;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = objc_claimAutoreleasedReturnValue();
    heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
    v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKHeartRateSummaryStatisticsBucket *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HKHeartRateSummaryStatisticsBucket *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[HKHeartRateSummaryStatisticsBucket bucketIndex](self, "bucketIndex"),
          v5 == -[HKHeartRateSummaryStatisticsBucket bucketIndex](v4, "bucketIndex")))
    {
      -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](self, "heartRatesInBeatsPerMinute");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](v4, "heartRatesInBeatsPerMinute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 1;
      }
      else
      {
        -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](v4, "heartRatesInBeatsPerMinute");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](self, "heartRatesInBeatsPerMinute");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](v4, "heartRatesInBeatsPerMinute");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRatesInBeatsPerMinute, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKHeartRateSummaryStatisticsBucket *v5;
  uint64_t v6;
  NSMutableIndexSet *heartRatesInBeatsPerMinute;

  v5 = -[HKHeartRateSummaryStatisticsBucket initWithBucketIndex:]([HKHeartRateSummaryStatisticsBucket alloc], "initWithBucketIndex:", self->_bucketIndex);
  v6 = -[NSMutableIndexSet mutableCopyWithZone:](self->_heartRatesInBeatsPerMinute, "mutableCopyWithZone:", a3);
  heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
  v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bucketIndex;
  id v5;

  bucketIndex = self->_bucketIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", bucketIndex, CFSTR("BucketIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heartRatesInBeatsPerMinute, CFSTR("HeartRatesInBeatsPerMinute"));

}

- (HKHeartRateSummaryStatisticsBucket)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryStatisticsBucket *v5;
  uint64_t v6;
  NSMutableIndexSet *heartRatesInBeatsPerMinute;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryStatisticsBucket;
  v5 = -[HKHeartRateSummaryStatisticsBucket init](&v9, sel_init);
  if (v5)
  {
    v5->_bucketIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BucketIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HeartRatesInBeatsPerMinute"));
    v6 = objc_claimAutoreleasedReturnValue();
    heartRatesInBeatsPerMinute = v5->_heartRatesInBeatsPerMinute;
    v5->_heartRatesInBeatsPerMinute = (NSMutableIndexSet *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_bucketIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p bucketIndex:%@ heartRatesInBeatsPerMinute:%@>"), v4, self, v5, self->_heartRatesInBeatsPerMinute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HKHeartRateSummaryStatisticsBucket bucketIndex](self, "bucketIndex");
  -[HKHeartRateSummaryStatisticsBucket heartRatesInBeatsPerMinute](self, "heartRatesInBeatsPerMinute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSIndexSet)heartRatesInBeatsPerMinute
{
  return &self->_heartRatesInBeatsPerMinute->super;
}

@end
