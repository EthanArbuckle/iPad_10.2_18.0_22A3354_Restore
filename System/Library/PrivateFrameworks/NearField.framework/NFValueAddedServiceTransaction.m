@implementation NFValueAddedServiceTransaction

- (NFValueAddedServiceTransaction)initWithDictionary:(id)a3
{
  id v4;
  NFValueAddedServiceTransaction *v5;
  uint64_t v6;
  NSData *merchantId;
  uint64_t v8;
  NSString *signupUrl;
  uint64_t v10;
  NSNumber *terminalAppVersion;
  uint64_t v12;
  NSNumber *terminalMode;
  uint64_t v14;
  NSData *passData;
  uint64_t v16;
  NSData *token;
  uint64_t v18;
  NSNumber *filter;
  uint64_t v20;
  NSNumber *filterType;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  NSNumber *didSucceed;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = -[NFValueAddedServiceTransaction init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MerchantId"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignupUrl"));
    v8 = objc_claimAutoreleasedReturnValue();
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalAppVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalMode"));
    v12 = objc_claimAutoreleasedReturnValue();
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PassData"));
    v14 = objc_claimAutoreleasedReturnValue();
    passData = v5->_passData;
    v5->_passData = (NSData *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Token"));
    v16 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSData *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Filter"));
    v18 = objc_claimAutoreleasedReturnValue();
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FilterType"));
    v20 = objc_claimAutoreleasedReturnValue();
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Error"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v5->_error, v22);
        v23 = -[NSError code](v5->_error, "code") == 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
        v24 = objc_claimAutoreleasedReturnValue();
        didSucceed = v5->_didSucceed;
        v5->_didSucceed = (NSNumber *)v24;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Result"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_result = objc_msgSend(v26, "unsignedIntValue");
    }

  }
  return v5;
}

- (NFValueAddedServiceTransaction)initWithCoder:(id)a3
{
  id v4;
  NFValueAddedServiceTransaction *v5;
  uint64_t v6;
  NSData *merchantId;
  uint64_t v8;
  NSString *signupUrl;
  uint64_t v10;
  NSNumber *terminalAppVersion;
  uint64_t v12;
  NSNumber *terminalMode;
  uint64_t v14;
  NSData *passData;
  uint64_t v16;
  NSData *token;
  uint64_t v18;
  NSError *error;
  uint64_t v20;
  NSNumber *didSucceed;
  uint64_t v22;
  NSNumber *filter;
  uint64_t v24;
  NSNumber *filterType;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NFValueAddedServiceTransaction;
  v5 = -[NFValueAddedServiceTransaction init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MerchantId"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SignupUrl"));
    v8 = objc_claimAutoreleasedReturnValue();
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TerminalAppVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    terminalAppVersion = v5->_terminalAppVersion;
    v5->_terminalAppVersion = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TerminalMode"));
    v12 = objc_claimAutoreleasedReturnValue();
    terminalMode = v5->_terminalMode;
    v5->_terminalMode = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PassData"));
    v14 = objc_claimAutoreleasedReturnValue();
    passData = v5->_passData;
    v5->_passData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Token"));
    v16 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Error"));
    v18 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DidSucceed"));
    v20 = objc_claimAutoreleasedReturnValue();
    didSucceed = v5->_didSucceed;
    v5->_didSucceed = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Filter"));
    v22 = objc_claimAutoreleasedReturnValue();
    filter = v5->_filter;
    v5->_filter = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FilterType"));
    v24 = objc_claimAutoreleasedReturnValue();
    filterType = v5->_filterType;
    v5->_filterType = (NSNumber *)v24;

    v5->_result = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Result"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *merchantId;
  id v5;

  merchantId = self->_merchantId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", merchantId, CFSTR("MerchantId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signupUrl, CFSTR("SignupUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalAppVersion, CFSTR("TerminalAppVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalMode, CFSTR("TerminalMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passData, CFSTR("PassData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("Token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("Error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_didSucceed, CFSTR("DidSucceed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filter, CFSTR("Filter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterType, CFSTR("FilterType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("Result"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unsigned int v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  const __CFString *v12;
  objc_super v13;

  v3 = -[NSNumber intValue](self->_terminalMode, "intValue") - 1;
  if (v3 > 7)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E3B51C60[v3];
  v12 = v4;
  v5 = (int)self->_result;
  if (v5 > 4)
    v6 = CFSTR("Unknown Error");
  else
    v6 = off_1E3B51CA0[v5];
  v11 = v6;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)NFValueAddedServiceTransaction;
  -[NFValueAddedServiceTransaction description](&v13, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ { merchantID=\"%@\" signupURL=%@ terminalAppVersion=%@ terminalModeDescription=%@ terminalMode=%@ filter=%@ filterType=%@ didSucceed=%@ passData=%@ token=%@ errorCode=0x%04x error=%@ result=0x%04x resultDescription=%@ }"), v8, self->_merchantId, self->_signupUrl, self->_terminalAppVersion, v12, self->_terminalMode, self->_filter, self->_filterType, self->_didSucceed, self->_passData, self->_token, -[NSError code](self->_error, "code"), self->_error, self->_result, v11);

  return v9;
}

- (id)asDictionary
{
  unsigned int v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSData *merchantId;
  NSString *signupUrl;
  NSNumber *terminalAppVersion;
  NSNumber *terminalMode;
  NSNumber *filter;
  NSNumber *filterType;
  NSNumber *didSucceed;
  NSData *passData;
  NSData *token;
  void *v18;
  void *v19;
  void *v20;

  v3 = -[NSNumber intValue](self->_terminalMode, "intValue") - 1;
  if (v3 > 7)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E3B51C60[v3];
  v5 = (int)self->_result;
  if (v5 > 4)
    v6 = CFSTR("Unknown Error");
  else
    v6 = off_1E3B51CA0[v5];
  v7 = (void *)objc_opt_new();
  v8 = v7;
  merchantId = self->_merchantId;
  if (merchantId)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", merchantId, CFSTR("merchantID"));
  signupUrl = self->_signupUrl;
  if (signupUrl)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", signupUrl, CFSTR("signupURL"));
  terminalAppVersion = self->_terminalAppVersion;
  if (terminalAppVersion)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", terminalAppVersion, CFSTR("terminalAppVersion"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("terminalModeDescription"));
  terminalMode = self->_terminalMode;
  if (terminalMode)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", terminalMode, CFSTR("terminalMode"));
  filter = self->_filter;
  if (filter)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", filter, CFSTR("filter"));
  filterType = self->_filterType;
  if (filterType)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", filterType, CFSTR("filterType"));
  didSucceed = self->_didSucceed;
  if (didSucceed)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", didSucceed, CFSTR("didSucceed"));
  passData = self->_passData;
  if (passData)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", passData, CFSTR("passData"));
  token = self->_token;
  if (token)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", token, CFSTR("token"));
  if (self->_error)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%04x"), -[NSError code](self->_error, "code"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("errorCode"));

    -[NSError description](self->_error, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("error"));

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("resultDescription"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_result);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("result"));

  return v8;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (NSString)signupUrl
{
  return self->_signupUrl;
}

- (NSNumber)terminalAppVersion
{
  return self->_terminalAppVersion;
}

- (NSNumber)terminalMode
{
  return self->_terminalMode;
}

- (NSNumber)didSucceed
{
  return self->_didSucceed;
}

- (NSData)passData
{
  return self->_passData;
}

- (NSData)token
{
  return self->_token;
}

- (NSError)error
{
  return self->_error;
}

- (NSNumber)filter
{
  return self->_filter;
}

- (NSNumber)filterType
{
  return self->_filterType;
}

- (unsigned)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_didSucceed, 0);
  objc_storeStrong((id *)&self->_terminalMode, 0);
  objc_storeStrong((id *)&self->_terminalAppVersion, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end
