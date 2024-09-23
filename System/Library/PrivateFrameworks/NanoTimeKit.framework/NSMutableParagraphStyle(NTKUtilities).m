@implementation NSMutableParagraphStyle(NTKUtilities)

+ (uint64_t)NTKHyphenationParagraphStyle
{
  LODWORD(a3) = NTKHyphenationDefaultFactor;
  return objc_msgSend(a1, "NTKHyphenationParagraphStyleWithFactor:", a3);
}

+ (id)NTKHyphenationParagraphStyleWithFactor:()NTKUtilities
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v3 = v2;
  v4 = a1;
  if (a1 < 0.0)
    v4 = 0.0;
  v5 = fmin(v4, 1.0);
  *(float *)&v5 = v5;
  objc_msgSend(v2, "setHyphenationFactor:", v5);
  objc_msgSend(v3, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v3, "setLineBreakStrategy:", 0xFFFFLL);
  return v3;
}

@end
