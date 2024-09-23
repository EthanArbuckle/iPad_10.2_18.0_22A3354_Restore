@implementation BBDataProviderAddBulletinForDestinations

void ___BBDataProviderAddBulletinForDestinations_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v4 = v2;
    BBPublisherDestinationStrings(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v3;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Add bulletin to destinations %ld: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  v6 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_publishBulletinRequest:forSectionID:forDestinations:", a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v6);
}

@end
