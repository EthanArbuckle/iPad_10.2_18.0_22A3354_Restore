@implementation FADeleteFamilyRequest

- (FADeleteFamilyRequest)init
{
  FADeleteFamilyRequest *v2;
  FADeleteFamilyRequest *v3;
  FADeleteFamilyRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FADeleteFamilyRequest;
  v2 = -[FAFamilyCircleRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E8561870;
  v6 = v4;
  v12 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke_1;
  v9[3] = &unk_1E8561988;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "removeFamilyWithReplyBlock:", v9);

}

void __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__FADeleteFamilyRequest_startRequestWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
