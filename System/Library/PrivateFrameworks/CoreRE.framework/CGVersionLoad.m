@implementation CGVersionLoad

void *__CGVersionLoad_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 1);
  if (result)
  {
    v1 = result;
    _MergedGlobals_497 = (uint64_t)dlsym(result, "CGGStateSetInfoDictionary");
    qword_254123A20 = (uint64_t)dlsym(v1, "CGGStateGetInfoDictionary");
    __CGContextClipToMaskWithTransformFunc = dlsym(v1, "CGContextClipToMaskWithTransform");
    __CGGStateClipToPathFunc = dlsym(v1, "CGGStateClipToPath");
    __CGFontGetGlyphPositionsFunc = dlsym(v1, "CGFontGetGlyphPositions");
    result = dlsym(v1, "CGGStateGetStrokeParameters");
    __CGGStateGetStrokeParametersFunc = result;
  }
  return result;
}

@end
