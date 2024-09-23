@implementation AAUIQuotaRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAUIQuotaRequest)initWithAccount:(id)a3
{
  id v5;
  AAUIQuotaRequest *v6;
  AAUIQuotaRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIQuotaRequest;
  v6 = -[AAUIQuotaRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)initDetailedRequestWithAccount:(id)a3
{
  id result;

  result = -[AAUIQuotaRequest initWithAccount:](self, "initWithAccount:", a3);
  if (result)
    *((_BYTE *)result + 72) = 1;
  return result;
}

- (id)urlString
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[ACAccount aa_personID](self->_account, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_isDetailedRequest)
      v4 = CFSTR("storageInfoURL");
    else
      v4 = CFSTR("quotaInfoURL");
    -[ACAccount propertiesForDataclass:](self->_account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0CFAE70];
    -[ACAccount aa_personID](self->_account, "aa_personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0CFAE80];
    objc_msgSend(MEMORY[0x1E0CFAC38], "udid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AAUIQuotaRequest;
  -[AARequest urlRequest](&v22, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ACAccount aa_personID](self->_account, "aa_personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_authToken](self->_account, "aa_authToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v9, CFSTR("Authorization"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", CFSTR("ProductVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@ iOS/%@"), v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v16, CFSTR("User-agent"));
  objc_msgSend(MEMORY[0x1E0CFAC38], "clientInfoHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v17, CFSTR("X-MMe-Client-Info"));
  objc_msgSend(MEMORY[0x1E0CFAC38], "udid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v18, CFSTR("X-Client-UDID"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
