@implementation HFSetupAccessoryResult

- (HFSetupAccessoryResult)initWithPayload:(id)a3 error:(id)a4 hasAddRequest:(BOOL)a5
{
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  HFSetupAccessoryResult *v11;
  HFSetupAccessoryResult *v12;
  void **p_error;
  uint64_t v14;
  HMSetupAccessoryPayload *setupPayload;
  HFSetupAccessoryResult *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMSetupAccessoryPayload *v24;
  objc_super v26;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
    v10 = 1;
  else
    v10 = a5;
  if (v10)
  {
    v26.receiver = self;
    v26.super_class = (Class)HFSetupAccessoryResult;
    v11 = -[HFSetupAccessoryResult init](&v26, sel_init);
    v12 = v11;
    if (v11)
    {
      p_error = (void **)&v11->_error;
      objc_storeStrong((id *)&v11->_error, a4);
      v14 = objc_msgSend((id)v8, "copy");
      setupPayload = v12->_setupPayload;
      v12->_setupPayload = (HMSetupAccessoryPayload *)v14;

      v12->_isValidForPairing = v10;
      if (v12->_error)
      {
        if (v8)
          NSLog(CFSTR("HFSetupAccessoryResult initWithPayload received an error AND a setupPayload (%@) - this shouldn't happen."), v8);
        goto LABEL_14;
      }
      v12->_hasAddRequest = a5;
      if (-[HMSetupAccessoryPayload isPaired](v12->_setupPayload, "isPaired"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 21);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *p_error;
        *p_error = (void *)v17;

LABEL_14:
        v24 = v12->_setupPayload;
        v12->_setupPayload = 0;

        goto LABEL_15;
      }
      if (-[HFSetupAccessoryResult isAllZerosCode](v12, "isAllZerosCode"))
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode"), CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode"), 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode"), 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "hf_errorWithCode:title:description:", 22, v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *p_error;
        *p_error = (void *)v22;

        goto LABEL_14;
      }
    }
LABEL_15:
    self = v12;
    v16 = self;
    goto LABEL_16;
  }
  NSLog(CFSTR("HFSetupAccessoryResult requires either a payload, error, or add request"));
  v16 = 0;
LABEL_16:

  return v16;
}

- (HFSetupAccessoryResult)initWithPayload:(id)a3 hasAddRequest:(BOOL)a4
{
  return -[HFSetupAccessoryResult initWithPayload:error:hasAddRequest:](self, "initWithPayload:error:hasAddRequest:", a3, 0, a4);
}

- (HFSetupAccessoryResult)initWithPayload:(id)a3
{
  return -[HFSetupAccessoryResult initWithPayload:error:hasAddRequest:](self, "initWithPayload:error:hasAddRequest:", a3, 0, 0);
}

- (HFSetupAccessoryResult)initWithSetupURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  HFSetupAccessoryResult *v8;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CBA840];
  v5 = a3;
  v10 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSetupPayloadURL:error:", v5, &v10);

  v7 = v10;
  v8 = -[HFSetupAccessoryResult initWithPayload:error:hasAddRequest:](self, "initWithPayload:error:hasAddRequest:", v6, v7, 0);

  return v8;
}

- (HFSetupAccessoryResult)initWithSetupCode:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  HFSetupAccessoryResult *v7;

  v4 = (objc_class *)MEMORY[0x1E0CBA840];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithHAPSetupCode:", v5);

  v7 = -[HFSetupAccessoryResult initWithPayload:error:hasAddRequest:](self, "initWithPayload:error:hasAddRequest:", v6, 0, 0);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAccessoryResult setupPayload](self, "setupPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("setupPayload"));

  -[HFSetupAccessoryResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("error"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFSetupAccessoryResult hasAddRequest](self, "hasAddRequest"), CFSTR("hasAddRequest"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isAllZerosCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFSetupAccessoryResult setupPayload](self, "setupPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFSetupAccessoryResult setupPayload](self, "setupPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1EA741FF8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v3) = objc_msgSend(v6, "compare:", CFSTR("00000000")) == 0;

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (NSError)error
{
  return self->_error;
}

- (HMSetupAccessoryPayload)setupPayload
{
  return self->_setupPayload;
}

- (BOOL)hasAddRequest
{
  return self->_hasAddRequest;
}

- (BOOL)isValidForPairing
{
  return self->_isValidForPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
