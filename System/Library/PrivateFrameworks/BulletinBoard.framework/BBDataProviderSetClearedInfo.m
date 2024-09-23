@implementation BBDataProviderSetClearedInfo

void ___BBDataProviderSetClearedInfo_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Set cleared info for section %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_saveUpdatedClearedInfo:forSectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v5);
}

@end
