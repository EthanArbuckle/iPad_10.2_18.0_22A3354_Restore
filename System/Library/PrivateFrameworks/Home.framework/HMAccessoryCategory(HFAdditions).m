@implementation HMAccessoryCategory(HFAdditions)

- (uint64_t)hf_isMediaAccessory
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (qword_1ED379888 != -1)
    dispatch_once(&qword_1ED379888, &__block_literal_global_155);
  v2 = (void *)_MergedGlobals_286;
  objc_msgSend(a1, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)hf_compatibleServiceTypes
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CBA1D8];
  objc_msgSend(a1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_compatibleServiceTypesForCategoryType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hf_compatibleServiceTypesForCategoryType:()HFAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (id)*MEMORY[0x1E0CB7A70];

    v3 = v4;
  }
  if (qword_1ED379898 != -1)
    dispatch_once(&qword_1ED379898, &__block_literal_global_2_22);
  objc_msgSend((id)qword_1ED379890, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_standardAccessoryCategoryTypes
{
  if (qword_1ED3798A8 != -1)
    dispatch_once(&qword_1ED3798A8, &__block_literal_global_5_9);
  return (id)qword_1ED3798A0;
}

@end
