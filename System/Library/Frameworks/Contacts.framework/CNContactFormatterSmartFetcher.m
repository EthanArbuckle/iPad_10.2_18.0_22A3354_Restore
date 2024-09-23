@implementation CNContactFormatterSmartFetcher

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
  v7[2] = __38__CNContactFormatterSmartFetcher_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__CNContactFormatterSmartFetcher_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

void __50__CNContactFormatterSmartFetcher__cn_requiredKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKey:", v3);

}

- (id)_cn_requiredKeys
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  +[CNContactKeyVector keyVectorWithKey:](CNMutableContactKeyVector, "keyVectorWithKey:", CFSTR("contactType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (CNContactFormatterSmartFetcher *)self->_mandatoryNameProperties;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNContactFormatterSmartFetcher__cn_requiredKeys__block_invoke;
  v7[3] = &unk_1E29F9C50;
  v8 = v3;
  v4 = v3;
  -[CNContactFormatterSmartFetcher enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  CNContactFormatterSmartFetcher *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v15 = v4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__CNContactFormatterSmartFetcher_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __42__CNContactFormatterSmartFetcher_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __38__CNContactFormatterSmartFetcher_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "ignoresOrganization"));
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  id v4;
  NSSet *mandatoryNameProperties;
  NSSet *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (self)
    mandatoryNameProperties = self->_mandatoryNameProperties;
  else
    mandatoryNameProperties = 0;
  v6 = mandatoryNameProperties;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke;
  v20[3] = &unk_1E29FCA70;
  v7 = v4;
  v20[4] = self;
  v21 = v7;
  v22 = &v23;
  -[NSSet enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v20);

  (*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("contactType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = -[CNContactFormatterSmartFetcher ignoresOrganization](self, "ignoresOrganization");
  v11 = v9 != 1 || v10;
  if ((v11 & 1) != 0
    || ((*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("organizationName")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))(),
        v12,
        (v13 & 1) != 0))
  {
    if (!*((_BYTE *)v24 + 24))
    {
      if (-[CNContactFormatterSmartFetcher ignoresNickname](self, "ignoresNickname")
        || ((*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("nickname")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))(),
            v14,
            v15))
      {
        if (!v11
          || -[CNContactFormatterSmartFetcher ignoresOrganization](self, "ignoresOrganization")
          || ((*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("organizationName")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))(),
              v16,
              v17))
        {
          (*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("emailAddresses"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "count"))
            v19 = (id)(*((uint64_t (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("phoneNumbers"));

        }
      }
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        v4 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

      }
    }
  }

}

uint64_t __38__CNContactFormatterSmartFetcher_hash__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "ignoresNickname"));
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "nameProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_3;
  v4[3] = &unk_1E29FC9F8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_cn_each:", v4);

}

- (id)_cn_optionalKeys
{
  void *v3;
  NSDictionary *fallBackNamePropertyByNameKey;
  NSDictionary *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    fallBackNamePropertyByNameKey = self->_fallBackNamePropertyByNameKey;
  else
    fallBackNamePropertyByNameKey = 0;
  v5 = fallBackNamePropertyByNameKey;
  -[NSDictionary allValues](v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke;
  v13[3] = &unk_1E29FCAC0;
  v7 = v3;

  v14 = v7;
  objc_msgSend(v6, "_cn_each:", v13);

  v17[0] = CFSTR("contactType");
  v17[1] = CFSTR("emailAddresses");
  v17[2] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  if (!-[CNContactFormatterSmartFetcher ignoresNickname](self, "ignoresNickname"))
  {
    v16 = CFSTR("nickname");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  if (!-[CNContactFormatterSmartFetcher ignoresOrganization](self, "ignoresOrganization"))
  {
    v15 = CFSTR("organizationName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v10);

  }
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)ignoresOrganization
{
  return self->_ignoresOrganization;
}

- (BOOL)ignoresNickname
{
  return self->_ignoresNickname;
}

- (void)setIgnoresOrganization:(BOOL)a3
{
  self->_ignoresOrganization = a3;
}

- (void)setIgnoresNickname:(BOOL)a3
{
  self->_ignoresNickname = a3;
}

- (CNContactFormatterSmartFetcher)init
{
  CNContactFormatterSmartFetcher *v2;
  CNContactFormatterSmartFetcher *v3;
  CNContactFormatterSmartFetcher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactFormatterSmartFetcher;
  v2 = -[CNContactFormatterSmartFetcher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CNContactFormatterSmartFetcher setupNameKeys](v2);
    v4 = v3;
  }

  return v3;
}

- (void)setupNameKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  SEL v13;
  SEL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke;
    aBlock[3] = &unk_1E29FC9D0;
    v19 = v3;
    v5 = v3;
    v6 = _Block_copy(aBlock);
    +[CN requiredPropertiesForNameScriptDetection](CN, "requiredPropertiesForNameScriptDetection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v7);

    +[CNContactNameOrderImpl givenNameFirstOrder](CNContactNameOrderImpl, "givenNameFirstOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    +[CNContactNameOrderImpl familyNameFirstOrder](CNContactNameOrderImpl, "familyNameFirstOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_2;
    v15[3] = &unk_1E29FCA20;
    v16 = v2;
    v17 = v6;
    v11 = v6;
    v12 = v2;
    objc_msgSend(v10, "_cn_each:", v15);

    objc_setProperty_nonatomic_copy(a1, v13, v12, 16);
    objc_setProperty_nonatomic_copy(a1, v14, v5, 24);

  }
}

void __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  objc_msgSend(a2, "key");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D13848];
  v11 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((_DWORD)v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 24);
    else
      v7 = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke_2;
    v12[3] = &unk_1E29FCA48;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v13 = v9;
    v14 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallBackNamePropertyByNameKey, 0);
  objc_storeStrong((id *)&self->_mandatoryNameProperties, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactFormatterSmartFetcher)initWithCoder:(id)a3
{
  id v4;
  CNContactFormatterSmartFetcher *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *mandatoryNameProperties;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *fallBackNamePropertyByNameKey;
  CNContactFormatterSmartFetcher *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNContactFormatterSmartFetcher;
  v5 = -[CNSmartPropertyFetcher initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_ignoresNickname = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresNickname"));
    v5->_ignoresOrganization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresOrganization"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mandatoryNameProperties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    mandatoryNameProperties = v5->_mandatoryNameProperties;
    v5->_mandatoryNameProperties = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("fallBackNamePropertyByNameKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    fallBackNamePropertyByNameKey = v5->_fallBackNamePropertyByNameKey;
    v5->_fallBackNamePropertyByNameKey = (NSDictionary *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactFormatterSmartFetcher;
  v4 = a3;
  -[CNSmartPropertyFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoresNickname, CFSTR("ignoresNickname"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoresOrganization, CFSTR("ignoresOrganization"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mandatoryNameProperties, CFSTR("mandatoryNameProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallBackNamePropertyByNameKey, CFSTR("fallBackNamePropertyByNameKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  NSSet *mandatoryNameProperties;
  NSDictionary *fallBackNamePropertyByNameKey;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactFormatterSmartFetcher;
  v4 = -[CNSmartPropertyFetcher copyWithZone:](&v9, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIgnoresNickname:", -[CNContactFormatterSmartFetcher ignoresNickname](self, "ignoresNickname"));
  objc_msgSend(v4, "setIgnoresOrganization:", -[CNContactFormatterSmartFetcher ignoresOrganization](self, "ignoresOrganization"));
  if (self)
  {
    mandatoryNameProperties = self->_mandatoryNameProperties;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  mandatoryNameProperties = 0;
  if (v4)
LABEL_3:
    objc_setProperty_nonatomic_copy(v4, v5, mandatoryNameProperties, 16);
LABEL_4:
  if (!self)
  {
    fallBackNamePropertyByNameKey = 0;
    if (!v4)
      return v4;
    goto LABEL_6;
  }
  fallBackNamePropertyByNameKey = self->_fallBackNamePropertyByNameKey;
  if (v4)
LABEL_6:
    objc_setProperty_nonatomic_copy(v4, v5, fallBackNamePropertyByNameKey, 24);
  return v4;
}

uint64_t __42__CNContactFormatterSmartFetcher_isEqual___block_invoke(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ignoresNickname");
  return v2 ^ objc_msgSend(*(id *)(a1 + 40), "ignoresNickname") ^ 1;
}

uint64_t __42__CNContactFormatterSmartFetcher_isEqual___block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ignoresOrganization");
  return v2 ^ objc_msgSend(*(id *)(a1 + 40), "ignoresOrganization") ^ 1;
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "unionOrderedSet:", v8);
  objc_msgSend(v10, "addObjectsFromArray:", v14);
  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v6, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);
}

void __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = *MEMORY[0x1E0D13848];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9);

  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke_2;
  v3[3] = &unk_1E29FCA98;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

@end
