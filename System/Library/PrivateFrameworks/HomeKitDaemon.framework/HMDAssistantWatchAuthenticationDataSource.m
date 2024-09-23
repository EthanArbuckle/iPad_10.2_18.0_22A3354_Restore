@implementation HMDAssistantWatchAuthenticationDataSource

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDAssistantWatchAuthenticationDataSource *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Requesting watch auth from siri for current request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc_init(MEMORY[0x24BE092B8]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__HMDAssistantWatchAuthenticationDataSource_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke;
  v12[3] = &unk_24E781B48;
  v13 = v9;
  v14 = v4;
  v10 = v4;
  v11 = v9;
  objc_msgSend(v11, "getCurrentRequestIsWatchAuthenticatedWithCompletion:", v12);

}

uint64_t __97__HMDAssistantWatchAuthenticationDataSource_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
