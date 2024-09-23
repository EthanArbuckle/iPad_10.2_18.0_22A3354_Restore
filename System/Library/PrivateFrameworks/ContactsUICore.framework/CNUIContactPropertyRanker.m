@implementation CNUIContactPropertyRanker

+ (id)bestPropertyComparator
{
  if (bestPropertyComparator_onceToken != -1)
    dispatch_once(&bestPropertyComparator_onceToken, &__block_literal_global_55);
  return (id)MEMORY[0x1DF0D6388](bestPropertyComparator_sIDSContactBestPropertyRanker);
}

void __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke()
{
  void *v0;

  v0 = (void *)bestPropertyComparator_sIDSContactBestPropertyRanker;
  bestPropertyComparator_sIDSContactBestPropertyRanker = (uint64_t)&__block_literal_global_2_1;

}

uint64_t __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  double v5;
  id v6;
  void *v7;
  int v8;
  double v9;

  v2 = a2;
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0C967C0]);

  if (_block_invoke_cn_once_token_1 != -1)
    dispatch_once(&_block_invoke_cn_once_token_1, &__block_literal_global_5_1);
  if (v4)
    v5 = 1.0;
  else
    v5 = 0.0;
  v6 = (id)_block_invoke_cn_once_object_1;
  objc_msgSend(v2, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "containsObject:", v7);
  v9 = v5 + 0.5;
  if (!v8)
    v9 = v5;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
}

void __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C97028];
  v4[0] = *MEMORY[0x1E0C97058];
  v4[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)_block_invoke_cn_once_object_1;
  _block_invoke_cn_once_object_1 = v2;

}

@end
