@implementation AAAvailabilityRequest

- (AAAvailabilityRequest)initWithAccount:(id)a3
{
  id v5;
  AAAvailabilityRequest *v6;
  AAAvailabilityRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAAvailabilityRequest;
  v6 = -[AAAvailabilityRequest init](&v9, sel_init);
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[16];

  -[ACAccount dataclassProperties](self->_account, "dataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C8F358]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Error! AAAvailabilityRequest could not find a base URL.", buf, 2u);
    }

    goto LABEL_7;
  }
  -[ACAccount aa_personID](self->_account, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount aa_personID](self->_account, "aa_personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@/sharedstreams/status?feature=photos"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
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
  v10.super_class = (Class)AAAvailabilityRequest;
  -[AARequest urlRequest](&v10, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AAAvailabilityRequest urlString](self, "urlString");
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
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("dHUDegar6MCO"), CFSTR("x-apple-mme-sharedstreams-version"));
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
