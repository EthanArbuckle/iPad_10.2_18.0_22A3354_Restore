@implementation FARegisterPushTokenRequest

- (FARegisterPushTokenRequest)initWithPushToken:(id)a3
{
  id v5;
  FARegisterPushTokenRequest *v6;
  FARegisterPushTokenRequest *v7;
  FARegisterPushTokenRequest *v8;

  v5 = a3;
  v6 = -[FAFamilyCircleRequest init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pushToken, a3);
    v8 = v7;
  }

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSData *pushToken;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E8561870;
  v6 = v4;
  v14 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pushToken = self->_pushToken;
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke_12;
  v11[3] = &unk_1E8561870;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "registerPushToken:options:replyBlock:", pushToken, v9, v11);

}

void __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FARegisterPushTokenRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__FARegisterPushTokenRequest_startRequestWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
