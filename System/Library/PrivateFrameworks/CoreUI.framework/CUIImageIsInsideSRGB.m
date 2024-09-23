@implementation CUIImageIsInsideSRGB

uint64_t (*____CUIImageIsInsideSRGB_block_invoke())(_QWORD)
{
  void *v0;
  uint64_t (*result)(_QWORD);

  v0 = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 256);
  result = (uint64_t (*)(_QWORD))dlsym(v0, "CGImageIsInsideSRGB");
  __CUIImageIsInsideSRGB___imageIsInsideSRGB = result;
  return result;
}

@end
