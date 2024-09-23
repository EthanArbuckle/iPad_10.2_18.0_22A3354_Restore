@implementation SLWebUserInfoResponse

- (SLWebUserInfoResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLWebUserInfoResponse *v12;
  SLWebUserInfoResponse *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  id v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLWebUserInfoResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v22.receiver = self;
  v22.super_class = (Class)SLWebUserInfoResponse;
  v12 = -[SLWebUserInfoResponse init](&v22, sel_init, v19, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v10, "statusCode");
      v13->_statusCode = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLWebUserInfoResponse httpResponse status code %@"));

      if (!v13->_error)
      {
        v21 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v21, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v21;
        v17 = v21;
        if (v17)
          objc_storeStrong((id *)&v13->_error, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SLWebUserInfoResponse _populateDataFromResponseDictionary:](v13, "_populateDataFromResponseDictionary:", v15);
        else
          _SLLog(v5, 7, CFSTR("SLWebUserInfoResponse response JSON data does not represent NSDictionary. Game over."));

      }
    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLWebUserInfoResponse response is not NSHTTPURLResponse. Game over."));
    }
  }

  return v13;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)emailAddress
{
  return (NSString *)-[NSArray firstObject](self->_emailAddresses, "firstObject");
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
