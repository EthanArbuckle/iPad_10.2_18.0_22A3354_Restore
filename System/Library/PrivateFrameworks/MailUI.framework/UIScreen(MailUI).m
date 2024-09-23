@implementation UIScreen(MailUI)

+ (uint64_t)mui_isLargeFormatPad
{
  uint64_t result;
  double v1;

  result = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mui_maxDimension");
    return v1 > 1200.0;
  }
  return result;
}

+ (double)mui_maxDimension
{
  void *v0;
  double v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;
  objc_msgSend(v0, "bounds");
  if (v2 < v3)
    v2 = v3;

  return v2;
}

@end
