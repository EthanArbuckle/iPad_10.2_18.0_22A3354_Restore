@implementation AFRemoteRequest

- (AFRemoteRequest)initWithInfo:(id)a3
{
  id v5;
  AFRemoteRequest *v6;
  AFRemoteRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFRemoteRequest;
  v6 = -[AFRemoteRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_info, a3);

  return v7;
}

- (void)sendWithCompletion:(id)a3
{
  id v4;
  AFSettingsConnection *v5;
  AFRequestInfo *info;
  NSString *peerIdentifier;
  AFSettingsConnection *v8;
  id v9;
  _QWORD v10[5];
  AFSettingsConnection *v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(AFSettingsConnection);
  info = self->_info;
  peerIdentifier = self->_peerIdentifier;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__AFRemoteRequest_sendWithCompletion___block_invoke;
  v10[3] = &unk_1E3A32E00;
  v11 = v5;
  v12 = v4;
  v10[4] = self;
  v8 = v5;
  v9 = v4;
  -[AFSettingsConnection startRemoteRequest:onPeer:completion:](v8, "startRemoteRequest:onPeer:completion:", info, peerIdentifier, v10);

}

- (AFRequestInfo)info
{
  return self->_info;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

uint64_t __38__AFRemoteRequest_sendWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 != 0, a2);
  return result;
}

@end
