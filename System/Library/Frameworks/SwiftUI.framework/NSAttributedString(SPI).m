@implementation NSAttributedString(SPI)

- (uint64_t)isEmptyOrTerminatedByParagraphSeparator
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  unsigned int v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 1;
  v3 = v2;
  objc_msgSend(a1, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterAtIndex:", v3 - 1);

  v6 = v5 == 8233;
  if (v5 == 13)
    v6 = 1;
  v7 = v5 == 10 || v6;
  if ((v5 - 14) >= 0x201B)
    return v7;
  else
    return 0;
}

@end
