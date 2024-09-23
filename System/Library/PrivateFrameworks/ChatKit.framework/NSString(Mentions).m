@implementation NSString(Mentions)

- (id)mentionsSafeText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localizedUppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchSafeText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localizedUppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
