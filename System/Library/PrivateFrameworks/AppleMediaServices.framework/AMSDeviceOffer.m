@implementation AMSDeviceOffer

+ (id)offersSetFromArray:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

AMSDeviceOffer *__37__AMSDeviceOffer_offersSetFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSDeviceOffer *v3;

  v2 = a2;
  v3 = -[AMSDeviceOffer initWithDictionary:]([AMSDeviceOffer alloc], "initWithDictionary:", v2);

  return v3;
}

- (AMSDeviceOffer)initWithOfferIdentifier:(id)a3
{
  id v4;
  AMSDeviceOffer *v5;
  AMSDeviceOffer *v6;
  NSNumber *adamId;
  uint64_t v8;
  NSString *offerIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDeviceOffer;
  v5 = -[AMSDeviceOffer init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    adamId = v5->_adamId;
    v5->_adamId = (NSNumber *)&unk_1E25AF440;

    v8 = objc_msgSend(v4, "copy");
    offerIdentifier = v6->_offerIdentifier;
    v6->_offerIdentifier = (NSString *)v8;

  }
  return v6;
}

- (AMSDeviceOffer)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AMSDeviceOffer *v7;
  void *v8;
  id v9;
  AMSDeviceOffer *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *description;
  void *v17;
  id v18;
  void *v19;
  NSNumber *v20;
  NSNumber *dsid;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      v7 = -[AMSDeviceOffer initWithOfferIdentifier:](self, "initWithOfferIdentifier:", v6);
      if (!v7)
      {
LABEL_48:
        self = v7;
        v10 = self;
        goto LABEL_49;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adamId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;

        if (v9)
          goto LABEL_15;
      }
      else
      {

      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v33 = 138543362;
        *(_QWORD *)&v33[4] = objc_opt_class();
        v13 = *(id *)&v33[4];
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No adamId found in initializer dictionary, setting to 0", v33, 0xCu);

      }
      v9 = &unk_1E25AF440;
LABEL_15:
      objc_storeStrong((id *)&v7->_adamId, v9);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      description = v7->_description;
      v7->_description = v15;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDowngrading"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      v7->_downgrading = objc_msgSend(v18, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsid"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      dsid = v7->_dsid;
      v7->_dsid = v20;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSubscribed"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;

      v7->_subscribed = objc_msgSend(v23, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v25), (v26 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber"), *(_OWORD *)v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v28);
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            v25 = v28;
LABEL_45:
            if (objc_msgSend(v30, "count", *(_OWORD *)v33))
              objc_storeStrong((id *)&v7->_serialNumbers, v30);

            goto LABEL_48;
          }
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumbers"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v31;
        else
          v25 = 0;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v30 = 0;
          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v25);
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v26;
      goto LABEL_45;
    }
  }
  else
  {

    v6 = 0;
  }
  v10 = 0;
LABEL_49:

  return v10;
}

- (unint64_t)offerType
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  -[AMSDeviceOffer offerIdentifier](self, "offerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(AMSDeviceOfferIdentifierAppleMusic, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(AMSDeviceOfferIdentifieriCloud, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend((id)AMSDeviceOfferIdentifierAppleCare, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend((id)AMSDeviceOfferIdentifierTV, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToString:", v11);

        if (v12)
          v6 = 4;
        else
          v6 = 0;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[AMSDeviceOffer adamId](self, "adamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSDeviceOffer description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[AMSDeviceOffer isDowngrading](self, "isDowngrading");
  v8 = -[AMSDeviceOffer isSubscribed](self, "isSubscribed");
  -[AMSDeviceOffer offerIdentifier](self, "offerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");
  -[AMSDeviceOffer serialNumbers](self, "serialNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AMSDeviceOffer *v5;
  uint64_t v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;

  v5 = (AMSDeviceOffer *)a3;
  if (self == v5)
  {
    v7 = 1;
    goto LABEL_5;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[AMSDeviceOffer adamId](self, "adamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (-[AMSDeviceOffer adamId](v5, "adamId"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSDeviceOffer adamId](self, "adamId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOffer adamId](v5, "adamId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        if (!v12)
          goto LABEL_3;
      }
      else
      {

        if ((v12 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[AMSDeviceOffer description](self, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (-[AMSDeviceOffer description](v5, "description"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSDeviceOffer description](self, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOffer description](v5, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v13)
      {

        if (!v16)
          goto LABEL_3;
      }
      else
      {

        if ((v16 & 1) == 0)
          goto LABEL_3;
      }
    }
    v17 = -[AMSDeviceOffer isDowngrading](self, "isDowngrading");
    if (v17 != -[AMSDeviceOffer isDowngrading](v5, "isDowngrading"))
      goto LABEL_3;
    v18 = -[AMSDeviceOffer isSubscribed](self, "isSubscribed");
    if (v18 != -[AMSDeviceOffer isSubscribed](v5, "isSubscribed"))
      goto LABEL_3;
    -[AMSDeviceOffer offerIdentifier](self, "offerIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (-[AMSDeviceOffer offerIdentifier](v5, "offerIdentifier"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSDeviceOffer offerIdentifier](self, "offerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOffer offerIdentifier](v5, "offerIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v19)
      {

        if (!v22)
          goto LABEL_3;
      }
      else
      {

        if ((v22 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[AMSDeviceOffer serialNumbers](self, "serialNumbers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23
      || (-[AMSDeviceOffer serialNumbers](v5, "serialNumbers"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSDeviceOffer serialNumbers](self, "serialNumbers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOffer serialNumbers](v5, "serialNumbers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25) ^ 1;

      if (v23)
      {
LABEL_32:

        v7 = v26 ^ 1;
        goto LABEL_5;
      }
    }
    else
    {
      LOBYTE(v26) = 0;
    }

    goto LABEL_32;
  }
LABEL_3:
  v7 = 0;
LABEL_5:

  return v7;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_98 != -1)
    dispatch_once(&_MergedGlobals_98, &__block_literal_global_37);
  return (NSString *)(id)qword_1ECEAD108;
}

void __31__AMSDeviceOffer_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD108;
  qword_1ECEAD108 = (uint64_t)CFSTR("AMSDeviceOffers");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD110 != -1)
    dispatch_once(&qword_1ECEAD110, &__block_literal_global_40);
  return (NSString *)(id)qword_1ECEAD118;
}

void __38__AMSDeviceOffer_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD118;
  qword_1ECEAD118 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)serialNumbers
{
  return self->_serialNumbers;
}

- (BOOL)isDowngrading
{
  return self->_downgrading;
}

- (void)setDowngrading:(BOOL)a3
{
  self->_downgrading = a3;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
}

@end
