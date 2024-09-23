@implementation FigVideoCaptureSourceUIBaseZoomFactor

uint64_t __FigVideoCaptureSourceUIBaseZoomFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  float v2;

  v2 = *(float *)(a2 + 168);
  if (v2 == 0.0)
    v2 = 1.0;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  return 0;
}

@end
