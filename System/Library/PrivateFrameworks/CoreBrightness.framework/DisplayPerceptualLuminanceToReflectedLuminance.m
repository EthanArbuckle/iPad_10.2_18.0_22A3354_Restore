@implementation DisplayPerceptualLuminanceToReflectedLuminance

uint64_t __DisplayPerceptualLuminanceToReflectedLuminance_block_invoke(uint64_t a1)
{
  float v1;
  uint64_t result;

  v1 = _DisplayPerceptualLuminanceToReflectedLuminanceInternal(*(_QWORD *)(a1 + 40), *(float *)(a1 + 48));
  result = a1;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  return result;
}

@end
