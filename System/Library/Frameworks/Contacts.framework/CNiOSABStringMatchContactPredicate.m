@implementation CNiOSABStringMatchContactPredicate

- (CNiOSABStringMatchContactPredicate)initWithSearchString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNiOSABStringMatchContactPredicate *v14;
  uint64_t v15;
  NSString *searchString;
  uint64_t v17;
  NSString *accountIdentifier;
  uint64_t v19;
  NSString *containerIdentifier;
  uint64_t v21;
  NSString *groupIdentifier;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSABStringMatchContactPredicate;
  v14 = -[CNPredicate init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    accountIdentifier = v14->_accountIdentifier;
    v14->_accountIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    containerIdentifier = v14->_containerIdentifier;
    v14->_containerIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    groupIdentifier = v14->_groupIdentifier;
    v14->_groupIdentifier = (NSString *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABStringMatchContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABStringMatchContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *searchString;
  void *v9;
  uint64_t v10;
  NSString *accountIdentifier;
  void *v12;
  uint64_t v13;
  NSString *containerIdentifier;
  void *v15;
  uint64_t v16;
  NSString *groupIdentifier;
  CNiOSABStringMatchContactPredicate *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABStringMatchContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_searchString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABStringMatchContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("_searchString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("_accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("_groupIdentifier"));

}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  uint64_t v9;
  void *v10;
  __CFArray *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0D13848];
  -[CNiOSABStringMatchContactPredicate searchString](self, "searchString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  if ((_DWORD)v9)
  {
    if (!a7)
      return 0;
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v11 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  -[CNiOSABStringMatchContactPredicate groupIdentifier](self, "groupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CNiOSABStringMatchContactPredicate groupIdentifier](self, "groupIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v14 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)ABAddressBookCopyGroupsWithUUIDs();

    if (v12)
    {
      if (CFArrayGetCount((CFArrayRef)v12))
      {
        CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
        v14 = 0;
      }
      else
      {
        v14 = 1;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  -[CNiOSABStringMatchContactPredicate containerIdentifier](self, "containerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CNiOSABStringMatchContactPredicate containerIdentifier](self, "containerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)ABAddressBookCopySourcesWithUUIDs();

    if (!v15)
      goto LABEL_17;
    if (!CFArrayGetCount((CFArrayRef)v15))
      goto LABEL_17;
    CFArrayGetValueAtIndex((CFArrayRef)v15, 0);
    if ((v14 & 1) != 0)
      goto LABEL_17;
  }
  else if ((v14 & 1) != 0)
  {
LABEL_17:
    v11 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    goto LABEL_18;
  }
  -[CNiOSABStringMatchContactPredicate searchString](self, "searchString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABStringMatchContactPredicate accountIdentifier](self, "accountIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CFArray *)ABAddressBookCopyArrayOfAllPeopleMatching();

  if (!v11)
    goto LABEL_17;
LABEL_18:
  if (v12)
    CFRelease(v12);
  if (v15)
    CFRelease(v15);
  return v11;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
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
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingString:accountIdentifier:containerIdentifier:groupIdentifier:]"));
  -[CNiOSABStringMatchContactPredicate searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("searchString"), v5);

  -[CNiOSABStringMatchContactPredicate accountIdentifier](self, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("accountIdentifier"), v7);

  -[CNiOSABStringMatchContactPredicate containerIdentifier](self, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifier"), v9);

  -[CNiOSABStringMatchContactPredicate groupIdentifier](self, "groupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupIdentifier"), v11);

  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
