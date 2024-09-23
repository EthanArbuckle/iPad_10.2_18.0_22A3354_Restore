@implementation CDPQuotaStorageAppListRequest

- (CDPQuotaStorageAppListRequest)initWithAccount:(id)a3 isWalrusEnabled:(BOOL)a4
{
  id v7;
  CDPQuotaStorageAppListRequest *v8;
  CDPQuotaStorageAppListRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPQuotaStorageAppListRequest;
  v8 = -[CDPQuotaStorageAppListRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a3);
    v9->_isWalrusEnabled = a4;
  }

  return v9;
}

- (id)_urlStringFormatFromBag
{
  NSString *urlStringFormat;
  void *v4;
  NSString *v5;
  NSString *v6;

  urlStringFormat = self->_urlStringFormat;
  if (!urlStringFormat)
  {
    -[ACAccount propertiesForDataclass:](self->_account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("storageAppListURL"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlStringFormat;
    self->_urlStringFormat = v5;

    urlStringFormat = self->_urlStringFormat;
  }
  return urlStringFormat;
}

- (BOOL)isUrlAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ACAccount aa_personID](self->_account, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CDPQuotaStorageAppListRequest _urlStringFormatFromBag](self, "_urlStringFormatFromBag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)urlString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[CDPQuotaStorageAppListRequest isUrlAvailable](self, "isUrlAvailable"))
  {
    -[CDPQuotaStorageAppListRequest _urlStringFormatFromBag](self, "_urlStringFormatFromBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BE04BE0];
    -[ACAccount aa_personID](self->_account, "aa_personID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BE04BF0];
    objc_msgSend(MEMORY[0x24BE04958], "udid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPQuotaStorageAppListRequest;
  -[AARequest urlRequest](&v9, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v4, "ak_addAnisetteHeaders");
  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addClientTimeHeader");
  objc_msgSend(v4, "ak_addTimeZoneHeaders");
  objc_msgSend(v4, "ak_addLocaleHeader");
  objc_msgSend(v4, "ak_addCountryHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  objc_msgSend(MEMORY[0x24BE04958], "userAgentHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));

  objc_msgSend(MEMORY[0x24BE04958], "udid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Client-UDID"));

  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/x-buddyml"), CFSTR("Accept"));
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  -[CDPQuotaStorageAppListRequest _acceptedLanguageString](self, "_acceptedLanguageString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v7, CFSTR("Accept-Language"));

  if (!self->_isWalrusEnabled)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", *MEMORY[0x24BE0AC70], CFSTR("x-apple-storageapplist-nadp"));
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  return v4;
}

- (id)_acceptedLanguageString
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "minimizedLanguagesFromLanguages:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("en");
  v6 = v4;

  return v6;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_urlStringFormat, 0);
}

@end
