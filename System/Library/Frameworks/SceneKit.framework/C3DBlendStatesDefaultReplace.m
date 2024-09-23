@implementation C3DBlendStatesDefaultReplace

uint64_t __C3DBlendStatesDefaultReplace_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x10000010000;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultReplace_states = result;
  return result;
}

@end
