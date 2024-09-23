@implementation NSError(FMAdditions)

- (uint64_t)fm_isFileNotFoundError
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 260;
  else
    v3 = 0;

  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver")))
    v5 = objc_msgSend(a1, "code") == 4;
  else
    v5 = 0;

  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    v7 = objc_msgSend(a1, "code") == 2;
  else
    v7 = 0;

  return (v3 || v5) | v7;
}

@end
