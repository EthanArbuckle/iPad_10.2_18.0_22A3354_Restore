@implementation NSXPCInterface(IL)

+ (id)il_messageFilterHostInterface
{
  if (il_messageFilterHostInterface_onceToken != -1)
    dispatch_once(&il_messageFilterHostInterface_onceToken, &__block_literal_global_2);
  return (id)il_messageFilterHostInterface_interface;
}

@end
