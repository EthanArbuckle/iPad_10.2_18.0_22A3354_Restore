@implementation AMSCarrierLinkResult

- (AMSCarrierLinkResult)initWithResponse:(id)a3 linkParams:(id)a4
{
  id v7;
  id v8;
  AMSCarrierLinkResult *v9;
  AMSCarrierLinkResult *v10;
  void *v11;
  NSString *v12;
  NSString *channelCustomerId;
  void *v14;
  NSString *v15;
  NSString *productCode;
  void *v17;
  NSNumber *v18;
  NSNumber *statusCode;
  void *error;
  id v21;
  uint64_t v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AMSCarrierLinkResult;
  v9 = -[AMSCarrierLinkResult init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("channelCustomerId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    channelCustomerId = v10->_channelCustomerId;
    v10->_channelCustomerId = v12;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("productCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    productCode = v10->_productCode;
    v10->_productCode = v15;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    statusCode = v10->_statusCode;
    v10->_statusCode = v18;

    objc_storeStrong((id *)&v10->_linkParams, a4);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("error"));
    error = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = error;

      if (!v21)
      {
LABEL_16:

        goto LABEL_17;
      }
      AMSError(12, CFSTR("Carrier link failure"), v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      error = v10->_error;
      v10->_error = (NSError *)v22;
    }
    else
    {
      v21 = 0;
    }

    goto LABEL_16;
  }
LABEL_17:

  return v10;
}

- (AMSCarrierLinkResult)initWithChannelLinkResult:(id)a3
{
  id v4;
  void *v5;
  AMSCarrierLinkParams *v6;
  void *v7;
  void *v8;
  AMSCarrierLinkParams *v9;
  AMSCarrierLinkResult *v10;

  v4 = a3;
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [AMSCarrierLinkParams alloc];
  objc_msgSend(v4, "linkParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "linkParamsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSCarrierLinkParams initWithString:](v6, "initWithString:", v8);

  v10 = -[AMSCarrierLinkResult initWithResponse:linkParams:](self, "initWithResponse:linkParams:", v5, v9);
  return v10;
}

- (AMSCarrierLinkResult)initWithLinkParams:(id)a3 channelCustomerId:(id)a4 productCode:(id)a5 statusCode:(id)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  AMSCarrierLinkResult *v16;
  NSDictionary *v17;
  void *v18;
  NSDictionary *response;
  id v21;
  id v22;
  objc_super v23;

  v21 = a3;
  v22 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSCarrierLinkResult;
  v16 = -[AMSCarrierLinkResult init](&v23, sel_init);
  if (v16)
  {
    v17 = (NSDictionary *)objc_opt_new();
    objc_storeStrong((id *)&v16->_channelCustomerId, a4);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v22, CFSTR("channelCustomerId"), v21);
    objc_storeStrong((id *)&v16->_productCode, a5);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, CFSTR("productCode"));
    objc_storeStrong((id *)&v16->_statusCode, a6);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v14, CFSTR("status"));
    objc_storeStrong((id *)&v16->_linkParams, a3);
    objc_storeStrong((id *)&v16->_error, a7);
    objc_msgSend(v15, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, CFSTR("error"));

    response = v16->_response;
    v16->_response = v17;

  }
  return v16;
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
  -[AMSCarrierLinkResult channelCustomerId](self, "channelCustomerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("channelCustomerId"));

  -[AMSCarrierLinkResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

  -[AMSCarrierLinkResult linkParams](self, "linkParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("linkParams"));

  -[AMSCarrierLinkResult productCode](self, "productCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productCode"));

  -[AMSCarrierLinkResult response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("response"));

  -[AMSCarrierLinkResult statusCode](self, "statusCode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("statusCode"));

}

- (AMSCarrierLinkResult)initWithCoder:(id)a3
{
  id v4;
  AMSCarrierLinkResult *v5;
  uint64_t v6;
  NSString *channelCustomerId;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  AMSCarrierLinkParams *linkParams;
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
  v20.super_class = (Class)AMSCarrierLinkResult;
  v5 = -[AMSCarrierLinkResult init](&v20, sel_init);
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
    v5->_linkParams = (AMSCarrierLinkParams *)v10;

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

- (AMSCarrierLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSString)productCode
{
  return self->_productCode;
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
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_storeStrong((id *)&self->_channelCustomerId, 0);
}

@end
