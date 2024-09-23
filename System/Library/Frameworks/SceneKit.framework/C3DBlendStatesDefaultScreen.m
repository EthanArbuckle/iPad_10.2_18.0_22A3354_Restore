@implementation C3DBlendStatesDefaultScreen

uint64_t __C3DBlendStatesDefaultScreen_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x5010003010101;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultScreen_states = result;
  return result;
}

@end
