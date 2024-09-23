@implementation ITIdleTimerServiceProvider

+ (id)makeRequestHandlerWithDelegate:(id)a3
{
  id v3;
  ITIdleTimerStateClient *v4;

  v3 = a3;
  v4 = -[ITIdleTimerStateClient initWithDelegate:]([ITIdleTimerStateClient alloc], "initWithDelegate:", v3);

  return v4;
}

@end
