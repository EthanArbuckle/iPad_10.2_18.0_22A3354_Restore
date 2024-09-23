@implementation AVSynchronousBlockScheduler

- (void)scheduleBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
