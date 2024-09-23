@implementation AADeviceListRequest

- (AADeviceListRequest)initWithAccount:(id)a3
{
  id v5;
  AADeviceListRequest *v6;
  AADeviceListRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADeviceListRequest;
  v6 = -[AADeviceListRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDeviceListURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACAccount aa_personID](self->_account, "aa_personID");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
      v5 = v4;
  }
  else
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Error! AADeviceListRequest could not find a base URL.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)AADeviceListRequest;
  -[AARequest urlRequest](&v10, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AADeviceListRequest urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setURL:", v6);

    objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);

    }
    objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
