@implementation CNiOSABAccountForExternalIdentifierPredicate

- (CNiOSABAccountForExternalIdentifierPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABAccountForExternalIdentifierPredicate initWithAccountExternalIdentifier:](self, "initWithAccountExternalIdentifier:", 0);
}

- (CNiOSABAccountForExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABAccountForExternalIdentifierPredicate *v6;
  uint64_t v7;
  NSString *externalIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("externalIdentifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    externalIdentifier = v6->_externalIdentifier;
    v6->_externalIdentifier = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAccountForExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABAccountForExternalIdentifierPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *externalIdentifier;
  CNiOSABAccountForExternalIdentifierPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABAccountForExternalIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("_externalIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  const __CFAllocator *v4;
  __CFArray *v5;
  void *values;

  -[CNiOSABAccountForExternalIdentifierPredicate externalIdentifier](self, "externalIdentifier");

  values = (void *)ABAddressBookCopyAccountWithIdentifier();
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!values)
    return CFArrayCreate(v4, 0, 0, MEMORY[0x1E0C9B378]);
  v5 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  if (values)
    CFRelease(values);
  return v5;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

@end
