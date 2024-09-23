@implementation CGFunctionCreateIdentity

CGFunctionRef __CGFunctionCreateIdentity_block_invoke()
{
  CGFunctionRef result;

  result = CGFunctionCreate(0, 1uLL, 0, 1uLL, 0, &create_identity_callbacks);
  CGFunctionCreateIdentity_identity = (uint64_t)result;
  return result;
}

@end
