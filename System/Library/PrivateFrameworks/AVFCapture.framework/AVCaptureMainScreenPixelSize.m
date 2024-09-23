@implementation AVCaptureMainScreenPixelSize

void __AVCaptureMainScreenPixelSize_block_invoke()
{
  uint64_t v0;
  const void *v1;

  v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (const void *)v0;
    FigCFDictionaryGetFloatIfPresent();
    FigCFDictionaryGetFloatIfPresent();
    CFRelease(v1);
  }
}

@end
