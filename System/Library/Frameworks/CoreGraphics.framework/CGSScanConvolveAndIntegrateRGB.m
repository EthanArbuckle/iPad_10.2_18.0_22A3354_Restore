@implementation CGSScanConvolveAndIntegrateRGB

const void *__CGSScanConvolveAndIntegrateRGB_block_invoke()
{
  BOOL v0;
  const void *result;
  _BOOL4 v2;
  _BOOL4 v3;
  BOOL v4;
  __int16 *v5;
  __int16 *v6;
  __int16 *v7;
  BOOL v8;
  BOOL v9;

  v9 = 0;
  if (get_BOOLean_property("CGFontUseCustomConvolveKernels", copy_application_property_value, &v9))
    v0 = !v9;
  else
    v0 = 1;
  if (!v0)
  {
    if (redConvolveKernel)
      CGSScanConvolveAndIntegrateRGB_redKernel = redConvolveKernel;
    if (greenConvolveKernel)
      CGSScanConvolveAndIntegrateRGB_greenKernel = greenConvolveKernel;
    if (blueConvolveKernel)
      CGSScanConvolveAndIntegrateRGB_blueKernel = blueConvolveKernel;
  }
  v8 = 0;
  result = get_BOOLean_property("CGFontUseMonochromeKernel", (const void *(*)(const char *))copy_local_domain_value, &v8);
  if ((_DWORD)result && v8)
  {
    v2 = v9;
    v3 = monochromeConvolveKernel != 0;
    v4 = !v2 || !v3;
    if (v2 && v3)
      v5 = (__int16 *)monochromeConvolveKernel;
    else
      v5 = mKernel;
    if (v4)
      v6 = mKernel;
    else
      v6 = (__int16 *)greenConvolveKernel;
    if (v4)
      v7 = mKernel;
    else
      v7 = (__int16 *)blueConvolveKernel;
    CGSScanConvolveAndIntegrateRGB_redKernel = (uint64_t)v5;
    CGSScanConvolveAndIntegrateRGB_greenKernel = (uint64_t)v6;
    CGSScanConvolveAndIntegrateRGB_blueKernel = (uint64_t)v7;
  }
  return result;
}

@end
