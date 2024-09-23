@implementation CNUIUserActionItemComparator

+ (id)comparatorWithPreferredLabelsFirst
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__CNUIUserActionItemComparator_comparatorWithPreferredLabelsFirst__block_invoke;
  v3[3] = &__block_descriptor_40_e51_q24__0__CNUIUserActionItem_8__CNUIUserActionItem_16l;
  v3[4] = a1;
  return (id)objc_msgSend(v3, "copy");
}

+ (id)comparatorWithAlphabeticalOrderByTargetHandle
{
  return (id)objc_msgSend(&__block_literal_global_120, "copy");
}

+ (id)comparatorWithAlphabeticalOrderByLabel
{
  return (id)objc_msgSend(&__block_literal_global_117_0, "copy");
}

+ (id)comparatorWithActionItemGrouping
{
  return (id)objc_msgSend(&__block_literal_global_114_0, "copy");
}

uint64_t __77__CNUIUserActionItemComparator_comparatorWithAlphabeticalOrderByTargetHandle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "targetHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1EA606688;
  v8 = v7;

  objc_msgSend(v4, "targetHandle");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1EA606688;
  v11 = v10;

  v12 = -[__CFString compare:](v8, "compare:", v11);
  return v12;
}

uint64_t __70__CNUIUserActionItemComparator_comparatorWithAlphabeticalOrderByLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "label");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1EA606688;
  v8 = v7;

  objc_msgSend(v4, "label");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1EA606688;
  v11 = v10;

  v12 = -[__CFString compare:](v8, "compare:", v11);
  return v12;
}

uint64_t __64__CNUIUserActionItemComparator_comparatorWithActionItemGrouping__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "group");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t __66__CNUIUserActionItemComparator_comparatorWithPreferredLabelsFirst__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "scoreForUserAction:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scoreForUserAction:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

+ (id)scoreForUserAction:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = scoreForUserAction__cn_once_token_1;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&scoreForUserAction__cn_once_token_1, &__block_literal_global_105);
  v5 = (id)scoreForUserAction__cn_once_object_1;
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = &unk_1EA61C710;
  v9 = v8;

  return v9;
}

void __51__CNUIUserActionItemComparator_scoreForUserAction___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96FF0];
  v5[0] = *MEMORY[0x1E0C97058];
  v5[1] = v0;
  v6[0] = &unk_1EA61C5F8;
  v6[1] = &unk_1EA61C6D0;
  v1 = *MEMORY[0x1E0C97070];
  v5[2] = *MEMORY[0x1E0C97028];
  v5[3] = v1;
  v6[2] = &unk_1EA61C6E0;
  v6[3] = &unk_1EA61C6F0;
  v5[4] = *MEMORY[0x1E0C96FF8];
  v6[4] = &unk_1EA61C700;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)scoreForUserAction__cn_once_object_1;
  scoreForUserAction__cn_once_object_1 = v3;

}

@end
