@implementation ATXInformationFeatureSet

- (ATXInformationFeatureSet)initWithFeatureDictionary:(id)a3
{
  id v4;
  ATXInformationFeatureSet *v5;
  uint64_t v6;
  NSDictionary *features;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXInformationFeatureSet;
  v5 = -[ATXInformationFeatureSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    features = v5->_features;
    v5->_features = (NSDictionary *)v6;

  }
  return v5;
}

- (double)valueForFeature:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (a3 - 10 <= 0xFFFFFFFFFFFFFFF6)
  {
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXInformationFeatureSet valueForFeature:].cold.1(a3, v5);

  }
  +[ATXInformationFeatureSetBuilder stringForInfoSuggestionFeature:](ATXInformationFeatureSetBuilder, "stringForInfoSuggestionFeature:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (id)dictionaryRepresentation
{
  return self->_features;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeatureDictionary:", self->_features);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)valueForFeature:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXInformationFeatureSet: Unknown value passed into selector valueForFeature for ATXInfoSuggestionFeatureName %lu", (uint8_t *)&v2, 0xCu);
}

@end
