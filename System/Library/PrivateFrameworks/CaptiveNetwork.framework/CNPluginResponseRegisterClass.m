@implementation CNPluginResponseRegisterClass

uint64_t ____CNPluginResponseRegisterClass_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCNPluginResponseTypeID = result;
  return result;
}

@end
