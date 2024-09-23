@implementation AVTTransitionSchedulerFactory

+ (id)synchronousTransitionSchedulerWithEventHandler:(id)a3
{
  id v3;
  AVTSynchronousTransitionScheduler *v4;

  v3 = a3;
  v4 = -[AVTSynchronousTransitionScheduler initWithEventHandler:]([AVTSynchronousTransitionScheduler alloc], "initWithEventHandler:", v3);

  return v4;
}

+ (id)concurrentTransitionSchedulerWithEventHandler:(id)a3 delay:(double)a4
{
  id v5;
  AVTConcurrentTransitionScheduler *v6;

  v5 = a3;
  v6 = -[AVTConcurrentTransitionScheduler initWithEventHandler:delay:]([AVTConcurrentTransitionScheduler alloc], "initWithEventHandler:delay:", v5, a4);

  return v6;
}

@end
