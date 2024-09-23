@implementation _CDLogging(CDUserContext)

+ (id)mdcsChannel
{
  if (mdcsChannel_onceToken != -1)
    dispatch_once(&mdcsChannel_onceToken, &__block_literal_global_4);
  return (id)mdcsChannel_mdcsChannel;
}

@end
