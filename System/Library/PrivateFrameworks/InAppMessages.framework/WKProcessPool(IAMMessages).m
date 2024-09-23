@implementation WKProcessPool(IAMMessages)

+ (id)webContentProcessPool
{
  if (webContentProcessPool_onceToken != -1)
    dispatch_once(&webContentProcessPool_onceToken, &__block_literal_global_1);
  return (id)webContentProcessPool_contentProcessPool;
}

@end
