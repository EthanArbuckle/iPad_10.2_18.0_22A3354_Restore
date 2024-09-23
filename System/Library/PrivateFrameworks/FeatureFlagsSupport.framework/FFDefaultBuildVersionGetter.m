@implementation FFDefaultBuildVersionGetter

- (id)getBuildVersion
{
  size_t v3;
  _OWORD v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v3 = 256;
  sysctlbyname("kern.osversion", v4, &v3, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
