@implementation C3DBlendStatesDefaultAdditive

uint64_t __C3DBlendStatesDefaultAdditive_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x1010001010001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultAdditive_states = result;
  return result;
}

@end
