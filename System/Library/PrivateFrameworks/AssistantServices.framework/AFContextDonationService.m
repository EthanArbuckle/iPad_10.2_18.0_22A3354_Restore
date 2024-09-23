@implementation AFContextDonationService

- (id)_init
{
  AFContextDonationService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMapTable *transformersByType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFContextDonationService;
  v2 = -[AFContextDonationService init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AFContextDonationService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    transformersByType = v2->_transformersByType;
    v2->_transformersByType = (NSMapTable *)v5;

  }
  return v2;
}

- (id)_connection
{
  AFDeviceContextConnection *connection;
  AFDeviceContextConnection *v4;
  OS_dispatch_queue *queue;
  void *v6;
  AFDeviceContextConnection *v7;
  AFDeviceContextConnection *v8;

  connection = self->_connection;
  if (!connection)
  {
    v4 = [AFDeviceContextConnection alloc];
    queue = self->_queue;
    +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AFDeviceContextConnection initWithQueue:instanceContext:delegate:](v4, "initWithQueue:instanceContext:delegate:", queue, v6, self);
    v8 = self->_connection;
    self->_connection = v7;

    connection = self->_connection;
  }
  return connection;
}

- (void)setDonationService:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AFContextDonationService_setDonationService___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)registerContextTransformer:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFContextDonationService_registerContextTransformer_forType___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5
{
  -[AFContextDonationService donateContext:withMetadata:pushToRemote:completion:](self, "donateContext:withMetadata:pushToRemote:completion:", a3, a4, a5, 0);
}

- (void)donateContext:(id)a3 withMetadata:(id)a4 pushToRemote:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke;
    v15[3] = &unk_1E3A36C58;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    v20 = a5;
    v19 = v12;
    v18 = v13;
    dispatch_async(queue, v15);

  }
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  AFDeviceContextConnection *connection;

  connection = self->_connection;
  self->_connection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_donationService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transformersByType, 0);
}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(_QWORD);
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    objc_msgSend(v3, "donateContext:withMetadata:pushToRemote:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__41748;
    v39 = __Block_byref_object_dispose__41749;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__41748;
    v33 = __Block_byref_object_dispose__41749;
    v34 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_5;
    v23[3] = &unk_1E3A36BE0;
    v23[4] = v2;
    v26 = &v35;
    v27 = &v29;
    v24 = *(id *)(a1 + 56);
    v28 = *(_BYTE *)(a1 + 72);
    v25 = *(id *)(a1 + 64);
    v6 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C](v23);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "serializedBackingStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_3;
      v17[3] = &unk_1E3A36C30;
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v17[4] = *(_QWORD *)(a1 + 32);
      v21 = &v35;
      v18 = v8;
      v22 = &v29;
      v19 = *(id *)(a1 + 48);
      v20 = v6;
      objc_msgSend(v7, "getRedactedContextForContextSnapshot:metadata:privacyPolicy:completion:", v11, v10, 50, v17);

    }
    else
    {
      v43 = &unk_1E3AA7900;
      v44[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v36[5];
      v36[5] = v12;

      v14 = *(_QWORD *)(a1 + 48);
      v41 = &unk_1E3AA7900;
      v42 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v30[5];
      v30[5] = v15;

      v6[2](v6);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);

  }
}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_2;
  v7[3] = &unk_1E3A36BB8;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "donateSerializedContextMapByPrivacyClass:withMetadataMap:forType:pushToRemote:completion:", v3, v4, v6, v5, v7);

}

void __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_4;
  block[3] = &unk_1E3A36C08;
  v19 = *(_QWORD *)(a1 + 64);
  block[1] = 3221225472;
  v14 = v5;
  v15 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 72);
  v16 = v9;
  v20 = v10;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v24 = a1[4];
    v25 = a1[5];
    *(_DWORD *)buf = 136315650;
    v35 = "-[AFContextDonationService donateContext:withMetadata:pushToRemote:completion:]_block_invoke_4";
    v36 = 2112;
    v37 = v24;
    v38 = 2112;
    v39 = v25;
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #hal redacted: %@ %@", buf, 0x20u);
  }
  v3 = (void *)a1[4];
  if (v3 && a1[5])
  {
    v4 = a1[6];
    v32[0] = &unk_1E3AA7900;
    v32[1] = &unk_1E3AA7918;
    v33[0] = v4;
    objc_msgSend(v3, "serializedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[9] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = a1[7];
    v30[0] = &unk_1E3AA7900;
    v30[1] = &unk_1E3AA7918;
    v10 = a1[5];
    v31[0] = v9;
    v31[1] = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = v31;
    v13 = (void **)v30;
    v14 = 2;
  }
  else
  {
    v15 = a1[6];
    v28 = &unk_1E3AA7900;
    v29 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[9] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = a1[7];
    v26 = &unk_1E3AA7900;
    v27 = v19;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v27;
    v13 = &v26;
    v14 = 1;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14, v26, v27);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1[10] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

uint64_t __79__AFContextDonationService_donateContext_withMetadata_pushToRemote_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__AFContextDonationService_registerContextTransformer_forType___block_invoke(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[4];
  if (*(_QWORD *)(v1 + 24))
    return objc_msgSend(*(id *)(v1 + 24), "registerContextTransformer:forType:", a1[5], a1[6]);
  else
    return objc_msgSend(*(id *)(v1 + 8), "setObject:forKey:", a1[5], a1[6]);
}

void __47__AFContextDonationService_setDonationService___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 24))
    {
      objc_msgSend(*(id *)(v2 + 8), "keyEnumerator");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextObject");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        do
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registerContextTransformer:forType:", v5, v4);

          objc_msgSend(v7, "nextObject");
          v6 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v6;
        }
        while (v6);
      }

    }
  }
}

+ (id)defaultService
{
  if (defaultService_onceToken != -1)
    dispatch_once(&defaultService_onceToken, &__block_literal_global_41764);
  return (id)defaultService_sDonation;
}

void __42__AFContextDonationService_defaultService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AFContextDonationService _init]([AFContextDonationService alloc], "_init");
  v1 = (void *)defaultService_sDonation;
  defaultService_sDonation = (uint64_t)v0;

}

@end
