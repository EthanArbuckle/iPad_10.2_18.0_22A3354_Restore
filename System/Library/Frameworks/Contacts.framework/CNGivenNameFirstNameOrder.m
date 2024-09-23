@implementation CNGivenNameFirstNameOrder

- (id)nameProperties
{
  if (nameProperties_cn_once_token_2 != -1)
    dispatch_once(&nameProperties_cn_once_token_2, &__block_literal_global_19_0);
  return (id)nameProperties_cn_once_object_2;
}

- (id)phoneticNameProperties
{
  if (phoneticNameProperties_cn_once_token_3 != -1)
    dispatch_once(&phoneticNameProperties_cn_once_token_3, &__block_literal_global_22_0);
  return (id)phoneticNameProperties_cn_once_object_3;
}

void __51__CNGivenNameFirstNameOrder_phoneticNameProperties__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  +[CN phoneticGivenNameDescription](CN, "phoneticGivenNameDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[CN phoneticMiddleNameDescription](CN, "phoneticMiddleNameDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticFamilyNameDescription](CN, "phoneticFamilyNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithObjects:", v5, v1, v2, 0);
  v4 = (void *)phoneticNameProperties_cn_once_object_3;
  phoneticNameProperties_cn_once_object_3 = v3;

}

void __43__CNGivenNameFirstNameOrder_nameProperties__block_invoke()
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
  +[CN givenNameDescription](CN, "givenNameDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN middleNameDescription](CN, "middleNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN familyNameDescription](CN, "familyNameDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN nameSuffixDescription](CN, "nameSuffixDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v0, "initWithObjects:", v7, v1, v2, v3, v4, 0);
  v6 = (void *)nameProperties_cn_once_object_2;
  nameProperties_cn_once_object_2 = v5;

}

- (id)sortingNameProperties
{
  if (sortingNameProperties_cn_once_token_4 != -1)
    dispatch_once(&sortingNameProperties_cn_once_token_4, &__block_literal_global_23);
  return (id)sortingNameProperties_cn_once_object_4;
}

void __50__CNGivenNameFirstNameOrder_sortingNameProperties__block_invoke()
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
  +[CN phoneticGivenNameDescription](CN, "phoneticGivenNameDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  +[CN givenNameDescription](CN, "givenNameDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticFamilyNameDescription](CN, "phoneticFamilyNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  +[CN familyNameDescription](CN, "familyNameDescription");
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
  v11 = (void *)sortingNameProperties_cn_once_object_4;
  sortingNameProperties_cn_once_object_4 = v10;

}

- (int64_t)nameOrder
{
  return 1;
}

@end
