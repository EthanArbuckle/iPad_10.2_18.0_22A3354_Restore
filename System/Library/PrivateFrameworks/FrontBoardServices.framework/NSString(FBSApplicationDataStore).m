@implementation NSString(FBSApplicationDataStore)

- (uint64_t)fbs_looksLikeAnIdentityString
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("{\"));
}

- (id)fbs_bundleIDFromAppID
{
  id v2;

  if (objc_msgSend(a1, "fbs_looksLikeAnIdentityString"))
  {
    objc_msgSend(MEMORY[0x1E0CA5850], "bundleIdentifierForIdentityString:error:", a1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

@end
