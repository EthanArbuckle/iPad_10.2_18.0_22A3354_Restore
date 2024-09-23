@implementation CNFamilyNameFirstNameOrder

- (id)nameProperties
{
  if (nameProperties_cn_once_token_5 != -1)
    dispatch_once(&nameProperties_cn_once_token_5, &__block_literal_global_25_0);
  return (id)nameProperties_cn_once_object_5;
}

void __44__CNFamilyNameFirstNameOrder_nameProperties__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  +[CN namePrefixDescription](CN, "namePrefixDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CN familyNameDescription](CN, "familyNameDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN givenNameDescription](CN, "givenNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN middleNameDescription](CN, "middleNameDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN nameSuffixDescription](CN, "nameSuffixDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v0, "initWithObjects:", v7, v1, v2, v3, v4, 0);
  v6 = (void *)nameProperties_cn_once_object_5;
  nameProperties_cn_once_object_5 = v5;

}

- (id)phoneticNameProperties
{
  if (phoneticNameProperties_cn_once_token_6 != -1)
    dispatch_once(&phoneticNameProperties_cn_once_token_6, &__block_literal_global_26_0);
  return (id)phoneticNameProperties_cn_once_object_6;
}

void __52__CNFamilyNameFirstNameOrder_phoneticNameProperties__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  +[CN phoneticFamilyNameDescription](CN, "phoneticFamilyNameDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[CN phoneticGivenNameDescription](CN, "phoneticGivenNameDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticMiddleNameDescription](CN, "phoneticMiddleNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithObjects:", v5, v1, v2, 0);
  v4 = (void *)phoneticNameProperties_cn_once_object_6;
  phoneticNameProperties_cn_once_object_6 = v3;

}

- (id)sortingNameProperties
{
  if (sortingNameProperties_cn_once_token_7 != -1)
    dispatch_once(&sortingNameProperties_cn_once_token_7, &__block_literal_global_27_1);
  return (id)sortingNameProperties_cn_once_object_7;
}

void __51__CNFamilyNameFirstNameOrder_sortingNameProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v12 = objc_alloc(MEMORY[0x1E0C99D20]);
  +[CN phoneticFamilyNameDescription](CN, "phoneticFamilyNameDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  +[CN familyNameDescription](CN, "familyNameDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticGivenNameDescription](CN, "phoneticGivenNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  +[CN givenNameDescription](CN, "givenNameDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticMiddleNameDescription](CN, "phoneticMiddleNameDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  +[CN middleNameDescription](CN, "middleNameDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN nameSuffixDescription](CN, "nameSuffixDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN namePrefixDescription](CN, "namePrefixDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "initWithObjects:", v1, v4, v7, v8, v9, 0);
  v11 = (void *)sortingNameProperties_cn_once_object_7;
  sortingNameProperties_cn_once_object_7 = v10;

}

- (int64_t)nameOrder
{
  return 2;
}

@end
