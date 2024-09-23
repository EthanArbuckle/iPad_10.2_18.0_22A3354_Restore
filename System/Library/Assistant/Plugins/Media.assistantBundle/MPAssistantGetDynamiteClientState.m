@implementation MPAssistantGetDynamiteClientState

- (void)performWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *requestAceHash;
  NSObject *v9;
  NSString *v10;
  id v11;
  id v12;
  _QWORD v13[7];
  uint8_t buf[4];
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D88448]);
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetDynamiteClientState aceId](self, "aceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Dynamite Client State"), v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v7;

  }
  _MPLogCategoryAssistant();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl(&dword_1CC97B000, v9, OS_LOG_TYPE_DEFAULT, "Get Dynamite Client State (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1CC9A8F54;
  v13[3] = &unk_1E88E3C58;
  v13[4] = self;
  v13[5] = v5;
  v13[6] = v4;
  v11 = v4;
  v12 = v5;
  sub_1CC9A8F54((uint64_t)v13, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
