@implementation CNiOSABContactsInGroupPredicate

- (CNiOSABContactsInGroupPredicate)initWithParentGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContactsInGroupPredicate *v6;
  uint64_t v7;
  NSString *parentGroupIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parentGroup.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContactsInGroupPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    parentGroupIdentifier = v6->_parentGroupIdentifier;
    v6->_parentGroupIdentifier = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactsInGroupPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContactsInGroupPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *parentGroupIdentifier;
  CNiOSABContactsInGroupPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContactsInGroupPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentGroupIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    parentGroupIdentifier = v5->_parentGroupIdentifier;
    v5->_parentGroupIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactsInGroupPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentGroupIdentifier, CFSTR("_parentGroupIdentifier"), v5.receiver, v5.super_class);

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
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  const void *ValueAtIndex;
  __CFArray *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  -[CNiOSABContactsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v15 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_11;
  }
  -[CNiOSABContactsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (const void *)ABAddressBookCopyGroupsWithUUIDs();

  if (!v13)
  {
LABEL_9:
    v15 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    goto LABEL_11;
  }
  if (CFArrayGetCount((CFArrayRef)v13) <= 0)
  {
    CFRelease(v13);
    goto LABEL_9;
  }
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
  v15 = ABGroupCopyArrayOfAllMembersWithSortOrdering(ValueAtIndex, objc_msgSend(v9, "sortOrder"));
  CFRelease(v13);
  if (!v15)
    goto LABEL_9;
LABEL_11:

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNiOSABContactsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CF5D88];
    -[CNiOSABContactsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForContactsInGroupWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CNSetError(a5, 400, 0);
    v11 = 0;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsInGroupWithIdentifier:]"));
  -[CNiOSABContactsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
}

@end
