@implementation NSString

- (id)normalizedBase64Encoded
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
