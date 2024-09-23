@implementation NSArray(INKeyImageProducing)

- (id)_keyImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_4096);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  INKeyImageUtilitiesKeyImageBySubProducerComparison(a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)_compareSubProducerOne:()INKeyImageProducing subProducerTwo:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a1, "indexOfObject:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(a1, "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

@end
