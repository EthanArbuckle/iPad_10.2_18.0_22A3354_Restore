@implementation ASDAccountLookupResponse

- (ASDAccountLookupResponse)init
{
  return -[ASDAccountLookupResponse initWithAccountID:](self, "initWithAccountID:", &unk_1E37E31C0);
}

- (ASDAccountLookupResponse)initWithAccountID:(id)a3
{
  id v4;
  ASDAccountLookupResponse *v5;
  uint64_t v6;
  NSNumber *accountID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDAccountLookupResponse;
  v5 = -[ASDAccountLookupResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDAccountLookupResponse *v4;
  void *v5;
  ASDAccountLookupResponse *v6;
  void *v7;

  v4 = +[ASDAccountLookupResponse allocWithZone:](ASDAccountLookupResponse, "allocWithZone:", a3);
  -[ASDAccountLookupResponse accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDAccountLookupResponse initWithAccountID:](v4, "initWithAccountID:", v5);

  -[ASDAccountLookupResponse setAskToBuyEnabled:](v6, "setAskToBuyEnabled:", -[ASDAccountLookupResponse askToBuyEnabled](self, "askToBuyEnabled"));
  -[ASDRequestResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDRequestResponse setError:](v6, "setError:", v7);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountLookupResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDAccountLookupResponse *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDAccountLookupResponse initWithAccountID:](self, "initWithAccountID:", v5);
  if (v6)
  {
    -[ASDAccountLookupResponse setAskToBuyEnabled:](v6, "setAskToBuyEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("askToBuyEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDRequestResponse setError:](v6, "setError:", v7);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASDAccountLookupResponse accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("accountID"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ASDAccountLookupResponse askToBuyEnabled](self, "askToBuyEnabled"), CFSTR("askToBuyEnabled"));
  -[ASDRequestResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASDRequestResponse error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ASDErrorWithSafeUserInfo(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("error"));

  }
}

- (NSNumber)accountID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)askToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (void)setAskToBuyEnabled:(BOOL)a3
{
  self->_askToBuyEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
