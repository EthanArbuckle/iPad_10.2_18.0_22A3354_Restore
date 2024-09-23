@implementation C3DBlendStatesDefaultSubtract

uint64_t __C3DBlendStatesDefaultSubtract_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0x1000201010101;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultSubtract_states = result;
  return result;
}

@end
