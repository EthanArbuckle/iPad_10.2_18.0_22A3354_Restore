@implementation FVDUtilsAGXPixelFormatsSupported

const __CFDictionary *__FVDUtilsAGXPixelFormatsSupported_block_invoke()
{
  const __CFDictionary *result;
  const __CFArray *v1;
  CFTypeID v2;

  result = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x1E0CA91B0]);
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v2 == result)
      {
        CFArrayGetValueAtIndex(v1, 0);
        return (const __CFDictionary *)FigCFDictionaryGetInt32IfPresent();
      }
    }
  }
  return result;
}

@end
