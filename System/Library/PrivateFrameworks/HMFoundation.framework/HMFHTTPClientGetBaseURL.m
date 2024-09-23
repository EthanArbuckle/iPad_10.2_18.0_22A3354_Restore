@implementation HMFHTTPClientGetBaseURL

void ____HMFHTTPClientGetBaseURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      v7 = v5;
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 2, CFSTR("Unable to determine the address of the server"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void ____HMFHTTPClientGetBaseURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to resolve service with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v3);

}

@end
