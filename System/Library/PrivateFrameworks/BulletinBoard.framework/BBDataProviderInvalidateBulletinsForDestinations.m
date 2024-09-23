@implementation BBDataProviderInvalidateBulletinsForDestinations

void __BBDataProviderInvalidateBulletinsForDestinations_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Invalidate bulletins in section %{public}@ for destinations %ld", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void *)MEMORY[0x212B94804]();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
    objc_msgSend((id)__server, "_updateBulletinsInFeed:ifSectionIsEnabled:", 1, v8);

  objc_autoreleasePoolPop(v7);
}

@end
