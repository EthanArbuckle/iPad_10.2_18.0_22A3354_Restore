@implementation ULImmediateScheduler

- (void)performAsyncBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)performSyncBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
