@implementation AAFamilyEligibilityRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyEligibilityURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAFamilyEligibilityRequest;
  -[AAFamilyRequest urlRequest](&v8, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!self->_iTunesAccount)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "No iTunes account provided to family eligibility request.", v7, 2u);
    }

  }
  return v4;
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
}

@end
