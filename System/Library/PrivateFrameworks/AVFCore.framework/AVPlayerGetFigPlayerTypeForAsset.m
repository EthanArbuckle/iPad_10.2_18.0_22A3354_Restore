@implementation AVPlayerGetFigPlayerTypeForAsset

uint64_t __AVPlayerGetFigPlayerTypeForAsset_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)a1[4];
  v3 = a1[6];
  if (v3 <= 1)
    v3 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("streaming"), 0);
  if (v3 == 2)
    objc_msgSend(v2, "_isStreaming");
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

@end
