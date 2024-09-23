@implementation HDDataCollectorConfiguration

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (HDDataCollectorConfiguration)init
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

+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 interval:(double)a4 latency:(double)a5
{
  HDDataCollectorConfiguration *v8;
  objc_super v10;

  v8 = [HDDataCollectorConfiguration alloc];
  if (v8)
  {
    v10.receiver = v8;
    v10.super_class = (Class)HDDataCollectorConfiguration;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    if (v8)
    {
      v8->_collectionInterval = fmax(a4, 0.0);
      v8->_collectionLatency = fmax(a5, 0.0);
      v8->_collectionType = a3;
    }
  }
  return v8;
}

+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 aggregatorConfiguration:(id)a4
{
  id v5;
  HDDataCollectorConfiguration *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  objc_super v13;

  v5 = a4;
  v6 = [HDDataCollectorConfiguration alloc];
  objc_msgSend(v5, "aggregationInterval");
  v8 = v7;
  objc_msgSend(v5, "collectionLatency");
  v10 = v9;

  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)HDDataCollectorConfiguration;
    v11 = objc_msgSendSuper2(&v13, sel_init);
    if (v11)
    {
      v11[2] = fmax(v8, 0.0);
      v11[3] = fmax(v10, 0.0);
      *((_QWORD *)v11 + 1) = a3;
    }
  }
  else
  {
    v11 = 0;
  }
  return (HDDataCollectorConfiguration *)v11;
}

+ (id)disabledConfiguration
{
  HDDataCollectorConfiguration *v2;
  double v3;
  objc_super v5;

  v2 = [HDDataCollectorConfiguration alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)HDDataCollectorConfiguration;
    v2 = objc_msgSendSuper2(&v5, sel_init);
    if (v2)
    {
      v3 = fmax(*MEMORY[0x1E0CB4B30], 0.0);
      v2->_collectionInterval = v3;
      v2->_collectionLatency = v3;
      v2->_collectionType = 0;
    }
  }
  return v2;
}

- (id)mergedConfiguration:(id)a3
{
  id v4;
  HDDataCollectorConfiguration *v5;
  unint64_t collectionType;
  uint64_t v7;
  _BOOL8 v9;
  uint64_t v11;
  double collectionInterval;
  double v13;
  double v14;
  double collectionLatency;
  double v16;
  double v17;
  HDDataCollectorConfiguration *v18;
  objc_super v20;

  v4 = a3;
  v5 = [HDDataCollectorConfiguration alloc];
  collectionType = self->_collectionType;
  v7 = objc_msgSend(v4, "collectionType");
  v9 = collectionType == 1 || v7 == 1;
  if (v7 == 2 || collectionType == 2)
    v11 = 2;
  else
    v11 = v9;
  collectionInterval = self->_collectionInterval;
  objc_msgSend(v4, "collectionInterval");
  if (collectionInterval >= v13)
    v14 = v13;
  else
    v14 = collectionInterval;
  collectionLatency = self->_collectionLatency;
  objc_msgSend(v4, "collectionLatency");
  v17 = v16;

  if (collectionLatency < v17)
    v17 = collectionLatency;
  if (v5)
  {
    v20.receiver = v5;
    v20.super_class = (Class)HDDataCollectorConfiguration;
    v18 = -[HDDataCollectorConfiguration init](&v20, sel_init);
    if (v18)
    {
      v18->_collectionInterval = fmax(v14, 0.0);
      v18->_collectionLatency = fmax(v17, 0.0);
      v18->_collectionType = v11;
    }
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKDataCollectionTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ Interval: %0.1lfs Latency: %0.1lfs>"), v4, *(_QWORD *)&self->_collectionInterval, *(_QWORD *)&self->_collectionLatency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_collectionType == *((_QWORD *)v4 + 1)
    && vabdd_f64(self->_collectionInterval, *((double *)v4 + 2)) < 2.22044605e-16
    && vabdd_f64(self->_collectionLatency, *((double *)v4 + 3)) < 2.22044605e-16;

  return v5;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (double)collectionLatency
{
  return self->_collectionLatency;
}

@end
