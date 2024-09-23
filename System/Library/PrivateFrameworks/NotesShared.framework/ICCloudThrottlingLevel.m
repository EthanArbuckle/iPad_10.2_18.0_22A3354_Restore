@implementation ICCloudThrottlingLevel

- (id)description
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICCloudThrottlingLevel batchInterval](self, "batchInterval");
  v5 = (int)v4;
  -[ICCloudThrottlingLevel maximumBatchIntervalFactor](self, "maximumBatchIntervalFactor");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<batchInterval=%d maximumBatchIntervalFactor=%d numberOfBatches=%d>"), v5, (int)v6, -[ICCloudThrottlingLevel numberOfBatches](self, "numberOfBatches"));
}

- (double)maximumBatchIntervalFactor
{
  return self->_maximumBatchIntervalFactor;
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (unint64_t)numberOfBatches
{
  return self->_numberOfBatches;
}

- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 maximumBatchIntervalFactor:(double)a4 numberOfBatches:(unint64_t)a5
{
  ICCloudThrottlingLevel *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICCloudThrottlingLevel;
  result = -[ICCloudThrottlingLevel init](&v9, sel_init);
  if (result)
  {
    result->_batchInterval = a3;
    result->_maximumBatchIntervalFactor = a4;
    result->_numberOfBatches = a5;
  }
  return result;
}

- (ICCloudThrottlingLevel)init
{
  -[ICCloudThrottlingLevel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

@end
