@implementation FACancelInvitationRequest

- (FACancelInvitationRequest)initWith:(id)a3 familyID:(id)a4
{
  id v7;
  id v8;
  FACancelInvitationRequest *v9;
  FACancelInvitationRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FACancelInvitationRequest;
  v9 = -[FAFamilyCircleRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_email, a3);
    objc_storeStrong((id *)&v10->_familyID, a4);
  }

  return v10;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSString *email;
  NSString *familyID;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__FACancelInvitationRequest_startRequestWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E8561870;
  v6 = v4;
  v14 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  email = self->_email;
  familyID = self->_familyID;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __63__FACancelInvitationRequest_startRequestWithCompletionHandler___block_invoke_1;
  v11[3] = &unk_1E8562530;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "cancelInvitationWith:familyID:options:replyBlock:", email, familyID, 0, v11);

}

void __63__FACancelInvitationRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FACancelInvitationRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__FACancelInvitationRequest_startRequestWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
