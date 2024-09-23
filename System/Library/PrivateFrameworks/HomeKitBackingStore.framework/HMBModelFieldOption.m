@implementation HMBModelFieldOption

- (void)applyTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (id)externalRecordField:(id)a3
{
  id v3;
  HMBModelFieldOptionExternalRecordField *v4;

  v3 = a3;
  v4 = -[HMBModelFieldOptionExternalRecordField initWithExternalRecordField:encrypted:]([HMBModelFieldOptionExternalRecordField alloc], "initWithExternalRecordField:encrypted:", v3, 0);

  return v4;
}

+ (id)encryptedExternalRecordField:(id)a3
{
  id v3;
  HMBModelFieldOptionExternalRecordField *v4;

  v3 = a3;
  v4 = -[HMBModelFieldOptionExternalRecordField initWithExternalRecordField:encrypted:]([HMBModelFieldOptionExternalRecordField alloc], "initWithExternalRecordField:encrypted:", v3, 1);

  return v4;
}

+ (id)excludeFromCloudStorage
{
  return objc_alloc_init(HMBModelFieldOptionExcludeFromCloudStorage);
}

+ (id)queryableField
{
  return objc_alloc_init(HMBModelFieldOptionQueryable);
}

+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4
{
  id v5;
  id v6;
  HMBModelFieldOptionQueryable *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMBModelFieldOptionQueryable initWithEncodingBlock:decodingBlock:descriptionBlock:]([HMBModelFieldOptionQueryable alloc], "initWithEncodingBlock:decodingBlock:descriptionBlock:", v6, v5, &__block_literal_global_235);

  return v7;
}

+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4 descriptionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMBModelFieldOptionQueryable *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMBModelFieldOptionQueryable initWithEncodingBlock:decodingBlock:descriptionBlock:]([HMBModelFieldOptionQueryable alloc], "initWithEncodingBlock:decodingBlock:descriptionBlock:", v9, v8, v7);

  return v10;
}

uint64_t __65__HMBModelFieldOption_queryableFieldWithEncodeBlock_decodeBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbDescription");
}

@end
