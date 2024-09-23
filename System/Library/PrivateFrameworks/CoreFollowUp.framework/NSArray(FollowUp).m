@implementation NSArray(FollowUp)

- (id)fl_multiMap:()FollowUp
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __33__NSArray_FollowUp__fl_multiMap___block_invoke;
    v12 = &unk_1E6F1E2F0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fl_map:()FollowUp
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __28__NSArray_FollowUp__fl_map___block_invoke;
    v12 = &unk_1E6F1E2F0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
