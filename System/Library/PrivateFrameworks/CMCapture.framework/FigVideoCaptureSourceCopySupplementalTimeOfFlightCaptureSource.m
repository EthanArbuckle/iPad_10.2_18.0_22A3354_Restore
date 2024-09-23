@implementation FigVideoCaptureSourceCopySupplementalTimeOfFlightCaptureSource

uint64_t __FigVideoCaptureSourceCopySupplementalTimeOfFlightCaptureSource_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a2 + 160);
  if (v3)
    v3 = CFRetain(v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 0;
}

@end
