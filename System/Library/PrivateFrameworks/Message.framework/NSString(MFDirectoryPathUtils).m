@implementation NSString(MFDirectoryPathUtils)

- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils
{
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mf_makeCompletePath:mode:", a1, a3);

  return v6;
}

- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("/"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = objc_msgSend(a1, "hasPrefix:", v4);

  return v6;
}

@end
