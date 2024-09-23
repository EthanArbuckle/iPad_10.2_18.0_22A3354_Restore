@implementation AAStorableLoginContext

- (AAStorableLoginContext)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  AAStorableLoginContext *v8;
  uint64_t v9;
  NSString *appleID;
  uint64_t v11;
  NSString *altDSID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAStorableLoginContext;
  v8 = -[AAStorableLoginContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v11;

  }
  return v8;
}

- (void)setDSID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *DSID;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_DSID, a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "stringValue");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      DSID = self->_DSID;
      self->_DSID = v6;
    }
    else
    {
      _AALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Attempted to set invalid DSID: %@", (uint8_t *)&v9, 0xCu);
      }

      DSID = self->_DSID;
      self->_DSID = 0;
    }

  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)continuationKey
{
  return self->_continuationKey;
}

- (void)setContinuationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)passwordResetKey
{
  return self->_passwordResetKey;
}

- (void)setPasswordResetKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)cloudKitToken
{
  return self->_cloudKitToken;
}

- (void)setCloudKitToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isBeneficiaryLogin
{
  return self->_beneficiaryLogin;
}

- (void)setBeneficiaryLogin:(BOOL)a3
{
  self->_beneficiaryLogin = a3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cloudKitToken, 0);
  objc_storeStrong((id *)&self->_passwordResetKey, 0);
  objc_storeStrong((id *)&self->_continuationKey, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
