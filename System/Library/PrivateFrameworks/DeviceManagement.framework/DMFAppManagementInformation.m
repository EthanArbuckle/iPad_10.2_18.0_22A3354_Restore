@implementation DMFAppManagementInformation

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setState:", -[DMFAppManagementInformation state](self, "state"));
  objc_msgSend(v4, "setOptions:", -[DMFAppManagementInformation options](self, "options"));
  -[DMFAppManagementInformation redemptionCode](self, "redemptionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRedemptionCode:", v5);

  -[DMFAppManagementInformation unusedRedemptionCode](self, "unusedRedemptionCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnusedRedemptionCode:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFAppManagementInformation)initWithCoder:(id)a3
{
  id v4;
  DMFAppManagementInformation *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *redemptionCode;
  void *v11;
  uint64_t v12;
  NSString *unusedRedemptionCode;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFAppManagementInformation;
  v5 = -[DMFAppManagementInformation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v7, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("redemptionCode"));
    v9 = objc_claimAutoreleasedReturnValue();
    redemptionCode = v5->_redemptionCode;
    v5->_redemptionCode = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("unusedRedemptionCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    unusedRedemptionCode = v5->_unusedRedemptionCode;
    v5->_unusedRedemptionCode = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFAppManagementInformation state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFAppManagementInformation options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("options"));

  -[DMFAppManagementInformation redemptionCode](self, "redemptionCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("redemptionCode"));

  -[DMFAppManagementInformation unusedRedemptionCode](self, "unusedRedemptionCode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("unusedRedemptionCode"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForState:", -[DMFAppManagementInformation state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("State                  : %@\n"), v4);

  -[DMFAppManagementInformation _stringForOptions:](self, "_stringForOptions:", -[DMFAppManagementInformation options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Options                : %@\n"), v5);

  -[DMFAppManagementInformation redemptionCode](self, "redemptionCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Redemption Code        : %@\n"), v6);

  -[DMFAppManagementInformation unusedRedemptionCode](self, "unusedRedemptionCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Unused Redemption Code : %@\n"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

+ (id)stringForState:(unint64_t)a3
{
  if (a3 > 0x12)
    return CFSTR("Unknown");
  else
    return off_1E6ED7B20[a3];
}

- (id)_stringForOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (!a3)
  {
    objc_msgSend(v4, "appendString:", CFSTR("None"));
    goto LABEL_12;
  }
  v6 = &stru_1E6ED9BA0;
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(v5, "appendFormat:", CFSTR("%@Remove Keychain Group"), v6);
    v6 = CFSTR(", ");
    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Remove App"), &stru_1E6ED9BA0);
  v6 = CFSTR(", ");
  if ((a3 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a3 & 4) == 0)
    goto LABEL_5;
LABEL_10:
  objc_msgSend(v5, "appendFormat:", CFSTR("%@Prevent Backup"), v6);
  v6 = CFSTR(", ");
  if ((a3 & 8) != 0)
LABEL_11:
    objc_msgSend(v5, "appendFormat:", CFSTR("%@Prevent Document Sync"), v6);
LABEL_12:
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)redemptionCode
{
  return self->_redemptionCode;
}

- (void)setRedemptionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)unusedRedemptionCode
{
  return self->_unusedRedemptionCode;
}

- (void)setUnusedRedemptionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unusedRedemptionCode, 0);
  objc_storeStrong((id *)&self->_redemptionCode, 0);
}

@end
