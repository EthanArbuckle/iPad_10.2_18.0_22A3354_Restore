@implementation NSIndexSet(ContactsFoundation)

- (id)_cn_map:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__NSIndexSet_ContactsFoundation___cn_map___block_invoke;
  v11[3] = &unk_1E29BBEF0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (uint64_t)_cn_all:()ContactsFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_ContactsFoundation___cn_all___block_invoke;
  v8[3] = &unk_1E29BBEA0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)_cn_any:()ContactsFoundation
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_ContactsFoundation___cn_any___block_invoke;
  v8[3] = &unk_1E29BBEA0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_cn_each:()ContactsFoundation
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __43__NSIndexSet_ContactsFoundation___cn_each___block_invoke;
    v6[3] = &unk_1E29BBEC8;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    objc_msgSend(a1, "enumerateIndexesUsingBlock:", v6);

    v4 = v5;
  }

}

- (id)_cn_filter:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__NSIndexSet_ContactsFoundation___cn_filter___block_invoke;
    v10[3] = &unk_1E29BBEF0;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateIndexesUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

- (id)_cn_flatMap:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__NSIndexSet_ContactsFoundation___cn_flatMap___block_invoke;
  v11[3] = &unk_1E29BBEF0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_cn_mapRanges:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__NSIndexSet_ContactsFoundation___cn_mapRanges___block_invoke;
  v11[3] = &unk_1E29BBF18;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_cn_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cn_mapRanges:", CNRangeShortDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

  objc_msgSend(v2, "appendString:", CFSTR("}"));
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

@end
