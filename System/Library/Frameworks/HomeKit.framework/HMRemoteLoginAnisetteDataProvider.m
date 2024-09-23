@implementation HMRemoteLoginAnisetteDataProvider

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMRemoteLoginMessage initNewMessage]([HMProvisionAnisetteDataRequest alloc], "initNewMessage");
  objc_msgSend(v5, "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  encodeRootObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(v5, "xpcMessageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginAnisetteDataProvider uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
  v14 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", v10, v13, v8);

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __69__HMRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  v21 = &unk_1E3AB3A50;
  v22 = v4;
  v15 = v4;
  objc_msgSend(v14, "setResponseHandler:", &v18);
  -[HMRemoteLoginAnisetteDataProvider context](self, "context", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[HMRemoteLoginMessage initNewMessage]([HMSyncAnisetteDataRequest alloc], "initNewMessage");
  objc_msgSend(v8, "setSimData:", v7);

  objc_msgSend(v8, "messageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v9;
  encodeRootObject(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(v8, "xpcMessageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginAnisetteDataProvider uuid](self, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
  v17 = (void *)objc_msgSend(v12, "initWithName:destination:payload:", v13, v16, v11);

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __72__HMRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  v24 = &unk_1E3AB3A50;
  v25 = v6;
  v18 = v6;
  objc_msgSend(v17, "setResponseHandler:", &v21);
  -[HMRemoteLoginAnisetteDataProvider context](self, "context", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v17);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMRemoteLoginMessage initNewMessage]([HMEraseAnisetteDataRequest alloc], "initNewMessage");
  objc_msgSend(v5, "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  encodeRootObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(v5, "xpcMessageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginAnisetteDataProvider uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
  v14 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", v10, v13, v8);

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __65__HMRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  v21 = &unk_1E3AB3A50;
  v22 = v4;
  v15 = v4;
  objc_msgSend(v14, "setResponseHandler:", &v18);
  -[HMRemoteLoginAnisetteDataProvider context](self, "context", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[2];

  v4 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[HMRemoteLoginMessage initNewMessage]([HMFetchAnisetteDataRequest alloc], "initNewMessage");
  objc_msgSend(v7, "setShouldProvision:", v4);
  objc_msgSend(v7, "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  encodeRootObject(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(v7, "xpcMessageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginAnisetteDataProvider uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);
  v16 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", v12, v15, v10);

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __93__HMRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v23 = &unk_1E3AB3A50;
  v24 = v6;
  v17 = v6;
  objc_msgSend(v16, "setResponseHandler:", &v20);
  -[HMRemoteLoginAnisetteDataProvider context](self, "context", v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:", v16);

}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[HMRemoteLoginMessage initNewMessage]([HMLegacyAnisetteDataRequest alloc], "initNewMessage");
  objc_msgSend(v8, "setDsid:", v7);

  objc_msgSend(v8, "messageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v9;
  encodeRootObject(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(v8, "xpcMessageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginAnisetteDataProvider uuid](self, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
  v17 = (void *)objc_msgSend(v12, "initWithName:destination:payload:", v13, v16, v11);

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __78__HMRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v24 = &unk_1E3AB3A50;
  v25 = v6;
  v18 = v6;
  objc_msgSend(v17, "setResponseHandler:", &v21);
  -[HMRemoteLoginAnisetteDataProvider context](self, "context", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v17);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMRemoteLoginAnisetteDataProvider context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMRemoteLoginAnisetteDataProvider)initWithCoder:(id)a3
{
  id v4;
  HMRemoteLoginAnisetteDataProvider *v5;
  uint64_t v6;
  NSUUID *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMRemoteLoginAnisetteDataProvider;
  v5 = -[HMRemoteLoginAnisetteDataProvider init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

  }
  return v5;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __78__HMRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  +[HMLegacyAnisetteDataResponse objWithDict:](HMLegacyAnisetteDataResponse, "objWithDict:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "anisetteData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

}

void __93__HMRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  +[HMFetchAnisetteDataResponse objWithDict:](HMFetchAnisetteDataResponse, "objWithDict:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "anisetteData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

}

void __65__HMRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[HMEraseAnisetteDataResponse objWithDict:](HMEraseAnisetteDataResponse, "objWithDict:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

void __72__HMRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[HMSyncAnisetteDataResponse objWithDict:](HMSyncAnisetteDataResponse, "objWithDict:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

void __69__HMRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[HMProvisionAnisetteDataResponse objWithDict:](HMProvisionAnisetteDataResponse, "objWithDict:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "didSucceed"), v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
