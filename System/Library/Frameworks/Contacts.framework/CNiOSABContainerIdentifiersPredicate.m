@implementation CNiOSABContainerIdentifiersPredicate

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  __CFArray *v9;

  -[CNiOSABContainerIdentifiersPredicate identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[CNiOSABContainerIdentifiersPredicate identifiers](self, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFArray *)ABAddressBookCopySourcesWithUUIDs();

    if (!v9)
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  else if (a4)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v9 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v9;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (CNiOSABContainerIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContainerIdentifiersPredicate *v6;
  uint64_t v7;
  NSArray *identifiers;
  CNiOSABContainerIdentifiersPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainerIdentifiersPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *identifiers;
  CNiOSABContainerIdentifiersPredicate *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  v5 = -[CNPredicate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_identifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerIdentifiersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, CFSTR("_identifiers"), v5.receiver, v5.super_class);

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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainersWithIdentifiers:]"));
  -[CNiOSABContainerIdentifiersPredicate identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifiers"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
