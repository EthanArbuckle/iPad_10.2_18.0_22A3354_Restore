@implementation C3DBlendStatesDefaultOverBlack

uint64_t __C3DBlendStatesDefaultOverBlack_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x5000005000001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultOverBlack_states = result;
  return result;
}

@end
