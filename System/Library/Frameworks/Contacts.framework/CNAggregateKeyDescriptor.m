@implementation CNAggregateKeyDescriptor

- (id)_cn_requiredKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNAggregateKeyDescriptor keyDescriptors](self, "keyDescriptors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_cn_requiredKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionKeyVector:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSArray)keyDescriptors
{
  return self->_keyDescriptors;
}

- (id)_cn_optionalKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNAggregateKeyDescriptor keyDescriptors](self, "keyDescriptors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_cn_optionalKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionKeyVector:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (CNContactKeyVector)unauthorizedKeys
{
  return self->_unauthorizedKeys;
}

uint64_t __32__CNAggregateKeyDescriptor_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "privateDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

- (NSString)privateDescription
{
  return self->_privateDescription;
}

uint64_t __32__CNAggregateKeyDescriptor_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "keyDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
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
  v7[2] = __32__CNAggregateKeyDescriptor_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CNAggregateKeyDescriptor_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (id)_cn_ignorableKeys
{
  return +[CNAccessAuthorization allAuthorizationKeysVector](CNAccessAuthorization, "allAuthorizationKeysVector");
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
  CNAggregateKeyDescriptor *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v15 = v4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__CNAggregateKeyDescriptor_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __36__CNAggregateKeyDescriptor_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNAggregateKeyDescriptor keyDescriptors](self, "keyDescriptors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_cn_executeGetterForRepresentedKeys:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (id)keyDescriptorWithKeyDescriptors:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeyDescriptors:description:", v7, v6);

  return v8;
}

- (CNAggregateKeyDescriptor)initWithKeyDescriptors:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  CNAggregateKeyDescriptor *v8;
  CNAggregateKeyDescriptor *v9;
  CNAggregateKeyDescriptor *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAggregateKeyDescriptor;
  v8 = -[CNAggregateKeyDescriptor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CNAggregateKeyDescriptor setKeyDescriptors:](v8, "setKeyDescriptors:", v6);
    -[CNAggregateKeyDescriptor setPrivateDescription:](v9, "setPrivateDescription:", v7);
    v10 = v9;
  }

  return v9;
}

- (void)setPrivateDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setKeyDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthorizedKeys, 0);
  objc_storeStrong((id *)&self->_privateDescription, 0);
  objc_storeStrong((id *)&self->_keyDescriptors, 0);
}

- (CNAggregateKeyDescriptor)initWithCoder:(id)a3
{
  id v4;
  CNAggregateKeyDescriptor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *keyDescriptors;
  void *v10;
  uint64_t v11;
  NSString *privateDescription;
  CNAggregateKeyDescriptor *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNAggregateKeyDescriptor;
  v5 = -[CNAggregateKeyDescriptor init](&v15, sel_init);
  if (v5)
  {
    +[CNSecureCodingClassSets keyDescriptorClasses](CNSecureCodingClassSets, "keyDescriptorClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_keyDescriptors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    keyDescriptors = v5->_keyDescriptors;
    v5->_keyDescriptors = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_privateDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    privateDescription = v5->_privateDescription;
    v5->_privateDescription = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *keyDescriptors;
  id v5;

  keyDescriptors = self->_keyDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyDescriptors, CFSTR("_keyDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateDescription, CFSTR("_privateDescription"));

}

- (void)setUnauthorizedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_unauthorizedKeys, a3);
}

uint64_t __36__CNAggregateKeyDescriptor_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "keyDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "keyDescriptors");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "keyDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "keyDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

uint64_t __36__CNAggregateKeyDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "privateDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "privateDescription");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "privateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "privateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAggregateKeyDescriptor privateDescription](self, "privateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), v4);

  -[CNAggregateKeyDescriptor unauthorizedKeys](self, "unauthorizedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNAggregateKeyDescriptor unauthorizedKeys](self, "unauthorizedKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("unauthorized keys"), v7);

  }
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_recursiveDescription
{
  return -[CNAggregateKeyDescriptor _cn_recursiveDescriptionWithPrefix:](self, "_cn_recursiveDescriptionWithPrefix:", &stru_1E29FF900);
}

- (id)_cn_recursiveDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v4);
  -[CNAggregateKeyDescriptor description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v18 = v4;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CNAggregateKeyDescriptor keyDescriptors](self, "keyDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "_cn_recursiveDescriptionWithPrefix:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringByAppendingString:", v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v5, "appendString:", v14);
        objc_msgSend(v5, "appendString:", CFSTR("\n"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

@end
