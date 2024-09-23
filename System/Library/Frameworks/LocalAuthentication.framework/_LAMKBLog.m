@implementation _LAMKBLog

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_10);
  return (id)log_log;
}

@end
