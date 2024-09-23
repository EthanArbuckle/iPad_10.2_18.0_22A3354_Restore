@implementation AMSPurchaseResult

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  -[AMSPurchaseResult correlationID](self, "correlationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSPurchaseResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AMSPurchaseResult purchase](self, "purchase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[AMSPurchaseResult URLResponse](self, "URLResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v10 ^ v12 ^ -[AMSPurchaseResult didShowPaymentSheet](self, "didShowPaymentSheet");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AMSPurchaseResult *v4;
  BOOL v5;

  v4 = (AMSPurchaseResult *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AMSPurchaseResult isEqualToPurchaseResult:](self, "isEqualToPurchaseResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPurchaseResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;

  v7 = a3;
  -[AMSPurchaseResult correlationID](self, "correlationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "correlationID"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AMSPurchaseResult correlationID](self, "correlationID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "correlationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      LOBYTE(v10) = 0;
LABEL_45:

      goto LABEL_46;
    }
    v9 = 1;
  }
  else
  {
    v43 = 0;
    v9 = 0;
  }
  -[AMSPurchaseResult error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v7, "error"), (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AMSPurchaseResult error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v12;
    if (!objc_msgSend(v12, "isEqual:", v5))
    {
      LOBYTE(v10) = 0;
      goto LABEL_43;
    }
    v40 = v9;
    v41 = 1;
  }
  else
  {
    v40 = v9;
    v37 = 0;
    v41 = 0;
  }
  -[AMSPurchaseResult purchase](self, "purchase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v7, "purchase"), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AMSPurchaseResult purchase](self, "purchase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "purchase");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v14;
    if (!objc_msgSend(v14, "isEqual:", v38))
    {
      LOBYTE(v10) = 0;
LABEL_38:
      v23 = (void *)v38;
LABEL_39:

LABEL_40:
      if (v13)
        goto LABEL_41;
LABEL_54:

      if ((v41 & 1) != 0)
        goto LABEL_42;
      goto LABEL_55;
    }
    v15 = 1;
  }
  else
  {
    v33 = 0;
    v15 = 0;
  }
  -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36 || (objc_msgSend(v7, "responseDictionary"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v13;
    -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "responseDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v17;
    if (!objc_msgSend(v17, "isEqual:", v34))
    {
      LOBYTE(v10) = 0;
      v13 = v16;
      goto LABEL_36;
    }
    v31 = 1;
    v13 = v16;
  }
  else
  {
    v29 = 0;
    v31 = 0;
  }
  v32 = v15;
  -[AMSPurchaseResult URLResponse](self, "URLResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v7, "URLResponse");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v26 = 0;
      v27 = 0;
LABEL_31:
      v20 = -[AMSPurchaseResult didShowPaymentSheet](self, "didShowPaymentSheet", v26);
      v10 = v20 ^ objc_msgSend(v7, "didShowPaymentSheet") ^ 1;
      if (!v27)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  v30 = v18;
  -[AMSPurchaseResult URLResponse](self, "URLResponse", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLResponse");
  v15 = objc_claimAutoreleasedReturnValue();
  v28 = v19;
  if (objc_msgSend(v19, "isEqual:", v15))
  {
    v27 = 1;
    v18 = v30;
    goto LABEL_31;
  }
  LOBYTE(v10) = 0;
  v18 = v30;
LABEL_32:

LABEL_33:
  if (v18)
  {

    v21 = v43;
    LODWORD(v15) = v32;
    if (v31)
    {
LABEL_35:
      v43 = v21;
LABEL_36:

      v22 = (void *)v36;
      if (v36)
        goto LABEL_37;
      goto LABEL_51;
    }
  }
  else
  {

    v21 = v43;
    LODWORD(v15) = v32;
    if ((v31 & 1) != 0)
      goto LABEL_35;
  }
  v22 = (void *)v36;
  v43 = v21;
  if (v36)
  {
LABEL_37:

    if (!(_DWORD)v15)
      goto LABEL_40;
    goto LABEL_38;
  }
LABEL_51:

  if ((v15 & 1) != 0)
  {
    v23 = (void *)v38;
    goto LABEL_39;
  }
  if (!v13)
    goto LABEL_54;
LABEL_41:

  if (v41)
  {
LABEL_42:
    v9 = v40;
LABEL_43:

    if (v11)
      goto LABEL_44;
    goto LABEL_56;
  }
LABEL_55:
  v9 = v40;
  if (v11)
  {
LABEL_44:

    if (!v9)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_56:

  if ((v9 & 1) != 0)
    goto LABEL_45;
LABEL_46:
  if (!v8)

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSPurchaseResult *v5;
  void *v6;
  uint64_t v7;
  NSString *correlationID;
  void *v9;
  uint64_t v10;
  NSError *error;
  void *v12;
  uint64_t v13;
  NSDictionary *loadURLEventDictionary;
  void *v15;
  uint64_t v16;
  AMSPurchase *purchase;
  void *v18;
  uint64_t v19;
  NSDictionary *responseDictionary;
  void *v21;
  uint64_t v22;
  NSURLResponse *URLResponse;

  v5 = objc_alloc_init(AMSPurchaseResult);
  -[AMSPurchaseResult correlationID](self, "correlationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  correlationID = v5->_correlationID;
  v5->_correlationID = (NSString *)v7;

  -[AMSPurchaseResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  error = v5->_error;
  v5->_error = (NSError *)v10;

  -[AMSPurchaseResult loadURLEventDictionary](self, "loadURLEventDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  loadURLEventDictionary = v5->_loadURLEventDictionary;
  v5->_loadURLEventDictionary = (NSDictionary *)v13;

  -[AMSPurchaseResult purchase](self, "purchase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  purchase = v5->_purchase;
  v5->_purchase = (AMSPurchase *)v16;

  -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  responseDictionary = v5->_responseDictionary;
  v5->_responseDictionary = (NSDictionary *)v19;

  -[AMSPurchaseResult URLResponse](self, "URLResponse");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  URLResponse = v5->_URLResponse;
  v5->_URLResponse = (NSURLResponse *)v22;

  v5->_didShowPaymentSheet = self->_didShowPaymentSheet;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AMSPurchaseResult correlationID](self, "correlationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("correlationID"));

  -[AMSPurchaseResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("error"));

  -[AMSPurchaseResult loadURLEventDictionary](self, "loadURLEventDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSPurchaseResult loadURLEventDictionary](self, "loadURLEventDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_encodePropertyListDictionary:format:forKey:", v7, 200, CFSTR("loadURLEventDictionary"));

  }
  -[AMSPurchaseResult purchase](self, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("purchase"));

  -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSPurchaseResult responseDictionary](self, "responseDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_encodePropertyListDictionary:format:forKey:", v10, 200, CFSTR("responseDictionary"));

  }
  -[AMSPurchaseResult URLResponse](self, "URLResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("URLResponse"));

  objc_msgSend(v12, "encodeBool:forKey:", -[AMSPurchaseResult didShowPaymentSheet](self, "didShowPaymentSheet"), CFSTR("didShowPaymentSheet"));
}

- (AMSPurchaseResult)initWithCoder:(id)a3
{
  id v4;
  AMSPurchaseResult *v5;
  uint64_t v6;
  NSString *correlationID;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  AMSPurchase *purchase;
  uint64_t v12;
  NSDictionary *responseDictionary;
  uint64_t v14;
  NSURLResponse *URLResponse;
  uint64_t v16;
  NSDictionary *loadURLEventDictionary;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSPurchaseResult;
  v5 = -[AMSPurchaseResult init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("correlationID"));
    v6 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchase"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchase = v5->_purchase;
    v5->_purchase = (AMSPurchase *)v10;

    objc_msgSend(v4, "ams_decodePropertyListDictionaryForKey:", CFSTR("responseDictionary"));
    v12 = objc_claimAutoreleasedReturnValue();
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLResponse"));
    v14 = objc_claimAutoreleasedReturnValue();
    URLResponse = v5->_URLResponse;
    v5->_URLResponse = (NSURLResponse *)v14;

    objc_msgSend(v4, "ams_decodePropertyListDictionaryForKey:", CFSTR("loadURLEventDictionary"));
    v16 = objc_claimAutoreleasedReturnValue();
    loadURLEventDictionary = v5->_loadURLEventDictionary;
    v5->_loadURLEventDictionary = (NSDictionary *)v16;

    v5->_didShowPaymentSheet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didShowPaymentSheet"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)loadURLEventDictionary
{
  return self->_loadURLEventDictionary;
}

- (void)setLoadURLEventDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURLResponse)URLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)didShowPaymentSheet
{
  return self->_didShowPaymentSheet;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  self->_didShowPaymentSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_loadURLEventDictionary, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
}

@end
