@implementation DMFManagementLockRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFManagementLockRequest)initWithCoder:(id)a3
{
  id v4;
  DMFManagementLockRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *lockedByLabel;
  void *v9;
  uint64_t v10;
  NSString *passcode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFManagementLockRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("lockedByLabel"));
    v7 = objc_claimAutoreleasedReturnValue();
    lockedByLabel = v5->_lockedByLabel;
    v5->_lockedByLabel = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("passcode"));
    v10 = objc_claimAutoreleasedReturnValue();
    passcode = v5->_passcode;
    v5->_passcode = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFManagementLockRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFManagementLockRequest lockedByLabel](self, "lockedByLabel", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lockedByLabel"));

  -[DMFManagementLockRequest passcode](self, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("passcode"));

}

- (NSString)lockedByLabel
{
  return self->_lockedByLabel;
}

- (void)setLockedByLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_lockedByLabel, 0);
}

@end
