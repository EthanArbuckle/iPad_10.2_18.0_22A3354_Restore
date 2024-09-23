@implementation WFWalletMerchant

- (WFWalletMerchant)initWithDisplayName:(id)a3 uniqueIdentifier:(id)a4 logoURL:(id)a5 merchantType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  WFWalletMerchant *v13;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSString *uniqueIdentifier;
  uint64_t v18;
  NSURL *logoURL;
  WFWalletMerchant *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFWalletMerchant;
  v13 = -[WFWalletMerchant init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    uniqueIdentifier = v13->_uniqueIdentifier;
    v13->_uniqueIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    logoURL = v13->_logoURL;
    v13->_logoURL = (NSURL *)v18;

    v13->_merchantType = a6;
    v20 = v13;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFWalletMerchant displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[WFWalletMerchant uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uniqueIdentifier"));

  -[WFWalletMerchant logoURL](self, "logoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("logoURL"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFWalletMerchant merchantType](self, "merchantType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("merchantType"));

}

- (WFWalletMerchant)initWithCoder:(id)a3
{
  id v4;
  WFWalletMerchant *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSURL *logoURL;
  void *v12;
  WFWalletMerchant *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFWalletMerchant;
  v5 = -[WFWalletMerchant init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merchantType = objc_msgSend(v12, "unsignedIntegerValue");
    v13 = v5;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WFWalletMerchant *v4;
  WFWalletMerchant *v5;
  WFWalletMerchant *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WFWalletMerchant *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFWalletMerchant uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWalletMerchant uniqueIdentifier](v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (unint64_t)merchantType
{
  return self->_merchantType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
