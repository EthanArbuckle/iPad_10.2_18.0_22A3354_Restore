@implementation CRKASMConcreteNameComponents

- (CRKASMConcreteNameComponents)initWithPerson:(id)a3
{
  id v4;
  CRKASMConcreteNameComponents *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *givenName;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *phoneticGivenName;
  void *v14;
  uint64_t v15;
  NSString *familyName;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *phoneticFamilyName;
  uint64_t v21;
  NSString *fullName;
  uint64_t v23;
  NSString *phoneticFullName;
  uint64_t v25;
  NSString *monogram;
  uint64_t v27;
  NSAttributedString *attributedFullName;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRKASMConcreteNameComponents;
  v5 = -[CRKASMConcreteNameComponents init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "makeNameComponentsForPerson:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "givenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v8;

    objc_msgSend(v6, "phoneticRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    phoneticGivenName = v5->_phoneticGivenName;
    v5->_phoneticGivenName = (NSString *)v12;

    objc_msgSend(v6, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v15;

    objc_msgSend(v6, "phoneticRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "familyName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    phoneticFamilyName = v5->_phoneticFamilyName;
    v5->_phoneticFamilyName = (NSString *)v19;

    objc_msgSend((id)objc_opt_class(), "makeFullNameWithComponents:", v6);
    v21 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v21;

    objc_msgSend((id)objc_opt_class(), "makePhoneticFullNameWithComponents:", v6);
    v23 = objc_claimAutoreleasedReturnValue();
    phoneticFullName = v5->_phoneticFullName;
    v5->_phoneticFullName = (NSString *)v23;

    objc_msgSend((id)objc_opt_class(), "makeMonogramWithComponents:", v6);
    v25 = objc_claimAutoreleasedReturnValue();
    monogram = v5->_monogram;
    v5->_monogram = (NSString *)v25;

    objc_msgSend((id)objc_opt_class(), "makeFamilyNameGivenNameWithComponents:", v6);
    v27 = objc_claimAutoreleasedReturnValue();
    attributedFullName = v5->_attributedFullName;
    v5->_attributedFullName = (NSAttributedString *)v27;

  }
  return v5;
}

+ (id)makeNameComponentsForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  objc_msgSend(v3, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPhoneticRepresentation:", v7);

  objc_msgSend(v3, "phoneticGivenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGivenName:", v8);

  objc_msgSend(v3, "phoneticFamilyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "phoneticRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFamilyName:", v10);

  return v4;
}

+ (id)makeFullNameWithComponents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stringFromNameComponents:configurationBlock:cleanupBlock:", v3, &__block_literal_global_23, &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__CRKASMConcreteNameComponents_makeFullNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", 3);
}

uint64_t __59__CRKASMConcreteNameComponents_makeFullNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", 0);
}

+ (id)makePhoneticFullNameWithComponents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stringFromNameComponents:configurationBlock:cleanupBlock:", v3, &__block_literal_global_2_1, &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __67__CRKASMConcreteNameComponents_makePhoneticFullNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStyle:", 3);
  objc_msgSend(v2, "setPhonetic:", 1);

}

void __67__CRKASMConcreteNameComponents_makePhoneticFullNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStyle:", 0);
  objc_msgSend(v2, "setPhonetic:", 0);

}

+ (id)makeMonogramWithComponents:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stringFromNameComponents:configurationBlock:cleanupBlock:", v3, &__block_literal_global_4, &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __59__CRKASMConcreteNameComponents_makeMonogramWithComponents___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "set_ignoresFallbacks:", 1);
  objc_msgSend(v2, "setStyle:", 4);

}

void __59__CRKASMConcreteNameComponents_makeMonogramWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "set_ignoresFallbacks:", 0);
  objc_msgSend(v2, "setStyle:", 0);

}

+ (id)makeFamilyNameGivenNameWithComponents:(id)a3
{
  return (id)objc_msgSend(a1, "annotatedStringFromNameComponents:configurationBlock:cleanupBlock:", a3, &__block_literal_global_6, &__block_literal_global_7);
}

uint64_t __70__CRKASMConcreteNameComponents_makeFamilyNameGivenNameWithComponents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", 3);
}

uint64_t __70__CRKASMConcreteNameComponents_makeFamilyNameGivenNameWithComponents___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", 0);
}

+ (id)stringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5
{
  void (**v7)(id, void *);
  void (**v8)(id, void *);
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v7 = (void (**)(id, void *))a5;
  v8 = (void (**)(id, void *))a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  objc_msgSend(v10, "stringFromPersonNameComponents:", v9);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
  if (v11)
    v12 = v11;
  else
    v12 = &stru_24D9CB490;
  v13 = v12;

  return v13;
}

+ (id)annotatedStringFromNameComponents:(id)a3 configurationBlock:(id)a4 cleanupBlock:(id)a5
{
  void (**v7)(id, void *);
  void (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;

  v7 = (void (**)(id, void *))a5;
  v8 = (void (**)(id, void *))a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  objc_msgSend(v10, "annotatedStringFromPersonNameComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
  return v11;
}

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_10);
  return (id)sharedFormatter_formatter;
}

void __47__CRKASMConcreteNameComponents_sharedFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedFormatter_formatter;
  sharedFormatter_formatter = v0;

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[CRKASMConcreteNameComponents givenName](self, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKASMConcreteNameComponents phoneticGivenName](self, "phoneticGivenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKASMConcreteNameComponents familyName](self, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CRKASMConcreteNameComponents phoneticFamilyName](self, "phoneticFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[CRKASMConcreteNameComponents fullName](self, "fullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[CRKASMConcreteNameComponents phoneticFullName](self, "phoneticFullName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[CRKASMConcreteNameComponents monogram](self, "monogram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[CRKASMConcreteNameComponents attributedFullName](self, "attributedFullName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CRKASMConcreteNameComponents *v8;
  CRKASMConcreteNameComponents *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  CRKASMConcreteNameComponents *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(CFSTR("givenName, phoneticGivenName, familyName, phoneticFamilyName, fullName, phoneticFullName, monogram, attributedFullName"), "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_4;
  v28[3] = &unk_24D9C7230;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (CRKASMConcreteNameComponents *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[CRKASMConcreteNameComponents isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class()))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = v9;
          -[CRKASMConcreteNameComponents valueForKey:](v8, "valueForKey:", v16);
          v18 = objc_claimAutoreleasedReturnValue();
          -[CRKASMConcreteNameComponents valueForKey:](v17, "valueForKey:", v16);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  -[CRKASMConcreteNameComponents givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents phoneticGivenName](self, "phoneticGivenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents familyName](self, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents phoneticFamilyName](self, "phoneticFamilyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents fullName](self, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents phoneticFullName](self, "phoneticFullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents monogram](self, "monogram");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteNameComponents attributedFullName](self, "attributedFullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p { givenName = %@, phoneticGivenName = %@, familyName = %@, phoneticFamilyName = %@, fullName = %@, phoneticFullName = %@, monogram = %@, attributedFullName = %@ }>"), v3, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)phoneticFullName
{
  return self->_phoneticFullName;
}

- (NSString)monogram
{
  return self->_monogram;
}

- (NSAttributedString)attributedFullName
{
  return self->_attributedFullName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedFullName, 0);
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_phoneticFullName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
