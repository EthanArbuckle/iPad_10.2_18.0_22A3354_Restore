@implementation FMDActivationLockInfo

- (FMDActivationLockInfo)initWithCoder:(id)a3
{
  id v4;
  FMDActivationLockInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDActivationLockInfo;
  v5 = -[FMDActivationLockInfo init](&v14, sel_init);
  if (v5)
  {
    -[FMDActivationLockInfo setIsActivationLocked:](v5, "setIsActivationLocked:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActivationLocked")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskedAppleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockInfo setMaskedAppleID:](v5, "setMaskedAppleID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskedOrganizationID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockInfo setMaskedOrganizationID:](v5, "setMaskedOrganizationID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockInfo setTitle:](v5, "setTitle:", v8);

    -[FMDActivationLockInfo setIsOfflineFindingEnabled:](v5, "setIsOfflineFindingEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOfflineFindingEnabled")));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("localeStrings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDActivationLockInfo setLocaleStrings:](v5, "setLocaleStrings:", v12);

    -[FMDActivationLockInfo setIsRestrictedSKU:](v5, "setIsRestrictedSKU:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestrictedSKU")));
    -[FMDActivationLockInfo setIsFindMyLPEMEnabled:](v5, "setIsFindMyLPEMEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFindMyLPEMEnabled")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isActivationLocked](self, "isActivationLocked"), CFSTR("isActivationLocked"));
  -[FMDActivationLockInfo maskedAppleID](self, "maskedAppleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("maskedAppleID"));

  -[FMDActivationLockInfo maskedOrganizationID](self, "maskedOrganizationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("maskedOrganizationID"));

  -[FMDActivationLockInfo title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("title"));

  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isOfflineFindingEnabled](self, "isOfflineFindingEnabled"), CFSTR("isOfflineFindingEnabled"));
  -[FMDActivationLockInfo localeStrings](self, "localeStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("localeStrings"));

  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isRestrictedSKU](self, "isRestrictedSKU"), CFSTR("isRestrictedSKU"));
  objc_msgSend(v8, "encodeBool:forKey:", -[FMDActivationLockInfo isFindMyLPEMEnabled](self, "isFindMyLPEMEnabled"), CFSTR("isFindMyLPEMEnabled"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMDActivationLockInfo title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDActivationLockInfo maskedAppleID](self, "maskedAppleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDActivationLockInfo maskedOrganizationID](self, "maskedOrganizationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - [\n\t%@\n\t%@\n\t%@\n\tAL Status %d\n\tofflineFinding %d,\n\trestrictedSKU %d\n\tofflineFindingInLPM %d]"), v4, v5, v6, v7, -[FMDActivationLockInfo isActivationLocked](self, "isActivationLocked"), -[FMDActivationLockInfo isOfflineFindingEnabled](self, "isOfflineFindingEnabled"), -[FMDActivationLockInfo isRestrictedSKU](self, "isRestrictedSKU"), -[FMDActivationLockInfo isFindMyLPEMEnabled](self, "isFindMyLPEMEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isActivationLocked
{
  return self->_isActivationLocked;
}

- (void)setIsActivationLocked:(BOOL)a3
{
  self->_isActivationLocked = a3;
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_maskedAppleID, a3);
}

- (NSString)maskedOrganizationID
{
  return self->_maskedOrganizationID;
}

- (void)setMaskedOrganizationID:(id)a3
{
  objc_storeStrong((id *)&self->_maskedOrganizationID, a3);
}

- (BOOL)isOfflineFindingEnabled
{
  return self->_isOfflineFindingEnabled;
}

- (void)setIsOfflineFindingEnabled:(BOOL)a3
{
  self->_isOfflineFindingEnabled = a3;
}

- (NSDictionary)localeStrings
{
  return self->_localeStrings;
}

- (void)setLocaleStrings:(id)a3
{
  objc_storeStrong((id *)&self->_localeStrings, a3);
}

- (BOOL)isRestrictedSKU
{
  return self->_isRestrictedSKU;
}

- (void)setIsRestrictedSKU:(BOOL)a3
{
  self->_isRestrictedSKU = a3;
}

- (BOOL)isFindMyLPEMEnabled
{
  return self->_isFindMyLPEMEnabled;
}

- (void)setIsFindMyLPEMEnabled:(BOOL)a3
{
  self->_isFindMyLPEMEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeStrings, 0);
  objc_storeStrong((id *)&self->_maskedOrganizationID, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
