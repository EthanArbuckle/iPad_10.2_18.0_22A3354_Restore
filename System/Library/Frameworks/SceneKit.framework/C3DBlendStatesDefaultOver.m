@implementation C3DBlendStatesDefaultOver

uint64_t __C3DBlendStatesDefaultOver_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x5010005010001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultOver_states = result;
  return result;
}

@end
