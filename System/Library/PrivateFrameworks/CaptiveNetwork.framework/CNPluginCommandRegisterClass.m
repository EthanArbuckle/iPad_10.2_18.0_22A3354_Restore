@implementation CNPluginCommandRegisterClass

uint64_t ____CNPluginCommandRegisterClass_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCNPluginCommandTypeID = result;
  return result;
}

@end
