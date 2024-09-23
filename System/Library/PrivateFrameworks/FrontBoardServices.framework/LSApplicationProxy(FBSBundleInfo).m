@implementation LSApplicationProxy(FBSBundleInfo)

- (id)fbs_correspondingApplicationRecord
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "correspondingApplicationRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    FBSLogApplicationLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "No corresponding record for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2;
}

@end
