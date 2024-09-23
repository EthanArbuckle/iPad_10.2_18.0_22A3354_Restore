@implementation LACOnenessSignpostEvent

+ (LACSignpostEvent)authenticationRequestWillStart
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_2);
}

void __57__LACOnenessSignpostEvent_authenticationRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogABM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MacAuthenticationRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (LACSignpostEvent)authenticationRequestDidFinish
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_4_2);
}

void __57__LACOnenessSignpostEvent_authenticationRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogABM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MacAuthenticationRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (LACSignpostEvent)eligibleDevicesRequestWillStart
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_6_1);
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestWillStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogABM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MacEligibleDevicesRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

+ (LACSignpostEvent)eligibleDevicesRequestDidFinish
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_8_0);
}

void __58__LACOnenessSignpostEvent_eligibleDevicesRequestDidFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogABM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MacEligibleDevicesRequest", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

@end
