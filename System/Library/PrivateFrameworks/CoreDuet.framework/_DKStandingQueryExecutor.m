@implementation _DKStandingQueryExecutor

+ (void)executeAllStandingQueriesWithStorage:(id)a3
{
  objc_msgSend(a1, "executeAllStandingQueriesWithStorage:activity:", a3, 0);
}

+ (void)executeAllStandingQueriesWithStorage:(id)a3 activity:(id)a4
{
  id v5;
  void *v6;
  _DKDeviceActivityStandingQuery *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x193FEE914]();
  v7 = objc_alloc_init(_DKDeviceActivityStandingQuery);
  -[_DKDeviceActivityStandingQuery setActivity:](v7, "setActivity:", v5);
  -[_DKDeviceActivityStandingQuery executeWithStorage:](v7, "executeWithStorage:", v8);

  objc_autoreleasePoolPop(v6);
}

@end
