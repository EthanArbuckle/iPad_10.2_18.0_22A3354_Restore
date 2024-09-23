@implementation NFVASResponse

+ (BOOL)validateDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Token"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PassData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StatusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      v6 = 0;
      v4 = v5;
      goto LABEL_15;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !+[NFVASRequest validateDictionary:](NFVASRequest, "validateDictionary:", v4))
    {
LABEL_13:
      v6 = 0;
      goto LABEL_15;
    }
  }
  v6 = 1;
LABEL_15:

  return v6;
}

- (NFVASResponse)initWithDictionary:(id)a3
{
  id v4;
  NFVASResponse *v5;
  uint64_t v6;
  NSData *token;
  uint64_t v8;
  NSData *vasData;
  uint64_t v10;
  NSNumber *statusCode;
  uint64_t v12;
  NSNumber *mobileCapabilities;
  void *v14;
  NFVASRequest *v15;
  NFVASRequest *request;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NFVASResponse;
  v5 = -[NFVASResponse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PassData"));
    v8 = objc_claimAutoreleasedReturnValue();
    vasData = v5->_vasData;
    v5->_vasData = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MobileCapabilities"));
    v12 = objc_claimAutoreleasedReturnValue();
    mobileCapabilities = v5->_mobileCapabilities;
    v5->_mobileCapabilities = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Request"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[NFVASRequest initWithDictionary:]([NFVASRequest alloc], "initWithDictionary:", v14);
      request = v5->_request;
      v5->_request = v15;

    }
  }

  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  NSData *token;
  NSData *vasData;
  NSNumber *statusCode;
  NSNumber *mobileCapabilities;
  NFVASRequest *request;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  token = self->_token;
  if (token)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", token, CFSTR("Token"));
  vasData = self->_vasData;
  if (vasData)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", vasData, CFSTR("PassData"));
  statusCode = self->_statusCode;
  if (statusCode)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", statusCode, CFSTR("StatusCode"));
  mobileCapabilities = self->_mobileCapabilities;
  if (mobileCapabilities)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mobileCapabilities, CFSTR("MobileCapabilities"));
  request = self->_request;
  if (request)
  {
    -[NFVASRequest asDictionary](request, "asDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Request"));

  }
  return v4;
}

- (BOOL)paymentSupported
{
  return (-[NSNumber unsignedCharValue](self->_mobileCapabilities, "unsignedCharValue") >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFVASResponse;
  -[NFVASResponse description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ status=0x%04x data=%@ token=%@ mobileCapabilities=%@ request=%@"), v4, -[NSNumber unsignedIntValue](self->_statusCode, "unsignedIntValue"), self->_vasData, self->_token, self->_mobileCapabilities, self->_request);

  return v5;
}

- (NFVASRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSData)vasData
{
  return self->_vasData;
}

- (void)setVasData:(id)a3
{
  objc_storeStrong((id *)&self->_vasData, a3);
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSNumber)mobileCapabilities
{
  return self->_mobileCapabilities;
}

- (void)setMobileCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_mobileCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCapabilities, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
