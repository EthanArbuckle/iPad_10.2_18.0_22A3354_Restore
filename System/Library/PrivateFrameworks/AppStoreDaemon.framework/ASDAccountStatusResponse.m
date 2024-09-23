@implementation ASDAccountStatusResponse

- (ASDAccountStatusResponse)initWithAccountID:(id)a3
{
  id v4;
  ASDAccountStatusResponse *v5;
  uint64_t v6;
  NSNumber *accountID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDAccountStatusResponse;
  v5 = -[ASDAccountStatusResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

  }
  return v5;
}

- (BOOL)hasErrorStatus
{
  return -[ASDAccountStatusResponse accountStatus](self, "accountStatus") != 0;
}

- (BOOL)hasResponseFlag:(int64_t)a3
{
  return (-[ASDAccountStatusResponse accountStatus](self, "accountStatus") & a3) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountStatusResponse)initWithCoder:(id)a3
{
  id v4;
  ASDAccountStatusResponse *v5;
  uint64_t v6;
  NSNumber *accountID;

  v4 = a3;
  v5 = -[ASDAccountStatusResponse initWithAccountID:](self, "initWithAccountID:", 0);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    v5->_accountStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_accountStatus"));
    v5->_hasCachedFamilyInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasCachedFamilyInfo"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *accountID;
  id v5;

  accountID = self->_accountID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountID, CFSTR("_accountID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountStatus, CFSTR("_accountStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCachedFamilyInfo, CFSTR("_hasCachedFamilyInfo"));

}

- (NSNumber)accountID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (BOOL)hasCachedFamilyInfo
{
  return self->_hasCachedFamilyInfo;
}

- (void)setHasCachedFamilyInfo:(BOOL)a3
{
  self->_hasCachedFamilyInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
