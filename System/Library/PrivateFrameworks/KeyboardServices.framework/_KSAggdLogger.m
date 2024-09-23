@implementation _KSAggdLogger

+ (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  ADClientSetValueForScalarKey();
}

+ (void)addValue:(int64_t)a3 forScalarKey:(id)a4
{
  ADClientAddValueForScalarKey();
}

+ (void)addValue:(int64_t)a3 forDistributionKey:(id)a4
{
  ADClientPushValueForDistributionKey();
}

+ (void)clearScalarKey:(id)a3
{
  ADClientClearScalarKey();
}

@end
