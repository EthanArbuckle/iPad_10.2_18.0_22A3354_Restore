@implementation LACSharedModePolicyCoordinatorACMAdapter

- (LACSharedModePolicyCoordinatorACMAdapter)initWithReplyQueue:(id)a3 storageRequestFactory:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACSharedModePolicyCoordinatorACMAdapter *v12;
  LACSharedModePolicyCoordinatorACMAdapter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACSharedModePolicyCoordinatorACMAdapter;
  v12 = -[LACSharedModePolicyCoordinatorACMAdapter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replyQueue, a3);
    objc_storeStrong((id *)&v13->_requestFactory, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
  }

  return v13;
}

- (void)updatePolicyEvaluationWithTraits:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  LACSharedModePolicyCoordinatorACMStorage *storage;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  LACSharedModePolicyCoordinatorACMAdapter *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  LACLogSharedMode();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLACSharedModePolicyTraits(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will set traits = [%{public}@]", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  -[LACSharedModePolicyCoordinatorACMStorageRequestFactory requestWithPolicyTraits:](self->_requestFactory, "requestWithPolicyTraits:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  storage = self->_storage;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__LACSharedModePolicyCoordinatorACMAdapter_updatePolicyEvaluationWithTraits_completion___block_invoke;
  v12[3] = &unk_2510C1768;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)a3;
  v11 = v6;
  v13 = v11;
  -[LACSharedModePolicyCoordinatorACMStorage performRequest:completion:](storage, "performRequest:completion:", v9, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);

}

void __88__LACSharedModePolicyCoordinatorACMAdapter_updatePolicyEvaluationWithTraits_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogSharedMode();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSStringFromLACSharedModePolicyTraits(*(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = WeakRetained;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%{public}@ did set traits = [%{public}@] err=%{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestFactory, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
