@implementation MDMUserOutstandingActivitiesFilePath

void __MDMUserOutstandingActivitiesFilePath_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCUserProfileStorageDirectory_once != -1)
    dispatch_once(&MCUserProfileStorageDirectory_once, &__block_literal_global_127);
  v0 = (id)MCUserProfileStorageDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MDMOutstandingActivities.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MDMUserOutstandingActivitiesFilePath_str;
  MDMUserOutstandingActivitiesFilePath_str = v1;

}

@end
