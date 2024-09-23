@implementation __NSCFURLSessionXPC

+ (id)bgSessionManagerInterface
{
  return (id)sBgSessionManagerInterface;
}

+ (void)initialize
{
  if (+[__NSCFURLSessionXPC initialize]::onceToken != -1)
    dispatch_once(&+[__NSCFURLSessionXPC initialize]::onceToken, &__block_literal_global_16582);
}

+ (id)bgSessionInterface
{
  return (id)sBgSessionInterface;
}

+ (id)bgSessionClientInterface
{
  return (id)sBgSessionClientInterface;
}

@end
