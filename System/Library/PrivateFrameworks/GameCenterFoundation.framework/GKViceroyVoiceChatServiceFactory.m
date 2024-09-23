@implementation GKViceroyVoiceChatServiceFactory

+ (id)makeService
{
  return objc_alloc_init(DefaultGKVoiceChatService);
}

@end
