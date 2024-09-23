@implementation PHAsset(MessageUI)

- (id)mf_localIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
