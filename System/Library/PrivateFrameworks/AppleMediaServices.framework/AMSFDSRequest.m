@implementation AMSFDSRequest

- (AMSFDSRequest)initWithPurchaseIdentifier:(id)a3 account:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSFDSRequest *v11;
  AMSFDSRequest *v12;
  uint64_t v13;
  NSNumber *purchaseIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSFDSRequest;
  v11 = -[AMSFDSRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_options, a5);
    v13 = objc_msgSend(v8, "copy");
    purchaseIdentifier = v12->_purchaseIdentifier;
    v12->_purchaseIdentifier = (NSNumber *)v13;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ACAccount copyWithZone:](self->_account, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_logKey, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[AMSFDSOptions copyWithZone:](self->_options, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSNumber copyWithZone:](self->_purchaseIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AMSFDSRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v9, "encodeObject:forKey:", self->_account, CFSTR("kCodingKeyAccount"));
  -[AMSFDSRequest logKey](self, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v9, "encodeObject:forKey:", self->_logKey, CFSTR("kCodingKeyLogKey"));
  -[AMSFDSRequest options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v9, "encodeObject:forKey:", self->_options, CFSTR("kCodingKeyOptions"));
  -[AMSFDSRequest purchaseIdentifier](self, "purchaseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AMSFDSRequest purchaseIdentifier](self, "purchaseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("kCodingKeyPurchaseIdentifier"));

  }
}

- (AMSFDSRequest)initWithCoder:(id)a3
{
  id v4;
  AMSFDSRequest *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  NSString *logKey;
  uint64_t v10;
  AMSFDSOptions *options;
  uint64_t v12;
  NSNumber *purchaseIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSFDSRequest;
  v5 = -[AMSFDSRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAccount"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyOptions"));
    v10 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (AMSFDSOptions *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyPurchaseIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    purchaseIdentifier = v5->_purchaseIdentifier;
    v5->_purchaseIdentifier = (NSNumber *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)accountType
{
  void *v3;
  char v4;
  void *v6;
  unsigned int v7;

  -[AMSFDSRequest account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ams_isiCloudAccount");

  if ((v4 & 1) != 0)
    return 2;
  -[AMSFDSRequest account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ams_isiTunesAccount");

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AMSFDSOptions)options
{
  return self->_options;
}

- (NSNumber)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
