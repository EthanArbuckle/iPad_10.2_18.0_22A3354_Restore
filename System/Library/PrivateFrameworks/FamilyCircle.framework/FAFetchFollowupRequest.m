@implementation FAFetchFollowupRequest

- (FAFetchFollowupRequest)initWithAltDSID:(id)a3
{
  id v5;
  FAFetchFollowupRequest *v6;
  FAFetchFollowupRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFetchFollowupRequest;
  v6 = -[FAFamilyCircleRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *altDSID;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FAFetchFollowupRequest_startRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E8561870;
  v10 = v4;
  v5 = v4;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  altDSID = self->_altDSID;
  -[FAFamilyCircleRequest requestOptions](self, "requestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchFollowupsWithAltDSID:options:replyBlock:", altDSID, v8, v5);

}

void __60__FAFetchFollowupRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FAFetchFollowupRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
