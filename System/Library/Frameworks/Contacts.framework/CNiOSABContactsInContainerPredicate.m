@implementation CNiOSABContactsInContainerPredicate

- (CNiOSABContactsInContainerPredicate)initWithParentContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContactsInContainerPredicate *v6;
  uint64_t v7;
  NSString *parentContainerIdentifier;
  CNiOSABContactsInContainerPredicate *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parentContainer.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInContainerPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    parentContainerIdentifier = v6->_parentContainerIdentifier;
    v6->_parentContainerIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactsInContainerPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContactsInContainerPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *parentContainerIdentifier;
  CNiOSABContactsInContainerPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInContainerPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentContainerIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    parentContainerIdentifier = v5->_parentContainerIdentifier;
    v5->_parentContainerIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactsInContainerPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentContainerIdentifier, CFSTR("_parentContainerIdentifier"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;

  v15 = 0;
  -[CNiOSABContactsInContainerPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a7)
  {
    v12 = objc_msgSend(v9, "code");
    objc_msgSend(v10, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v12, v13);
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();

  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CFArrayRef v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = *MEMORY[0x1E0D13848];
  -[CNiOSABContactsInContainerPredicate parentContainerIdentifier](self, "parentContainerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if ((_DWORD)v11)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a7)
      *a7 = objc_retainAutorelease(v13);

    v15 = 0;
  }
  else
  {
    -[CNiOSABContactsInContainerPredicate parentContainerIdentifier](self, "parentContainerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)ABAddressBookCopySourcesWithUUIDs();

    if (v17
      && (objc_msgSend(v17, "firstObject"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      v15 = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(a3, v18, objc_msgSend(v10, "sortOrder"));
    }
    else
    {
      v15 = (CFArrayRef)MEMORY[0x1E0C9AA60];
    }

  }
  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = *MEMORY[0x1E0D13848];
  -[CNiOSABContactsInContainerPredicate parentContainerIdentifier](self, "parentContainerIdentifier", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((_DWORD)v7)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a5)
    {
      v10 = objc_retainAutorelease(v9);
      v11 = 0;
      *a5 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CF5D88];
    -[CNiOSABContactsInContainerPredicate parentContainerIdentifier](self, "parentContainerIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForContactsInContainerWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsInContainerWithIdentifier:]"));
  -[CNiOSABContactsInContainerPredicate parentContainerIdentifier](self, "parentContainerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)parentContainerIdentifier
{
  return self->_parentContainerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentContainerIdentifier, 0);
}

@end
