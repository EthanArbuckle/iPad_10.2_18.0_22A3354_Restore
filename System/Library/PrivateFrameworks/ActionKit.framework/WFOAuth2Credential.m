@implementation WFOAuth2Credential

- (WFOAuth2Credential)initWithResponseObject:(id)a3
{
  id v4;
  WFOAuth2Credential *v5;
  uint64_t v6;
  NSDictionary *responseObject;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSString *accessToken;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSString *tokenType;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSString *refreshToken;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSDate *expirationDate;
  WFOAuth2Credential *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WFOAuth2Credential;
  v5 = -[WFOAuth2Credential init](&v35, sel_init);
  if (!v5)
    goto LABEL_17;
  v6 = objc_msgSend(v4, "copy");
  responseObject = v5->_responseObject;
  v5->_responseObject = (NSDictionary *)v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("access_token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v8;
  v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  v11 = v10;

  v12 = objc_msgSend(v11, "copy");
  accessToken = v5->_accessToken;
  v5->_accessToken = (NSString *)v12;

  if (-[NSString length](v5->_accessToken, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token_type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = objc_msgSend(v17, "copy");
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("refresh_token"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v24 = objc_msgSend(v23, "copy");
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expires_in"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v29, "doubleValue");
      objc_msgSend(v30, "dateWithTimeIntervalSinceNow:");
      v31 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v31;
    }
    else
    {
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = 0;
    }

    v33 = v5;
  }
  else
  {
LABEL_17:
    v33 = 0;
  }

  return v33;
}

- (NSString)tokenType
{
  if (self->_tokenType)
    return self->_tokenType;
  else
    return (NSString *)CFSTR("bearer");
}

- (BOOL)isValid
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  -[WFOAuth2Credential refreshToken](self, "refreshToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[WFOAuth2Credential accessToken](self, "accessToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = !-[WFOAuth2Credential isExpired](self, "isExpired");
    else
      LOBYTE(v4) = 0;

  }
  return v4;
}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  BOOL v4;

  -[WFOAuth2Credential expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 < 0.0;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  WFOAuth2Credential *v5;
  NSString *accessToken;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSString *refreshToken;
  NSString *v12;
  NSString *v13;
  NSDate *expirationDate;
  uint64_t v15;
  void *v16;
  NSDate *v17;
  void *v18;

  v5 = (WFOAuth2Credential *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      accessToken = self->_accessToken;
      -[WFOAuth2Credential accessToken](v5, "accessToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](accessToken, "isEqualToString:", v7))
      {
        v10 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[WFOAuth2Credential tokenType](self, "tokenType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOAuth2Credential tokenType](v5, "tokenType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:options:", v9, 1))
      {
        v10 = 0;
LABEL_18:

        goto LABEL_19;
      }
      refreshToken = self->_refreshToken;
      -[WFOAuth2Credential refreshToken](v5, "refreshToken");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (refreshToken == v12
        || (v13 = self->_refreshToken,
            -[WFOAuth2Credential refreshToken](v5, "refreshToken"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v13, "isEqualToString:", v3)))
      {
        expirationDate = self->_expirationDate;
        -[WFOAuth2Credential expirationDate](v5, "expirationDate");
        v15 = objc_claimAutoreleasedReturnValue();
        if (expirationDate == (NSDate *)v15)
        {

          v10 = 1;
        }
        else
        {
          v16 = (void *)v15;
          v17 = self->_expirationDate;
          -[WFOAuth2Credential expirationDate](v5, "expirationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[NSDate isEqualToDate:](v17, "isEqualToDate:", v18);

        }
        if (refreshToken == v12)
          goto LABEL_17;
      }
      else
      {
        v10 = 0;
      }

LABEL_17:
      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_accessToken, "hash");
  v4 = -[NSString hash](self->_refreshToken, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_expirationDate, "hash");
}

- (WFOAuth2Credential)initWithCoder:(id)a3
{
  id v4;
  WFOAuth2Credential *v5;
  uint64_t v6;
  NSString *accessToken;
  uint64_t v8;
  NSString *tokenType;
  uint64_t v10;
  NSString *refreshToken;
  uint64_t v12;
  NSDate *expirationDate;
  WFOAuth2Credential *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFOAuth2Credential;
  v5 = -[WFOAuth2Credential init](&v16, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessToken")),
        v6 = objc_claimAutoreleasedReturnValue(),
        accessToken = v5->_accessToken,
        v5->_accessToken = (NSString *)v6,
        accessToken,
        -[NSString length](v5->_accessToken, "length")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenType"));
    v8 = objc_claimAutoreleasedReturnValue();
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessToken;
  id v5;

  accessToken = self->_accessToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessToken, CFSTR("accessToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenType, CFSTR("tokenType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshToken, CFSTR("refreshToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)responseObject
{
  return self->_responseObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseObject, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
