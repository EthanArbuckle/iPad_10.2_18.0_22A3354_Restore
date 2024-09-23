@implementation HMManagedConfigurationProfileInfo

- (HMManagedConfigurationProfileInfo)initWithIdentifier:(id)a3 profileData:(id)a4
{
  id v7;
  id v8;
  HMManagedConfigurationProfileInfo *v9;
  HMManagedConfigurationProfileInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMManagedConfigurationProfileInfo;
  v9 = -[HMManagedConfigurationProfileInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_profileData, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMManagedConfigurationProfileInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMMCP.identifier"));

  -[HMManagedConfigurationProfileInfo profileData](self, "profileData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMMCP.data"));

}

- (HMManagedConfigurationProfileInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  HMManagedConfigurationProfileInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMCP.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMCP.data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[HMManagedConfigurationProfileInfo initWithIdentifier:profileData:](self, "initWithIdentifier:profileData:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)profileData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
