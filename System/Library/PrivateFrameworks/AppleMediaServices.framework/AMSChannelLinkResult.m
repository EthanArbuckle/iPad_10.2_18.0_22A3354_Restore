@implementation AMSChannelLinkResult

- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4
{
  return -[AMSChannelLinkResult initWithResponse:linkParams:supplementaryFields:](self, "initWithResponse:linkParams:supplementaryFields:", a3, a4, 0);
}

- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4 supplementaryFields:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSChannelLinkResult *v12;
  AMSChannelLinkResult *v13;
  void *v14;
  NSString *v15;
  NSString *channelCustomerId;
  void *v17;
  NSString *v18;
  NSString *productCode;
  void *v20;
  NSNumber *v21;
  NSNumber *statusCode;
  void *error;
  id v24;
  uint64_t v25;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)AMSChannelLinkResult;
  v12 = -[AMSChannelLinkResult init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_response, a3);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("channelCustomerId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    channelCustomerId = v13->_channelCustomerId;
    v13->_channelCustomerId = v15;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("productCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    productCode = v13->_productCode;
    v13->_productCode = v18;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    statusCode = v13->_statusCode;
    v13->_statusCode = v21;

    objc_storeStrong((id *)&v13->_linkParams, a4);
    objc_storeStrong((id *)&v13->_supplementaryFields, a5);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("error"));
    error = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = error;

      if (!v24)
      {
LABEL_16:

        goto LABEL_17;
      }
      AMSError(12, CFSTR("Channel link failure"), v24, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      error = v13->_error;
      v13->_error = (NSError *)v25;
    }
    else
    {
      v24 = 0;
    }

    goto LABEL_16;
  }
LABEL_17:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AMSChannelLinkResult channelCustomerId](self, "channelCustomerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("channelCustomerId"));

  -[AMSChannelLinkResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

  -[AMSChannelLinkResult linkParams](self, "linkParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("linkParams"));

  -[AMSChannelLinkResult productCode](self, "productCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productCode"));

  -[AMSChannelLinkResult response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("response"));

  -[AMSChannelLinkResult statusCode](self, "statusCode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("statusCode"));

}

- (AMSChannelLinkResult)initWithCoder:(id)a3
{
  id v4;
  AMSChannelLinkResult *v5;
  uint64_t v6;
  NSString *channelCustomerId;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  AMSChannelLinkParams *linkParams;
  uint64_t v12;
  NSString *productCode;
  void *v14;
  uint64_t v15;
  NSDictionary *response;
  uint64_t v17;
  NSNumber *statusCode;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSChannelLinkResult;
  v5 = -[AMSChannelLinkResult init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channelCustomerId"));
    v6 = objc_claimAutoreleasedReturnValue();
    channelCustomerId = v5->_channelCustomerId;
    v5->_channelCustomerId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkParams"));
    v10 = objc_claimAutoreleasedReturnValue();
    linkParams = v5->_linkParams;
    v5->_linkParams = (AMSChannelLinkParams *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    productCode = v5->_productCode;
    v5->_productCode = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("response"));
    v15 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusCode"));
    v17 = objc_claimAutoreleasedReturnValue();
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)channelCustomerId
{
  return self->_channelCustomerId;
}

- (AMSChannelLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSString)productCode
{
  return self->_productCode;
}

- (NSSet)supplementaryFields
{
  return self->_supplementaryFields;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)response
{
  return self->_response;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_supplementaryFields, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_storeStrong((id *)&self->_channelCustomerId, 0);
}

@end
