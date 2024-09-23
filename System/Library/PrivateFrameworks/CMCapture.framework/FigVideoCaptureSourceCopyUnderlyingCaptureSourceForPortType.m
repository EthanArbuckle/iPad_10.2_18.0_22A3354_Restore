@implementation FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType

uint64_t __FigVideoCaptureSourceCopyUnderlyingCaptureSourceForPortType_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a2 + 144);
  if (!v3)
    v3 = *(void **)(a2 + 152);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (id)objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  return 0;
}

@end
