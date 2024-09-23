@implementation NRMockRegistryClient

- (NRMockRegistryClient)init
{
  void *v3;
  NRMockRegistryClient *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("NRRegistryPlatformSupportsWatch");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NRRegistryClient initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

+ (Class)xpcConnectionClass
{
  return (Class)objc_opt_class();
}

@end
