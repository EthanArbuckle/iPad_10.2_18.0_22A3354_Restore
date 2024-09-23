@implementation CNHandleStringsContactPredicate

id __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  CNContactHandleStringIndexer *v4;
  void *v5;

  v3 = a2;
  v4 = -[CNContactHandleStringIndexer initWithTargetHandleStrings:]([CNContactHandleStringIndexer alloc], "initWithTargetHandleStrings:", *(_QWORD *)(a1 + 32));
  -[CNContactHandleStringIndexer indexContacts:](v4, "indexContacts:", v3);

  -[CNContactHandleStringIndexer index](v4, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cn_resultTransformWithMatchInfos:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id (*v9)(uint64_t, void *);
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_50);

  -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    v15 = MEMORY[0x1E0C809B0];
    v9 = __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_2;
    v10 = &v15;
    v11 = v4;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v9 = __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_3;
    v10 = &v14;
    v11 = (void *)v7;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_1E29F9908;
  v10[4] = (uint64_t)v11;
  v12 = _Block_copy(v10);

  return v12;
}

- (NSArray)handleStrings
{
  return self->_handleStrings;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);
  objc_storeStrong((id *)&self->_handleStrings, 0);
}

- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3 containerIdentifiers:(id)a4
{
  id v6;
  id v7;
  CNHandleStringsContactPredicate *v8;
  uint64_t v9;
  NSArray *handleStrings;
  uint64_t v11;
  NSArray *containerIdentifiers;
  CNHandleStringsContactPredicate *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNHandleStringsContactPredicate;
  v8 = -[CNPredicate init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    handleStrings = v8->_handleStrings;
    v8->_handleStrings = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    containerIdentifiers = v8->_containerIdentifiers;
    v8->_containerIdentifiers = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0D13A38];
    v7 = a3;
    objc_msgSend(v6, "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = a4;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "%04llx Default country code: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (CNHandleStringsContactPredicate)init
{
  return -[CNHandleStringsContactPredicate initWithHandleStrings:](self, "initWithHandleStrings:", MEMORY[0x1E0C9AA60]);
}

- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3
{
  return -[CNHandleStringsContactPredicate initWithHandleStrings:containerIdentifiers:](self, "initWithHandleStrings:containerIdentifiers:", a3, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNHandleStringsContactPredicate containerIdentifiers](self, "containerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingHandleStrings:inContainersWithIdentifiers:]"));
    -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("handleStrings"), v6);

    -[CNHandleStringsContactPredicate containerIdentifiers](self, "containerIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("containerIdentifiers");
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingHandleStrings:]"));
    -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("handleStrings");
  }
  v11 = (id)objc_msgSend(v3, "appendName:object:", v9, v8);

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)shortDebugDescription
{
  return CFSTR("HandleStringsPredicate");
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
  v8[2] = __43__CNHandleStringsContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __43__CNHandleStringsContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "handleStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "handleStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __39__CNHandleStringsContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNHandleStringsContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "handleStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNHandleStringsContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNHandleStringsContactPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *handleStrings;
  CNHandleStringsContactPredicate *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNHandleStringsContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_handleStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    handleStrings = v5->_handleStrings;
    v5->_handleStrings = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNHandleStringsContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_handleStrings, CFSTR("_handleStrings"), v5.receiver, v5.super_class);

}

BOOL __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "matchedTerms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v2;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v6 = *(void **)(a1 + 32);
        objc_msgSend(v5, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "matchedTerms");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v3, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = v16;
                objc_msgSend(v16, "addObject:", v5);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKey:", v17, v15);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  return v3;
}

@end
