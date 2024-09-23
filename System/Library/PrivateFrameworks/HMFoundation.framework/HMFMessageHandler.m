@implementation HMFMessageHandler

void __47____HMFMessageHandler__canonicalizePolicyList___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HMFObjectCacheHMFMessagePolicy cachedInstanceForMessagePolicy:](HMFObjectCacheHMFMessagePolicy, "cachedInstanceForMessagePolicy:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __47____HMFMessageHandler__canonicalizePolicyList___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 < v5;
}

void __34____HMFMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Messaging.Handler"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E18;
  qword_1ED012E18 = v0;

}

@end
