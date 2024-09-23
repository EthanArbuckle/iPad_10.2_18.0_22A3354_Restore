@implementation FAFamilySetupBuddyMLRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)urlString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04A78], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familySetupUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSString *inviteCode;
  void *v7;
  uint8_t v9[8];
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)FAFamilySetupBuddyMLRequest;
  -[AAFamilyRequest urlRequest](&v10, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_iTunesAccount)
  {
    objc_msgSend(v4, "fam_addiTunesHeadersWithAccount:");
  }
  else
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "No iTunes account provided to family setup UI request.", v9, 2u);
    }

  }
  inviteCode = self->_inviteCode;
  if (inviteCode)
  {
    v11 = CFSTR("invite-code");
    v12[0] = inviteCode;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_setBodyWithParameters:", v7);

  }
  return v4;
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (NSString)inviteCode
{
  return self->_inviteCode;
}

- (void)setInviteCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteCode, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
}

@end
