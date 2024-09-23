@implementation ATXCategoricalFeatureAmbientLightType

- (id)featureNameForAWDProactiveAppPredictionAmbientLightType:(int)a3
{
  NSObject *v4;

  if (a3 < 8)
    return off_1E82EBC48[a3];
  __atxlog_handle_relevance_model();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXCategoricalFeatureAmbientLightType featureNameForAWDProactiveAppPredictionAmbientLightType:].cold.1();

  return CFSTR("<Unexpected Category Value>");
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;

  v5 = a3;
  objc_msgSend(v5, "ambientLightContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "ambientLightContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ambientLightType");

    -[ATXCategoricalFeatureAmbientLightType featureNameForAWDProactiveAppPredictionAmbientLightType:](self, "featureNameForAWDProactiveAppPredictionAmbientLightType:", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_relevance_model();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXCategoricalFeatureAmbientLightType categoricalFeatureValueForContext:candidate:].cold.1();

    v9 = CFSTR("<Unexpected Category Value>");
  }

  return v9;
}

- (void)featureNameForAWDProactiveAppPredictionAmbientLightType:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_5_8(&dword_1C9A3B000, v2, v3, "%@ - Invalid ambientLightType attempted to be featurized: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - Nil ambientLightContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
