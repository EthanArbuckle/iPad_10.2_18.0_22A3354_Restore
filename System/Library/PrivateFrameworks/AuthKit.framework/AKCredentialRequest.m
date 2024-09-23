@implementation AKCredentialRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKCredentialRequest)init
{
  AKCredentialRequest *v2;
  uint64_t v3;
  NSUUID *requestIdentifier;
  uint64_t v5;
  NSUUID *transactionID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKCredentialRequest;
  v2 = -[AKCredentialRequest init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v2->_requestIdentifier;
    v2->_requestIdentifier = (NSUUID *)v3;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    transactionID = v2->_transactionID;
    v2->_transactionID = (NSUUID *)v5;

  }
  return v2;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("AKUserIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("_requestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionID, CFSTR("_transactionID"));

}

- (AKCredentialRequest)initWithCoder:(id)a3
{
  id v4;
  AKCredentialRequest *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *userIdentifier;
  uint64_t v10;
  NSUUID *requestIdentifier;
  uint64_t v12;
  NSUUID *transactionID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKCredentialRequest;
  v5 = -[AKCredentialRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKUserIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionID"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSUUID *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_requestIdentifier, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSString copy](self->_userIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_altDSID, "copy");
  v10 = (void *)v4[1];
  v4[1] = v9;

  v11 = -[NSUUID copy](self->_transactionID, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> requestIdentifier: %@,\naltDSID: %@,\nuserID: %@ \ntransactionID:%@"), v5, self, self->_requestIdentifier, self->_altDSID, self->_userIdentifier, self->_transactionID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
