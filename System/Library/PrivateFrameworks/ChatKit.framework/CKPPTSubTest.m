@implementation CKPPTSubTest

+ (void)start:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  if (!kApplicationReference && CKIsRunningInMessages())
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)kApplicationReference;
    kApplicationReference = v3;

  }
  objc_msgSend((id)kApplicationReference, "startPPTSubtestForCurrentTest:", v5);

}

+ (void)stop:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  if (!kApplicationReference && CKIsRunningInMessages())
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)kApplicationReference;
    kApplicationReference = v3;

  }
  objc_msgSend((id)kApplicationReference, "stopPPTSubtestForCurrentTest:", v5);

}

@end
