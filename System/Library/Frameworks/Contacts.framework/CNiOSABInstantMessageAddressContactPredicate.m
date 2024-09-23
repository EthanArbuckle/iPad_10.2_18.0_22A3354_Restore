@implementation CNiOSABInstantMessageAddressContactPredicate

- (CNiOSABInstantMessageAddressContactPredicate)initWithInstantMessageAddress:(id)a3
{
  id v4;
  CNiOSABInstantMessageAddressContactPredicate *v5;
  uint64_t v6;
  CNInstantMessageAddress *imAddress;
  CNiOSABInstantMessageAddressContactPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABInstantMessageAddressContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABInstantMessageAddressContactPredicate *v5;
  void *v6;
  uint64_t v7;
  CNInstantMessageAddress *imAddress;
  CNiOSABInstantMessageAddressContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    imAddress = v5->_imAddress;
    v5->_imAddress = (CNInstantMessageAddress *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABInstantMessageAddressContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imAddress, CFSTR("_imAddress"), v5.receiver, v5.super_class);

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
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v13 = 0;
  -[CNiOSABInstantMessageAddressContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a7)
  {
    *a7 = (__CFError *)v9;
  }

  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  if (a5)
    *a5 = 0;
  +[CN instantMessagAddressesDescription](CN, "instantMessagAddressesDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABInstantMessageAddressContactPredicate imAddress](self, "imAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend((id)objc_msgSend(v14, "ABMultiValueValueFromCNLabeledValueValue:", v15), "mutableCopy");

  objc_msgSend(v16, "removeObjectForKey:", *MEMORY[0x1E0CF5F80]);
  v17 = (void *)MEMORY[0x1E0CF5D80];
  v18 = objc_msgSend(v12, "sortOrder");
  objc_msgSend(v17, "personPredicateWithValue:comparison:forProperty:", v16, v18, *MEMORY[0x1E0CF6020]);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
  {
    v31[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    v23 = a3;
    v24 = objc_msgSend(v12, "sortOrder");
    v25 = objc_msgSend(v12, "options");
    v26 = v23;
    v13 = v22;
    +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v21, v24, a5, v25, v26, v22, a7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a7)
      *a7 = objc_retainAutorelease(v28);

    v27 = 0;
  }

  return v27;
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

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingInstantMessageAddress:]"));
  -[CNiOSABInstantMessageAddressContactPredicate imAddress](self, "imAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("im"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
  v8[2] = __56__CNiOSABInstantMessageAddressContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __56__CNiOSABInstantMessageAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "imAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __52__CNiOSABInstantMessageAddressContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __52__CNiOSABInstantMessageAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "imAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (CNInstantMessageAddress)imAddress
{
  return self->_imAddress;
}

- (void)setImAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imAddress, 0);
}

@end
