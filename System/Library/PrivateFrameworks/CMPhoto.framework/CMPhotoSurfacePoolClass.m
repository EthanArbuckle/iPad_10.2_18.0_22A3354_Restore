@implementation CMPhotoSurfacePoolClass

void __CMPhotoSurfacePoolClass_Finalize_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 16) = 1;
  v3 = *(NSObject **)(v2 + 328);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 320))
    {
      dispatch_resume(*(dispatch_object_t *)(v4 + 328));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
    }
  }
}

@end
