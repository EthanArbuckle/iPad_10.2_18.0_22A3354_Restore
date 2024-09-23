@implementation FASettingsPresetsRequest

- (FASettingsPresetsRequest)initWithFamilyMember:(id)a3
{
  void *v4;
  FASettingsPresetsRequest *v5;

  objc_msgSend(a3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FASettingsPresetsRequest initWithFamilyMemberAltDSID:](self, "initWithFamilyMemberAltDSID:", v4);

  return v5;
}

- (FASettingsPresetsRequest)initWithFamilyMemberAltDSID:(id)a3
{
  id v5;
  FASettingsPresetsRequest *v6;
  FASettingsPresetsRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FASettingsPresetsRequest;
  v6 = -[FAFamilyCircleRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (FASettingsPresetsRequest)initWithChildAge:(id)a3
{
  id v5;
  FASettingsPresetsRequest *v6;
  FASettingsPresetsRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FASettingsPresetsRequest;
  v6 = -[FAFamilyCircleRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_childAge, a3);

  return v7;
}

- (id)fetchPresets
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FASettingsPresetsRequest_fetchPresets__block_invoke;
  v5[3] = &unk_1E85618E0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

void __40__FASettingsPresetsRequest_fetchPresets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__FASettingsPresetsRequest_fetchPresets__block_invoke_2;
  v16[3] = &unk_1E8561870;
  v5 = v3;
  v17 = v5;
  objc_msgSend(v4, "serviceRemoteObjectWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: fetching presets with altDSID", v15, 2u);
    }

    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[4];
    objc_msgSend(v10, "requestOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchSettingsPresetsForMemberWithAltDSID:fromCache:options:replyBlock:", v11, 0, v12, v5);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: altDSID is nil fallback to fetching presets with age", v15, 2u);
    }

    v13 = *(_QWORD **)(a1 + 32);
    v14 = v13[5];
    objc_msgSend(v13, "requestOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchSettingsPresetsForAge:fromCache:options:replyBlock:", v14, 0, v12, v5);
  }

}

uint64_t __40__FASettingsPresetsRequest_fetchPresets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPresetsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FASettingsPresetsRequest fetchPresets](self, "fetchPresets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onComplete:", v4);

}

- (id)fetchCachedPresets
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke;
  v5[3] = &unk_1E85618E0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

void __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke_2;
  v16[3] = &unk_1E8561870;
  v5 = v3;
  v17 = v5;
  objc_msgSend(v4, "serviceRemoteObjectWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: fetching cached presets with altDSID", v15, 2u);
    }

    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[4];
    objc_msgSend(v10, "requestOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchSettingsPresetsForMemberWithAltDSID:fromCache:options:replyBlock:", v11, 1, v12, v5);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "FASettingsPresetsRequest: altDSID is nil fallback to fetching cached presets with age", v15, 2u);
    }

    v13 = *(_QWORD **)(a1 + 32);
    v14 = v13[5];
    objc_msgSend(v13, "requestOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchSettingsPresetsForAge:fromCache:options:replyBlock:", v14, 1, v12, v5);
  }

}

uint64_t __46__FASettingsPresetsRequest_fetchCachedPresets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCachedPresetsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FASettingsPresetsRequest fetchCachedPresets](self, "fetchCachedPresets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onComplete:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAge, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
