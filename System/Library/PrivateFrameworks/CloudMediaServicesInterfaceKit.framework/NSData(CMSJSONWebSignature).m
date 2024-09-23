@implementation NSData(CMSJSONWebSignature)

- (uint64_t)initWithBase64URLEncodedString:()CMSJSONWebSignature
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "length") & 3) != 0)
  {
    do
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("="));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
    }
    while ((objc_msgSend(v6, "length") & 3) != 0);
  }
  else
  {
    v6 = v5;
  }
  v7 = objc_msgSend(a1, "initWithBase64EncodedString:options:", v6, 0);

  return v7;
}

@end
