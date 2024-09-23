@implementation FAEnableScreenTimeSettingsRequest

- (FAEnableScreenTimeSettingsRequest)initWithFamilyMemberDSID:(id)a3 screentimeModelCache:(id)a4
{
  id v7;
  id v8;
  FAEnableScreenTimeSettingsRequest *v9;
  FAEnableScreenTimeSettingsRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAEnableScreenTimeSettingsRequest;
  v9 = -[FAFamilyCircleRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberDSID, a3);
    objc_storeStrong((id *)&v10->_screentimeModelCache, a4);
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

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__FAEnableScreenTimeSettingsRequest_startRequestWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E8561870;
  v12 = v4;
  v5 = v4;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FAEnableScreenTimeSettingsRequest startRequestWithCompletionHandler:].cold.1(v7);

  -[FAEnableScreenTimeSettingsRequest memberDSID](self, "memberDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAEnableScreenTimeSettingsRequest screentimeModelCache](self, "screentimeModelCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableSettingsForMemberDSID:screentimeModelCache:options:replyBlock:", v8, v9, v10, v5);

}

void __71__FAEnableScreenTimeSettingsRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[FAEnableScreenTimeSettingsRequest startRequestWithCompletionHandler:]_block_invoke";
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
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v5 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke;
  v13[3] = &unk_1E85624E0;
  v13[4] = &v20;
  -[FAFamilyCircleRequest synchronousRemoteObjectWithErrorHandler:](self, "synchronousRemoteObjectWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAEnableScreenTimeSettingsRequest memberDSID](self, "memberDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAEnableScreenTimeSettingsRequest screentimeModelCache](self, "screentimeModelCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke_2;
  v12[3] = &unk_1E8562508;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v6, "enableSettingsForMemberDSID:screentimeModelCache:options:replyBlock:", v7, v8, v9, v12);

  if (a3)
    *a3 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__FAEnableScreenTimeSettingsRequest_enableSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (FAScreentimeSettingsObjectCache)screentimeModelCache
{
  return (FAScreentimeSettingsObjectCache *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screentimeModelCache, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

- (void)startRequestWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_DEBUG, "Starting ScreenTime enablement request", v1, 2u);
}

@end
