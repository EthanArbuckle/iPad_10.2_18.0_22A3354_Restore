@implementation C3DBlendStatesDefaultMax

uint64_t __C3DBlendStatesDefaultMax_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x401010401010001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultMax_states = result;
  return result;
}

@end
