@implementation ATXInformationFeatureSetBuilder

- (void)appendFeature:(unint64_t)a3 value:(double)a4
{
  NSObject *v5;
  void *v8;
  id v9;

  if (a3 - 10 > 0xFFFFFFFFFFFFFFF6)
  {
    +[ATXInformationFeatureSetBuilder stringForInfoSuggestionFeature:](ATXInformationFeatureSetBuilder, "stringForInfoSuggestionFeature:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationFeatureSetBuilder setFeatureWithName:toValue:](self, "setFeatureWithName:toValue:", v9, v8);

  }
  else
  {
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXInformationFeatureSetBuilder appendFeature:value:].cold.1(a3, v5);

  }
}

- (void)setFeatureWithName:(id)a3 toValue:(id)a4
{
  id v6;
  NSMutableDictionary *features;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  features = self->_features;
  if (!features)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_features;
    self->_features = v8;

    features = self->_features;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v6, v10);

}

- (id)build
{
  return -[ATXInformationFeatureSet initWithFeatureDictionary:]([ATXInformationFeatureSet alloc], "initWithFeatureDictionary:", self->_features);
}

+ (id)stringForInfoSuggestionFeature:(unint64_t)a3
{
  id result;
  void *v6;

  if (a3 < 0xB)
    return off_1E82E37F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXInformationFeatureSetBuilder.m"), 67, CFSTR("Unknown value for ATXInfoSuggestionFeatureName"));

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)appendFeature:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFeatureSetBuilder: Unknown value for ATXInfoSuggestionFeature %lu", (uint8_t *)&v2, 0xCu);
}

@end
