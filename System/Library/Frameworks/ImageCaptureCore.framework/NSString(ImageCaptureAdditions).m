@implementation NSString(ImageCaptureAdditions)

- (uint64_t)baseImageFilePrefix
{
  int v2;
  unsigned int v3;
  unsigned int v4;

  if ((unint64_t)objc_msgSend(a1, "length") < 4)
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  v3 = (objc_msgSend(a1, "characterAtIndex:", 1) << 16) + (v2 << 24);
  v4 = v3 + (objc_msgSend(a1, "characterAtIndex:", 2) << 8);
  return (int)(v4 + objc_msgSend(a1, "characterAtIndex:", 3));
}

- (uint64_t)baseImageFileDigits
{
  void *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "stringByDeletingPathExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length");
  if (v2 < 4)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:", v2 - 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  return v4;
}

@end
