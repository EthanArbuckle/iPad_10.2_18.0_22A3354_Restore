@implementation BBDataProviderUpdateClearedInfoWithHandler

void __BBDataProviderUpdateClearedInfoWithHandler_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Update cleared info for section %{public}@", (uint8_t *)&v5, 0xCu);
  }
  v4 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_updateClearedInfoForSectionID:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v4);
}

@end
