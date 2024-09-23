@implementation C3DBlendStatesDefaultMultiplicativeSeparate

uint64_t __C3DBlendStatesDefaultMultiplicativeSeparate_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x10002000101;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultMultiplicativeSeparate_states = result;
  return result;
}

@end
