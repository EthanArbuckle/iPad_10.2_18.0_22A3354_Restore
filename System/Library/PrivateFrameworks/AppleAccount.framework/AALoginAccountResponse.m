@implementation AALoginAccountResponse

- (AALoginAccountResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AALoginAccountResponse *v4;
  AALoginAccountResponse *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AALoginAccountResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v9, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, a4, 1);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSHTTPURLResponse statusCode](v4->super.super._httpResponse, "statusCode");
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AALoginAccountResponse _parseResponse:responseBody:](v5, "_parseResponse:responseBody:", v6, v7);

  }
  return v5;
}

- (AALoginAccountResponse)initWithHttpStatus:(int64_t)a3 responseBody:(id)a4
{
  id v6;
  AALoginAccountResponse *v7;
  AALoginAccountResponse *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AALoginAccountResponse;
  v7 = -[AALoginAccountResponse init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[AALoginAccountResponse _parseResponse:responseBody:](v7, "_parseResponse:responseBody:", a3, v6);

  return v8;
}

- (void)_parseResponse:(int64_t)a3 responseBody:(id)a4
{
  NSNumber *v5;
  NSNumber *status;
  void *v7;
  NSString *v8;
  NSString *statusMessage;
  void *v10;
  NSDictionary *v11;
  NSDictionary *responseForDelegates;
  void *v13;
  NSString *v14;
  NSString *dsid;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AALoginResponseAppleAccountInfo *v20;
  AALoginResponseAppleAccountInfo *appleAccountInfo;
  void *v22;
  void *v23;
  AALoginResponseiCloudTokens *v24;
  AALoginResponseiCloudTokens *iCloudTokens;
  AALoginResponseDataclasses *v26;
  AALoginResponseDataclasses *dataclasses;
  id v28;

  if (a3 == 200)
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("status"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    status = self->_status;
    self->_status = v5;

    -[AAResponse responseDictionary](self, "responseDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("status-message"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    statusMessage = self->_statusMessage;
    self->_statusMessage = v8;

    -[AAResponse responseDictionary](self, "responseDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("delegates"));
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    responseForDelegates = self->_responseForDelegates;
    self->_responseForDelegates = v11;

    -[AAResponse responseDictionary](self, "responseDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("dsid"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    dsid = self->_dsid;
    self->_dsid = v14;

    -[NSDictionary objectForKeyedSubscript:](self->_responseForDelegates, "objectForKeyedSubscript:", CFSTR("com.apple.mobileme"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("status-message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if (!objc_msgSend(v16, "integerValue"))
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("service-data"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", CFSTR("appleAccountInfo"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "copy");

        v20 = -[AALoginResponseAppleAccountInfo initWithDictionary:]([AALoginResponseAppleAccountInfo alloc], "initWithDictionary:", v19);
        appleAccountInfo = self->_appleAccountInfo;
        self->_appleAccountInfo = v20;

        objc_msgSend(v17, "objectForKey:", CFSTR("tokens"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");

        v24 = -[AALoginResponseiCloudTokens initWithTokens:]([AALoginResponseiCloudTokens alloc], "initWithTokens:", v23);
        iCloudTokens = self->_iCloudTokens;
        self->_iCloudTokens = v24;

        v26 = -[AALoginResponseDataclasses initWithiCloudServiceData:]([AALoginResponseDataclasses alloc], "initWithiCloudServiceData:", v17);
        dataclasses = self->_dataclasses;
        self->_dataclasses = v26;

      }
    }

  }
}

- (id)responseParametersForServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AALoginAccountResponse responseForDelegates](self, "responseForDelegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)convertToProvisioningResponse
{
  void *v2;
  void *v3;
  void *v4;
  AAProvisioningResponse *v5;

  -[AALoginAccountResponse responseParametersForServiceIdentifier:](self, "responseParametersForServiceIdentifier:", CFSTR("com.apple.mobileme"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("service-data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("com.apple.mobileme"));
  v5 = -[AAProvisioningResponse initWithDictionary:]([AAProvisioningResponse alloc], "initWithDictionary:", v4);

  return v5;
}

- (id)convertToLoginDelegatesResponse
{
  AALoginDelegatesResponse *v3;
  void *v4;
  void *v5;
  AALoginDelegatesResponse *v6;

  v3 = [AALoginDelegatesResponse alloc];
  -[AAResponse httpResponse](self, "httpResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAResponse data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AAResponse initWithHTTPResponse:data:](v3, "initWithHTTPResponse:data:", v4, v5);

  return v6;
}

- (AALoginAccountResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AALoginAccountResponse;
  return -[AACodableResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AALoginAccountResponse;
  -[AACodableResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)status
{
  return self->_status;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (NSDictionary)responseForDelegates
{
  return self->_responseForDelegates;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (AALoginResponseAppleAccountInfo)appleAccountInfo
{
  return self->_appleAccountInfo;
}

- (AALoginResponseiCloudTokens)iCloudTokens
{
  return self->_iCloudTokens;
}

- (AALoginResponseDataclasses)dataclasses
{
  return self->_dataclasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_iCloudTokens, 0);
  objc_storeStrong((id *)&self->_appleAccountInfo, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_responseForDelegates, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
