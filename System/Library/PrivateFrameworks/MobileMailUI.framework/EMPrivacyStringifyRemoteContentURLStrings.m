@implementation EMPrivacyStringifyRemoteContentURLStrings

id __EMPrivacyStringifyRemoteContentURLStrings_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end
