@implementation iCloudStorageController

- (iCloudStorageController)initWithAccount:(id)a3
{
  id v5;
  iCloudStorageController *v6;
  iCloudStorageController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)iCloudStorageController;
  v6 = -[iCloudStorageController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getICQStoragePlanRecommendationClass_softClass;
  v25 = getICQStoragePlanRecommendationClass_softClass;
  v8 = MEMORY[0x24BDAC760];
  if (!getICQStoragePlanRecommendationClass_softClass)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __getICQStoragePlanRecommendationClass_block_invoke;
    v21[3] = &unk_2509E0700;
    v21[4] = &v22;
    __getICQStoragePlanRecommendationClass_block_invoke((uint64_t)v21);
    v7 = (void *)v23[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  v20 = (id)objc_msgSend([v9 alloc], "initWithAccount:", self->_account);
  v10 = (void *)v16[5];
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke;
  v12[3] = &unk_2509E0820;
  v12[4] = self;
  v11 = v6;
  v13 = v11;
  v14 = &v15;
  objc_msgSend(v10, "calculateExtraQuotaNeededToSyncIsAccountFull:completion:", v4, v12);

  _Block_object_dispose(&v15, 8);
}

- (void)fetchStorageSummary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getICQCloudStorageDataControllerClass_softClass;
  v23 = getICQCloudStorageDataControllerClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!getICQCloudStorageDataControllerClass_softClass)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __getICQCloudStorageDataControllerClass_block_invoke;
    v19[3] = &unk_2509E0700;
    v19[4] = &v20;
    __getICQCloudStorageDataControllerClass_block_invoke((uint64_t)v19);
    v5 = (void *)v21[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  v18 = (id)objc_msgSend([v7 alloc], "initWithAccount:", self->_account);
  v8 = (void *)v14[5];
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__iCloudStorageController_fetchStorageSummary___block_invoke;
  v10[3] = &unk_2509E0848;
  v10[4] = self;
  v9 = v4;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "fetchStorageSummaryWithCompletion:", v10);

  _Block_object_dispose(&v13, 8);
}

- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v7 = (void *)getICSHomeDataControllerClass_softClass;
  v17 = getICSHomeDataControllerClass_softClass;
  if (!getICSHomeDataControllerClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getICSHomeDataControllerClass_block_invoke;
    v13[3] = &unk_2509E0700;
    v13[4] = &v14;
    __getICSHomeDataControllerClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v14, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithAccount:", self->_account);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__iCloudStorageController_fetchCloudStorageInfo_completion___block_invoke;
    v11[3] = &unk_2509E0870;
    v12 = v6;
    objc_msgSend(v9, "fetchCloudStorageInfo:completion:", v4, v11);

  }
  else
  {
    _CELogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[iCloudStorageController fetchCloudStorageInfo:completion:].cold.1(v10);

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)fetchCloudStorageInfo:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2380DF000, log, OS_LOG_TYPE_ERROR, "Future method not implemented in iCS.", v1, 2u);
}

@end
