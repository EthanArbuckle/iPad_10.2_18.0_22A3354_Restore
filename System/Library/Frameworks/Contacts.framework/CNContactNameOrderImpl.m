@implementation CNContactNameOrderImpl

+ (id)defaultOrder
{
  void *v3;
  uint64_t v4;

  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayNameOrder");

  if (v4 == 2)
    objc_msgSend(a1, "familyNameFirstOrder");
  else
    objc_msgSend(a1, "givenNameFirstOrder");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)givenNameFirstOrder
{
  if (givenNameFirstOrder_cn_once_token_0 != -1)
    dispatch_once(&givenNameFirstOrder_cn_once_token_0, &__block_literal_global_64);
  return (id)givenNameFirstOrder_cn_once_object_0;
}

+ (id)defaultNewContactOrder
{
  void *v3;
  uint64_t v4;

  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "newContactDisplayNameOrder");

  if (v4 == 2)
    objc_msgSend(a1, "familyNameFirstOrder");
  else
    objc_msgSend(a1, "givenNameFirstOrder");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)familyNameFirstOrder
{
  if (familyNameFirstOrder_cn_once_token_1 != -1)
    dispatch_once(&familyNameFirstOrder_cn_once_token_1, &__block_literal_global_2_0);
  return (id)familyNameFirstOrder_cn_once_object_1;
}

void __46__CNContactNameOrderImpl_familyNameFirstOrder__block_invoke()
{
  CNFamilyNameFirstNameOrder *v0;
  void *v1;

  v0 = objc_alloc_init(CNFamilyNameFirstNameOrder);
  v1 = (void *)familyNameFirstOrder_cn_once_object_1;
  familyNameFirstOrder_cn_once_object_1 = (uint64_t)v0;

}

void __45__CNContactNameOrderImpl_givenNameFirstOrder__block_invoke()
{
  CNGivenNameFirstNameOrder *v0;
  void *v1;

  v0 = objc_alloc_init(CNGivenNameFirstNameOrder);
  v1 = (void *)givenNameFirstOrder_cn_once_object_0;
  givenNameFirstOrder_cn_once_object_0 = (uint64_t)v0;

}

+ (id)defaultSortOrder
{
  void *v3;
  uint64_t v4;

  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sortOrder");

  if (v4 == 3)
    objc_msgSend(a1, "familyNameFirstOrder");
  else
    objc_msgSend(a1, "givenNameFirstOrder");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)nameOrder
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("abstract method"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)orderForSortOrder:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    +[CNContactNameOrderImpl givenNameFirstOrder](CNContactNameOrderImpl, "givenNameFirstOrder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 3)
      +[CNContactNameOrderImpl familyNameFirstOrder](CNContactNameOrderImpl, "familyNameFirstOrder");
    else
      +[CNContactNameOrderImpl defaultSortOrder](CNContactNameOrderImpl, "defaultSortOrder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)nameProperties
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  -[CNContactNameOrderImpl doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)phoneticNameProperties
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  -[CNContactNameOrderImpl doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (id)sortingNameProperties
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactNameOrderImpl;
  -[CNContactNameOrderImpl doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

@end
