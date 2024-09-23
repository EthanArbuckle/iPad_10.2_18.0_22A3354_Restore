@implementation FAUpdateFamilyMemberFlagRequest

- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 flag:(id)a4 enabled:(BOOL)a5
{
  return -[FAUpdateFamilyMemberFlagRequest initWithFamilyMemberDSID:ephemeralAuthResults:flag:enabled:](self, "initWithFamilyMemberDSID:ephemeralAuthResults:flag:enabled:", a3, 0, a4, a5);
}

- (FAUpdateFamilyMemberFlagRequest)initWithFamilyMemberDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  FAUpdateFamilyMemberFlagRequest *v14;
  FAUpdateFamilyMemberFlagRequest *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FAUpdateFamilyMemberFlagRequest;
  v14 = -[FAFamilyCircleRequest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dsid, a3);
    objc_storeStrong((id *)&v15->_ephemeralAuthResults, a4);
    objc_storeStrong((id *)&v15->_flag, a5);
    v15->_enabled = a6;
  }

  return v15;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSNumber *dsid;
  void *v10;
  NSString *flag;
  _BOOL8 enabled;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E8561870;
  v6 = v4;
  v17 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:].cold.1(self, v8);

  dsid = self->_dsid;
  -[FAUpdateFamilyMemberFlagRequest ephemeralAuthResults](self, "ephemeralAuthResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  flag = self->_flag;
  enabled = self->_enabled;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14;
  v14[3] = &unk_1E8561B00;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v7, "updateFamilyMemberFlagWithDSID:ephemeralAuthResults:flag:enabled:replyBlock:", dsid, v10, flag, enabled, v14);

}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
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

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14_cold_2(a1, (uint64_t)v3, v4);
  }
  else if (v5)
  {
    __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14_cold_1(v4);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_flag, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

- (void)startRequestWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "ephemeralAuthResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", v5 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "Starting family update member flag request: %@, ephemeralAuth: (%@)", (uint8_t *)&v7, 0x16u);

}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:]_block_invoke";
  _os_log_debug_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_DEBUG, "%s Family update member flag completed.", (uint8_t *)&v1, 0xCu);
}

void __69__FAUpdateFamilyMemberFlagRequest_startRequestWithCompletionHandler___block_invoke_14_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v4 = 136315650;
  v5 = "-[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_DEBUG, "%s Error updating Family member flag %@ completed %@", (uint8_t *)&v4, 0x20u);
}

@end
