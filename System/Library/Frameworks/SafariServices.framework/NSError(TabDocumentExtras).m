@implementation NSError(TabDocumentExtras)

- (id)failingURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB32F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
