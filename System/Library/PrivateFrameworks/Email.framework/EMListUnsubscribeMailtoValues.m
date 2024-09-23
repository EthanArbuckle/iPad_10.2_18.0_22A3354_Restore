@implementation EMListUnsubscribeMailtoValues

- (EMListUnsubscribeMailtoValues)initWithAddresss:(id)a3 subject:(id)a4 body:(id)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EMListUnsubscribeMailtoValues *v14;
  uint64_t v15;
  NSString *address;
  uint64_t v17;
  NSString *subject;
  uint64_t v19;
  NSString *body;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMListUnsubscribeMailtoValues;
  v14 = -[EMListUnsubscribeMailtoValues init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    address = v14->_address;
    v14->_address = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    subject = v14->_subject;
    v14->_subject = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    body = v14->_body;
    v14->_body = (NSString *)v19;

    objc_storeStrong((id *)&v14->_account, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EDReceivingAccount)account
{
  EDReceivingAccount *v3;
  EDReceivingAccount *account;
  NSString *accountIdentifier;

  if (self->_accountIdentifier)
  {
    +[EMListUnsubscribeCommand _accountWithIdentifier:](EMListUnsubscribeCommand, "_accountWithIdentifier:");
    v3 = (EDReceivingAccount *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    self->_account = v3;

    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = 0;

  }
  return self->_account;
}

- (EMListUnsubscribeMailtoValues)initWithCoder:(id)a3
{
  id v4;
  EMListUnsubscribeMailtoValues *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *subject;
  uint64_t v10;
  NSString *body;
  uint64_t v12;
  NSString *accountIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMListUnsubscribeMailtoValues;
  v5 = -[EMListUnsubscribeMailtoValues init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
    v8 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_body"));
    v10 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_account.identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v12;

  }
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
  -[EMListUnsubscribeMailtoValues address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_address"));

  -[EMListUnsubscribeMailtoValues subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_subject"));

  -[EMListUnsubscribeMailtoValues body](self, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_body"));

  -[EMListUnsubscribeMailtoValues account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_account.identifier"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_address, "hash");
  v4 = -[NSString hash](self->_subject, "hash");
  v5 = -[NSString hash](self->_body, "hash");
  -[EDReceivingAccount identifier](self->_account, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (11 * v4) ^ (37 * v3) ^ v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      objc_msgSend(v5, "subject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        objc_msgSend(v5, "body");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[EMListUnsubscribeMailtoValues account](self, "account");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "account");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = EFObjectsAreEqual();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
