@implementation HMFLocationAuthorizationRequest

void __48____HMFLocationAuthorizationRequest_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Location.Authorization.Request"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012EE8;
  qword_1ED012EE8 = v0;

}

uint64_t __84____HMFLocationAuthorizationRequest_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 336))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 40), "status");
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 1024;
      v10 = v2;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Received notification of status: %d", (uint8_t *)&v7, 0x12u);

    }
    objc_autoreleasePoolPop(v3);
    return __HMFLocationAuthorizationHandleAuthorizationStatus(*(void **)(v1 + 32), v2);
  }
  return result;
}

@end
