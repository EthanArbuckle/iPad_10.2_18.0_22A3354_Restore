@implementation _CNBufferingStrategy

+ (_CNBufferingStrategy)strategyWithCapacity:(unint64_t)a3
{
  return (_CNBufferingStrategy *)-[_CNSpatialBufferingStrategy initWithCapacity:]([_CNSpatialBufferingStrategy alloc], "initWithCapacity:", a3);
}

+ (_CNBufferingStrategy)strategyWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v5;
  _CNTemporalBufferingStrategy *v6;

  v5 = a4;
  v6 = -[_CNTemporalBufferingStrategy initWithTimeInterval:scheduler:]([_CNTemporalBufferingStrategy alloc], "initWithTimeInterval:scheduler:", v5, a3);

  return (_CNBufferingStrategy *)v6;
}

+ (id)combine:(id)a3
{
  id v3;
  _CNCombinedBufferingStrategy *v4;

  v3 = a3;
  v4 = -[_CNCombinedBufferingStrategy initWithStrategies:]([_CNCombinedBufferingStrategy alloc], "initWithStrategies:", v3);

  return v4;
}

@end
