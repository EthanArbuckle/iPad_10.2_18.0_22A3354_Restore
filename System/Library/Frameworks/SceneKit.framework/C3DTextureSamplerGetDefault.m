@implementation C3DTextureSamplerGetDefault

uint64_t __C3DTextureSamplerGetDefault_block_invoke()
{
  uint64_t result;

  result = C3DTextureSamplerCreate();
  C3DTextureSamplerGetDefault_states = result;
  return result;
}

@end
