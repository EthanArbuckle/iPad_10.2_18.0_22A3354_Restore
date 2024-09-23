@implementation FedStatsInvalidDataType

- (FedStatsInvalidDataType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FedStatsInvalidDataType;
  return -[FedStatsInvalidDataType init](&v3, sel_init);
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("This is only a placeholder class for invalid types."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return objc_alloc_init((Class)a1);
}

- (int64_t)dataType
{
  return -2;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("This is only a placeholder class for invalid types."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("This is only a placeholder class for invalid types."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("This is only a placeholder class for invalid types."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("This is only a placeholder class for invalid types."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)classCount
{
  return 0;
}

- (id)sampleForIndex:(unint64_t)a3
{
  return &unk_250C57A58;
}

@end
