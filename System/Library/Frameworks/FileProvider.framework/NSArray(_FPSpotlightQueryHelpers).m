@implementation NSArray(_FPSpotlightQueryHelpers)

- (id)_fp_map:()_FPSpotlightQueryHelpers
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPSpotlightQueryHelpers.m"), 40, CFSTR("Block cannot be nil."));

  }
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __45__NSArray__FPSpotlightQueryHelpers___fp_map___block_invoke;
    v15 = &unk_1E444EAB8;
    v16 = v7;
    v17 = v5;
    v8 = v7;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v12);
    v9 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);

  }
  else
  {
    v9 = (void *)objc_opt_new();
  }

  return v9;
}

- (uint64_t)_fp_componentsJoinedByOr
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR(" || "));
}

- (uint64_t)_fp_componentsJoinedByAnd
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR(" && "));
}

- (id)_fp_filter:()_FPSpotlightQueryHelpers
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPSpotlightQueryHelpers.m"), 52, CFSTR("Block cannot be nil."));

  }
  if (objc_msgSend(a1, "count"))
  {
    v6 = (void *)objc_opt_new();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __48__NSArray__FPSpotlightQueryHelpers___fp_filter___block_invoke;
    v14 = &unk_1E444C4B0;
    v15 = v6;
    v16 = v5;
    v7 = v6;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v11);
    v8 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (uint64_t)_fp_componentsWrappedInQuotes
{
  return objc_msgSend(a1, "_fp_map:", &__block_literal_global_46);
}

@end
