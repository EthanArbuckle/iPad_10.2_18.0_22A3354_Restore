@implementation NTPBTodaySectionConfigFont(NTAdditions)

- (id)URL
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "urlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
