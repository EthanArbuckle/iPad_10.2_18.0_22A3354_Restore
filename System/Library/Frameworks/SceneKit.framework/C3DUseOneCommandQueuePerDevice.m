@implementation C3DUseOneCommandQueuePerDevice

BOOL __C3DUseOneCommandQueuePerDevice_block_invoke()
{
  _BOOL8 result;

  result = C3DPreferencesGetBool(18);
  C3DUseOneCommandQueuePerDevice_useOneCommandQueuePerDevice = result;
  return result;
}

@end
