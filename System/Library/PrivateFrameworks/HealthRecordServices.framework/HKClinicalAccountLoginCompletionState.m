@implementation HKClinicalAccountLoginCompletionState

- (HKClinicalAccountLoginCompletionState)initWithAccount:(id)a3 alternateCredentialPersistentID:(id)a4 wasRelogin:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKClinicalAccountLoginCompletionState *v13;
  uint64_t v14;
  HKClinicalAccount *account;
  uint64_t v16;
  NSNumber *alternateCredentialPersistentID;
  uint64_t v18;
  NSError *error;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalAccountLoginCompletionState;
  v13 = -[HKClinicalAccountLoginCompletionState init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    account = v13->_account;
    v13->_account = (HKClinicalAccount *)v14;

    v16 = objc_msgSend(v11, "copy");
    alternateCredentialPersistentID = v13->_alternateCredentialPersistentID;
    v13->_alternateCredentialPersistentID = (NSNumber *)v16;

    v13->_wasRelogin = a5;
    v18 = objc_msgSend(v12, "copy");
    error = v13->_error;
    v13->_error = (NSError *)v18;

  }
  return v13;
}

+ (id)completionStateWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccount:alternateCredentialPersistentID:wasRelogin:error:", 0, 0, 0, v4);

  return v5;
}

- (BOOL)didSucceed
{
  return self->_error == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalAccountLoginCompletionState)initWithCoder:(id)a3
{
  id v4;
  HKClinicalAccountLoginCompletionState *v5;
  uint64_t v6;
  HKClinicalAccount *account;
  uint64_t v8;
  NSNumber *alternateCredentialPersistentID;
  uint64_t v10;
  NSError *error;
  HKClinicalAccountLoginCompletionState *v12;
  objc_super v14;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("wasRelogin")) & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)HKClinicalAccountLoginCompletionState;
    v5 = -[HKClinicalAccountLoginCompletionState init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
      v6 = objc_claimAutoreleasedReturnValue();
      account = v5->_account;
      v5->_account = (HKClinicalAccount *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialPersistentID"));
      v8 = objc_claimAutoreleasedReturnValue();
      alternateCredentialPersistentID = v5->_alternateCredentialPersistentID;
      v5->_alternateCredentialPersistentID = (NSNumber *)v8;

      v5->_wasRelogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasRelogin"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
      v10 = objc_claimAutoreleasedReturnValue();
      error = v5->_error;
      v5->_error = (NSError *)v10;

    }
    self = v5;
    v12 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  HKClinicalAccount *account;
  id v5;

  account = self->_account;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", account, CFSTR("account"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateCredentialPersistentID, CFSTR("credentialPersistentID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wasRelogin, CFSTR("wasRelogin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSNumber *alternateCredentialPersistentID;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HKClinicalAccount identifier](self->_account, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  alternateCredentialPersistentID = self->_alternateCredentialPersistentID;
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> account: %@, alternate credential: %@, was relogin: %@, error: %@"), v4, self, v5, alternateCredentialPersistentID, v7, self->_error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKClinicalAccount)account
{
  return self->_account;
}

- (NSNumber)alternateCredentialPersistentID
{
  return self->_alternateCredentialPersistentID;
}

- (void)setAlternateCredentialPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)wasRelogin
{
  return self->_wasRelogin;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_alternateCredentialPersistentID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
