@implementation CNiOSABContainersForAccountExternalIdentifierPredicate

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABContainersForAccountExternalIdentifierPredicate initWithAccountExternalIdentifier:](self, "initWithAccountExternalIdentifier:", 0);
}

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithAccountExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContainersForAccountExternalIdentifierPredicate *v6;
  uint64_t v7;
  NSString *accountExternalIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("externalIdentifierString == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    accountExternalIdentifier = v6->_accountExternalIdentifier;
    v6->_accountExternalIdentifier = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForAccountExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainersForAccountExternalIdentifierPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *accountExternalIdentifier;
  CNiOSABContainersForAccountExternalIdentifierPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountExternalIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    accountExternalIdentifier = v5->_accountExternalIdentifier;
    v5->_accountExternalIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForAccountExternalIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountExternalIdentifier, CFSTR("_accountExternalIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  -[CNiOSABContainersForAccountExternalIdentifierPredicate accountExternalIdentifier](self, "accountExternalIdentifier");
  return (__CFArray *)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier();
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainersInAccountWithExternalIdentifier:]"));
  -[CNiOSABContainersForAccountExternalIdentifierPredicate accountExternalIdentifier](self, "accountExternalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("externalIdentifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)accountExternalIdentifier
{
  return self->_accountExternalIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountExternalIdentifier, 0);
}

@end
