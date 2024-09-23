@implementation SiriTTSDaemonSession(AFAddition)

+ (id)afSharedSession
{
  if (afSharedSession_onceToken != -1)
    dispatch_once(&afSharedSession_onceToken, &__block_literal_global_0);
  return (id)afSharedSession_session;
}

@end
