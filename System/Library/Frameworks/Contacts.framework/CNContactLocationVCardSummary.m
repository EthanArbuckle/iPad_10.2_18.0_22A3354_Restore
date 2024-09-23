@implementation CNContactLocationVCardSummary

- (CNContactLocationVCardSummary)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  CNContactLocationVCardSummary *v7;
  CNContactLocationVCardSummary *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNContactLocationVCardSummary *v19;
  void *v20;
  id v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNContactLocationVCardSummary;
  v7 = -[CNContactLocationVCardSummary init](&v23, sel_init);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(MEMORY[0x1E0DDCAD0], "countOfCardsInData:", v6) == 1)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DDCAE0]);
      objc_msgSend(v9, "setContactLimit:", 1);
      objc_msgSend(v9, "setMaximumValueLength:", 200);
      objc_msgSend(v9, "setPropertiesToFetch:", &unk_1E2A40788);
      v22 = 0;
      +[CNContactVCardSerialization contactsWithData:options:error:](CNContactVCardSerialization, "contactsWithData:options:error:", v6, v9, &v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v22;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "givenName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "urlAddresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      {
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 700, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v19 = 0;
      }
      else
      {
        v8 = -[CNContactLocationVCardSummary initWithTitle:URLString:](v8, "initWithTitle:URLString:", v13, v16);
        v19 = v8;
      }

    }
    else
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 700, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v20;
      v19 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v20);
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CNContactLocationVCardSummary)initWithTitle:(id)a3 URLString:(id)a4
{
  id v6;
  id v7;
  CNContactLocationVCardSummary *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *urlString;
  CNContactLocationVCardSummary *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactLocationVCardSummary;
  v8 = -[CNContactLocationVCardSummary init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    urlString = v8->_urlString;
    v8->_urlString = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactLocationVCardSummary title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("descriptiveLabel"), v4);

  -[CNContactLocationVCardSummary urlString](self, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("urlString"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  CNContactLocationVCardSummary *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__CNContactLocationVCardSummary_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __41__CNContactLocationVCardSummary_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __41__CNContactLocationVCardSummary_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __41__CNContactLocationVCardSummary_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "urlString");
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
  v7[2] = __37__CNContactLocationVCardSummary_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNContactLocationVCardSummary_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __37__CNContactLocationVCardSummary_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __37__CNContactLocationVCardSummary_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "urlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactLocationVCardSummary)initWithCoder:(id)a3
{
  id v4;
  CNContactLocationVCardSummary *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *urlString;
  CNContactLocationVCardSummary *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactLocationVCardSummary;
  v5 = -[CNContactLocationVCardSummary init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlString, CFSTR("_urlString"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
