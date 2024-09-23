@implementation CNiOSABDefaultContainerForAccountPredicate

- (CNiOSABDefaultContainerForAccountPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABDefaultContainerForAccountPredicate initWithAccountIdentifier:](self, "initWithAccountIdentifier:", 0);
}

- (CNiOSABDefaultContainerForAccountPredicate)initWithAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABDefaultContainerForAccountPredicate *v6;
  uint64_t v7;
  NSString *identifier;
  CNiOSABDefaultContainerForAccountPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("defaultForAccount.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABDefaultContainerForAccountPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABDefaultContainerForAccountPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  CNiOSABDefaultContainerForAccountPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABDefaultContainerForAccountPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex v7;
  const void *ValueAtIndex;
  const void *v9;
  __CFArray *v10;
  const void **p_DefaultSourceForAccount;
  CFIndex v12;
  uint64_t DefaultSourceForAccount;

  -[CNiOSABDefaultContainerForAccountPredicate identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
  if (!v5)
    return 0;
  v6 = v5;
  if (CFArrayGetCount(v5) < 1)
    goto LABEL_13;
  v7 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
    v9 = (const void *)ABAccountCopyInternalUUID();
    if (v9)
      v9 = CFAutorelease(v9);
    if (CFEqual(v9, v4))
      break;
    if (++v7 >= CFArrayGetCount(v6))
      goto LABEL_13;
  }
  if (ValueAtIndex)
  {
    DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount();
    if (DefaultSourceForAccount)
    {
      p_DefaultSourceForAccount = (const void **)&DefaultSourceForAccount;
      v12 = 1;
    }
    else
    {
      p_DefaultSourceForAccount = 0;
      v12 = 0;
    }
    v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], p_DefaultSourceForAccount, v12, MEMORY[0x1E0C9B378]);
  }
  else
  {
LABEL_13:
    v10 = 0;
  }
  CFRelease(v6);
  return v10;
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForDefaultContainerForAccountWithIdentifier:]"));
  -[CNiOSABDefaultContainerForAccountPredicate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
