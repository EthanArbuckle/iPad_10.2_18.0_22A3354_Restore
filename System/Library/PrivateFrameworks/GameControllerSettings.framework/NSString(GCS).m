@implementation NSString(GCS)

- (id)shortenedVersionNumberString
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR(".0")))
  {
    do
    {
      objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - objc_msgSend(CFSTR(".0"), "length"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v2;
    }
    while ((objc_msgSend(v2, "hasSuffix:", CFSTR(".0")) & 1) != 0);
  }
  else
  {
    v2 = v1;
  }
  return v2;
}

@end
