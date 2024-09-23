@implementation FALaunchOutOfProcessRequest

- (void)launchOutOfProcessUIWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__FALaunchOutOfProcessRequest_launchOutOfProcessUIWithOptions_completion___block_invoke;
  v10[3] = &unk_1E8561870;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "launchOutOfProcessFamilyWithOptions:completion:", v8, v7);

}

void __74__FALaunchOutOfProcessRequest_launchOutOfProcessUIWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  FACircleStateResponse *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FARegisterPushTokenRequest: Error from service - %@", (uint8_t *)&v6, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = -[FACircleStateResponse initWithLoadSuccess:error:userInfo:]([FACircleStateResponse alloc], "initWithLoadSuccess:error:userInfo:", 0, v3, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
