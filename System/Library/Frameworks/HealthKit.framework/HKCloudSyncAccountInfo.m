@implementation HKCloudSyncAccountInfo

- (HKCloudSyncAccountInfo)initWithFullName:(id)a3 emailAddress:(id)a4 accountSettings:(unint64_t)a5
{
  id v8;
  id v9;
  HKCloudSyncAccountInfo *v10;
  uint64_t v11;
  NSPersonNameComponents *fullName;
  uint64_t v13;
  NSString *emailAddress;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKCloudSyncAccountInfo;
  v10 = -[HKCloudSyncAccountInfo init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    fullName = v10->_fullName;
    v10->_fullName = (NSPersonNameComponents *)v11;

    v13 = objc_msgSend(v9, "copy");
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v13;

    v10->_accountSettings = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSPersonNameComponents *fullName;
  id v5;

  fullName = self->_fullName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fullName, CFSTR("FullName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddress, CFSTR("EmailAddress"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountSettings, CFSTR("AccountSettings"));

}

- (HKCloudSyncAccountInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKCloudSyncAccountInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EmailAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AccountSettings"));

  v8 = -[HKCloudSyncAccountInfo initWithFullName:emailAddress:accountSettings:](self, "initWithFullName:emailAddress:accountSettings:", v5, v6, v7);
  return v8;
}

- (NSPersonNameComponents)fullName
{
  return self->_fullName;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (unint64_t)accountSettings
{
  return self->_accountSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
