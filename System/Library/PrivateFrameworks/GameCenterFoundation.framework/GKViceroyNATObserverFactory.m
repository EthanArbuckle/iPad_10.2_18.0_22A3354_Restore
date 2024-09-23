@implementation GKViceroyNATObserverFactory

+ (id)makeObserver
{
  return objc_alloc_init(DefaultGKViceroyNATObserver);
}

@end
