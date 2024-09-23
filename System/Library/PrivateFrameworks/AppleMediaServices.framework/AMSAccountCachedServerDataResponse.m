@implementation AMSAccountCachedServerDataResponse

- (void)setAllAccountData:(id)a3
{
  objc_storeStrong((id *)&self->_allAccountData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAccountData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSAccountCachedServerDataResponse allAccountData](self, "allAccountData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAllAccountData"));

}

- (NSDictionary)allAccountData
{
  return self->_allAccountData;
}

- (AMSAccountCachedServerDataResponse)initWithCoder:(id)a3
{
  id v4;
  AMSAccountCachedServerDataResponse *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *allAccountData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSAccountCachedServerDataResponse;
  v5 = -[AMSAccountCachedServerDataResponse init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("kAllAccountData"));
    v7 = objc_claimAutoreleasedReturnValue();
    allAccountData = v5->_allAccountData;
    v5->_allAccountData = (NSDictionary *)v7;

  }
  return v5;
}

@end
