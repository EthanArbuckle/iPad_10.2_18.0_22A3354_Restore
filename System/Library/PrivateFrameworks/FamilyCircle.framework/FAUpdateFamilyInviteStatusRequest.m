@implementation FAUpdateFamilyInviteStatusRequest

- (FAUpdateFamilyInviteStatusRequest)initWithInviteCode:(id)a3 inviteStatus:(int64_t)a4 responseFormat:(int64_t)a5 additionalRequestParameters:(id)a6
{
  id v11;
  id v12;
  FAUpdateFamilyInviteStatusRequest *v13;
  FAUpdateFamilyInviteStatusRequest *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FAUpdateFamilyInviteStatusRequest;
  v13 = -[FAFamilyCircleRequest init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_inviteCode, a3);
    v14->_inviteStatus = a4;
    v14->_responseFormat = a5;
    objc_storeStrong((id *)&v14->_additionalRequestParameters, a6);
  }

  return v14;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E8561870;
  v6 = v4;
  v17 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FAUpdateFamilyInviteStatusRequest inviteStatus](self, "inviteStatus");
  -[FAUpdateFamilyInviteStatusRequest inviteCode](self, "inviteCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FAUpdateFamilyInviteStatusRequest responseFormat](self, "responseFormat");
  -[FAUpdateFamilyInviteStatusRequest additionalRequestParameters](self, "additionalRequestParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke_12;
  v14[3] = &unk_1E8561988;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v7, "updateFamilyInviteStatusWith:inviteCode:options:responseFormat:additionalRequestParameters:replyBlock:", v8, v9, v10, v11, v12, v14);

}

void __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FAUpdateFamilyInviteStatusRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__FAUpdateFamilyInviteStatusRequest_startRequestWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)inviteCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (NSDictionary)additionalRequestParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)responseFormat
{
  return self->_responseFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRequestParameters, 0);
  objc_storeStrong((id *)&self->_inviteCode, 0);
}

@end
