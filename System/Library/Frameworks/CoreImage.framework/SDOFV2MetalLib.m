@implementation SDOFV2MetalLib

uint64_t __SDOFV2MetalLib_block_invoke()
{
  uint64_t result;
  void *v1;
  const __CFString *v2;

  result = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreImage"));
  if (result)
  {
    v1 = (void *)result;
    if (CI_ENABLE_FUNCTION_STITCHING())
      v2 = CFSTR("CIPortraitBlurStitchableV2");
    else
      v2 = CFSTR("CIPortraitBlurV2");
    result = objc_msgSend(v1, "URLForResource:withExtension:", v2, CFSTR("metallib"));
    if (result)
    {
      result = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", result);
      SDOFV2MetalLib::data = result;
    }
  }
  return result;
}

@end
