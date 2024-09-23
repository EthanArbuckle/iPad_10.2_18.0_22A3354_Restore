@implementation NSURL(IntentsFoundation)

- (uint64_t)if_isContainedByDirectoryAtURL:()IntentsFoundation
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v9;

  if (!a3)
    return 0;
  v9 = 0;
  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v9, v5, a1, 0);

  if (v9)
    return 0;
  else
    return v7;
}

@end
