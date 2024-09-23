@implementation SessionAccess

- (AAAccessQueue)accessQueue
{
  return (AAAccessQueue *)*(id *)self->accessQueue;
}

@end
