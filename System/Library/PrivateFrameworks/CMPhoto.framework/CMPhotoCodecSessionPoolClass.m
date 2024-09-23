@implementation CMPhotoCodecSessionPoolClass

void __CMPhotoCodecSessionPoolClass_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 16) = 1;
  v3 = *(NSObject **)(v2 + 136);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 128))
    {
      dispatch_resume(*(dispatch_object_t *)(v4 + 136));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    }
  }
}

@end
