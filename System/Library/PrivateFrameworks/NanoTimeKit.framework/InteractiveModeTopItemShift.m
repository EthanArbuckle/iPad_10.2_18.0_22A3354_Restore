@implementation InteractiveModeTopItemShift

void __InteractiveModeTopItemShift_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  _BYTE v4[136];
  uint64_t v5;

  v3 = a2;
  v2 = 0;
  if (REUpNextDemoShiftTopItems())
  {
    _LayoutConstants_0(v3, v4);
    v2 = v5;
  }
  InteractiveModeTopItemShift_interactiveModeShiftValue = v2;

}

@end
