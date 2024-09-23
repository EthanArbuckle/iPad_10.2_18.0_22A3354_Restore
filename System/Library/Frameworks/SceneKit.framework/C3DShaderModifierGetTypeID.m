@implementation C3DShaderModifierGetTypeID

uint64_t __C3DShaderModifierGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DShaderModifierGetTypeID_typeID = result;
  return result;
}

@end
