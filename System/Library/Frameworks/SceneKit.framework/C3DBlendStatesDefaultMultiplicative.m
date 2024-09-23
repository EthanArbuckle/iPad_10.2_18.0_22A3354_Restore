@implementation C3DBlendStatesDefaultMultiplicative

uint64_t __C3DBlendStatesDefaultMultiplicative_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x2000002000001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultMultiplicative_states = result;
  return result;
}

@end
