@implementation UIImage

void __45__UIImage_Additions__imageWithColor_andSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;

  v3 = a2;
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v3, "CGContext"), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");

  CGContextFillRect(v4, *(CGRect *)(a1 + 40));
}

uint64_t __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke_2()
{
  objc_msgSend(CFSTR("Falling back to UIGraphicsBeginImageContextWithOptions, which is not extended range safe! "), "stringByAppendingString:", CFSTR("UIGraphicsImageRenderer is #included, so you must be on a old whitetail build"));

}

CGColorSpaceRef __29__UIImage_Additions___isSRGB__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  _isSRGB_s_sRGB = (uint64_t)result;
  return result;
}

@end
