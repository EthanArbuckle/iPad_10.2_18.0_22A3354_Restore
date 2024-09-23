@implementation NSString(MFDirectoryPathUtils)

- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "mf_makeCompletePath:mode:", a1, a3);
}

- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils
{
  void *v3;

  v3 = a3;
  if ((objc_msgSend(a3, "hasSuffix:", CFSTR("/")) & 1) == 0)
    v3 = (void *)objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
  return objc_msgSend(a1, "hasPrefix:", v3);
}

@end
