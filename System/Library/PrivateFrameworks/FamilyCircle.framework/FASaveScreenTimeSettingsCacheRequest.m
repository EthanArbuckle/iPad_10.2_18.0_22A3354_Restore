@implementation FASaveScreenTimeSettingsCacheRequest

- (FASaveScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3 screentimeObject:(id)a4
{
  id v7;
  id v8;
  FASaveScreenTimeSettingsCacheRequest *v9;
  FASaveScreenTimeSettingsCacheRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FASaveScreenTimeSettingsCacheRequest;
  v9 = -[FAFamilyCircleRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberDSID, a3);
    objc_storeStrong((id *)&v10->_object, a4);
  }

  return v10;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  FASaveScreenTimeSettingsCacheRequest *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__FASaveScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E8561870;
  v12 = v4;
  v5 = v4;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "Starting caching of object: %@", buf, 0xCu);
  }

  -[FASaveScreenTimeSettingsCacheRequest object](self, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASaveScreenTimeSettingsCacheRequest memberDSID](self, "memberDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheObjectSettings:dsid:options:replyBlock:", v8, v9, v10, v5);

}

void __74__FASaveScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[FASaveScreenTimeSettingsCacheRequest startRequestWithCompletionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "%s: Error from service - %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMemberDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (FAScreentimeSettingsObjectCache)object
{
  return (FAScreentimeSettingsObjectCache *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

@end
