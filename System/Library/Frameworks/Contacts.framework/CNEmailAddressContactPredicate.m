@implementation CNEmailAddressContactPredicate

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)returnsMultipleResults
{
  return self->_returnsMultipleResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (BOOL)cn_hasHighSpecificity
{
  void *v2;
  void *v3;
  char v4;

  -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("@"));

  return v4;
}

- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 returnMultipleResults:(BOOL)a4
{
  return -[CNEmailAddressContactPredicate initWithEmailAddress:groupIdentifiers:returnMultipleResults:](self, "initWithEmailAddress:groupIdentifiers:returnMultipleResults:", a3, 0, a4);
}

- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 groupIdentifiers:(id)a4 returnMultipleResults:(BOOL)a5
{
  id v8;
  id v9;
  CNEmailAddressContactPredicate *v10;
  void *v11;
  uint64_t v12;
  NSArray *groupIdentifiers;
  CNEmailAddressContactPredicate *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNEmailAddressContactPredicate;
  v10 = -[CNPredicate init](&v16, sel_init);
  if (v10)
  {
    if (v8)
    {
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&v10->_emailAddresses, v11);
    if (v8)

    v12 = objc_msgSend(v9, "copy");
    groupIdentifiers = v10->_groupIdentifiers;
    v10->_groupIdentifiers = (NSArray *)v12;

    v10->_returnsMultipleResults = a5;
    v14 = v10;
  }

  return v10;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingEmailAddresses:]"));
  -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("emailAddresses"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)shortDebugDescription
{
  return CFSTR("EmailPredicate");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNEmailAddressContactPredicate *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CNEmailAddressContactPredicate *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__CNEmailAddressContactPredicate_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v17 = v4;
  v18 = self;
  aBlock = v6;
  v11 = 3221225472;
  v12 = __42__CNEmailAddressContactPredicate_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

BOOL __42__CNEmailAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 40), "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == objc_msgSend(v4, "count");

  return v5;
}

uint64_t __42__CNEmailAddressContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CNEmailAddressContactPredicate_isEqual___block_invoke_3;
  v5[3] = &unk_1E29F9210;
  v6 = *(id *)(a1 + 40);
  v7 = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __42__CNEmailAddressContactPredicate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(MEMORY[0x1E0D13A40], "isString:localizedCaseInsensitiveEqualToOther:", v8, v10);
  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke_3;
  v9[3] = &unk_1E29F7D98;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "groupIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "returnsMultipleResults"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEmailAddressContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNEmailAddressContactPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *emailAddresses;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *groupIdentifiers;
  CNEmailAddressContactPredicate *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNEmailAddressContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_emailAddresses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_groupIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v16;

    v5->_returnsMultipleResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_returnsMultipleResults"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNEmailAddressContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddresses, CFSTR("_emailAddresses"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifiers, CFSTR("_groupIdentifiers"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_returnsMultipleResults, CFSTR("_returnsMultipleResults"));

}

- (id)contactsFromCLSDataStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C93E38]), "initWithOptions:behaviors:searchString:", 1, 1, v6);
    +[CNClassKitServices objectsMatching:fromStore:](CNClassKitServices, "objectsMatching:fromStore:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "map:", &__block_literal_global_45);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", MEMORY[0x1E0C9AA60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __65__CNEmailAddressContactPredicate_MAID__contactsFromCLSDataStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "_cn_filter:", CLSObjectIsPerson);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", CLSPersonToCNContactTransform);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "contactMatchesByEmailAddress:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (v12)
          {
            objc_msgSend(v12, "addObjectsFromArray:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
