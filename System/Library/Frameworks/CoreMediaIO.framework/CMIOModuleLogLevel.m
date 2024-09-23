@implementation CMIOModuleLogLevel

uint64_t __CMIOModuleLogLevel_block_invoke()
{
  uint64_t result;

  result = CMIOPreferencesGetIntegerValue(CFSTR("CMIOExtensionSession.Debug"), 0);
  CMIOModuleLogLevel_cmioLevel = result;
  return result;
}

uint64_t __CMIOModuleLogLevel_block_invoke_0()
{
  uint64_t result;

  result = CMIOPreferencesGetIntegerValue(CFSTR("CMIOExtensionProxy.Debug"), 0);
  CMIOModuleLogLevel_cmioLevel_0 = result;
  return result;
}

uint64_t __CMIOModuleLogLevel_block_invoke_1()
{
  uint64_t result;

  result = CMIOPreferencesGetIntegerValue(CFSTR("CMIOExtensionProviderHostContext.Debug"), 0);
  CMIOModuleLogLevel_cmioLevel_1 = result;
  return result;
}

@end
