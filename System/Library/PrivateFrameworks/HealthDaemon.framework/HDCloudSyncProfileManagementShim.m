@implementation HDCloudSyncProfileManagementShim

- (HDCloudSyncProfileManagementShim)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncProfileManagementShim *v6;
  HDCloudSyncProfileManagementShim *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncProfileManagementShim;
  v6 = -[HDCloudSyncProfileManagementShim init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)deleteAllProfilesOfType:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  id v19;

  v8 = a5;
  objc_msgSend(a4, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  LOBYTE(a3) = objc_msgSend(v10, "deleteAllProfilesOfType:error:", a3, &v19);
  v11 = v19;

  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__HDCloudSyncProfileManagementShim_deleteAllProfilesOfType_configuration_completion___block_invoke;
  v15[3] = &unk_1E6CEBC78;
  v18 = a3;
  v16 = v11;
  v17 = v8;
  v13 = v11;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __85__HDCloudSyncProfileManagementShim_deleteAllProfilesOfType_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)deleteProfile:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  id v21;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "deleteProfile:error:", v9, &v21);

  v13 = v21;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__HDCloudSyncProfileManagementShim_deleteProfile_configuration_completion___block_invoke;
  v17[3] = &unk_1E6CEBC78;
  v20 = v12;
  v18 = v13;
  v19 = v8;
  v15 = v13;
  v16 = v8;
  dispatch_async(queue, v17);

}

uint64_t __75__HDCloudSyncProfileManagementShim_deleteProfile_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(a6, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profileManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v17, "createProfileForIdentifier:firstName:lastName:error:", v15, v14, v13, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v28;
  queue = self->_queue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __107__HDCloudSyncProfileManagementShim_createProfileForIdentifier_firstName_lastName_configuration_completion___block_invoke;
  v24[3] = &unk_1E6CEBCA0;
  v26 = v19;
  v27 = v12;
  v25 = v18;
  v21 = v19;
  v22 = v18;
  v23 = v12;
  dispatch_async(queue, v24);

}

void __107__HDCloudSyncProfileManagementShim_createProfileForIdentifier_firstName_lastName_configuration_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[6];
  v3 = (void *)a1[4];
  if (v3)
  {
    objc_msgSend(v3, "profileIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v4, a1[5]);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, a1[5]);
  }
}

- (void)profileExistsForProfileIdentifier:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  id v21;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "profileExistsForIdentifier:error:", v9, &v21);

  v13 = v21;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __95__HDCloudSyncProfileManagementShim_profileExistsForProfileIdentifier_configuration_completion___block_invoke;
  v17[3] = &unk_1E6CEBCC8;
  v20 = v12;
  v18 = v13;
  v19 = v8;
  v15 = v8;
  v16 = v13;
  dispatch_async(queue, v17);

}

uint64_t __95__HDCloudSyncProfileManagementShim_profileExistsForProfileIdentifier_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
