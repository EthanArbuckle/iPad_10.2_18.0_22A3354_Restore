@implementation CNContactWithNamePredicate

- (id)contactsFromCLSDataStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  -[CNContactWithNamePredicate name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C93E38]), "initWithOptions:behaviors:searchString:", 1, 1, v5);
    +[CNClassKitServices objectsMatching:fromStore:](CNClassKitServices, "objectsMatching:fromStore:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke;
    v10[3] = &unk_1E29F9260;
    v10[4] = self;
    objc_msgSend(v7, "map:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a2, "_cn_filter:", CLSObjectIsPerson);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke_2;
  v7[3] = &unk_1E29F9238;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "_cn_filter:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_cn_map:", CLSPersonToCNContactTransform);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "doesPerson:matchName:", v3, v5);

  return v6;
}

+ (BOOL)doesPerson:(id)a3 matchName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "_cn_tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CNContactWithNamePredicate_MAID__doesPerson_matchName___block_invoke;
  v10[3] = &unk_1E29F9198;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "_cn_all:", v10);

  return v8;
}

uint64_t __57__CNContactWithNamePredicate_MAID__doesPerson_matchName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_cn_hasPrefix:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "middleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "_cn_hasPrefix:", v3) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "_cn_hasPrefix:", v3);

    }
  }

  return v5;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[CNContactWithNamePredicate name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestContactMatchesWithMessagingPrefix:limitTo:error:", v9, -1, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNContactWithNamePredicate)initWithName:(id)a3
{
  return -[CNContactWithNamePredicate initWithName:options:](self, "initWithName:options:", a3, 3);
}

- (CNContactWithNamePredicate)initWithName:(id)a3 options:(unint64_t)a4
{
  id v6;
  CNContactWithNamePredicate *v7;
  uint64_t v8;
  NSString *name;
  CNContactWithNamePredicate *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactWithNamePredicate;
  v7 = -[CNPredicate init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_options = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactWithNamePredicate)initWithCoder:(id)a3
{
  id v4;
  CNContactWithNamePredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  CNContactWithNamePredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNContactWithNamePredicate;
  v5 = -[CNPredicate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactWithNamePredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);

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

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingName:]"));
  -[CNContactWithNamePredicate name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v5);

  objc_msgSend((id)objc_opt_class(), "descriptionForOptions:", -[CNContactWithNamePredicate options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("options"), v7);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (id)descriptionForOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 2) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("prefix"));
  if ((v3 & 1) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("cd-insensitive"));
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v6 = CFSTR("none");
  }
  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNContactWithNamePredicate *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__CNContactWithNamePredicate_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __38__CNContactWithNamePredicate_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __38__CNContactWithNamePredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __38__CNContactWithNamePredicate_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "options"), objc_msgSend(*(id *)(a1 + 40), "options"));
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CNContactWithNamePredicate_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CNContactWithNamePredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __34__CNContactWithNamePredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __34__CNContactWithNamePredicate_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "unsignedIntegerHash:", objc_msgSend(*(id *)(a1 + 32), "options"));
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
