@implementation C3DBlendStatesDefaultConstantColor

uint64_t __C3DBlendStatesDefaultConstantColor_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0xB0A000B0A0001;
  result = C3DBlendStatesCreate((uint64_t)&v1, 1);
  C3DBlendStatesDefaultConstantColor_states = result;
  return result;
}

@end
