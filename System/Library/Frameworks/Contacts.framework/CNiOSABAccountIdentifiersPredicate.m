@implementation CNiOSABAccountIdentifiersPredicate

- (CNiOSABAccountIdentifiersPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABAccountIdentifiersPredicate initWithIdentifiers:](self, "initWithIdentifiers:", MEMORY[0x1E0C9AA60]);
}

- (CNiOSABAccountIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  CNiOSABAccountIdentifiersPredicate *v6;
  uint64_t v7;
  NSArray *identifiers;
  CNiOSABAccountIdentifiersPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
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

- (CNiOSABAccountIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABAccountIdentifiersPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *identifiers;
  CNiOSABAccountIdentifiersPredicate *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
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
  v5.super_class = (Class)CNiOSABAccountIdentifiersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, CFSTR("_identifiers"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyAccountsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNiOSABAccountIdentifiersPredicate identifiers](self, "identifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10))
          objc_msgSend(v5, "addObject:");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (__CFArray *)ABAddressBookCopyAccountsWithUUIDs();
  return v11;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
