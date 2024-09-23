@implementation VSPersistentStorage

+ (id)defaultStorageDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", CFSTR("/var/mobile/Library/Application Support"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v2, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("com.apple.VideoSubscriberAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v7, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v7, "forceUnwrapObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v18);
    v14 = v18;

    if (v14)
    {
      VSErrorLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[VSPersistentStorage defaultStorageDirectoryURL].cold.1((uint64_t)v14, v15);

    }
  }
  objc_msgSend(v7, "forceUnwrapObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (VSPersistentStorage)initWithAccountStore:(id)a3 channelsCenterClass:(Class)a4
{
  id v6;
  VSPersistentStorage *v7;
  VSAccountStore *v8;
  VSAccountStore *accountStore;
  uint64_t v10;
  VSAccountChannelsCenter *channelsCenter;
  VSPrivacyVoucherLockbox *v12;
  VSPrivacyVoucherLockbox *voucherLockbox;
  VSPrivacyFacade *v14;
  VSPrivacyFacade *privacyFacade;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSPersistentStorage;
  v7 = -[VSPersistentStorage init](&v17, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = (VSAccountStore *)v6;
    }
    else
    {
      +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
      v8 = (VSAccountStore *)objc_claimAutoreleasedReturnValue();
    }
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    v10 = objc_msgSend([a4 alloc], "initWithAccountStore:", v7->_accountStore);
    channelsCenter = v7->_channelsCenter;
    v7->_channelsCenter = (VSAccountChannelsCenter *)v10;

    v12 = objc_alloc_init(VSPrivacyVoucherLockbox);
    voucherLockbox = v7->_voucherLockbox;
    v7->_voucherLockbox = v12;

    v14 = -[VSPrivacyFacade initWithVoucherLockbox:]([VSPrivacyFacade alloc], "initWithVoucherLockbox:", v7->_voucherLockbox);
    privacyFacade = v7->_privacyFacade;
    v7->_privacyFacade = v14;

  }
  return v7;
}

- (VSPersistentStorage)initWithAccountStore:(id)a3
{
  id v4;
  VSPersistentStorage *v5;

  v4 = a3;
  v5 = -[VSPersistentStorage initWithAccountStore:channelsCenterClass:](self, "initWithAccountStore:channelsCenterClass:", v4, objc_opt_class());

  return v5;
}

- (VSPersistentStorage)init
{
  return -[VSPersistentStorage initWithAccountStore:](self, "initWithAccountStore:", 0);
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (VSAccountChannelsCenter)channelsCenter
{
  return self->_channelsCenter;
}

- (VSPrivacyVoucherLockbox)voucherLockbox
{
  return self->_voucherLockbox;
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_voucherLockbox, 0);
  objc_storeStrong((id *)&self->_channelsCenter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

+ (void)defaultStorageDirectoryURL
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error creating persistent storage directory %@", (uint8_t *)&v2, 0xCu);
}

@end
