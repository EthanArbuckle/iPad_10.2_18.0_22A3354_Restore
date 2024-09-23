@implementation C3DBlendStatesDefaultConstantAlpha

uint64_t __C3DBlendStatesDefaultConstantAlpha_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0xD0C000D0C0001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultConstantAlpha_states = result;
  return result;
}

@end
