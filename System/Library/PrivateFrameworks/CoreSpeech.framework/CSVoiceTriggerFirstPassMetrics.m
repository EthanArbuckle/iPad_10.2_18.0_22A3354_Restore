@implementation CSVoiceTriggerFirstPassMetrics

- (id)_initWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  CSVoiceTriggerFirstPassMetrics *v6;
  uint64_t v7;
  NSNumber *firstPassInfoGeneratedTime;
  uint64_t v9;
  NSNumber *firstPassInfoProcessedTime;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerFirstPassMetrics;
  v6 = -[CSVoiceTriggerFirstPassMetrics init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    firstPassInfoGeneratedTime = v6->_firstPassInfoGeneratedTime;
    v6->_firstPassInfoGeneratedTime = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    firstPassInfoProcessedTime = v6->_firstPassInfoProcessedTime;
    v6->_firstPassInfoProcessedTime = (NSNumber *)v9;

  }
  return v6;
}

- (NSNumber)firstPassInfoGeneratedTime
{
  return self->_firstPassInfoGeneratedTime;
}

- (NSNumber)firstPassInfoProcessedTime
{
  return self->_firstPassInfoProcessedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPassInfoProcessedTime, 0);
  objc_storeStrong((id *)&self->_firstPassInfoGeneratedTime, 0);
}

+ (CSVoiceTriggerFirstPassMetrics)CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:(unint64_t)a3 firstPassInfoProcessedTime:(unint64_t)a4
{
  return (CSVoiceTriggerFirstPassMetrics *)-[CSVoiceTriggerFirstPassMetrics _initWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:]([CSVoiceTriggerFirstPassMetrics alloc], "_initWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", a3, a4);
}

@end
