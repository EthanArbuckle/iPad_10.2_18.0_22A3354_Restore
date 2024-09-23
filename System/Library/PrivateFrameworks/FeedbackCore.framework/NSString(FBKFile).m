@implementation NSString(FBKFile)

- (uint64_t)isImageFile
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (commonImageFormats_onceToken != -1)
      dispatch_once(&commonImageFormats_onceToken, &__block_literal_global_0);
    v3 = (id)commonImageFormats__commonExtensions;
    objc_msgSend(a1, "pathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)isVideoFile
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "pathExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("mov"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
