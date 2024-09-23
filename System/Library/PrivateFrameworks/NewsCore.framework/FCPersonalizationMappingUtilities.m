@implementation FCPersonalizationMappingUtilities

+ (id)scoredTagsDictionaryFromScoredTags:(id)a3
{
  id v3;
  void *v4;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "scoredTagIDs");
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:]";
    v9 = 2080;
    v10 = "FCPersonalizationMappingUtilities.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromArray:keyBlock:valueBlock:", v3, &__block_literal_global_134, &__block_literal_global_6_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__FCPersonalizationMappingUtilities_scoredTagsDictionaryFromScoredTags___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "score");
  return objc_msgSend(v2, "numberWithFloat:");
}

uint64_t __72__FCPersonalizationMappingUtilities_scoredTagsDictionaryFromScoredTags___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagId");
}

@end
