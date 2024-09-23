@implementation EFMutableBloomFilter

- (EFMutableBloomFilter)init
{
  return -[EFMutableBloomFilter initWithExpectedCount:](self, "initWithExpectedCount:", 1000);
}

- (EFMutableBloomFilter)initWithExpectedCount:(unint64_t)a3
{
  return -[EFMutableBloomFilter initWithFalsePositiveRate:forExpectedCount:](self, "initWithFalsePositiveRate:forExpectedCount:", a3, 0.05);
}

- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4
{
  return -[EFMutableBloomFilter initWithFalsePositiveRate:forExpectedCount:seed:](self, "initWithFalsePositiveRate:forExpectedCount:seed:", a4, 0, a3);
}

- (EFMutableBloomFilter)initWithFalsePositiveRate:(double)a3 forExpectedCount:(unint64_t)a4 seed:(unint64_t)a5
{
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("falsePositiveRate > 0.0"));

  }
  if (a3 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("falsePositiveRate < 1.0"));

    if (a4)
      goto LABEL_5;
  }
  else if (a4)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

LABEL_5:
  v9 = log(a3);
  v10 = v9 * -1.44269504;
  if (v9 * -1.44269504 < 0.0)
    v10 = 0.0;
  v11 = vcvtpd_u64_f64(fmin(v10, 100.0));
  v12 = v9 * -2.08136898;
  if (v12 < 0.0)
    v12 = 0.0;
  return -[EFMutableBloomFilter initWithBucketCount:hashFunctionCount:](self, "initWithBucketCount:hashFunctionCount:", vcvtpd_u64_f64(fmin(v12 * (double)a4, 9.22337204e18)), v11);
}

- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4
{
  return -[EFMutableBloomFilter initWithBucketCount:hashFunctionCount:seed:](self, "initWithBucketCount:hashFunctionCount:seed:", a3, a4, 0);
}

- (EFMutableBloomFilter)initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5
{
  id v9;
  EFMutableBloomFilter *v10;

  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = -[EFMutableBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:](self, "_initWithBucketCount:hashFunctionCount:seed:indexes:", a3, a4, a5, v9);

  return v10;
}

- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6
{
  void *v10;
  id v11;
  objc_super v13;

  v10 = (void *)objc_msgSend(a6, "mutableCopy");
  v13.receiver = self;
  v13.super_class = (Class)EFMutableBloomFilter;
  v11 = -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:](&v13, sel__initWithBucketCount_hashFunctionCount_seed_indexes_, a3, a4, a5, v10);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EFBloomFilter *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v4 = [EFBloomFilter alloc];
  v5 = -[EFBloomFilter bucketCount](self, "bucketCount");
  v6 = -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount");
  v7 = -[EFBloomFilter seed](self, "seed");
  v8 = (void *)-[NSIndexSet copy](self->super._indexes, "copy");
  v9 = -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:](v4, "_initWithBucketCount:hashFunctionCount:seed:indexes:", v5, v6, v7, v8);

  return v9;
}

- (void)addString:(id)a3
{
  id v4;

  v4 = a3;
  addStringToIndexes(self->super._indexes, v4, -[EFBloomFilter bucketCount](self, "bucketCount"), -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount"), -[EFBloomFilter seed](self, "seed"));

}

- (void)addData:(id)a3
{
  id v4;

  v4 = a3;
  addDataToIndexes(self->super._indexes, v4, -[EFBloomFilter bucketCount](self, "bucketCount"), -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount"), -[EFBloomFilter seed](self, "seed"));

}

- (void)removeAll
{
  -[NSIndexSet removeAllIndexes](self->super._indexes, "removeAllIndexes");
}

@end
