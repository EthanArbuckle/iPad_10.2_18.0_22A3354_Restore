@implementation GDComputeOrchestration

+ (id)start
{
  return +[GDComputeOrchestrationInner start](GDComputeOrchestrationInner, "start");
}

+ (id)nullEventReporter
{
  return (id)objc_opt_new();
}

@end
