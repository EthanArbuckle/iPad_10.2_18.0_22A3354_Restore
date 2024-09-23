@implementation SFSafeBrowsingPreferencesPlistPath

void ___SFSafeBrowsingPreferencesPlistPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPSharedResourcesDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Preferences/com.apple.Safari.SafeBrowsing.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SFSafeBrowsingPreferencesPlistPath::safeBrowsingPreferencesPlistPath;
  _SFSafeBrowsingPreferencesPlistPath::safeBrowsingPreferencesPlistPath = v0;

}

@end
