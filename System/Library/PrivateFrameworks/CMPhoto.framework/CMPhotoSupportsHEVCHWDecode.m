@implementation CMPhotoSupportsHEVCHWDecode

void __CMPhotoSupportsHEVCHWDecode_block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  CMPhotoSupportsHEVCHWDecode_supported = FigCFEqual();
  if (v0)
    CFRelease(v0);
}

@end
