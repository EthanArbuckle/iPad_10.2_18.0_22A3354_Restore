@implementation LAPSPasscodeTypeCollection

+ (id)allPasscodeTypes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF00]);
  +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAPSPasscodeType numericFourDigitsType](LAPSPasscodeType, "numericFourDigitsType", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  +[LAPSPasscodeType numericCustomDigitsType](LAPSPasscodeType, "numericCustomDigitsType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithArray:", v9);

  return v10;
}

uint64_t __46__LAPSPasscodeTypeCollection_allPasscodeTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "complexityRating"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "complexityRating");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

+ (id)allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __84__LAPSPasscodeTypeCollection_allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo___block_invoke;
  v4[3] = &__block_descriptor_40_e26_B16__0__LAPSPasscodeType_8l;
  v4[4] = a3;
  objc_msgSend(a1, "_allWhere:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __84__LAPSPasscodeTypeCollection_allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "complexityRating") >= *(_QWORD *)(a1 + 32);
}

+ (id)_allWhere:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF00]);
  objc_msgSend(a1, "allPasscodeTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allPasscodeTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__LAPSPasscodeTypeCollection__allWhere___block_invoke;
  v13[3] = &unk_24FDCD538;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithArray:", v10);

  return v11;
}

uint64_t __40__LAPSPasscodeTypeCollection__allWhere___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
