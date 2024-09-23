@implementation CNContactVCardSummary

- (CNContactVCardSummary)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  CNContactVCardSummary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  CNContactVCardSummary *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))() & 1) != 0)
    goto LABEL_2;
  v8 = objc_msgSend(MEMORY[0x1E0DDCAD0], "countOfCardsInData:", v6);
  if (v8 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "readingOptionsWithContactLimit:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    +[CNContactVCardSerialization contactsWithData:options:error:](CNContactVCardSerialization, "contactsWithData:options:error:", v6, v11, &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v34;
    if (!v12)
      goto LABEL_17;
    if ((unint64_t)objc_msgSend(v12, "count") <= 1)
      goto LABEL_19;
    v18 = (void *)objc_opt_class();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nameForContact:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_opt_class();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nameForContact:", v21);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "localizedStringWithName:andOtherName:", v16, v17);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v23 = &stru_1E29FF900;
    v24 = self;
    v25 = v22;
    v26 = 2;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = v8 - 1;
  if (v8 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "readingOptionsWithContactLimit:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    +[CNContactVCardSerialization contactsWithData:options:error:](CNContactVCardSerialization, "contactsWithData:options:error:", v6, v11, &v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v35;
    if (!v12)
      goto LABEL_17;
    if (!objc_msgSend(v12, "count"))
      goto LABEL_19;
    v27 = (void *)objc_opt_class();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "namesForContact:", v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "first");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "second");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = self;
    v25 = v17;
    v23 = v22;
    v26 = 1;
LABEL_15:
    self = -[CNContactVCardSummary initWithTitle:subtitle:contactCount:avatarContacts:](v24, "initWithTitle:subtitle:contactCount:avatarContacts:", v25, v23, v26, v12);

    goto LABEL_16;
  }
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "readingOptionsWithContactLimit:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    +[CNContactVCardSerialization contactsWithData:options:error:](CNContactVCardSerialization, "contactsWithData:options:error:", v6, v11, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    if (v12)
    {
      if (objc_msgSend(v12, "count"))
      {
        v14 = (void *)objc_opt_class();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nameForContact:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "localizedStringWithName:andThisManyOthers:", v16, v10);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        self = -[CNContactVCardSummary initWithTitle:subtitle:contactCount:avatarContacts:](self, "initWithTitle:subtitle:contactCount:avatarContacts:", v17, &stru_1E29FF900, v9, v12);
LABEL_16:

        v7 = self;
LABEL_24:

        goto LABEL_25;
      }
LABEL_19:
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 701, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_20:
        v7 = 0;
        goto LABEL_24;
      }
LABEL_23:
      v7 = 0;
      *a4 = objc_retainAutorelease(v16);
      goto LABEL_24;
    }
LABEL_17:
    v29 = v13;
    v30 = v29;
    if (v29)
    {
      v36 = *MEMORY[0x1E0CB3388];
      v37[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 701, v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_20;
    goto LABEL_23;
  }
LABEL_2:
  self = -[CNContactVCardSummary initWithTitle:subtitle:contactCount:avatarContacts:](self, "initWithTitle:subtitle:contactCount:avatarContacts:", &stru_1E29FF900, &stru_1E29FF900, 0, MEMORY[0x1E0C9AA60]);
  v7 = self;
LABEL_25:

  return v7;
}

+ (id)readingOptionsWithContactLimit:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DDCAE0]);
  objc_msgSend(v4, "setContactLimit:", a3);
  v5 = *MEMORY[0x1E0DDCA70];
  v10[0] = *MEMORY[0x1E0DDCA68];
  v10[1] = v5;
  v6 = *MEMORY[0x1E0DDCA90];
  v10[2] = *MEMORY[0x1E0DDCA78];
  v10[3] = v6;
  v7 = *MEMORY[0x1E0DDCA88];
  v10[4] = *MEMORY[0x1E0DDCA60];
  v10[5] = v7;
  v10[6] = *MEMORY[0x1E0DDCA80];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v8);

  objc_msgSend(v4, "setMaximumValueLength:", 100);
  return v4;
}

+ (id)namesForContact:(id)a3
{
  id v4;
  void *v5;
  _CNContactVCardNameSummzarizationScope *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "nameForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNContactVCardNameSummzarizationScope initWithContact:fullName:]([_CNContactVCardNameSummzarizationScope alloc], "initWithContact:fullName:", v4, v5);

  sOrganizationWithPerson_block_invoke(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    sPersonWithOrganization_block_invoke_2(0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)nameForContact:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CNContactVCardSummary_nameForContact___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = nameForContact__cn_once_token_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&nameForContact__cn_once_token_0, block);
  objc_msgSend((id)nameForContact__cn_once_object_0, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__CNContactVCardSummary_nameForContact___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeFormatter");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)nameForContact__cn_once_object_0;
  nameForContact__cn_once_object_0 = v1;

}

+ (CNContactFormatter)defaultNameFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CNContactVCardSummary_defaultNameFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultNameFormatter_cn_once_token_1 != -1)
    dispatch_once(&defaultNameFormatter_cn_once_token_1, block);
  return (CNContactFormatter *)(id)defaultNameFormatter_cn_once_object_1;
}

void __45__CNContactVCardSummary_defaultNameFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeFormatter");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultNameFormatter_cn_once_object_1;
  defaultNameFormatter_cn_once_object_1 = v1;

}

+ (id)makeFormatter
{
  CNContactFormatter *v2;

  v2 = objc_alloc_init(CNContactFormatter);
  -[CNContactFormatter setFallbackStyle:](v2, "setFallbackStyle:", -1);
  return v2;
}

+ (id)localizedStringWithName:(id)a3 andOtherName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NAME_AND_OTHER_NAME"), &stru_1E29FF900, CFSTR("ContactsVCards"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedStringWithName:(id)a3 andThisManyOthers:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NAME_AND_N_OTHERS"), &stru_1E29FF900, CFSTR("ContactsVCards"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CNContactVCardSummary)initWithTitle:(id)a3 subtitle:(id)a4 contactCount:(unint64_t)a5 avatarContacts:(id)a6
{
  id v10;
  id v11;
  id v12;
  CNContactVCardSummary *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *subtitle;
  uint64_t v18;
  NSArray *avatarContacts;
  CNContactVCardSummary *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNContactVCardSummary;
  v13 = -[CNContactVCardSummary init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v16;

    v13->_contactCount = a5;
    v18 = objc_msgSend(v12, "copy");
    avatarContacts = v13->_avatarContacts;
    v13->_avatarContacts = (NSArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactVCardSummary title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("descriptive label"), v4);

  -[CNContactVCardSummary subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("secondary descriptive label"), v6);

  v8 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("contact count"), -[CNContactVCardSummary contactCount](self, "contactCount"));
  -[CNContactVCardSummary avatarContacts](self, "avatarContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("avatar contacts"), v9);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CNContactVCardSummary *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __33__CNContactVCardSummary_isEqual___block_invoke;
  v24[3] = &unk_1E29F7D70;
  v24[4] = self;
  v25 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNContactVCardSummary_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v7 = v25;
  v23 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __33__CNContactVCardSummary_isEqual___block_invoke_3;
  v20[3] = &unk_1E29F7D70;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  v10 = _Block_copy(v20);
  v14 = v5;
  v15 = 3221225472;
  v16 = __33__CNContactVCardSummary_isEqual___block_invoke_4;
  v17 = &unk_1E29F7D70;
  v18 = self;
  v19 = v9;
  v11 = v9;
  v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v11, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke(uint64_t a1)
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

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "contactCount"), objc_msgSend(*(id *)(a1 + 40), "contactCount"));
}

uint64_t __33__CNContactVCardSummary_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "avatarContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "avatarContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isAvatarContacts:equalTo:", v3, v4);

  return v5;
}

+ (BOOL)isAvatarContacts:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "_cn_zip:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_cn_all:", &__block_literal_global_33_0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __50__CNContactVCardSummary_isAvatarContacts_equalTo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "isEqualIgnoringIdentifiers:", v4);
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD aBlock[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__CNContactVCardSummary_hash__block_invoke;
  v13[3] = &unk_1E29F7D98;
  v13[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__CNContactVCardSummary_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __29__CNContactVCardSummary_hash__block_invoke_3;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  v6 = _Block_copy(v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __29__CNContactVCardSummary_hash__block_invoke_4;
  v10[3] = &unk_1E29F7D98;
  v10[4] = self;
  v7 = _Block_copy(v10);
  v8 = objc_msgSend(v3, "hashWithBlocks:", v13, v5, v6, v7, 0);

  return v8;
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke(uint64_t a1)
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

uint64_t __29__CNContactVCardSummary_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "unsignedIntegerHash:", objc_msgSend(*(id *)(a1 + 32), "contactCount"));
}

uint64_t __29__CNContactVCardSummary_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "avatarContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactVCardSummary)initWithCoder:(id)a3
{
  id v4;
  CNContactVCardSummary *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *avatarContacts;
  CNContactVCardSummary *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactVCardSummary;
  v5 = -[CNContactVCardSummary init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v5->_contactCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_contactCount"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_avatarContacts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    avatarContacts = v5->_avatarContacts;
    v5->_avatarContacts = (NSArray *)v13;

    v15 = v5;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactCount, CFSTR("_contactCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avatarContacts, CFSTR("_avatarContacts"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)contactCount
{
  return self->_contactCount;
}

- (NSArray)avatarContacts
{
  return self->_avatarContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContacts, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
