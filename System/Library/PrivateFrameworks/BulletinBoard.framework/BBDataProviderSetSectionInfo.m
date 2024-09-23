@implementation BBDataProviderSetSectionInfo

void ___BBDataProviderSetSectionInfo_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Set info for section %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v5 = (void *)MEMORY[0x212B94804]();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend((id)__server, "_saveUpdatedSectionInfo:forSectionID:", v6, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v5);
}

@end
