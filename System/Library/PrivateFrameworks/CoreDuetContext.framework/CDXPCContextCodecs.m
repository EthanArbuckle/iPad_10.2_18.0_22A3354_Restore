@implementation CDXPCContextCodecs

uint64_t __50___CDXPCContextCodecs_supportedClassesToUnarchive__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)supportedClassesToUnarchive_supportedClasses;
  supportedClassesToUnarchive_supportedClasses = v4;

  v6 = (void *)supportedClassesToUnarchive_supportedClasses;
  +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  return objc_msgSend((id)supportedClassesToUnarchive_supportedClasses, "unionSet:", *(_QWORD *)(a1 + 32));
}

@end
