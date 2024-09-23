@implementation UIFont(LPExtras)

- (uint64_t)_lp_CSSFontWeight
{
  const __CTFontDescriptor *v1;
  void *v2;
  float v3;
  double v4;

  objc_msgSend(a1, "fontDescriptor");
  v1 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x1E0CA81C0]);
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v4 / 100.0) * 100.0);
}

- (uint64_t)_lp_symbolWeight
{
  if ((objc_msgSend(a1, "traits") & 2) != 0)
    return 7;
  if ((objc_msgSend(a1, "traits") & 4) != 0)
    return 2;
  if ((objc_msgSend(a1, "traits") & 8) != 0)
    return 3;
  if ((objc_msgSend(a1, "traits") & 0x10) != 0)
    return 1;
  return 4;
}

@end
