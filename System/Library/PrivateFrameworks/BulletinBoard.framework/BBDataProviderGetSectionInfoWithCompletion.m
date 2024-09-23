@implementation BBDataProviderGetSectionInfoWithCompletion

void ___BBDataProviderGetSectionInfoWithCompletion_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Get info for section %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_sectionInfoForSectionID:effective:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

  objc_autoreleasePoolPop(v4);
}

@end
