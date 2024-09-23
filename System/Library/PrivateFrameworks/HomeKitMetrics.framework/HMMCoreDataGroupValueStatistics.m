@implementation HMMCoreDataGroupValueStatistics

- (HMMCounterStatistics)counterStatistics
{
  return -[HMMCounterStatistics initWithMinValue:maxValue:sumOfValues:valueCount:]([HMMCounterStatistics alloc], "initWithMinValue:maxValue:sumOfValues:valueCount:", -[HMMCoreDataGroupValueStatistics min](self, "min"), -[HMMCoreDataGroupValueStatistics max](self, "max"), -[HMMCoreDataGroupValueStatistics sum](self, "sum"), -[HMMCoreDataGroupValueStatistics count](self, "count"));
}

- (id)addValue:(int64_t)a3
{
  void *v5;

  if (-[HMMCoreDataGroupValueStatistics count](self, "count"))
  {
    if (-[HMMCoreDataGroupValueStatistics min](self, "min") > a3)
      -[HMMCoreDataGroupValueStatistics setMin:](self, "setMin:", a3);
    if (-[HMMCoreDataGroupValueStatistics max](self, "max") >= a3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HMMCoreDataGroupValueStatistics max](self, "max"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMMCoreDataGroupValueStatistics setMin:](self, "setMin:", a3);
    v5 = &unk_1E8991EB8;
  }
  -[HMMCoreDataGroupValueStatistics setMax:](self, "setMax:", a3);
LABEL_9:
  -[HMMCoreDataGroupValueStatistics setSum:](self, "setSum:", -[HMMCoreDataGroupValueStatistics sum](self, "sum") + a3);
  -[HMMCoreDataGroupValueStatistics setCount:](self, "setCount:", -[HMMCoreDataGroupValueStatistics count](self, "count") + 1);
  return v5;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
}

@end
