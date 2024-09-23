@implementation EMHMERecipientCreationRequest

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EMHMERecipientCreationRequest_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1)
    dispatch_once(&log_onceToken_16, block);
  return (id)log_log_16;
}

void __36__EMHMERecipientCreationRequest_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;

}

- (EMHMERecipientCreationRequest)initWithAccount:(id)a3 recipient:(id)a4 hmeAddress:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMHMERecipientCreationRequest *v12;
  EMHMERecipientCreationRequest *v13;
  uint64_t v14;
  NSString *recipient;
  uint64_t v16;
  NSString *hmeAddress;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMHMERecipientCreationRequest;
  v12 = -[EMHMERecipientCreationRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    v14 = objc_msgSend(v10, "copy");
    recipient = v13->_recipient;
    v13->_recipient = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    hmeAddress = v13->_hmeAddress;
    v13->_hmeAddress = (NSString *)v16;

  }
  return v13;
}

+ (BOOL)canCreateHMEReplyToAddress:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.PremiumMailSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hmeGetReplyToAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "length") != 0;
  return (char)v3;
}

- (id)urlString
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[ACAccount propertiesForDataclass:](self->_account, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.PremiumMailSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hmeGetReplyToAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[EMHMERecipientCreationRequest log](EMHMERecipientCreationRequest, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "HME replyTo URL %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_httpBody
{
  NSString *hmeAddress;
  NSString *recipient;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  hmeAddress = self->_hmeAddress;
  v16[0] = CFSTR("hme");
  v16[1] = CFSTR("recipientEmail");
  recipient = self->_recipient;
  v17[0] = hmeAddress;
  v17[1] = recipient;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v6)
  {
    +[EMHMERecipientCreationRequest log](EMHMERecipientCreationRequest, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EMHMERecipientCreationRequest _httpBody].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EMHMERecipientCreationRequest;
  -[AARequest urlRequest](&v15, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[EMHMERecipientCreationRequest _httpBody](self, "_httpBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPBody:", v5);

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  objc_msgSend(MEMORY[0x1E0CFAC38], "udid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Client-UDID"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("ProductVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("CFBundleName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("CFBundleVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@ iOS/%@"), v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v13, CFSTR("User-agent"));

  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmeAddress, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)_httpBody
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "JSONSerialization error for body %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
