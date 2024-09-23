@implementation MPAssistantDislikesMediaEntity

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantDislikesMediaEntity aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Dislikes Media Entity"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Dislikes Media Entity (invoke) <%{public}@>: invoked", buf, 0xCu);
  }

  v10 = self->_requestAceHash;
  -[SAMPDislikesMediaEntity influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMPDislikesMediaEntity influencedUserSharedUserId](self, "influencedUserSharedUserId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1CC9A8AB4;
  v14[3] = &unk_1E88E3E10;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  sub_1CC995BFC(CFSTR("Dislikes Media Entity"), v10, v11, v12, v14);

}

- (void)_performWithCompletion:(id)a3
{
  id v4;
  NSString *requestAceHash;
  ICUserIdentity *userIdentity;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  requestAceHash = self->_requestAceHash;
  userIdentity = self->_userIdentity;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1CC9A898C;
  v8[3] = &unk_1E88E3D48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  sub_1CC995028(CFSTR("Dislikes Media Entity"), requestAceHash, 22, userIdentity, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
