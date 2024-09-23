@implementation NSMutableURLRequest(CaptiveNetworkPlugin)

- (const)bindToCommand:()CaptiveNetworkPlugin
{
  const void *result;

  result = CNPluginCommandGetInterfaceName(a3);
  if (result)
    return (const void *)objc_msgSend(a1, "setBoundInterfaceIdentifier:", result);
  return result;
}

@end
