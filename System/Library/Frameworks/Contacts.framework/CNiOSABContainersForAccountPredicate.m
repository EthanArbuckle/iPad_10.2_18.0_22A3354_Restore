@implementation CNiOSABContainersForAccountPredicate

- (CNiOSABContainersForAccountPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABContainersForAccountPredicate initWithAccountIdentifier:includingDisabledContainers:](self, "initWithAccountIdentifier:includingDisabledContainers:", 0, 0);
}

- (CNiOSABContainersForAccountPredicate)initWithAccountIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4
{
  id v6;
  void *v7;
  CNiOSABContainersForAccountPredicate *v8;
  uint64_t v9;
  NSString *accountIdentifier;
  objc_super v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account.identifier == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABContainersForAccountPredicate;
  v8 = -[CNPredicate initWithPredicate:](&v12, sel_initWithPredicate_, v7);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    v8->_includesDisabledContainers = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForAccountPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainersForAccountPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *accountIdentifier;
  CNiOSABContainersForAccountPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainersForAccountPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v7;

    v5->_includesDisabledContainers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includesDisabledContainers"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForAccountPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("_accountIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesDisabledContainers, CFSTR("_includesDisabledContainers"));

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __CFArray *MutableCopy;
  void *v10;
  void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex v14;
  const void *ValueAtIndex;
  const void *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  void *values;

  -[CNiOSABContainersForAccountPredicate accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAccount localAccount](CNAccount, "localAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    values = (void *)ABAddressBookCopyLocalSource();
    if (!values)
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    MutableCopy = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v10 = values;
  }
  else
  {
    -[CNiOSABContainersForAccountPredicate accountIdentifier](self, "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    v12 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    if (!v12)
      return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    v13 = v12;
    if (CFArrayGetCount(v12) < 1)
      goto LABEL_17;
    v14 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v13, v14);
      v16 = (const void *)ABAccountCopyInternalUUID();
      if (v16)
        v16 = CFAutorelease(v16);
      if (CFEqual(v16, v11))
        break;
      if (++v14 >= CFArrayGetCount(v13))
        goto LABEL_17;
    }
    if (ValueAtIndex && (v17 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesInAccount()) != 0)
    {
      v18 = v17;
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v17);
      CFRelease(v18);
    }
    else
    {
LABEL_17:
      MutableCopy = 0;
    }
    v10 = v13;
  }
  CFRelease(v10);
  if (!MutableCopy)
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  return MutableCopy;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainersInAccountWithIdentifier:]"));
  -[CNiOSABContainersForAccountPredicate accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)includesDisabledContainers
{
  return self->_includesDisabledContainers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
