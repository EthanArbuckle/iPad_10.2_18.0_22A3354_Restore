@implementation ATXInfoToBlendingConfidenceMapper

- (ATXInfoToBlendingConfidenceMapper)init
{
  ATXInfoToBlendingConfidenceMapper *v2;
  uint64_t v3;
  NSDictionary *map;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInfoToBlendingConfidenceMapper;
  v2 = -[ATXInfoToBlendingConfidenceMapper init](&v6, sel_init);
  if (v2)
  {
    +[ATXAssets2 dictionaryWithLegacyPathForClass:](ATXAssets2, "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    map = v2->_map;
    v2->_map = (NSDictionary *)v3;

  }
  return v2;
}

- (int64_t)blendingConfidenceCategoryForInfoConfidenceLevel:(int64_t)a3
{
  int v3;
  NSDictionary *map;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;

  v3 = a3;
  map = self->_map;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](map, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:].cold.1(v3, v9);

    v8 = 0;
  }

  return v8;
}

- (int64_t)minInfoConfidenceLevelForBlendingConfidenceCategory:(int64_t)a3
{
  int64_t v5;

  v5 = 1;
  while (-[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self, "blendingConfidenceCategoryForInfoConfidenceLevel:", v5) != a3)
  {
    if (++v5 == 16)
      return 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

- (void)blendingConfidenceCategoryForInfoConfidenceLevel:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ATXInfoToBlendingConfidenceMapper: mapping does not exist for info confidence level: %d. Should never happen.", (uint8_t *)v2, 8u);
}

@end
