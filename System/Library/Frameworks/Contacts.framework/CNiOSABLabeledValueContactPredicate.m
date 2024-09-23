@implementation CNiOSABLabeledValueContactPredicate

- (CNiOSABLabeledValueContactPredicate)initWithLabeledValueIdentifier:(id)a3
{
  id v3;
  CNiOSABLabeledValueContactPredicate *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  v3 = a3;
  v4 = -[CNPredicate init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLabeledValueContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABLabeledValueContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  CNiOSABLabeledValueContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"), v5.receiver, v5.super_class);

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
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __CFArray *v15;
  void *v16;
  void *PersonMatchingMultiValueUUID;
  void *v18;
  NSMapTable *v19;
  void *v20;
  void *values;
  int v23;
  uint64_t v24;
  NSMapTable *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = *MEMORY[0x1E0D13848];
  -[CNiOSABLabeledValueContactPredicate identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  if ((_DWORD)v13)
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
  }
  else
  {
    v23 = -1;
    -[CNiOSABLabeledValueContactPredicate identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PersonMatchingMultiValueUUID = (void *)ABAddressBookFindPersonMatchingMultiValueUUID();

    values = PersonMatchingMultiValueUUID;
    if (PersonMatchingMultiValueUUID)
    {
      v15 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      +[CNiOSABConversions contactIdentifierFromABPerson:]((uint64_t)CNiOSABConversions, values);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
      v19 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      NSMapInsert(v19, (const void *)(v23 + 1), MEMORY[0x1E0C9AA60]);
      v25 = v19;
      v26 = v18;
      v24 = *MEMORY[0x1E0CF5C58];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    }
  }

  return v15;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactMatchingLabeledValueIdentifier:]"));
  -[CNiOSABLabeledValueContactPredicate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
