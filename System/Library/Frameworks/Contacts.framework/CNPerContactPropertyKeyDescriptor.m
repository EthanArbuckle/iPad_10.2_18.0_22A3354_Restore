@implementation CNPerContactPropertyKeyDescriptor

- (CNPerContactPropertyKeyDescriptor)init
{
  CNPerContactPropertyKeyDescriptor *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *propertiesByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPerContactPropertyKeyDescriptor;
  v2 = -[CNPerContactPropertyKeyDescriptor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    propertiesByIdentifier = v2->_propertiesByIdentifier;
    v2->_propertiesByIdentifier = v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPerContactPropertyKeyDescriptor)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *propertiesByIdentifier;

  if (self)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = a3;
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("propertiesByIdentifier"));
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    propertiesByIdentifier = self->_propertiesByIdentifier;
    self->_propertiesByIdentifier = v9;

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_propertiesByIdentifier, CFSTR("propertiesByIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CNPerContactPropertyKeyDescriptor_isEqual___block_invoke;
  v9[3] = &unk_1E29F7D70;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v9, 0);

  return (char)self;
}

uint64_t __45__CNPerContactPropertyKeyDescriptor_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "propertiesByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "propertiesByIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "propertiesByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "propertiesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __41__CNPerContactPropertyKeyDescriptor_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __41__CNPerContactPropertyKeyDescriptor_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "propertiesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (void)setKeysToFetch:(id)a3 forContactIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_propertiesByIdentifier, "setObject:forKey:", a3, a4);
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  void (**v4)(id, const __CFString *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, const __CFString *))a3;
  v4[2](v4, CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v4[2](v4, CFSTR("linkIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = (id)((uint64_t (*)(id, _QWORD))v4[2])(v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)_cn_requiredKeys
{
  return +[CNContactKeyVector keyVectorWithKey:](CNContactKeyVector, "keyVectorWithKey:", CFSTR("identifier"));
}

- (id)_cn_optionalKeys
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary allValues](self->_propertiesByIdentifier, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNPerContactPropertyKeyDescriptor *v4;
  void *v5;

  v4 = objc_alloc_init(CNPerContactPropertyKeyDescriptor);
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_propertiesByIdentifier, "mutableCopy");
  -[CNPerContactPropertyKeyDescriptor setPropertiesByIdentifier:](v4, "setPropertiesByIdentifier:", v5);

  return v4;
}

- (NSMutableDictionary)propertiesByIdentifier
{
  return self->_propertiesByIdentifier;
}

- (void)setPropertiesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesByIdentifier, 0);
}

@end
