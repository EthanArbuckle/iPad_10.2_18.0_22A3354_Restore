@implementation ANSectionSubtypeDescriptor

- (ANSectionSubtypeDescriptor)init
{

  return 0;
}

- (id)initForAccountWithType:(id)a3
{
  id v4;
  ANSectionSubtypeDescriptor *v5;
  uint64_t v6;
  NSString *accountTypeID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANSectionSubtypeDescriptor;
  v5 = -[ANSectionSubtypeDescriptor init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountTypeID;
  id v5;

  accountTypeID = self->_accountTypeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountTypeID, CFSTR("_accountTypeID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_subtype, CFSTR("_subtype"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsAddingToLockScreenWhenUnlocked, CFSTR("_allowsAddingToLockScreenWhenUnlocked"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullUnlockActionLabel, CFSTR("_fullUnlockActionLabel"));

}

- (ANSectionSubtypeDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSectionSubtypeDescriptor *v5;
  uint64_t v6;
  NSString *accountTypeID;
  uint64_t v8;
  NSString *fullUnlockActionLabel;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANSectionSubtypeDescriptor;
  v5 = -[ANSectionSubtypeDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountTypeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    v5->_subtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_subtype"));
    v5->_allowsAddingToLockScreenWhenUnlocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsAddingToLockScreenWhenUnlocked"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fullUnlockActionLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    fullUnlockActionLabel = v5->_fullUnlockActionLabel;
    v5->_fullUnlockActionLabel = (NSString *)v8;

  }
  return v5;
}

- (NSString)accountTypeID
{
  return self->_accountTypeID;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (BOOL)allowsAddingToLockScreenWhenUnlocked
{
  return self->_allowsAddingToLockScreenWhenUnlocked;
}

- (void)setAllowsAddingToLockScreenWhenUnlocked:(BOOL)a3
{
  self->_allowsAddingToLockScreenWhenUnlocked = a3;
}

- (NSString)fullUnlockActionLabel
{
  return self->_fullUnlockActionLabel;
}

- (void)setFullUnlockActionLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullUnlockActionLabel, 0);
  objc_storeStrong((id *)&self->_accountTypeID, 0);
}

@end
