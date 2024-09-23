@implementation CNTestSmartFetcher

- (CNTestSmartFetcher)initWithRequiredKeys:(id)a3 optionalKeys:(id)a4
{
  id v6;
  id v7;
  CNTestSmartFetcher *v8;
  uint64_t v9;
  NSArray *requiredKeys;
  uint64_t v11;
  NSArray *optionalKeys;
  CNTestSmartFetcher *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNTestSmartFetcher;
  v8 = -[CNTestSmartFetcher init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    requiredKeys = v8->_requiredKeys;
    v8->_requiredKeys = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    optionalKeys = v8->_optionalKeys;
    v8->_optionalKeys = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNTestSmartFetcher)initWithCoder:(id)a3
{
  id v4;
  CNTestSmartFetcher *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *requiredKeys;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *optionalKeys;
  CNTestSmartFetcher *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNTestSmartFetcher;
  v5 = -[CNTestSmartFetcher init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("requiredKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    requiredKeys = v5->_requiredKeys;
    v5->_requiredKeys = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("optionalKeys"));
    v14 = objc_claimAutoreleasedReturnValue();
    optionalKeys = v5->_optionalKeys;
    v5->_optionalKeys = (NSArray *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *requiredKeys;
  id v5;

  requiredKeys = self->_requiredKeys;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requiredKeys, CFSTR("requiredKeys"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_optionalKeys, CFSTR("optionalKeys"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNTestSmartFetcher *v4;
  void *v5;
  void *v6;
  CNTestSmartFetcher *v7;

  v4 = [CNTestSmartFetcher alloc];
  -[CNTestSmartFetcher requiredKeys](self, "requiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTestSmartFetcher optionalKeys](self, "optionalKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNTestSmartFetcher initWithRequiredKeys:optionalKeys:](v4, "initWithRequiredKeys:optionalKeys:", v5, v6);

  return v7;
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
  CNTestSmartFetcher *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v15 = v4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__CNTestSmartFetcher_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __30__CNTestSmartFetcher_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __30__CNTestSmartFetcher_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "requiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __30__CNTestSmartFetcher_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "optionalKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "optionalKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
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
  v7[2] = __26__CNTestSmartFetcher_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNTestSmartFetcher_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __26__CNTestSmartFetcher_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "requiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __26__CNTestSmartFetcher_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "optionalKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CNTestSmartFetcher requiredKeys](self, "requiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = (id)v4[2](v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNTestSmartFetcher optionalKeys](self, "optionalKeys", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = (id)v4[2](v4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (id)_cn_requiredKeys
{
  void *v2;
  void *v3;

  -[CNTestSmartFetcher requiredKeys](self, "requiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cn_optionalKeys
{
  void *v2;
  void *v3;

  -[CNTestSmartFetcher optionalKeys](self, "optionalKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (NSArray)optionalKeys
{
  return self->_optionalKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalKeys, 0);
  objc_storeStrong((id *)&self->_requiredKeys, 0);
}

@end
