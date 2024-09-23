@implementation FAFetchScreenTimeSettingsCacheRequest

- (FAFetchScreenTimeSettingsCacheRequest)initWithFamilyMemberDSID:(id)a3
{
  id v5;
  FAFetchScreenTimeSettingsCacheRequest *v6;
  FAFetchScreenTimeSettingsCacheRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFetchScreenTimeSettingsCacheRequest;
  v6 = -[FAFamilyCircleRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_memberDSID, a3);

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__FAFetchScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E8561870;
  v10 = v4;
  v5 = v4;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchScreenTimeSettingsCacheRequest memberDSID](self, "memberDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableSettingsForMemberDSID:options:replyBlock:", v7, v8, v5);

}

void __75__FAFetchScreenTimeSettingsCacheRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[FAFetchScreenTimeSettingsCacheRequest startRequestWithCompletionHandler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "%s: Error from service - %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)enableSettings:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke;
  v12[3] = &unk_1E85624E0;
  v12[4] = &v19;
  -[FAFamilyCircleRequest synchronousRemoteObjectWithErrorHandler:](self, "synchronousRemoteObjectWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchScreenTimeSettingsCacheRequest memberDSID](self, "memberDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke_2;
  v11[3] = &unk_1E8562508;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v6, "enableSettingsForMemberDSID:options:replyBlock:", v7, v8, v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__FAFetchScreenTimeSettingsCacheRequest_enableSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

@end
