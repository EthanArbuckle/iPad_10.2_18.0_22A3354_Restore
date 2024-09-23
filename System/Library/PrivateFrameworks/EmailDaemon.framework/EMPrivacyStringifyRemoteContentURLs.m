@implementation EMPrivacyStringifyRemoteContentURLs

id __EMPrivacyStringifyRemoteContentURLs_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
  {
    objc_msgSend(v2, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v2, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullyRedactedStringForString:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
