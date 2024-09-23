@implementation CNiOSABOrganizationNameContactPredicate

- (CNiOSABOrganizationNameContactPredicate)initWithOrganizationName:(id)a3
{
  id v4;
  CNiOSABOrganizationNameContactPredicate *v5;
  uint64_t v6;
  NSString *organizationName;
  CNiOSABOrganizationNameContactPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABOrganizationNameContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABOrganizationNameContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationName;
  CNiOSABOrganizationNameContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_organizationName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABOrganizationNameContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_organizationName, CFSTR("_organizationName"), v5.receiver, v5.super_class);

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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactWithOrganizationName:]"));
  -[CNiOSABOrganizationNameContactPredicate organizationName](self, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("organizationName"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
  -[CNiOSABOrganizationNameContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
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
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0CF5D90];
  v13 = a6;
  v14 = a4;
  -[CNiOSABOrganizationNameContactPredicate organizationName](self, "organizationName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personPredicateWithValue:comparison:forProperty:addressBook:", v15, 3, *MEMORY[0x1E0CF6138], a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v22[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(v14, "sortOrder");
  v19 = objc_msgSend(v14, "options");

  +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v17, v18, a5, v19, a3, v13, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  return v20;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CF5D88];
  -[CNiOSABOrganizationNameContactPredicate organizationName](self, "organizationName", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContactsMatchingOrganizationName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CNiOSABOrganizationNameContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __51__CNiOSABOrganizationNameContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "organizationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __47__CNiOSABOrganizationNameContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __47__CNiOSABOrganizationNameContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "organizationName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
}

@end
