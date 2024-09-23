@implementation CNiOSABAccountForContainerPredicate

- (CNiOSABAccountForContainerPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABAccountForContainerPredicate initWithContainerIdentifier:](self, "initWithContainerIdentifier:", 0);
}

- (CNiOSABAccountForContainerPredicate)initWithContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABAccountForContainerPredicate *v6;
  uint64_t v7;
  NSString *containerIdentifier;
  CNiOSABAccountForContainerPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY containers.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForContainerPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAccountForContainerPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABAccountForContainerPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *containerIdentifier;
  CNiOSABAccountForContainerPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForContainerPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABAccountForContainerPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v5;
  void *v6;
  const __CFArray *v7;
  int IntValue;
  void *AccountForSource;
  __CFArray *v10;
  void *values;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CNiOSABAccountForContainerPredicate containerIdentifier](self, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNiOSABAccountForContainerPredicate containerIdentifier](self, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();

    if (v7)
    {
      if (CFArrayGetCount(v7) == 1)
      {
        CFArrayGetValueAtIndex(v7, 0);
        IntValue = ABRecordGetIntValue();
        AccountForSource = (void *)ABAddressBookGetAccountForSource();
        values = AccountForSource;
        if (AccountForSource)
        {
          CFRetain(AccountForSource);
        }
        else if (IntValue || (values = (void *)ABAccountCreate()) == 0)
        {
          v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
          goto LABEL_11;
        }
        v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
        CFRelease(values);
      }
      else
      {
        v10 = 0;
      }
LABEL_11:
      CFRelease(v7);
      return v10;
    }
  }
  return 0;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
