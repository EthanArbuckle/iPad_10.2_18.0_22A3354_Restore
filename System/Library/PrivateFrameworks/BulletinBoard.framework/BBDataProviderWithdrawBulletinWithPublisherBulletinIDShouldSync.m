@implementation BBDataProviderWithdrawBulletinWithPublisherBulletinIDShouldSync

void __BBDataProviderWithdrawBulletinWithPublisherBulletinIDShouldSync_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Withdraw bulletin in section %{public}@, publisher bulletin ID %{public}@, should sync %{BOOL}d", (uint8_t *)&v7, 0x1Cu);
  }
  v6 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "withdrawBulletinRequestsWithPublisherBulletinID:shouldSync:forSectionID:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v6);
}

@end
