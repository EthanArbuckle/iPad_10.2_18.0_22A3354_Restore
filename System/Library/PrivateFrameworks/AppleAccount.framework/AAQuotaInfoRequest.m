@implementation AAQuotaInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v3;
  __CFString *v4;
  ACAccount *account;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[ACAccount aa_personID](self->_account, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_isDetailedRequest)
      v4 = CFSTR("storageInfoURL");
    else
      v4 = CFSTR("quotaInfoURL");
    account = self->_account;
    v6 = v4;
    -[ACAccount propertiesForDataclass:](account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccount aa_personID](self->_account, "aa_personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$DS_PRS_ID$"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[AADeviceInfo udid](AADeviceInfo, "udid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$UDID$"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (AAQuotaInfoRequest)initWithAccount:(id)a3
{
  id v5;
  AAQuotaInfoRequest *v6;
  AAQuotaInfoRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAQuotaInfoRequest;
  v6 = -[AAQuotaInfoRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)initDetailedRequestWithAccount:(id)a3
{
  id result;

  result = -[AAQuotaInfoRequest initWithAccount:](self, "initWithAccount:", a3);
  if (result)
    *((_BYTE *)result + 64) = 1;
  return result;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AAQuotaInfoRequest;
  -[AARequest urlRequest](&v13, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Client-UDID"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@ %@/%@"), v9, v10, CFSTR("ProductName"), CFSTR("ProductVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v11, CFSTR("User-agent"));
  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
