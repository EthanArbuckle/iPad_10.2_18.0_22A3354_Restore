@implementation NSURL(MessagesAdditions)

- (BOOL)__ms_conformsToUTI:()MessagesAdditions
{
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a1, "__ms_UTI");
  v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v5;
  if (v5)
    v7 = UTTypeConformsTo(v5, v4) != 0;
  else
    v7 = 0;

  return v7;
}

- (id)__ms_UTI
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C99AD0], 0);
  return v2;
}

+ (id)__ms_cachesDirectory
{
  if (__ms_cachesDirectory_once != -1)
    dispatch_once(&__ms_cachesDirectory_once, &__block_literal_global_9);
  return (id)__ms_cachesDirectory_sCachesDirectory;
}

@end
