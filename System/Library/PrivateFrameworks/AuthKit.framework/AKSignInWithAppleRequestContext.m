@implementation AKSignInWithAppleRequestContext

- (AKSignInWithAppleRequestContext)initWithAltDSID:(id)a3
{
  id v5;
  AKSignInWithAppleRequestContext *v6;
  AKSignInWithAppleRequestContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignInWithAppleRequestContext;
  v6 = -[AKSignInWithAppleRequestContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (AKSignInWithAppleRequestContext)initWithCoder:(id)a3
{
  id v4;
  AKSignInWithAppleRequestContext *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  AKSignInWithAppleAccount *signInWithAppleAccount;
  uint64_t v10;
  NSString *currentGroupID;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *groups;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKSignInWithAppleRequestContext;
  v5 = -[AKSignInWithAppleRequestContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signInWithAppleAccount"));
    v8 = objc_claimAutoreleasedReturnValue();
    signInWithAppleAccount = v5->_signInWithAppleAccount;
    v5->_signInWithAppleAccount = (AKSignInWithAppleAccount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentGroupID"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentGroupID = v5->_currentGroupID;
    v5->_currentGroupID = (NSString *)v10;

    v5->__simulateAccountSharingResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_simulateAccountSharingResponse"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_groups"));
    v15 = objc_claimAutoreleasedReturnValue();
    groups = v5->__groups;
    v5->__groups = (NSSet *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signInWithAppleAccount, CFSTR("signInWithAppleAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentGroupID, CFSTR("currentGroupID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__simulateAccountSharingResponse, CFSTR("_simulateAccountSharingResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__groups, CFSTR("_groups"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_altDSID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[AKSignInWithAppleAccount copy](self->_signInWithAppleAccount, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_currentGroupID, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  *(_BYTE *)(v4 + 8) = self->__simulateAccountSharingResponse;
  v11 = -[NSSet copy](self->__groups, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  return (id)v4;
}

- (BOOL)_isMoveAccountRequest
{
  return self->_currentGroupID != 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\taltDSID: %@, \n\tsignInWithAppleAccount: %@, \n\tcurrentGroupID: %@, \n}>"), v5, self, self->_altDSID, self->_signInWithAppleAccount, self->_currentGroupID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (AKSignInWithAppleAccount)signInWithAppleAccount
{
  return self->_signInWithAppleAccount;
}

- (void)setSignInWithAppleAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currentGroupID
{
  return self->_currentGroupID;
}

- (void)setCurrentGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)_simulateAccountSharingResponse
{
  return self->__simulateAccountSharingResponse;
}

- (void)set_simulateAccountSharingResponse:(BOOL)a3
{
  self->__simulateAccountSharingResponse = a3;
}

- (void)set_isMoveAccountRequest:(BOOL)a3
{
  self->__isMoveAccountRequest = a3;
}

- (NSSet)_groups
{
  return self->__groups;
}

- (void)set_groups:(id)a3
{
  objc_storeStrong((id *)&self->__groups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groups, 0);
  objc_storeStrong((id *)&self->_currentGroupID, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAccount, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
