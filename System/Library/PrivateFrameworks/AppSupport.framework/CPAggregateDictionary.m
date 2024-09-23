@implementation CPAggregateDictionary

+ (id)sharedAggregateDictionary
{
  pthread_once(&__once, (void (*)(void))initializeAggregateDictionary);
  return (id)__aggregateDictionary;
}

- (void)significantTimeChanged
{
  __ADClientSignificantTimeChanged();
}

- (int)commit
{
  return __ADClientCommit();
}

- (void)clearScalarKey:(id)a3
{
  __ADClientClearScalarKey(a3);
}

- (void)setValue:(int64_t)a3 forScalarKey:(id)a4
{
  __ADClientSetValueForScalarKey(a4, a3);
}

- (void)incrementKey:(id)a3
{
  __ADClientAddValueForScalarKey(a3, 1);
}

- (void)decrementKey:(id)a3
{
  __ADClientAddValueForScalarKey(a3, -1);
}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  __ADClientAddValueForScalarKey(a4, a3);
}

- (void)subtractValue:(int64_t)a3 forKey:(id)a4
{
  __ADClientAddValueForScalarKey(a4, -a3);
}

- (void)clearDistributionKey:(id)a3
{
  __ADClientClearDistributionKey(a3);
}

- (void)setValue:(double)a3 forDistributionKey:(id)a4
{
  __ADClientSetValueForDistributionKey(a4, a3);
}

- (void)pushValue:(double)a3 forKey:(id)a4
{
  __ADClientPushValueForDistributionKey(a4, a3);
}

- (BOOL)isEnabled
{
  return 1;
}

@end
