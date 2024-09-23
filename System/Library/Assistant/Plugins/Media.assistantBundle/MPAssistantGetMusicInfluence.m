@implementation MPAssistantGetMusicInfluence

- (void)performWithCompletion:(id)a3
{
  NSString *requestAceHash;
  void (**v5)(id, void *);
  void *v6;
  NSString *v7;
  NSString *v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  void *v25;
  int v26;
  NSString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  requestAceHash = self->_requestAceHash;
  v5 = (void (**)(id, void *))a3;
  if (!-[NSString length](requestAceHash, "length"))
  {
    -[MPAssistantGetMusicInfluence aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Music Influence"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    v26 = 138543362;
    v27 = v10;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Get Music Influence (invoke) <%{public}@>: invoked", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CC24B8], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isPrivateListeningEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CC2390], "monitorForCurrentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v13 = objc_msgSend(v14, "isPrivateListeningEnabledForCurrentAccessory");
  v16 = v13 ^ 1u;
  v17 = objc_alloc_init(MEMORY[0x1E0D88460]);
  objc_msgSend(v17, "setValue:", v16);
  v18 = objc_alloc_init(MEMORY[0x1E0D88470]);
  objc_msgSend(v18, "setSetting:", v17);
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetMusicInfluence aceId](self, "aceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Music Influence"), v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_requestAceHash;
    self->_requestAceHash = v20;

  }
  _MPLogCategoryAssistant();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_requestAceHash;
    objc_msgSend(v18, "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v23;
    v28 = 2114;
    v29 = v24;
    _os_log_impl(&dword_1CC97B000, v22, OS_LOG_TYPE_DEFAULT, "Get Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v26, 0x16u);

  }
  objc_msgSend(v18, "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v25);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
