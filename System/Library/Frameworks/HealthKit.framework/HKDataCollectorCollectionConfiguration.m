@implementation HKDataCollectorCollectionConfiguration

- (HKDataCollectorCollectionConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (HKDataCollectorCollectionConfiguration)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HKDataCollectorCollectionConfiguration)initWithCollectionInterval:(double)a3 collectionLatency:(double)a4 collectionType:(unint64_t)a5
{
  HKDataCollectorCollectionConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKDataCollectorCollectionConfiguration;
  result = -[HKDataCollectorCollectionConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_collectionInterval = a3;
    result->_collectionLatency = a4;
    result->_collectionType = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKDataCollectorCollectionConfiguration collectionInterval](self, "collectionInterval");
  v6 = v5;
  -[HKDataCollectorCollectionConfiguration collectionLatency](self, "collectionLatency");
  v8 = v7;
  HKDataCollectionTypeToString(-[HKDataCollectorCollectionConfiguration collectionType](self, "collectionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: interval:%f latency:%f type:%@>"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)self->_collectionLatency ^ (unint64_t)self->_collectionInterval ^ self->_collectionType;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_collectionType == *((_QWORD *)v4 + 3)
    && self->_collectionInterval == v4[1]
    && self->_collectionLatency == v4[2];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDataCollectorCollectionConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKDataCollectorCollectionConfiguration *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKDataCollectorCollectionConfiguration;
  v5 = -[HKDataCollectorCollectionConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("collection_interval"));
    v5->_collectionInterval = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("collection_latency"));
    v5->_collectionLatency = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("collection_type"));
    v5->_collectionType = (unint64_t)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double collectionInterval;
  id v5;

  collectionInterval = self->_collectionInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("collection_interval"), collectionInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("collection_latency"), self->_collectionLatency);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("collection_type"), (double)self->_collectionType);

}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (double)collectionLatency
{
  return self->_collectionLatency;
}

- (void)setCollectionLatency:(double)a3
{
  self->_collectionLatency = a3;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

@end
